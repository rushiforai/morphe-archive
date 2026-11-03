package app.proxma.simosa;

import android.content.Context;
import android.os.Process;

import java.io.File;
import java.io.FileWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

/**
 * Keeps the claim flow readable after the fact, as ColorOS hides this app's logcat: every log line
 * also goes to {@code Android/data/com.jazz.jazzworld/files/proxma_trace.log}, which adb can read.
 * Numbers long enough to be a phone number and token-like strings are masked before writing.
 */
final class Trace {

    private static final String FILE = "proxma_trace.log";
    private static final long MAX_BYTES = 256 * 1024;

    private static volatile Context sContext;

    private Trace() {}

    static void init(Context context) {
        sContext = context.getApplicationContext();
    }

    static synchronized void line(String message) {
        Context context = sContext;
        if (context == null) {
            return;
        }
        try {
            File dir = context.getExternalFilesDir(null);
            if (dir == null) {
                return;
            }
            File file = new File(dir, FILE);
            if (file.length() > MAX_BYTES) {
                file.renameTo(new File(dir, FILE + ".1"));
            }
            String time = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss", Locale.US).format(new Date());
            try (FileWriter writer = new FileWriter(file, true)) {
                writer.write(time + " pid=" + Process.myPid() + " " + mask(message) + "\n");
            }
        } catch (Throwable ignored) {
            // A trace must never break a claim.
        }
    }

    private static String mask(String message) {
        return String.valueOf(message)
            .replaceAll("[A-Za-z0-9_\\-.]{24,}", "****")
            .replaceAll("\\d{10,}", "****");
    }
}
