package app.wordfeudwordfinder.extension.play;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Locale;

/** Strategy names, the debug order file and building strategies from names. Pure; never throws. */
public final class RefreshOrder {
    /** The debug opt-in file in {@code wfwf/} (see docs/DEV.md, "V4 — verversen"). */
    public static final String DEBUG_FILE = "debug_refresh_order.txt";
    static final int MAX_DEBUG_BYTES = 4096;
    private static final String[] NAMES = {LifecycleBounce.NAME, ForegroundSignal.NAME, RouteBounce.NAME, FcmNudge.NAME};

    private RefreshOrder() {}

    /**
     * Strategy names separated by commas, semicolons, spaces or lines; {@code #} starts a comment. Case-insensitive;
     * unknown names and duplicates are skipped. Returns canonical names.
     */
    public static List<String> parse(String text) {
        if (text == null) return Collections.emptyList();
        List<String> out = new ArrayList<>();
        for (String line : text.split("\\r?\\n|\\r")) {
            int hash = line.indexOf('#');
            if (hash >= 0) line = line.substring(0, hash);
            for (String token : line.split("[,;\\s]+")) {
                String name = canonical(token);
                if (name != null && !out.contains(name)) out.add(name);
            }
        }
        return out;
    }

    private static String canonical(String token) {
        String t = token.trim().toLowerCase(Locale.ROOT);
        for (String n : NAMES) if (n.toLowerCase(Locale.ROOT).equals(t)) return n;
        return null;
    }

    /** Builds the strategies for the given names, in order; unknown names are skipped. */
    public static List<Refresher.Strategy> strategies(List<String> names, Refresher.Messenger messenger) {
        List<Refresher.Strategy> out = new ArrayList<>();
        for (String name : names) {
            Refresher.Strategy s = create(name, messenger);
            if (s != null) out.add(s);
        }
        return out;
    }

    static Refresher.Strategy create(String name, Refresher.Messenger messenger) {
        if (LifecycleBounce.NAME.equals(name)) return new LifecycleBounce(messenger);
        if (ForegroundSignal.NAME.equals(name)) return new ForegroundSignal(messenger);
        if (RouteBounce.NAME.equals(name)) return new RouteBounce(messenger);
        if (FcmNudge.NAME.equals(name)) return new FcmNudge(messenger);
        return null;
    }

    /**
     * The debug files to look for, in order. The external one ({@code <externalFilesDir>/wfwf/}) counts only from
     * API 30 (scoped storage): on Android 10 and older any app with WRITE_EXTERNAL_STORAGE could write it and switch
     * on debug behaviour without the user's opt-in.
     */
    public static List<File> debugFiles(File internal, File external, int sdkInt) {
        List<File> out = new ArrayList<>();
        out.add(internal);
        if (external != null && sdkInt >= 30) out.add(external);
        return out;
    }

    /**
     * Returns the text (at most {@link #MAX_DEBUG_BYTES} bytes, UTF-8) of the first existing candidate file, or null
     * when none exists or can be read. The file's presence is the debug opt-in.
     */
    public static String readDebugFile(List<File> candidates) {
        for (File f : candidates) {
            if (f == null || !f.isFile()) continue;
            try (InputStream in = new FileInputStream(f)) {
                byte[] buf = new byte[MAX_DEBUG_BYTES];
                int n = 0;
                int r;
                while (n < buf.length && (r = in.read(buf, n, buf.length - n)) > 0) n += r;
                return new String(buf, 0, n, StandardCharsets.UTF_8);
            } catch (Exception e) {
                // try the next one
            }
        }
        return null;
    }
}
