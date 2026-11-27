package app.template.extension.zalo.buglog;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.TreeSet;

/**
 * The overview at the top of an exported bug log, parsed from the log files themselves: a table
 * per patch (errors, warnings, last occurrence, first error, whether its hook ran), the crashes and
 * ANRs with the patches they name, and the latest session header. Android-free so it can be unit
 * tested.
 */
final class ExportSummary {
    private ExportSummary() { }

    static final int FIRST_ERROR_CHARS = 120;
    static final String NOT_SEEN = "not seen";

    /** One log file: its name ({@code nezumi.log}, {@code nezumi-push.1.log}, ...) and its text. */
    static final class LogFile {
        final String name;
        final String text;

        LogFile(String name, String text) {
            this.name = name;
            this.text = text;
        }
    }

    private static final class PatchStats {
        int errors;
        int warnings;
        String last;
        String firstErrorTime;
        String firstError;
    }

    private static final class Session {
        final String header;
        final String time;
        final Set<String> hooksFired = new LinkedHashSet<>();

        Session(String header, String time) {
            this.header = header;
            this.time = time;
        }
    }

    /** Builds the summary; {@code files} are in export order (per process, older file first). */
    static String build(List<LogFile> files) {
        Map<String, PatchStats> stats = new LinkedHashMap<>();
        List<String> crashes = new ArrayList<>();
        // Process (file base name) to its latest session.
        Map<String, Session> latest = new LinkedHashMap<>();

        for (LogFile file : files) {
            String process = processOf(file.name);
            String[] lines = file.text.split("\n", -1);
            for (int index = 0; index < lines.length; index++) {
                String line = lines[index];
                if (line.startsWith("===== session ")) {
                    int end = index;
                    StringBuilder header = new StringBuilder();
                    String time = "";
                    while (end < lines.length) {
                        // A header cut short (failed to build, file truncated) ends at the next entry.
                        if (end > index && (lines[end].startsWith("===== ") || LogLine.parse(lines[end]) != null)) {
                            end--;
                            break;
                        }
                        header.append(lines[end]).append('\n');
                        if (lines[end].startsWith("time: ")) time = lines[end].substring(6).trim();
                        if (end > index && lines[end].equals("=====")) break;
                        end++;
                    }
                    // A rotated file repeats the header of the session it continues.
                    if (line.endsWith(" start =====") || !latest.containsKey(process)) {
                        latest.put(process, new Session(header.toString(), time));
                    }
                    index = end;
                    continue;
                }
                LogLine.Parsed parsed = LogLine.parse(line);
                if (parsed == null) continue;
                if (parsed.tag.equals(LogLine.HOOK_TAG) && parsed.message.startsWith(LogLine.HOOK_FIRED)) {
                    Session session = latest.get(process);
                    if (session == null) latest.put(process, session = new Session("", ""));
                    session.hooksFired.add(parsed.patchId);
                    continue;
                }
                if (parsed.level != 'E' && parsed.level != 'W') continue;
                PatchStats patch = stats.get(parsed.patchId);
                if (patch == null) stats.put(parsed.patchId, patch = new PatchStats());
                if (parsed.level == 'E') {
                    patch.errors++;
                    if (patch.firstErrorTime == null || parsed.time.compareTo(patch.firstErrorTime) < 0) {
                        patch.firstErrorTime = parsed.time;
                        patch.firstError = parsed.tag + ": " + parsed.message;
                    }
                    if (isCrash(parsed)) crashes.add(parsed.time + " [" + process + "] " + parsed.message);
                } else {
                    patch.warnings++;
                }
                if (patch.last == null || parsed.time.compareTo(patch.last) > 0) patch.last = parsed.time;
            }
        }

        Session newest = newestSession(latest);
        Map<String, String> applied = appliedPatches(newest == null ? "" : newest.header);
        Set<String> hooksFired = new LinkedHashSet<>();
        for (Session session : latest.values()) hooksFired.addAll(session.hooksFired);

        Set<String> rows = new LinkedHashSet<>(applied.keySet());
        rows.addAll(new TreeSet<>(stats.keySet()));

        StringBuilder out = new StringBuilder();
        out.append("===== Nezumi bug log summary =====\n");
        out.append("E/W: errors and warnings in all kept logs. hook: the patch's hook ran in the latest session\n");
        out.append("of any process (\"").append(NOT_SEEN).append("\" is not an error: the feature may simply not have been used).\n");
        out.append("n/a: the patch has no runtime hook.\n\n");
        out.append(String.format(Locale.US, "%-40s %5s %5s  %-23s  %-8s  %s%n", "patch", "E", "W", "last E/W", "hook", "first error"));
        if (rows.isEmpty()) out.append("(no patches recorded)\n");
        for (String id : rows) {
            PatchStats patch = stats.get(id);
            String hook = hooksFired.contains(id) ? "yes"
                : "no-hook".equals(applied.get(id)) ? "n/a"
                : NOT_SEEN;
            out.append(String.format(Locale.US, "%-40s %5d %5d  %-23s  %-8s  %s%n", id,
                patch == null ? 0 : patch.errors, patch == null ? 0 : patch.warnings,
                patch == null || patch.last == null ? "-" : patch.last, hook,
                patch == null || patch.firstError == null ? "-" : shorten(patch.firstError, FIRST_ERROR_CHARS)));
        }
        out.append("\nCrashes and ANRs:\n");
        if (crashes.isEmpty()) out.append("  (none)\n");
        for (String crash : crashes) out.append("  ").append(crash).append('\n');
        out.append("\nLatest session:\n");
        out.append(newest == null || newest.header.isEmpty() ? "(no session header)\n" : newest.header);
        out.append("===== end of summary =====\n");
        return out.toString();
    }

    /** Java crashes from the crash handler and exits of previous runs that the system reported as failures. */
    private static boolean isCrash(LogLine.Parsed line) {
        return line.tag.equals("CrashCapture") || line.tag.equals("ExitReasons");
    }

    /** The main process's latest session, else the newest of any process. */
    private static Session newestSession(Map<String, Session> latest) {
        Session main = latest.get("nezumi");
        if (main != null && !main.header.isEmpty()) return main;
        Session newest = null;
        for (Session session : latest.values()) {
            if (session.header.isEmpty()) continue;
            if (newest == null || session.time.compareTo(newest.time) > 0) newest = session;
        }
        return newest;
    }

    /** Patch id to "hook"/"no-hook" from a session header's "applied patches:" block. */
    static Map<String, String> appliedPatches(String header) {
        Map<String, String> result = new LinkedHashMap<>();
        boolean inBlock = false;
        for (String line : header.split("\n")) {
            if (line.startsWith("applied patches:")) {
                inBlock = true;
                continue;
            }
            if (!inBlock) continue;
            if (!line.startsWith("  ")) break;
            String entry = line.trim();
            int space = entry.indexOf(' ');
            String id = space < 0 ? entry : entry.substring(0, space);
            if (!id.matches("[a-z0-9-]+")) continue;
            result.put(id, entry.contains("[no-hook]") ? "no-hook" : "hook");
        }
        return result;
    }

    /** {@code nezumi-push.1.log} to {@code nezumi-push}. */
    static String processOf(String fileName) {
        if (fileName.endsWith(".1.log")) return fileName.substring(0, fileName.length() - ".1.log".length());
        if (fileName.endsWith(".log")) return fileName.substring(0, fileName.length() - ".log".length());
        return fileName;
    }

    static String shorten(String text, int max) {
        return text.length() <= max ? text : text.substring(0, max - 3) + "...";
    }
}
