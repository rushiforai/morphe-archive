package com.waze.gw;

import android.content.Context;
import android.content.DialogInterface;
import android.content.SharedPreferences;
import android.util.Log;
import android.view.View;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;

/** Reflection bridge to Waze's own dialog framework. */
final class WazeDialogs {
    private static final String TAG = "WazeGW";
    private static final String PREFS = "waze_hud_gw";
    private static final String SEEN_AUTHENTICITY = "authenticity_notice_v1_seen";
    private static final int MAX_SHOW_ATTEMPTS = 4;

    private static String title() {
        return I18n.tr("ui.mod_notice");
    }

    private static String message() {
        // One translation key per sentence: the translator sees four short strings that join into the notice.
        return I18n.f("ui.this_mod_was_made_by_chisadin", "https://wazemod.io.vn")
                + I18n.tr("ui.any_download_source_other_than_this")
                + I18n.tr("ui.the_original_waze_app_and_related")
                + I18n.tr("ui.and_its_google_affiliates");
    }

    private static volatile boolean pending;
    private static volatile int attempts;

    private WazeDialogs() {}

    static void showAuthenticityNoticeOnce(final View anchor) {
        // The notice points to the Mod's own site and APK downloads; the Morphe edition is patched on the device.
        if (true) return;
        if (anchor == null) return;
        final Context c = anchor.getContext();
        if (isSeen(c) || pending || attempts >= MAX_SHOW_ATTEMPTS) return;
        pending = true;
        anchor.postDelayed(new Runnable() {
            @Override public void run() {
                attempts++;
                if (!anchor.isAttachedToWindow() || !showNative(c)) {
                    pending = false;
                    if (attempts < MAX_SHOW_ATTEMPTS && anchor.isAttachedToWindow()) {
                        anchor.postDelayed(new Runnable() {
                            @Override public void run() { showAuthenticityNoticeOnce(anchor); }
                        }, 1200);
                    }
                }
            }
        }, 900);
    }

    private static boolean showNative(final Context c) {
        if (showModernNative(c)) return true;
        if (showLegacyNative(c)) return true;
        if (showPlain(c)) return true;
        Log.w(TAG, "native Waze dialog unavailable");
        return false;
    }

    /** Waze 5.24+ no longer ships either dialog API above, so fall back to a plain Android dialog. */
    private static boolean showPlain(final Context c) {
        try {
            if (!(c instanceof android.app.Activity)) return false;
            android.app.AlertDialog.Builder b = new android.app.AlertDialog.Builder(c);
            b.setTitle(title()).setMessage(message());
            b.setPositiveButton(I18n.tr("report.close"), new DialogInterface.OnClickListener() {
                @Override public void onClick(DialogInterface dialog, int which) { markSeen(c); pending = false; }
            });
            b.setOnCancelListener(new DialogInterface.OnCancelListener() {
                @Override public void onCancel(DialogInterface dialog) { pending = false; }
            });
            b.show();
            Log.i(TAG, "authenticity notice shown with a plain Android dialog");
            return true;
        } catch (Throwable t) {
            return false;
        }
    }

    /** Waze 5.20. Gọi dialog của waze */
    private static boolean showModernNative(final Context c) {
        try {
            final Class<?> builderClass = Class.forName("com.waze.ab.o");
            final Class<?> callbackClass = Class.forName("com.waze.ab.q");
            Object builder = builderClass.getConstructor().newInstance();

            builderClass.getMethod("Q", String.class).invoke(builder, title());
            builderClass.getMethod("O", CharSequence.class).invoke(builder, message());
            builderClass.getMethod("M", String.class).invoke(builder, I18n.tr("report.close"));

            Object callback = Proxy.newProxyInstance(callbackClass.getClassLoader(),
                    new Class<?>[]{callbackClass}, new InvocationHandler() {
                        @Override public Object invoke(Object proxy, Method method, Object[] args) {
                            String name = method.getName();
                            if ("onClick".equals(name)) {
                                markSeen(c);
                                pending = false;
                                return null;
                            }
                            if ("hashCode".equals(name)) return System.identityHashCode(proxy);
                            if ("equals".equals(name)) return args != null && args.length == 1 && proxy == args[0];
                            if ("toString".equals(name)) return "ModAuthenticityDialogCallback";
                            return null;
                        }
                    });
            builderClass.getField("a").set(builder, callback);

            builderClass.getMethod("H", DialogInterface.OnCancelListener.class).invoke(builder,
                    new DialogInterface.OnCancelListener() {
                        @Override public void onCancel(DialogInterface dialog) { pending = false; }
                    });

            Class<?> factory = Class.forName("com.waze.z.a.d.ai");
            Object dialog = factory.getMethod("q", builderClass).invoke(null, builder);
            if (dialog == null) return false;
            Log.i(TAG, "authenticity notice shown with native Waze dialog");
            return true;
        } catch (Throwable t) {
            return false;
        }
    }

    /** Waze 4.100/4.91 dialog bridge. Both releases expose this stable MsgBox API. */
    private static boolean showLegacyNative(final Context c) {
        try {
            Class<?> msgBoxClass = Class.forName("com.waze.MsgBox");
            Object msgBox = msgBoxClass.getMethod("getInstance").invoke(null);
            if (msgBox == null) return false;

            DialogInterface.OnClickListener closeListener =
                    new DialogInterface.OnClickListener() {
                        @Override public void onClick(DialogInterface dialog, int which) {
                            markSeen(c);
                            pending = false;
                        }
                    };
            msgBoxClass.getMethod("OpenMessageBoxTimeoutJavaCb",
                    String.class, String.class, String.class, int.class,
                    DialogInterface.OnClickListener.class)
                    // Legacy MsgBox order is title, message, close-button label. Passing the
                    // button first makes it the title and squeezes the message into OvalButton.
                    .invoke(msgBox, title(), message(), I18n.tr("report.close"), 0, closeListener);
            Log.i(TAG, "authenticity notice shown with legacy native Waze dialog");
            return true;
        } catch (Throwable t) {
            return false;
        }
    }

    private static boolean isSeen(Context c) {
        SharedPreferences p = c == null ? null : c.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
        return p != null && p.getBoolean(SEEN_AUTHENTICITY, false);
    }

    private static void markSeen(Context c) {
        if (c != null) c.getSharedPreferences(PREFS, Context.MODE_PRIVATE)
                .edit().putBoolean(SEEN_AUTHENTICITY, true).apply();
    }
}
