package app.hushtumblr.extension.tumblr.settings;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import android.app.Activity;
import android.preference.SwitchPreference;

import app.hushtumblr.extension.shared.SettingsContextRule;
import app.hushtumblr.extension.shared.settings.Setting;
import app.hushtumblr.extension.shared.settings.FailingStore;
import app.hushtumblr.extension.shared.settings.preference.AbstractPreferenceFragment;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.android.controller.ActivityController;
import org.robolectric.annotation.Config;
import org.robolectric.shadows.ShadowLooper;

import java.util.ArrayDeque;
import java.util.EnumSet;
import java.util.concurrent.RejectedExecutionException;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicBoolean;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
@SuppressWarnings("deprecation")
public class AsyncToggleTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    private final ArrayDeque<Runnable> work = new ArrayDeque<>();
    private ActivityController<Activity> controller;
    private HushTumblrPreferenceFragment page;

    @Before public void open() {
        PatchFamily.inBuildForTests = EnumSet.allOf(PatchFamily.class);
        Settings.HIDE_ADS.save(true);
        Settings.HIDE_TUMBLR_TV.save(false);
        Settings.CHECK_FOR_RELEASES.save(false);
        controller = Robolectric.buildActivity(Activity.class).setup();
        page = new HushTumblrPreferenceFragment();
        controller.get().getFragmentManager().beginTransaction().add(android.R.id.content, page).commitNow();
        HushTumblrPreferenceFragment.editWorkerForTests = work::add;
    }

    /**
     * A tap's change on [row], through its change listener as the framework's callChangeListener
     * does: true when nothing refuses it. That method is protected on android.preference.Preference,
     * so tests outside its package call this.
     */
    static boolean change(android.preference.Preference row, Object value) {
        android.preference.Preference.OnPreferenceChangeListener listener = row.getOnPreferenceChangeListener();
        return listener == null || listener.onPreferenceChange(row, value);
    }

    @After public void close() {
        HushTumblrPreferenceFragment.editWorkerForTests = Runnable::run;
        while (!work.isEmpty()) work.remove().run();
        ShadowLooper.idleMainLooper(250, TimeUnit.MILLISECONDS);
        controller.close();
        PatchFamily.inBuildForTests = null;
        Settings.HIDE_ADS.save(true);
        Settings.HIDE_TUMBLR_TV.save(false);
        Settings.CHECK_FOR_RELEASES.save(false);
    }

    @Test public void aSwitchKeepsItsSavedValueUntilTheWorkerFinishes() {
        SwitchPreference row = row(Settings.HIDE_ADS.key);
        CharSequence summary = row.getSummary();
        assertFalse(row.isPersistent());
        assertFalse(change(row, false));
        assertTrue(row.isChecked());
        assertTrue(Settings.HIDE_ADS.persistedValue());
        assertFalse(row.isEnabled());
        assertEquals("Saving the setting", row.getSummary());
        assertFalse(change(row, false));
        assertEquals(1, work.size());

        work.remove().run();
        ShadowLooper.idleMainLooper();

        assertFalse(Settings.HIDE_ADS.persistedValue());
        assertFalse(row.isChecked());
        assertTrue(row.isEnabled());
        assertEquals(summary, row.getSummary());
    }

    @Test public void returningToDefaultRemovesTheKeyInTheWorker() {
        Settings.HIDE_ADS.save(false);
        settle();
        page.refreshSwitches();
        SwitchPreference row = row(Settings.HIDE_ADS.key);
        assertFalse(change(row, true));
        assertTrue(Setting.preferences.preferences.contains(Settings.HIDE_ADS.key));

        work.remove().run();
        ShadowLooper.idleMainLooper();

        assertTrue(row.isChecked());
        assertFalse(Setting.preferences.preferences.contains(Settings.HIDE_ADS.key));
    }

    @Test public void aFailedDurableWriteKeepsTheEarlierSwitchAndCanBeRetried() {
        SwitchPreference row = row(Settings.HIDE_ADS.key);
        for (FailingStore.Fault fault : new FailingStore.Fault[]{FailingStore.Fault.COMMIT_FALSE,
                FailingStore.Fault.COMMIT_THROWS}) {
            assertFalse(change(row, false));
            try (FailingStore ignored = FailingStore.install(fault)) {
                work.remove().run();
            }
            ShadowLooper.idleMainLooper();
            assertTrue(Settings.HIDE_ADS.persistedValue());
            assertTrue(row.isChecked());
            assertTrue(row.isEnabled());
            assertEquals("The setting couldn't finish updating. Its saved value is shown.",
                    SettingsFeedbackTest.message(row));
            settle();
        }
        // Drawn under the switch, where it stays after any toast would have gone.
        android.view.View shown = row.getView(null, new android.widget.FrameLayout(controller.get()));
        android.widget.TextView said = shown.findViewWithTag(SettingsFeedback.MESSAGE_TAG);
        assertEquals("The setting couldn't finish updating. Its saved value is shown.", said.getText().toString());
        // The next flip that saves takes the failure away, and says the change waits for a restart.
        assertFalse(change(row, false));
        work.remove().run();
        ShadowLooper.idleMainLooper();
        assertFalse(Settings.HIDE_ADS.persistedValue());
        assertEquals("Saved. Restart Tumblr to apply this change.", SettingsFeedbackTest.message(row));
    }

    @Test @Config(sdk = {30, 37})
    public void aRejectedWorkerLeavesTheSwitchReadyToTryAgain() {
        HushTumblrPreferenceFragment.editWorkerForTests = task -> { throw new RejectedExecutionException(); };
        SwitchPreference row = row(Settings.HIDE_ADS.key);

        assertFalse(change(row, false));

        assertTrue(row.isChecked());
        assertTrue(row.isEnabled());
        assertTrue(Settings.HIDE_ADS.persistedValue());
        assertEquals("Couldn't start that. Try again in a moment.", SettingsFeedbackTest.message(row));
    }

    @Test public void anAvailabilityRefreshCannotEnableTheSwitchDuringItsSave() {
        SwitchPreference row = row(Settings.HIDE_ADS.key);
        change(row, false);
        page.refreshSwitches();
        assertFalse(row.isEnabled());
        assertFalse(change(row, false));
        assertEquals(1, work.size());
    }

    @Test public void anAcceptedSaveRetainsRestartDebtAfterThePageCloses() {
        SwitchPreference row = row(Settings.HIDE_TUMBLR_TV.key);
        change(row, true);
        controller.get().getFragmentManager().beginTransaction().remove(page).commitNow();

        work.remove().run();
        ShadowLooper.idleMainLooper();

        assertTrue(Settings.HIDE_TUMBLR_TV.persistedValue());
        assertTrue(AbstractPreferenceFragment.restartPending.contains(Settings.HIDE_TUMBLR_TV.key));
        assertFalse(page.isAdded());
    }

    @Test public void aSaveThatFailsAfterThePageClosesIsSaidUnderTheSwitchWhenSettingsOpensAgain() {
        String failed = "The setting couldn't finish updating. Its saved value is shown.";
        change(row(Settings.HIDE_ADS.key), false);
        controller.get().getFragmentManager().beginTransaction().remove(page).commitNow();
        try (FailingStore ignored = FailingStore.install(FailingStore.Fault.COMMIT_FALSE)) {
            work.remove().run();
        }
        ShadowLooper.idleMainLooper();
        assertEquals(failed, org.robolectric.shadows.ShadowToast.getTextOfLatestToast());

        page = new HushTumblrPreferenceFragment();
        controller.get().getFragmentManager().beginTransaction().add(android.R.id.content, page).commitNow();
        assertTrue(row(Settings.HIDE_ADS.key).isChecked());
        assertEquals(failed, SettingsFeedbackTest.message(row(Settings.HIDE_ADS.key)));

        // Said once: the screen after that starts clean.
        HushTumblrPreferenceFragment shown = page;
        page = new HushTumblrPreferenceFragment();
        controller.get().getFragmentManager().beginTransaction()
                .remove(shown).add(android.R.id.content, page).commitNow();
        assertNull(SettingsFeedbackTest.message(row(Settings.HIDE_ADS.key)));
    }

    /** A rotation mid-save rebuilds the page, and the failure belongs under the new page's switch. */
    @Test public void aSaveThatFailsAfterThePageIsReplacedIsSaidUnderTheNewSwitch() {
        String failed = "The setting couldn't finish updating. Its saved value is shown.";
        change(row(Settings.HIDE_ADS.key), false);
        HushTumblrPreferenceFragment oldPage = page;
        page = new HushTumblrPreferenceFragment();
        controller.get().getFragmentManager().beginTransaction()
                .remove(oldPage).add(android.R.id.content, page).commitNow();
        try (FailingStore ignored = FailingStore.install(FailingStore.Fault.COMMIT_FALSE)) {
            work.remove().run();
        }
        ShadowLooper.idleMainLooper();

        assertTrue(row(Settings.HIDE_ADS.key).isChecked());
        assertEquals(failed, SettingsFeedbackTest.message(row(Settings.HIDE_ADS.key)));
        String toast = org.robolectric.shadows.ShadowToast.getTextOfLatestToast();
        assertFalse("said in a toast over a screen that shows it", failed.equals(toast));
    }

    @Test public void aSaveFinishingAfterReplacementRefreshesTheNewPage() {
        change(row(Settings.HIDE_ADS.key), false);
        HushTumblrPreferenceFragment oldPage = page;
        page = new HushTumblrPreferenceFragment();
        controller.get().getFragmentManager().beginTransaction()
                .remove(oldPage).add(android.R.id.content, page).commitNow();
        assertTrue(row(Settings.HIDE_ADS.key).isChecked());

        work.remove().run();
        ShadowLooper.idleMainLooper();

        assertFalse(row(Settings.HIDE_ADS.key).isChecked());
        assertTrue(row(Settings.HIDE_ADS.key).isEnabled());
        assertFalse(oldPage.isAdded());
    }

    @Test public void anExternalSaveRefreshesTheSwitchThroughTheWorkerBarrier() {
        Settings.CHECK_FOR_RELEASES.save(false);
        while (!work.isEmpty()) work.remove().run();
        SwitchPreference row = row(Settings.CHECK_FOR_RELEASES.key);

        Settings.CHECK_FOR_RELEASES.save(true);
        ShadowLooper.idleMainLooper();
        assertFalse(row.isChecked());
        assertEquals(1, work.size());

        work.remove().run();
        ShadowLooper.idleMainLooper();

        assertTrue(row.isChecked());
        assertTrue(row.isEnabled());
    }

    @Test public void aRejectedExternalRefreshKeepsReplacementBackupRowsBusyUntilRetry() {
        HushTumblrPreferenceFragment.editWorkerForTests = task -> { throw new RejectedExecutionException(); };
        Settings.CHECK_FOR_RELEASES.save(true);
        ShadowLooper.idleMainLooper();
        assertTrue(HushTumblrPreferenceFragment.hasPendingEdits());
        HushTumblrPreferenceFragment oldPage = page;
        page = new HushTumblrPreferenceFragment();
        controller.get().getFragmentManager().beginTransaction()
                .remove(oldPage).add(android.R.id.content, page).commitNow();
        assertEquals("Saving changes", page.findPreference("action_undo_import").getSummary());

        HushTumblrPreferenceFragment.editWorkerForTests = work::add;
        ShadowLooper.idleMainLooper(250, TimeUnit.MILLISECONDS);
        assertEquals(1, work.size());
        work.remove().run();
        ShadowLooper.idleMainLooper();

        assertFalse(HushTumblrPreferenceFragment.hasPendingEdits());
        assertTrue(row(Settings.CHECK_FOR_RELEASES.key).isChecked());
        assertTrue(page.findPreference("action_export_settings").isEnabled());
    }

    @Test public void aQueuedEditKeepsNotificationsAndReplacementOffTheTransactionLock() throws Exception {
        change(row(Settings.HIDE_ADS.key), false);
        CountDownLatch held = new CountDownLatch(1);
        CountDownLatch release = new CountDownLatch(1);
        AtomicBoolean timedOut = new AtomicBoolean();
        Thread transaction = new Thread(() -> {
            synchronized (Setting.class) {
                held.countDown();
                try {
                    timedOut.set(!release.await(3, TimeUnit.SECONDS));
                } catch (InterruptedException interrupted) {
                    Thread.currentThread().interrupt();
                    timedOut.set(true);
                }
            }
        });
        transaction.start();
        try {
            assertTrue(held.await(2, TimeUnit.SECONDS));
            // A landed write can notify before a failed transaction has finished rolling back.
            Setting.preferences.preferences.edit().putBoolean(Settings.HIDE_ADS.key, false).apply();
            ShadowLooper.idleMainLooper();
            HushTumblrPreferenceFragment oldPage = page;
            page = new HushTumblrPreferenceFragment();
            controller.get().getFragmentManager().beginTransaction()
                    .remove(oldPage).add(android.R.id.content, page).commitNow();
            assertEquals("Saving changes", page.findPreference("action_undo_import").getSummary());
            assertFalse("the main thread waited for the transaction lock", timedOut.get());
        } finally {
            release.countDown();
            transaction.join(2000);
        }
        work.remove().run();
        ShadowLooper.idleMainLooper();
        assertFalse(row(Settings.HIDE_ADS.key).isChecked());
    }

    /**
     * Runs what the worker has queued. A write to the store, a test's own or a failed save's
     * rollback, queues a refresh ahead of the next switch's save, which would run in its place.
     */
    private void settle() {
        ShadowLooper.idleMainLooper();
        while (!work.isEmpty()) {
            work.remove().run();
            ShadowLooper.idleMainLooper();
        }
    }

    private SwitchPreference row(String key) {
        return (SwitchPreference) page.findPreference(key);
    }
}
