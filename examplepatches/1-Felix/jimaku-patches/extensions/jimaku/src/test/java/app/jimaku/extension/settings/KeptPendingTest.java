package app.jimaku.extension.settings;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

import app.jimaku.extension.jobs.JobKind;
import app.jimaku.extension.session.PendingJob;

public class KeptPendingTest {
    @Test
    public void keepsTheJobWaitedOnAcrossRunsUntilItIsForgotten() {
        MemoryPrefs prefs = new MemoryPrefs();
        new KeptPending(() -> prefs).save(new PendingJob("job-1", "aaaaaaaaaaa", "de", JobKind.CAPTIONS, "A video", true));
        PendingJob again = new KeptPending(() -> prefs).load();
        assertEquals("job-1", again.job);
        assertEquals("aaaaaaaaaaa", again.video);
        assertEquals("de", again.lang);
        assertEquals(JobKind.CAPTIONS, again.kind);
        assertEquals("A video", again.title);
        assertTrue(again.joined);

        // A later job is the one waited on now, and a late forget of the earlier one leaves it.
        new KeptPending(() -> prefs).clear("job-0");
        assertEquals("job-1", new KeptPending(() -> prefs).load().job);
        new KeptPending(() -> prefs).clear("job-1");
        assertNull(new KeptPending(() -> prefs).load());
    }

    @Test
    public void aRecordThatCantBeReadCountsAsNone() {
        MemoryPrefs prefs = new MemoryPrefs();
        prefs.edit().putString("pending_job", "job-1").putString("pending_video", "aaaaaaaaaaa").putString("pending_lang", "de")
                .putString("pending_kind", "something else").apply();
        assertNull(new KeptPending(() -> prefs).load());
    }
}
