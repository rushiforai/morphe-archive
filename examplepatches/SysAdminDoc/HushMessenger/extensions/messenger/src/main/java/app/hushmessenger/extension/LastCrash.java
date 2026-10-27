package app.hushmessenger.extension;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.charset.StandardCharsets;

/**
 * Where Messenger's last Java crash happened, for Report a problem. Android only tells a later start that the process
 * crashed, so a report like #103 arrives without a trace. The crash handler saves the exception's class names and its
 * top code frames, never its message, which can hold a file path or text from a chat. The report says it for KEEP_MS.
 */
final class LastCrash {
    static final String FILE = "hushmessenger-last-crash";
    static final long KEEP_MS = 3L * 24 * 60 * 60 * 1000;
    static final int FRAMES = 5;
    static final int MAX = 400;

    private LastCrash() { }

    /** "IllegalStateException caused by FileNotFoundException at X.a(12) < Y.b(40)": names and frames only. */
    static String summary(Throwable crash) {
        if (crash == null) return "";
        Throwable root = crash;
        for (int depth = 0; depth < 16 && root.getCause() != null && root.getCause() != root; depth++) root = root.getCause();
        StringBuilder line = new StringBuilder(crash.getClass().getName());
        if (root != crash) line.append(" caused by ").append(root.getClass().getName());
        StackTraceElement[] frames = root.getStackTrace();
        for (int i = 0; frames != null && i < Math.min(FRAMES, frames.length); i++) {
            StackTraceElement frame = frames[i];
            line.append(i == 0 ? " at " : " < ").append(frame.getClassName()).append('.').append(frame.getMethodName());
            if (frame.getLineNumber() >= 0) line.append('(').append(frame.getLineNumber()).append(')');
        }
        return clean(line.toString());
    }

    /** Only the characters class names and frames are made of, on one line, at most MAX of them. */
    static String clean(String value) {
        if (value == null) return "";
        StringBuilder kept = new StringBuilder();
        for (int i = 0; i < value.length() && kept.length() < MAX; i++) {
            char c = value.charAt(i);
            boolean allowed = (c >= 'a' && c <= 'z') || (c >= 'A' && c <= 'Z') || (c >= '0' && c <= '9') || "_$.<>() -".indexOf(c) >= 0;
            kept.append(allowed ? c : '?');
        }
        return kept.toString().trim();
    }

    /** Called from the crash handler while the process is going down, so it writes once and gives up on any failure. */
    static void record(File dir, Throwable crash, long now) {
        if (dir == null) return;
        String summary = summary(crash);
        if (summary.isEmpty()) return;
        try (FileOutputStream out = new FileOutputStream(new File(dir, FILE))) {
            out.write((now + "\n" + summary).getBytes(StandardCharsets.US_ASCII));
        } catch (IOException | RuntimeException ignored) {
            // The report just leaves the line out.
        }
    }

    /** The saved summary when the crash was within KEEP_MS of [now], otherwise "". */
    static String read(File dir, long now) {
        if (dir == null) return "";
        File file = new File(dir, FILE);
        if (!file.isFile() || file.length() > 2048) return "";
        byte[] bytes = new byte[(int) file.length()];
        try (FileInputStream in = new FileInputStream(file)) {
            int read = 0;
            while (read < bytes.length) {
                int count = in.read(bytes, read, bytes.length - read);
                if (count < 0) break;
                read += count;
            }
            String[] parts = new String(bytes, 0, read, StandardCharsets.US_ASCII).split("\n", 2);
            if (parts.length < 2) return "";
            long at = Long.parseLong(parts[0].trim());
            return at <= now && now - at <= KEEP_MS ? clean(parts[1]) : "";
        } catch (IOException | RuntimeException unreadable) {
            return "";
        }
    }
}
