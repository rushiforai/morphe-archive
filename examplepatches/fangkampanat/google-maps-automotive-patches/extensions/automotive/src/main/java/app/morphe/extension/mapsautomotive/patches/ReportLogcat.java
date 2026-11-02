package app.morphe.extension.mapsautomotive.patches;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.nio.charset.StandardCharsets;
import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Deque;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * This app's own lines from logcat, for the problem report. An app without READ_LOGS gets only the
 * lines its own uid wrote, which covers Maps' code and the libraries in its processes (from 0.1.1;
 * until then reports held Maps Car's own lines only).
 * <p>
 * Three uses: the warning and error lines of a crashing process, read by the crash handler before the
 * process ends; the same lines of the main process for every report ({@link StartLogcat}), read with
 * its pid as well; and native crashes, which run no Java handler: Android writes them to the crash log
 * buffer ("Fatal signal" from libc in the crashing process, then crash_dump's tombstone lines tagged
 * DEBUG), where the next start finds them. Logcat on the head unit is short and lost with a restart,
 * so what was not read in time is gone. Plain Java, so it can be checked off the device.
 */
final class ReportLogcat {
    static final int CRASH_TAIL_LINES = 300, CRASH_TAIL_BYTES = 24 * 1024, NATIVE_LINES = 250, MAX_LINE_CHARS = 1024;
    static final long CRASH_TIMEOUT_MS = 1500, CHECK_TIMEOUT_MS = 3000;
    /** Between a crash copy's text and its logcat lines. Only private copies have it. */
    static final String MARKER = "\n\n--- logcat: this process, warnings and errors ---\n";
    private static final int MAX_RAW_LINES = 6000;
    /** A tombstone's lines follow the signal line within this time. */
    private static final long TOMBSTONE_WINDOW_MS = 15_000;
    // "10-30 12:34:56.789  1234  1250 W Tag     : message"
    private static final Pattern THREADTIME = Pattern.compile("^\\d\\d-\\d\\d \\d\\d:\\d\\d:\\d\\d\\.\\d{3}\\s+\\d+\\s+\\d+\\s+([VDIWEFA])\\s(.*?)\\s*:(?: |$)");
    // "-v threadtime -v epoch": "      1793004312.216  1234  1250 F libc    : message"
    private static final Pattern EPOCH = Pattern.compile("^\\s*(\\d+)\\.(\\d{3})\\s+(\\d+)\\s+(\\d+)\\s+([VDIWEFA])\\s(.*?)\\s*:(?: (.*))?$");
    private static final Pattern SIGNAL_PROCESS = Pattern.compile("pid (\\d+) \\((.*)\\)\\s*$");
    private static final Pattern SIGNAL_THREAD = Pattern.compile(" in tid \\d+ \\((.*?)\\), pid ");
    // "pid: 123, tid: 456, name: RenderThread  >>> app.morphe.android.apps.maps.automotive <<<"
    private static final Pattern TOMBSTONE_PROCESS = Pattern.compile(">>> (\\S+) <<<");
    private static final Pattern TOMBSTONE_THREAD = Pattern.compile("name: (.*?)\\s+>>> ");
    // Numbers in a message, so "Invalid ID 0x0000002a." and "Invalid ID 0x00000028." count as one message.
    private static final Pattern NUMBERS = Pattern.compile("0x[0-9a-fA-F]+|\\d+");

    private ReportLogcat() {
    }

    /** A logcat entry read with epoch times. */
    static final class Entry {
        final long time;
        final int pid;
        final char level;
        final String tag, message;

        Entry(long time, int pid, char level, String tag, String message) {
            this.time = time;
            this.pid = pid;
            this.level = level;
            this.tag = tag;
            this.message = message;
        }
    }

    /** A native crash found in the crash log buffer. */
    static final class NativeCrash {
        final long time;
        /** The libc line, such as "Fatal signal 6 (SIGABRT), code -1 (SI_QUEUE) in tid 123 (main), pid 123 (maps.automotive)". */
        final String signal;
        /** The full process name from the tombstone, else the short name from the signal line. */
        final String process, thread;
        final boolean mainProcess;
        final List<String> lines;

        NativeCrash(long time, String signal, String process, String thread, boolean mainProcess, List<String> lines) {
            this.time = time;
            this.signal = signal;
            this.process = process;
            this.thread = thread;
            this.mainProcess = mainProcess;
            this.lines = lines;
        }
    }

    // Reading.

    /** The warning and error lines of process [pid], newest kept; empty when logcat cannot be read in time. */
    static List<String> processTail(int pid) {
        return processTail(pid, CRASH_TIMEOUT_MS);
    }

    static List<String> processTail(int pid, long timeoutMs) {
        return crashTail(run(Arrays.asList("logcat", "-d", "-v", "threadtime", "--pid=" + pid), timeoutMs));
    }

    /** This app's entries in the crash log buffer, with epoch times. */
    static List<Entry> crashBuffer() {
        return parseEpoch(run(Arrays.asList("logcat", "-d", "-b", "crash", "-v", "threadtime", "-v", "epoch"), CHECK_TIMEOUT_MS));
    }

    /** Runs the command and returns its last output lines; whatever was read when the time is up. */
    static List<String> run(List<String> command, long timeoutMs) {
        Deque<String> lines = new ArrayDeque<>();
        java.lang.Process process = null;
        try {
            process = new ProcessBuilder(command).redirectErrorStream(true).start();
            java.lang.Process running = process;
            Thread reader = new Thread(() -> {
                try (BufferedReader in = new BufferedReader(new InputStreamReader(running.getInputStream(), StandardCharsets.UTF_8))) {
                    String line;
                    while ((line = in.readLine()) != null) {
                        synchronized (lines) {
                            lines.addLast(line);
                            if (lines.size() > MAX_RAW_LINES) lines.removeFirst();
                        }
                    }
                } catch (Exception ignored) {
                    // Ends the reading; what was read is kept.
                }
            }, "MorpheLogcat");
            reader.setDaemon(true);
            reader.start();
            reader.join(timeoutMs);
        } catch (Exception ignored) {
            // No logcat: no lines.
        } finally {
            if (process != null) process.destroy();
        }
        synchronized (lines) {
            return new ArrayList<>(lines);
        }
    }

    // Parsing.

    /**
     * Warning, error and fatal lines, without AndroidRuntime's copy of the stack trace (the crash
     * text has it), the newest that fit in 300 lines and 24 KiB, oldest first. A message repeated with
     * other numbers is kept once, its newest line, with "[+N similar]": on the Dolphin Maps' start logs
     * hundreds of "Invalid ID 0x…" lines, which would fill the 300 lines.
     */
    static List<String> crashTail(List<String> raw) {
        List<String> newest = new ArrayList<>();
        List<Integer> repeats = new ArrayList<>();
        Map<String, Integer> seen = new HashMap<>();
        for (int i = raw.size() - 1; i >= 0; i--) {
            String line = raw.get(i);
            Matcher match = THREADTIME.matcher(line);
            if (!match.find()) continue;
            char level = match.group(1).charAt(0);
            if (level != 'W' && level != 'E' && level != 'F' && level != 'A') continue;
            if (match.group(2).equals("AndroidRuntime")) continue;
            String key = level + match.group(2) + '\u0000' + NUMBERS.matcher(line.substring(match.end())).replaceAll("#");
            Integer at = seen.get(key);
            if (at != null) {
                repeats.set(at, repeats.get(at) + 1);
            } else if (newest.size() < CRASH_TAIL_LINES) {
                seen.put(key, newest.size());
                newest.add(line);
                repeats.add(0);
            }
        }
        List<String> kept = new ArrayList<>();
        int bytes = 0;
        for (int i = 0; i < newest.size(); i++) {
            String line = cut(repeats.get(i) == 0 ? newest.get(i) : newest.get(i) + " [+" + repeats.get(i) + " similar]");
            bytes += line.getBytes(StandardCharsets.UTF_8).length + 3;
            if (bytes > CRASH_TAIL_BYTES) break;
            kept.add(0, line);
        }
        return kept;
    }

    static List<Entry> parseEpoch(List<String> raw) {
        List<Entry> entries = new ArrayList<>();
        for (String line : raw) {
            Matcher match = EPOCH.matcher(line);
            if (!match.matches()) continue;
            try {
                long time = Long.parseLong(match.group(1)) * 1000 + Integer.parseInt(match.group(2));
                String message = match.group(7);
                entries.add(new Entry(time, Integer.parseInt(match.group(3)), match.group(5).charAt(0), match.group(6),
                        message == null ? "" : message));
            } catch (NumberFormatException ignored) {
                // Not an entry.
            }
        }
        return entries;
    }

    /**
     * The native crashes after [afterMillis]: each libc "Fatal signal" line with the DEBUG lines that
     * follow it, or a tombstone (DEBUG "*** *** ***") without one. [packageName] tells the main process
     * from the others.
     */
    static List<NativeCrash> nativeCrashes(List<Entry> entries, long afterMillis, String packageName) {
        List<NativeCrash> crashes = new ArrayList<>();
        int i = 0;
        while (i < entries.size()) {
            Entry start = entries.get(i);
            boolean signal = isSignal(start), tombstone = isTombstoneStart(start);
            if (!signal && !tombstone || start.time <= afterMillis) {
                i++;
                continue;
            }
            List<String> lines = new ArrayList<>();
            lines.add(cut(start.message));
            String fullName = null, tombstoneThread = null, tombstoneSignal = null;
            int j = i + 1;
            for (; j < entries.size() && lines.size() < NATIVE_LINES; j++) {
                Entry entry = entries.get(j);
                if (isSignal(entry) || entry.time - start.time > TOMBSTONE_WINDOW_MS) break;
                if (isTombstoneStart(entry)) {
                    if (tombstone) break;
                    tombstone = true;
                }
                if (!entry.tag.equals("DEBUG")) continue;
                lines.add(cut(entry.message));
                Matcher name = TOMBSTONE_PROCESS.matcher(entry.message);
                if (fullName == null && name.find()) {
                    fullName = name.group(1);
                    Matcher thread = TOMBSTONE_THREAD.matcher(entry.message);
                    if (thread.find()) tombstoneThread = thread.group(1);
                }
                if (tombstoneSignal == null && entry.message.startsWith("signal ")) tombstoneSignal = entry.message;
            }
            String text = signal ? start.message : tombstoneSignal != null ? tombstoneSignal : "signal unknown";
            Matcher shortName = SIGNAL_PROCESS.matcher(text);
            String comm = signal && shortName.find() ? shortName.group(2) : null;
            Matcher thread = SIGNAL_THREAD.matcher(text);
            String threadName = signal && thread.find() ? thread.group(1) : tombstoneThread;
            boolean main = fullName != null ? fullName.equals(packageName) : comm != null && comm.equals(shortProcessName(packageName));
            if (main || ours(fullName, comm, packageName)) {
                crashes.add(new NativeCrash(start.time, cut(text), fullName != null ? fullName : comm, threadName, main, lines));
            }
            i = j;
        }
        return crashes;
    }

    /**
     * Whether a crash belongs to one of this app's processes. Apps normally see only their own lines,
     * but a head unit that shows every app's log must not turn other apps' crashes into reports:
     * "[package]:name" from the tombstone, or a short name that ends "[end of package]:name".
     */
    static boolean ours(String fullName, String comm, String packageName) {
        if (fullName != null) return fullName.equals(packageName) || fullName.startsWith(packageName + ":");
        if (comm == null) return false;
        int colon = comm.indexOf(':');
        return comm.equals(shortProcessName(packageName)) || colon > 0 && packageName.endsWith(comm.substring(0, colon));
    }

    private static boolean isSignal(Entry entry) {
        return entry.tag.equals("libc") && entry.message.startsWith("Fatal signal ");
    }

    private static boolean isTombstoneStart(Entry entry) {
        return entry.tag.equals("DEBUG") && entry.message.startsWith("*** *** ***");
    }

    /** The name the kernel shows for a process: Android keeps the last 15 characters of a long dotted name. */
    static String shortProcessName(String name) {
        return name.length() < 15 || name.indexOf('.') < 0 || name.indexOf('@') >= 0 ? name : name.substring(name.length() - 15);
    }

    private static String cut(String line) {
        return line.length() <= MAX_LINE_CHARS ? line : line.substring(0, MAX_LINE_CHARS - 1) + "…";
    }
}
