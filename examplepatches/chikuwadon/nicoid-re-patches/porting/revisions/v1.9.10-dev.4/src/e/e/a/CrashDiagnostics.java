package e.e.a;

import android.content.Context;
import java.io.*;
import java.util.*;

/** Keep one bounded Java crash trace available after the process restarts. */
public final class CrashDiagnostics {
    private static boolean installed;
    private static final String FILE = "nicoid-last-java-crash.txt";
    private static final int LIMIT = 65536;
    private CrashDiagnostics() {}

    public static synchronized void install(Context context) {
        if (installed) return;
        final String header=DebugHeader237.header(context);
        android.util.Log.i("nicoid-debug",header);
        final File file = new File(context.getFilesDir(), FILE);
        final Thread.UncaughtExceptionHandler previous = Thread.getDefaultUncaughtExceptionHandler();
        Thread.setDefaultUncaughtExceptionHandler((thread, error) -> {
            try (OutputStream out = new FileOutputStream(file)) {
                byte[] data = (header + "Time: " + System.currentTimeMillis() + "\n" + trace(error)).getBytes("UTF-8");
                out.write(data, 0, Math.min(data.length, LIMIT));
            } catch (Throwable ignored) {}
            if (previous != null) previous.uncaughtException(thread, error);
            else {
                android.os.Process.killProcess(android.os.Process.myPid());
                System.exit(10);
            }
        });
        installed = true;
    }

    static String trace(Throwable error) {
        StringBuilder text = new StringBuilder();
        Set<Throwable> seen = Collections.newSetFromMap(new IdentityHashMap<Throwable, Boolean>());
        int causes = 0;
        while (error != null && causes++ < 8 && seen.add(error)) {
            // Exception messages can contain URLs or cookies. Export only type and frames.
            text.append(error.getClass().getName()).append('\n');
            StackTraceElement[] frames = error.getStackTrace();
            for (int n = 0; n < Math.min(frames.length, 64); n++)
                text.append("  at ").append(frames[n]).append('\n');
            error = error.getCause();
        }
        return text.toString();
    }

    public static String append(Context context, String current) {
        File file = new File(context.getFilesDir(), FILE);
        if (!file.isFile()) return current;
        try (InputStream in = new FileInputStream(file); ByteArrayOutputStream out = new ByteArrayOutputStream()) {
            byte[] buffer = new byte[4096]; int count;
            while (out.size() < LIMIT && (count = in.read(buffer, 0, Math.min(buffer.length, LIMIT - out.size()))) > 0)
                out.write(buffer, 0, count);
            return current + "\n\nLast Java crash (retained across restart):\n" + out.toString("UTF-8");
        } catch (IOException ignored) { return current; }
    }
}
