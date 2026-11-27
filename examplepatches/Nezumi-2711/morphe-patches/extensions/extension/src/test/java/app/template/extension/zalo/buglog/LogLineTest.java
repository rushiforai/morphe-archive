package app.template.extension.zalo.buglog;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import java.util.TimeZone;

import org.junit.Test;

public class LogLineTest {
    @Test
    public void bodyHasLevelPatchTagThreadAndMessage() {
        assertEquals("E/keep-recalled-messages/RecalledMessages [main] row refresh unavailable",
            LogLine.body('E', "keep-recalled-messages", "RecalledMessages", "main", "row refresh unavailable", null));
    }

    @Test
    public void detailGoesOnFollowingLines() {
        assertEquals("W/core/ZaloEnv [bg] lookup failed\njava.lang.Exception\n\tat a.b.C.d(C.java:1)",
            LogLine.body('W', "core", "ZaloEnv", "bg", "lookup failed", "java.lang.Exception\n\tat a.b.C.d(C.java:1)"));
    }

    @Test
    public void fullLinePrefixesTimestamp() {
        TimeZone saved = TimeZone.getDefault();
        try {
            TimeZone.setDefault(TimeZone.getTimeZone("UTC"));
            // New thread: the formatter is per thread and picks up the zone on first use.
            String[] line = new String[1];
            Thread thread = new Thread(() -> line[0] = LogLine.full(0L, "I/core/Hook [main] hook fired"));
            thread.start();
            thread.join();
            assertEquals("1970-01-01 00:00:00.000 I/core/Hook [main] hook fired", line[0]);
        } catch (InterruptedException interrupted) {
            throw new AssertionError(interrupted);
        } finally {
            TimeZone.setDefault(saved);
        }
    }

    @Test
    public void parseRoundTrips() {
        String line = "2026-11-27 10:15:30.123 " + LogLine.body('W', "save-media", "PostPhotoSave", "pool-2-thread-1",
            "post menu: no photo row [x]", null);
        LogLine.Parsed parsed = LogLine.parse(line);
        assertNotNull(parsed);
        assertEquals("2026-11-27 10:15:30.123", parsed.time);
        assertEquals('W', parsed.level);
        assertEquals("save-media", parsed.patchId);
        assertEquals("PostPhotoSave", parsed.tag);
        assertEquals("pool-2-thread-1", parsed.thread);
        assertEquals("post menu: no photo row [x]", parsed.message);
    }

    @Test
    public void parseRejectsContinuationAndLegacyLines() {
        assertNull(LogLine.parse("\tat a.b.C.d(C.java:1)"));
        assertNull(LogLine.parse("2026-11-27 10:15:30.123 W/NezumiRecall [main] old format without patch id"));
        assertNull(LogLine.parse("===== session 123 start ====="));
    }

    @Test
    public void hookHitsGoToTheFileWithDetailedLoggingOff() {
        assertTrue(LogLine.goesToFile('I', LogLine.HOOK_TAG, false));
        assertTrue(LogLine.goesToFile('E', "RecalledMessages", false));
        // Other info/warning lines stay in the in-memory ring unless detailed logging is on.
        assertFalse(LogLine.goesToFile('I', "RecalledMessages", false));
        assertFalse(LogLine.goesToFile('W', "RecalledMessages", false));
        assertTrue(LogLine.goesToFile('W', "RecalledMessages", true));
    }
}
