package io.github.emotionbug.patches.runtime;

import android.app.job.JobParameters;
import android.app.job.JobWorkItem;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.Intent;
import android.net.Uri;
import android.os.PowerManager;
import java.io.File;
import java.nio.file.Files;
import java.util.concurrent.atomic.AtomicReference;
import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.rules.TemporaryFolder;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.Shadows;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.SQLiteMode;
import org.robolectric.shadow.api.Shadow;
import org.robolectric.shadows.ShadowJobService;
import org.robolectric.util.ReflectionHelpers;
import org.robolectric.util.ReflectionHelpers.ClassParameter;
import static org.junit.Assert.*;

@RunWith(RobolectricTestRunner.class)
@Config(manifest = Config.NONE, sdk = 29)
@SQLiteMode(SQLiteMode.Mode.NATIVE)
public class SummaryJobServiceTest {
    @Rule public final TemporaryFolder temporary = new TemporaryFolder();
    private Context context;
    private SummaryStore store;
    private SummaryJobService service;
    private PowerManager power;
    private JobParameters parameters;

    @Before public void open() throws Exception {
        File privateRoot = temporary.newFolder("private");
        context = new ContextWrapper(RuntimeEnvironment.getApplication()) {
            @Override public Context getApplicationContext() { return this; }
            @Override public File getNoBackupFilesDir() { return privateRoot; }
        };
        store = new SummaryStore(context);
        ReflectionHelpers.setStaticField(SummaryStore.class, "instance", store);
        store.mode(SummaryStore.ALWAYS);
        service = new SummaryJobService();
        ReflectionHelpers.callInstanceMethod(ContextWrapper.class, service, "attachBaseContext", ClassParameter.from(Context.class, context));
        power = context.getSystemService(PowerManager.class);
        parameters = Shadow.newInstanceOf(JobParameters.class);
        owner().set(parameters);
        ReflectionHelpers.setField(service, "active", true);
    }
    @After public void close() {
        service.onDestroy(); store.close();
        ReflectionHelpers.setStaticField(SummaryStore.class, "instance", null);
    }
    private AtomicReference<JobParameters> owner() { return ReflectionHelpers.getField(service, "running"); }
    private boolean selectGpu() { return ReflectionHelpers.callInstanceMethod(service, "selectGpu"); }
    private SummaryStore.Job claim() {
        return ReflectionHelpers.callInstanceMethod(service, "claimNext",
                ClassParameter.from(SummaryStore.class, store), ClassParameter.from(boolean.class, true));
    }
    private void screenOn() {
        BroadcastReceiver receiver = ReflectionHelpers.getField(service, "stop");
        receiver.onReceive(context, new Intent(Intent.ACTION_SCREEN_ON));
    }
    private void finish(JobParameters job, boolean retry) {
        ReflectionHelpers.callInstanceMethod(service, "finishJob", ClassParameter.from(JobParameters.class, job),
                ClassParameter.from(boolean.class, retry));
    }
    private void enqueue(long id) { store.event(id, id + 100, Uri.parse("content://fixture/audio/" + id), false, null, null); }

    @Test public void wakingGpuReturnsWorkOnceAndRetainsRevisionAndCheckpoint() throws Exception {
        enqueue(1); enqueue(2);
        SummaryStore.Job job = claim();
        File checkpoint = new File(store.work(job), "completed.chunk");
        Files.write(checkpoint.toPath(), new byte[]{1, 3, 5});
        Shadows.shadowOf(power).setIsInteractive(false);
        assertTrue(selectGpu());
        Shadows.shadowOf(power).setIsInteractive(true);
        screenOn();
        ShadowJobService shadow = Shadow.extract(service);
        assertTrue(shadow.getIsJobFinished());
        assertTrue(shadow.getIsRescheduleNeeded());
        assertNull(owner().get());
        assertEquals("waiting", store.job(job.id).state);
        assertNull(claim()); // No claim can escape the pause after running rows were marked waiting.
        assertFalse(ReflectionHelpers.<Boolean>callInstanceMethod(service, "completeWork",
                ClassParameter.from(JobParameters.class, parameters), ClassParameter.from(JobWorkItem.class, new JobWorkItem(new Intent()))));
        finish(parameters, false); screenOn();
        assertTrue(shadow.getIsRescheduleNeeded()); // A late finalizer cannot undo the handoff.
        assertFalse(service.onStartJob(Shadow.newInstanceOf(JobParameters.class))); // Terminal notification owner is not reused.
        store.recoverForScheduling(context);
        SummaryStore.Job resumed = store.next(true);
        assertEquals(job.id, resumed.id);
        assertEquals(job.revision, resumed.revision);
        assertArrayEquals(new byte[]{1, 3, 5}, Files.readAllBytes(checkpoint.toPath()));
        store.release(resumed);
        assertFalse(selectGpu());
    }

    @Test public void interactiveCpuAndDelayedScreenOnDoNotRestart() {
        enqueue(1);
        SummaryStore.Job job = claim();
        Shadows.shadowOf(power).setIsInteractive(true);
        assertFalse(selectGpu());
        screenOn();
        assertSame(parameters, owner().get());
        assertEquals("running",store.job(job.id).state);
        Shadows.shadowOf(power).setIsInteractive(false);
        assertTrue(selectGpu());
        screenOn(); // Stale broadcast must not interrupt a currently noninteractive device.
        assertSame(parameters, owner().get());
        assertFalse(((ShadowJobService) Shadow.extract(service)).getIsJobFinished());
        store.release(job);
    }

    @Test public void schedulerStopDoesNotExplicitlyFinishOrClaimMoreWork() {
        enqueue(1);
        SummaryStore.Job job = claim();
        assertTrue(service.onStopJob(parameters));
        assertNull(owner().get());
        finish(parameters, true);
        assertFalse(((ShadowJobService) Shadow.extract(service)).getIsJobFinished());
        assertEquals("waiting",store.job(job.id).state);
        assertNull(claim());
    }

    @Test public void staleCompletionAndStopCannotTakeReplacementOwnership() {
        JobParameters replacement = Shadow.newInstanceOf(JobParameters.class);
        owner().set(replacement);
        finish(parameters, false);
        assertFalse(service.onStopJob(parameters));
        assertSame(replacement,owner().get());
        assertFalse(((ShadowJobService) Shadow.extract(service)).getIsJobFinished());
    }

    @Test
    @org.robolectric.annotation.LooperMode(org.robolectric.annotation.LooperMode.Mode.PAUSED)
    public void ownedProcessExitIsQueuedAfterCompletionAcknowledgement() {
        Object thread = org.robolectric.shadows.ShadowActivityThread.currentActivityThread();
        Object bound = ReflectionHelpers.getField(thread, "mBoundApplication");
        String previous = ReflectionHelpers.getField(bound, "processName");
        org.robolectric.shadows.ShadowProcess.clearKilledProcesses();
        try {
            ReflectionHelpers.setField(bound, "processName", context.getPackageName() + SummaryJobService.PROCESS_SUFFIX);
            Shadows.shadowOf(power).setIsInteractive(false);
            assertTrue(selectGpu());
            Shadows.shadowOf(power).setIsInteractive(true);
            screenOn();
            assertTrue(((ShadowJobService) Shadow.extract(service)).getIsRescheduleNeeded());
            assertFalse(org.robolectric.shadows.ShadowProcess.wasKilled(android.os.Process.myPid()));
            Shadows.shadowOf(android.os.Looper.getMainLooper()).idle();
            assertTrue(org.robolectric.shadows.ShadowProcess.wasKilled(android.os.Process.myPid()));
        } finally {
            ReflectionHelpers.setField(bound, "processName", previous);
            org.robolectric.shadows.ShadowProcess.clearKilledProcesses();
        }
    }
}
