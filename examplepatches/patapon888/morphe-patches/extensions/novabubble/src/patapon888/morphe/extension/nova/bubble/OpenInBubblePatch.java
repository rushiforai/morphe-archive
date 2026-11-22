package patapon888.morphe.extension.nova.bubble;

import android.annotation.SuppressLint;
import android.app.Application;
import android.content.ComponentName;
import android.content.Context;
import android.content.SharedPreferences;
import android.os.Build;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import android.view.View;
import android.widget.Toast;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Pattern;

import i10.j1;
import kotlin.jvm.functions.Function1;
import r1.f1;

/**
 * Adds an "Open in bubble" long-press popup item to Nova Launcher, backed by the
 * Android 17 WMShell bubble shell command (requires root), plus a matching row in
 * Settings > Look & feel > Long-press Menu.
 */
@SuppressWarnings("unused")
public final class OpenInBubblePatch {
    private static final String TAG = "NovaBubble";
    private static final String PREFS = "morphe_nova_bubble";
    private static final String KEY_DRAWER = "drawer";
    private static final String KEY_HOME = "home";
    private static final Pattern PACKAGE_NAME = Pattern.compile("[A-Za-z0-9_.]+");

    private static f1 visibilityState;

    /**
     * Injection point: called with Nova's list of long-press popup item factories.
     */
    public static List<Object> addPopupItem(List<Object> factories) {
        try {
            ArrayList<Object> list = new ArrayList<>(factories);
            list.add(new BubbleShortcutFactory());
            return list;
        } catch (Throwable t) {
            Log.e(TAG, "addPopupItem failure", t);
            return factories;
        }
    }

    /**
     * Injection point: called with the rows of the Long-press Menu settings screen.
     */
    public static List<Object> addSettingsRow(List<Object> rows) {
        try {
            Context context = getContext();
            if (context == null) return rows;
            f1 state = getVisibilityState(context);
            // Reading the state inside composition makes the screen recompose when it changes.
            j1 value = (j1) state.getValue();
            Function1<Object, Object> onChange = newValue -> {
                setVisibility(context, (j1) newValue);
                return kotlin.Unit.a;
            };
            ArrayList<Object> list = new ArrayList<>(rows);
            list.add(new z00.h(
                    resId(context, "string", "morphe_nova_bubble_settings_title"),
                    resId(context, "drawable", "morphe_ic_bubble"),
                    value, true, true, onChange));
            return list;
        } catch (Throwable t) {
            Log.e(TAG, "addSettingsRow failure", t);
            return rows;
        }
    }

    static int resId(Context context, String type, String name) {
        return context.getResources().getIdentifier(name, type, context.getPackageName());
    }

    static synchronized f1 getVisibilityState(Context context) {
        if (visibilityState == null) {
            SharedPreferences prefs = context.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
            j1 value = new j1(prefs.getBoolean(KEY_DRAWER, true), prefs.getBoolean(KEY_HOME, true));
            visibilityState = androidx.compose.runtime.d.j(value, r1.h1.b);
        }
        return visibilityState;
    }

    private static synchronized void setVisibility(Context context, j1 value) {
        context.getSharedPreferences(PREFS, Context.MODE_PRIVATE).edit()
                .putBoolean(KEY_DRAWER, value.a)
                .putBoolean(KEY_HOME, value.b)
                .apply();
        getVisibilityState(context).setValue(value);
    }

    @SuppressLint("PrivateApi")
    private static Context getContext() {
        try {
            return (Application) Class.forName("android.app.ActivityThread")
                    .getMethod("currentApplication").invoke(null);
        } catch (Throwable t) {
            Log.e(TAG, "currentApplication failure", t);
            return null;
        }
    }

    static boolean isSupported() {
        return Build.VERSION.SDK_INT >= 36;
    }

    static String getBubblePackage(ia.e item, Context context) {
        ComponentName component = item.l();
        if (component == null) return null;
        String packageName = component.getPackageName();
        if (packageName == null || !PACKAGE_NAME.matcher(packageName).matches()) return null;
        if (packageName.equals(context.getPackageName())) return null;
        return packageName;
    }

    static void openInBubble(Context context, String packageName) {
        Context appContext = context.getApplicationContext();
        new Thread(() -> {
            String error = runAddBubble(packageName);
            if (error != null) {
                Log.w(TAG, "addBubble " + packageName + ": " + error);
                new Handler(Looper.getMainLooper()).post(() ->
                        Toast.makeText(appContext, "Bubble: " + error, Toast.LENGTH_LONG).show());
            }
        }, "NovaBubble").start();
    }

    /**
     * @return null on success, otherwise an error message.
     */
    private static String runAddBubble(String packageName) {
        String command = "dumpsys activity service SystemUIService WMShell bubbles addBubble " + packageName;
        try {
            Process process = new ProcessBuilder("su", "-c", command).redirectErrorStream(true).start();
            StringBuilder output = new StringBuilder();
            try (BufferedReader reader = new BufferedReader(new InputStreamReader(process.getInputStream()))) {
                String line;
                while ((line = reader.readLine()) != null) {
                    if (line.contains("Error") || line.contains("rror:")) {
                        output.append(line.trim()).append('\n');
                    }
                }
            }
            int exit = process.waitFor();
            if (output.length() > 0) return output.toString().trim();
            if (exit != 0) return "root access denied (exit " + exit + ")";
            return null;
        } catch (Throwable t) {
            return "root unavailable (" + t.getMessage() + ")";
        }
    }

    /**
     * Popup item factory (implements Nova's long-press shortcut factory interface).
     */
    public static final class BubbleShortcutFactory implements ma.q {
        @Override
        public ma.s a(Context context, ia.e item) {
            return null;
        }

        @Override
        public ma.s b(com.teslacoilsw.launcher.NovaLauncher launcher, ia.e item, ia.e item2, View view) {
            try {
                if (!isSupported() || item == null) return null;
                if (getBubblePackage(item, launcher) == null) return null;
                j1 visibility = (j1) getVisibilityState(launcher).getValue();
                if (!o30.j.r(launcher, view, item, visibility.a, visibility.b)) {
                    return null;
                }
                return new BubbleShortcut(
                        resId(launcher, "drawable", "morphe_ic_bubble"),
                        resId(launcher, "string", "morphe_nova_bubble_popup_title"),
                        launcher, item);
            } catch (Throwable t) {
                Log.e(TAG, "popup item failure", t);
                return null;
            }
        }
    }

    public static final class BubbleShortcut extends ma.s {
        private final com.teslacoilsw.launcher.NovaLauncher launcher;
        private final ia.e target;

        public BubbleShortcut(int icon, int label, com.teslacoilsw.launcher.NovaLauncher launcher, ia.e item) {
            super(icon, label, launcher, item);
            this.launcher = launcher;
            this.target = item;
        }

        @Override
        public void onClick(View view) {
            try {
                String packageName = getBubblePackage(target, launcher);
                com.teslacoilsw.launcher.NovaLauncher.e1(launcher);
                if (packageName != null) openInBubble(launcher, packageName);
            } catch (Throwable t) {
                Log.e(TAG, "onClick failure", t);
            }
        }
    }
}
