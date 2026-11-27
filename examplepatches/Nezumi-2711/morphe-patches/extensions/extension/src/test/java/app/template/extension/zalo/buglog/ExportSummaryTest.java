package app.template.extension.zalo.buglog;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

import java.util.Arrays;
import java.util.Collections;
import java.util.Map;

import org.junit.Test;

public class ExportSummaryTest {
    private static String header(int pid, String time, String... applied) {
        StringBuilder out = new StringBuilder();
        out.append("===== session ").append(pid).append(" start =====\n");
        out.append("time: ").append(time).append('\n');
        out.append("process: com.zing.zalo\n");
        out.append("options:\n  hide_typing = true\n");
        out.append("applied patches:");
        for (String patch : applied) out.append("\n  ").append(patch);
        out.append("\n=====\n");
        return out.toString();
    }

    private static String line(String time, char level, String patch, String tag, String message) {
        return time + " " + LogLine.body(level, patch, tag, "main", message, null) + "\n";
    }

    private static final String OLD_SESSION = "===== Nezumi bug log =====\n"
        + header(100, "2026-11-27 09:00:00.000", "keep-recalled-messages [hook]", "save-media [hook]")
        + line("2026-11-27 09:00:01.000", 'I', "save-media", "Hook", "hook fired")
        + line("2026-11-27 09:00:02.000", 'E', "keep-recalled-messages", "RecalledMessages", "first failure")
        + "java.lang.IllegalStateException: boom\n\tat a.b.C.d(C.java:1)\n"
        + line("2026-11-27 09:00:03.000", 'E', "core", "CrashCapture",
            "uncaught exception in thread \"main\" [patched-by: keep-recalled-messages] [nezumi: keep-recalled-messages]");

    private static final String NEW_SESSION =
        header(200, "2026-11-27 10:00:00.000", "keep-recalled-messages [hook]", "save-media [hook]",
            "clone-package [no-hook] packageName=com.zing.zalo.clone, appName=Zalo Clone")
        + line("2026-11-27 10:00:01.000", 'I', "keep-recalled-messages", "Hook", "hook fired")
        + line("2026-11-27 10:00:02.000", 'W', "keep-recalled-messages", "RecalledMessages", "row refresh unavailable")
        + line("2026-11-27 10:00:03.000", 'E', "keep-recalled-messages", "RecalledMessages", "second failure")
        + line("2026-11-27 10:00:04.000", 'W', "core", "BugLog", "dropped 3 lines")
        + line("2026-11-27 10:00:05.000", 'E', "core", "ExitReasons", "[previous run] ANR at 2026-11-27 09:30:00.000 [patched-by: save-media]");

    private static String build() {
        return ExportSummary.build(Arrays.asList(
            new ExportSummary.LogFile("nezumi.1.log", OLD_SESSION),
            new ExportSummary.LogFile("nezumi.log", NEW_SESSION)));
    }

    private static String row(String summary, String id) {
        for (String line : summary.split("\n")) {
            if (line.startsWith(id + " ")) return line;
        }
        throw new AssertionError("no row for " + id + " in\n" + summary);
    }

    @Test
    public void countsErrorsAndWarningsPerPatch() {
        String row = row(build(), "keep-recalled-messages");
        String[] columns = row.trim().split("\\s+");
        assertEquals("2", columns[1]);
        assertEquals("1", columns[2]);
        assertTrue(row, row.contains("2026-11-27 10:00:03.000"));
        // First error by time, prefixed with its tag.
        assertTrue(row, row.contains("RecalledMessages: first failure"));
    }

    @Test
    public void hookStatusComesFromTheLatestSessionOnly() {
        String summary = build();
        assertTrue(row(summary, "keep-recalled-messages").contains(" yes "));
        // save-media fired only in the older session.
        assertTrue(row(summary, "save-media").contains(ExportSummary.NOT_SEEN));
        assertTrue(row(summary, "clone-package").contains(" n/a "));
    }

    @Test
    public void listsCrashesAndAnrsWithTheirLabels() {
        String summary = build();
        String crashes = summary.substring(summary.indexOf("Crashes and ANRs:"), summary.indexOf("Latest session:"));
        assertTrue(crashes, crashes.contains("[nezumi] uncaught exception in thread \"main\" [patched-by: keep-recalled-messages]"));
        assertTrue(crashes, crashes.contains("ANR at 2026-11-27 09:30:00.000 [patched-by: save-media]"));
    }

    @Test
    public void includesTheLatestSessionHeader() {
        String summary = build();
        String latest = summary.substring(summary.indexOf("Latest session:"));
        assertTrue(latest, latest.contains("===== session 200 start ====="));
        assertTrue(latest, !latest.contains("session 100"));
    }

    @Test
    public void rowsCoverAppliedAndLoggedPatches() {
        String summary = build();
        row(summary, "core");
        row(summary, "clone-package");
    }

    @Test
    public void truncatesLongFirstErrors() {
        StringBuilder message = new StringBuilder();
        while (message.length() < 300) message.append("x");
        String summary = ExportSummary.build(Collections.singletonList(new ExportSummary.LogFile("nezumi.log",
            line("2026-11-27 10:00:00.000", 'E', "save-media", "SaveMedia", message.toString()))));
        String row = row(summary, "save-media");
        assertTrue(row, row.endsWith("..."));
        assertTrue(row, !row.contains(message.toString()));
    }

    @Test
    public void toleratesEmptyAndHeaderlessLogs() {
        String empty = ExportSummary.build(Collections.<ExportSummary.LogFile>emptyList());
        assertTrue(empty.contains("(no patches recorded)"));
        assertTrue(empty.contains("(no session header)"));
        // A header cut short must not swallow the lines after it.
        String cut = ExportSummary.build(Collections.singletonList(new ExportSummary.LogFile("nezumi.log",
            "===== session 1 start =====\ntime: 2026-11-27 10:00:00.000\n"
                + line("2026-11-27 10:00:01.000", 'E', "save-media", "SaveMedia", "after cut header"))));
        assertTrue(row(cut, "save-media").contains("after cut header"));
    }

    @Test
    public void parsesAppliedPatchBlock() {
        Map<String, String> applied = ExportSummary.appliedPatches(header(1, "t",
            "bug-log [hook]", "clone-package [no-hook] packageName=x"));
        assertEquals("hook", applied.get("bug-log"));
        assertEquals("no-hook", applied.get("clone-package"));
        assertEquals(2, applied.size());
    }

    @Test
    public void hookFiredInASecondaryProcessCountsAsYes() {
        String main = header(300, "2026-11-27 11:00:00.000", "keep-recalled-messages [hook]",
            "mark-as-read-from-notifications [hook]")
            + line("2026-11-27 11:00:01.000", 'I', "keep-recalled-messages", "Hook", "hook fired");
        String push = "===== Nezumi bug log =====\n"
            + header(301, "2026-11-27 11:00:02.000", "keep-recalled-messages [hook]",
                "mark-as-read-from-notifications [hook]")
            + line("2026-11-27 11:00:03.000", 'I', "mark-as-read-from-notifications", "Hook", "hook fired");
        String summary = ExportSummary.build(Arrays.asList(
            new ExportSummary.LogFile("nezumi.log", main),
            new ExportSummary.LogFile("nezumi-push.log", push)));
        assertTrue(row(summary, "keep-recalled-messages").contains(" yes "));
        assertTrue(row(summary, "mark-as-read-from-notifications").contains(" yes "));
        // The header shown is still the main process's.
        assertTrue(summary.substring(summary.indexOf("Latest session:")).contains("session 300 start"));
    }
}
