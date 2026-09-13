package app.morphe.extension.shared;

import static org.junit.Assert.assertTrue;

import app.morphe.extension.shared.settings.preference.LogBufferManager;
import app.morphe.extension.tiktok.SettingsContextRule;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import java.util.concurrent.atomic.AtomicBoolean;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 28)
public class UtilsSchedulingTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @Before
    public void setUp() {
        LogBufferManager.clearLogBuffer();
    }

    @After
    public void tearDown() throws Exception {
        Utils.awaitBackgroundTasksForTests();
        LogBufferManager.clearLogBuffer();
    }

    @Test
    public void aBackgroundErrorIsLoggedAndThePoolKeepsRunning() throws Exception {
        AtomicBoolean laterTaskRan = new AtomicBoolean();
        Utils.runOnBackgroundThread(() -> { throw new AssertionError("background sentinel"); });
        Utils.runOnBackgroundThread(() -> laterTaskRan.set(true));
        Utils.awaitBackgroundTasksForTests();

        assertTrue(laterTaskRan.get());
        assertTrue(LogBufferManager.buildExportText().contains("background sentinel"));
    }

    @Test
    public void anImmediateMainThreadErrorIsLoggedInsteadOfEscaping() {
        assertTrue(Utils.isCurrentlyOnMainThread());
        Utils.runOnMainThreadNowOrLater(() -> { throw new AssertionError("main sentinel"); });
        assertTrue(LogBufferManager.buildExportText().contains("main sentinel"));
    }
}
