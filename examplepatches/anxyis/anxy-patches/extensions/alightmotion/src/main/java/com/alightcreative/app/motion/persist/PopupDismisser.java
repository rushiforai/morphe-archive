package com.alightcreative.app.motion.persist;

import android.app.Activity;
import android.app.Application;
import android.content.Context;
import android.content.SharedPreferences;
import android.os.Handler;
import android.os.Looper;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.TextView;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;

public class PopupDismisser {
    private static final Handler handler = new Handler(Looper.getMainLooper());
    private static volatile boolean running = false;

    public static void onStart(Context context) {
        if (context != null) {
            try {
                seedPreferences(context);
            } catch (Throwable ignored) {
            }
        }
        onStart();
    }

    public static void onStart() {
        try {
            Class<?> atClass = Class.forName("android.app.ActivityThread");
            Method curAppMethod = atClass.getMethod("currentApplication");
            Application app = (Application) curAppMethod.invoke(null);
            if (app != null) {
                seedPreferences(app);
            }
        } catch (Throwable ignored) {
        }

        if (running) return;
        running = true;

        handler.post(new Runnable() {
            @Override
            public void run() {
                try {
                    dismissPopups();
                } catch (Throwable ignored) {
                }
                if (running) {
                    handler.postDelayed(this, 150);
                }
            }
        });
    }

    public static void seedPreferences(Context context) {
        if (context == null) return;
        try {
            context.getSharedPreferences("dialog", Context.MODE_PRIVATE)
                .edit()
                .putBoolean("first", true)
                .putInt("view", 0)
                .commit();

            context.getSharedPreferences("aab", Context.MODE_PRIVATE)
                .edit()
                .putBoolean("ver_ses", true)
                .putBoolean("ver_dev", true)
                .commit();

            context.getSharedPreferences("PkS", Context.MODE_PRIVATE)
                .edit()
                .putBoolean("ver_s", true)
                .putString("f_ln", "en")
                .putString("f_tg", "en-GB")
                .commit();

            context.getSharedPreferences("wdprefs1", Context.MODE_PRIVATE)
                .edit()
                .putBoolean("is_shown", true)
                .commit();

            context.getSharedPreferences("AlbinModsDialogPrefs", Context.MODE_PRIVATE)
                .edit()
                .putBoolean("dont_show_again", true)
                .putBoolean("dialogLock", true)
                .putInt("show_interval", 999999999)
                .putLong("last_show_time", 9999999999999L)
                .putBoolean("show_close_button", false)
                .commit();
        } catch (Throwable ignored) {
        }
    }

    private static void dismissPopups() {
        try {
            Class<?> wmgClass = Class.forName("android.view.WindowManagerGlobal");
            Method getInstanceMethod = wmgClass.getMethod("getInstance");
            Object wmgInstance = getInstanceMethod.invoke(null);

            Field mViewsField = wmgClass.getDeclaredField("mViews");
            mViewsField.setAccessible(true);
            Object viewsObj = mViewsField.get(wmgInstance);

            if (viewsObj instanceof ArrayList) {
                ArrayList<?> viewsList = (ArrayList<?>) viewsObj;
                for (int i = viewsList.size() - 1; i >= 0; i--) {
                    Object viewObj = viewsList.get(i);
                    if (viewObj instanceof View) {
                        View root = (View) viewObj;
                        if (containsMarker(root)) {
                            root.setVisibility(View.GONE);
                            findAndClickDismiss(root);
                        }
                    }
                }
            }
        } catch (Throwable ignored) {
        }
    }

    private static void findAndClickDismiss(View view) {
        if (view == null) return;
        if (view instanceof TextView) {
            CharSequence cs = ((TextView) view).getText();
            if (cs != null) {
                String text = cs.toString().trim();
                if (text.equalsIgnoreCase("CLOSE") ||
                    text.equalsIgnoreCase("CLOSE×") ||
                    text.equalsIgnoreCase("CLOSE X") ||
                    text.equalsIgnoreCase("Cancel") ||
                    text.equalsIgnoreCase("Dismiss") ||
                    text.equalsIgnoreCase("OK") ||
                    text.equalsIgnoreCase("LATER") ||
                    text.equalsIgnoreCase("REMIND ME LATER")) {
                    view.performClick();
                    return;
                }
            }
        }
        if (view instanceof ViewGroup) {
            ViewGroup vg = (ViewGroup) view;
            for (int i = 0; i < vg.getChildCount(); i++) {
                findAndClickDismiss(vg.getChildAt(i));
            }
        }
    }

    public static boolean containsMarker(View view) {
        if (view == null) return false;

        if (view instanceof TextView) {
            CharSequence cs = ((TextView) view).getText();
            if (cs != null) {
                String text = cs.toString();
                if (text.contains("Satriyaid") ||
                    text.contains("Modded by") ||
                    text.contains("Update Required") ||
                    text.contains("UPDATE this Apps") ||
                    text.contains("VISIT LINK") ||
                    text.contains("AlightMotion PRO") ||
                    text.contains("Telegram") ||
                    text.contains("JOIN MY") ||
                    text.contains("Follow all my Social Media") ||
                    text.contains("DONT SHOW AGAIN") ||
                    text.contains("DON'T SHOW AGAIN")) {
                    return true;
                }
            }
        }

        if (view instanceof ViewGroup) {
            ViewGroup vg = (ViewGroup) view;
            int count = vg.getChildCount();
            for (int i = 0; i < count; i++) {
                if (containsMarker(vg.getChildAt(i))) {
                    return true;
                }
            }
        }

        return false;
    }
}
