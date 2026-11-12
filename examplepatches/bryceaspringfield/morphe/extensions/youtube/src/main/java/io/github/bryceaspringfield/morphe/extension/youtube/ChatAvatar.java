package io.github.bryceaspringfield.morphe.extension.youtube;

import android.app.Activity;
import android.app.Application;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Proxy;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;

/**
 * A tap on a live chat message's profile picture opens its author's channel. Each chat message is a row whose
 * description reads "@handle. message" (checked on 2026-11-11 on Lofi Girl's live chat); the picture is the row's
 * first AVATAR_DP. The tap is read before YouTube's own views get it: a tap there (no drag) is cancelled for the row,
 * which otherwise opens the message's menu, and the channel page opens instead. A drag scrolls the chat as before.
 */
final class ChatAvatar {

    private static final Pattern ROW = Pattern.compile("^@([\\w.\\-]{3,40})\\. ");
    /** The picture's width with its left margin. */
    private static final int AVATAR_DP = 52;
    private static final java.util.Set<Window> HOOKED = java.util.Collections.newSetFromMap(new java.util.WeakHashMap<>());
    private static boolean registered;
    private static String downHandle;
    private static float downX, downY;

    private ChatAvatar() {
    }

    static synchronized void register() {
        if (registered) return;
        registered = true;
        try {
            ((Application) Utils.getContext().getApplicationContext()).registerActivityLifecycleCallbacks(new Callbacks());
        } catch (Throwable t) {
            Logger.printException(() -> "YouTube Extras: chat avatar hook not registered", t);
        }
    }

    /** The handle of the chat row under the point, when the point is on the row's picture. */
    private static String handleAt(View v, int x, int y, int[] loc, float density) {
        if (v.getVisibility() != View.VISIBLE) return null;
        v.getLocationOnScreen(loc);
        if (x < loc[0] || y < loc[1] || x >= loc[0] + v.getWidth() || y >= loc[1] + v.getHeight()) return null;
        CharSequence d = v.getContentDescription();
        if (d != null) {
            Matcher m = ROW.matcher(d);
            if (m.find()) return x - loc[0] <= AVATAR_DP * density ? m.group(1) : "";
        }
        if (v instanceof ViewGroup g) {
            for (int i = g.getChildCount() - 1; i >= 0; i--) {
                String h = handleAt(g.getChildAt(i), x, y, loc, density);
                if (h != null) return h;
            }
        }
        return null;
    }

    /** Returns true when the event was taken (the tap's end, replaced by a cancel). */
    private static boolean onTouch(Activity a, MotionEvent e) {
        if (!XSettings.CHAT_AVATAR_CHANNEL.get()) return false;
        switch (e.getActionMasked()) {
            case MotionEvent.ACTION_DOWN -> {
                downHandle = null;
                View decor = a.getWindow().getDecorView();
                String h = handleAt(decor, (int) e.getRawX(), (int) e.getRawY(), new int[2],
                        a.getResources().getDisplayMetrics().density);
                if (h != null && !h.isEmpty()) {
                    downHandle = h;
                    downX = e.getRawX();
                    downY = e.getRawY();
                }
                return false;
            }
            case MotionEvent.ACTION_MOVE -> {
                float slop = 12 * a.getResources().getDisplayMetrics().density;
                if (downHandle != null && Math.hypot(e.getRawX() - downX, e.getRawY() - downY) > slop) downHandle = null;
                return false;
            }
            case MotionEvent.ACTION_UP -> {
                String h = downHandle;
                downHandle = null;
                if (h == null) return false;
                MotionEvent cancel = MotionEvent.obtain(e);
                cancel.setAction(MotionEvent.ACTION_CANCEL);
                a.getWindow().getDecorView().dispatchTouchEvent(cancel);
                cancel.recycle();
                Logger.printDebug(() -> "YouTube Extras: chat picture of @" + h + " tapped, opening the channel");
                Intent i = new Intent(Intent.ACTION_VIEW, Uri.parse("https://www.youtube.com/@" + h));
                i.setPackage(a.getPackageName());
                a.startActivity(i);
                return true;
            }
            default -> {
                return false;
            }
        }
    }

    private static void hook(Activity a) {
        // The main activity only, where the player and its chat live.
        if (!a.getClass().getName().toLowerCase(java.util.Locale.ROOT).contains("watchwhile")) return;
        Window w = a.getWindow();
        if (w == null || !HOOKED.add(w)) return;
        Window.Callback inner = w.getCallback();
        if (inner == null) return;
        Window.Callback outer = (Window.Callback) Proxy.newProxyInstance(Window.Callback.class.getClassLoader(),
                new Class<?>[]{Window.Callback.class}, (proxy, method, args) -> {
                    if ("dispatchTouchEvent".equals(method.getName()) && args != null && args.length == 1
                            && args[0] instanceof MotionEvent e) {
                        try {
                            if (onTouch(a, e)) return true;
                        } catch (Throwable t) {
                            Logger.printDebug(() -> "YouTube Extras: chat avatar tap failed: " + t);
                        }
                    }
                    try {
                        return method.invoke(inner, args);
                    } catch (InvocationTargetException ex) {
                        throw ex.getCause();
                    }
                });
        w.setCallback(outer);
    }

    private static final class Callbacks implements Application.ActivityLifecycleCallbacks {
        @Override
        public void onActivityResumed(Activity a) {
            try {
                hook(a);
            } catch (Throwable t) {
                Logger.printException(() -> "YouTube Extras: chat avatar hook failed", t);
            }
        }

        @Override public void onActivityCreated(Activity a, Bundle b) {}
        @Override public void onActivityStarted(Activity a) {}
        @Override public void onActivityPaused(Activity a) {}
        @Override public void onActivityStopped(Activity a) {}
        @Override public void onActivitySaveInstanceState(Activity a, Bundle b) {}
        @Override public void onActivityDestroyed(Activity a) {}
    }
}
