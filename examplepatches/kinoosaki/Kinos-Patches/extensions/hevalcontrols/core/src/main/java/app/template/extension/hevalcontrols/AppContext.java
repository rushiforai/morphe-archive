package app.template.extension.hevalcontrols;

import android.app.Application;
import android.content.Context;
import android.os.Build;

import java.io.FileInputStream;
import java.lang.reflect.Method;
import java.nio.charset.StandardCharsets;

/** Application context and process helpers that work from minSdk 23 without androidx. */
public final class AppContext {
    private static volatile Method currentApplication;
    private static volatile boolean currentApplicationMissing;

    /**
     * {@code ActivityThread.currentApplication()}: the Application of this process, or null while
     * Android is still attaching it (inside {@code Application.attachBaseContext}) or off Android.
     */
    public static Context currentApplication() {
        if (currentApplicationMissing) return null;
        try {
            Method method = currentApplication;
            if (method == null) {
                method = Class.forName("android.app.ActivityThread").getMethod("currentApplication");
                currentApplication = method;
            }
            return (Context) method.invoke(null);
        } catch (ClassNotFoundException | NoSuchMethodException missing) {
            // Not Android (a JVM unit test) or a platform without the hidden API: stop trying.
            currentApplicationMissing = true;
            return null;
        } catch (Throwable unavailable) {
            return null;
        }
    }

    /** Whether this is the app's main process (its name equals the package name). */
    public static boolean isMainProcess(Context context) {
        String process = processName();
        return process == null || process.equals(context.getPackageName());
    }

    /** The current process name, or null when it cannot be read. */
    public static String processName() {
        if (Build.VERSION.SDK_INT >= 28) {
            try {
                String name = Application.getProcessName();
                if (name != null && !name.isEmpty()) return name;
            } catch (Throwable ignored) {
                // Fall through to /proc.
            }
        }
        try (FileInputStream in = new FileInputStream("/proc/self/cmdline")) {
            byte[] buffer = new byte[256];
            int length = in.read(buffer);
            if (length <= 0) return null;
            int end = 0;
            while (end < length && buffer[end] != 0) end++;
            return end == 0 ? null : new String(buffer, 0, end, StandardCharsets.UTF_8);
        } catch (Throwable unreadable) {
            return null;
        }
    }

    private AppContext() { }
}
