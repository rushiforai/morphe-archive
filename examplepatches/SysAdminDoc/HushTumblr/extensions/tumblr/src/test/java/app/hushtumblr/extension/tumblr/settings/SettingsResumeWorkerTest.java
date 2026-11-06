package app.hushtumblr.extension.tumblr.settings;

import static org.junit.Assert.*;

import android.app.Activity;
import android.os.Bundle;
import android.preference.Preference;
import android.preference.SwitchPreference;
import android.widget.ListView;

import app.hushtumblr.extension.shared.SettingsContextRule;
import app.hushtumblr.extension.shared.settings.BaseSettings;
import app.hushtumblr.extension.shared.settings.FailingStore;
import app.hushtumblr.extension.shared.settings.HushTumblrPause;
import app.hushtumblr.extension.shared.settings.PauseForTests;

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
import org.robolectric.shadows.ShadowToast;

import java.io.File;
import java.util.ArrayDeque;
import java.util.EnumSet;
import java.util.concurrent.RejectedExecutionException;
import java.util.concurrent.TimeUnit;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
@SuppressWarnings("deprecation")
public class SettingsResumeWorkerTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();
    private final ArrayDeque<Runnable> work = new ArrayDeque<>();
    private ActivityController<Activity> controller;
    private SettingsDialog dialog;
    private HushTumblrPreferenceFragment page;
    private File marker;
    private File held;

    @Before public void open() {
        PatchFamily.inBuildForTests = EnumSet.allOf(PatchFamily.class);
        BaseSettings.SAFE_MODE.save(false);
        BaseSettings.PAUSED.save(true);
        PauseForTests.pause(HushTumblrPause.Reason.SWITCH);
        controller = Robolectric.buildActivity(Activity.class).setup().visible();
        dialog = SettingsL10nTest.show(controller.get());
        page = page(dialog);
        HushTumblrPreferenceFragment.editWorkerForTests = work::add;
        ShadowToast.reset();
    }

    @After public void close() {
        HushTumblrPreferenceFragment.editWorkerForTests = Runnable::run;
        while (!work.isEmpty()) work.remove().run();
        ShadowLooper.idleMainLooper(250, TimeUnit.MILLISECONDS);
        controller.close();
        if (held != null && held.exists()) assertTrue(held.delete());
        if (marker != null && marker.exists()) assertTrue(marker.delete());
        BaseSettings.PAUSED.resetToDefault();
        BaseSettings.SAFE_MODE.resetToDefault();
        PauseForTests.resume();
        PatchFamily.inBuildForTests = null;
    }

    @Test public void resumeLeavesTheMainLoopFreeAndRejectsRepeatedCardTaps() {
        Preference card = card();
        card.getOnPreferenceClickListener().onPreferenceClick(card);
        boolean[] responsive = {false};
        new android.os.Handler(android.os.Looper.getMainLooper()).post(() -> responsive[0] = true);
        ShadowLooper.idleMainLooper();

        assertTrue(responsive[0]);
        assertTrue(BaseSettings.PAUSED.savedValue());
        assertTrue(pause().isChecked());
        assertFalse(card.isEnabled());
        assertEquals("Saving changes", card.getSummary());
        card.getOnPreferenceClickListener().onPreferenceClick(card);
        assertEquals(1, work.size());

        finish();

        assertFalse(BaseSettings.PAUSED.savedValue());
        assertFalse(pause().isChecked());
        assertTrue(card.isEnabled());
        assertTrue(card.getSummary().toString().contains("turns back on when Tumblr restarts"));
    }

    @Test public void resumeCannotBypassAnExistingSettingsWorker() {
        assertTrue(HushTumblrPreferenceFragment.submitEdit(() -> { }));
        page.resumeFromOverview();
        assertEquals(1, work.size());
        assertTrue(BaseSettings.PAUSED.savedValue());
        assertTrue(card().isEnabled());
    }

    @Test public void aRejectedResumeLeavesTheCardReadyToTryAgain() {
        HushTumblrPreferenceFragment.editWorkerForTests = task -> { throw new RejectedExecutionException(); };
        page.resumeFromOverview();
        assertTrue(BaseSettings.PAUSED.savedValue());
        assertTrue(pause().isChecked());
        assertTrue(card().isEnabled());
        assertFalse(HushTumblrPreferenceFragment.hasPendingEdits());
        assertEquals("Couldn't start that. Try again in a moment.", SettingsFeedbackTest.message(card()));
    }

    @Test public void aFailedCommitKeepsTheSavedPauseAndAllowsRetry() {
        page.resumeFromOverview();
        try (FailingStore ignored = FailingStore.install(FailingStore.Fault.COMMIT_THROWS,
                FailingStore.Fault.COMMIT_THROWS)) {
            work.remove().run();
        }
        ShadowLooper.idleMainLooper();
        assertTrue(BaseSettings.PAUSED.savedValue());
        assertTrue(pause().isChecked());
        assertTrue(card().isEnabled());
        assertEquals("Couldn't turn HushTumblr back on. Try again.", SettingsFeedbackTest.message(card()));
        page.resumeFromOverview();
        assertNull("a new tap still shows the last one's failure", SettingsFeedbackTest.message(card()));
        finish();
        assertFalse(BaseSettings.PAUSED.savedValue());
    }

    @Test public void aMarkerFailureKeepsItsExplanationAfterTheWorkerRefresh() throws Exception {
        marker = HushTumblrPause.markerFile(controller.get());
        assertNotNull(marker);
        held = new File(marker, "held-by-resume-test");
        assertTrue(marker.mkdirs());
        assertTrue(held.createNewFile());
        page.resumeFromOverview();
        assertTrue(held.isFile());
        assertTrue(BaseSettings.PAUSED.savedValue());

        finish();

        assertTrue(BaseSettings.PAUSED.savedValue());
        assertTrue(pause().isChecked());
        assertTrue(card().isEnabled());
        // Under the card, which a rebuilt screen keeps, where the summary was rewritten by the next
        // refresh and a toast's two lines cut the folder off.
        String left = SettingsFeedbackTest.message(card());
        assertTrue(left, left != null && left.contains("couldn't be removed") && left.endsWith("then tap Resume again."));
        assertFalse("also said in a toast", left.equals(ShadowToast.getTextOfLatestToast()));
        Bundle saved = new Bundle();
        page.onSaveInstanceState(saved);
        assertTrue("a rebuilt screen would lose it",
                saved.getBundle(HushTumblrPreferenceFragment.FEEDBACK_STATE).containsKey(HushTumblrPreferenceFragment.STATUS_CARD));
    }

    @Test public void aResumeFinishingAfterReplacementRefreshesTheNewSavedSwitch() {
        page.resumeFromOverview();
        HushTumblrPreferenceFragment earlier = page;
        controller.recreate();
        ShadowLooper.idleMainLooper();
        dialog = (SettingsDialog) controller.get().getFragmentManager().findFragmentByTag("hushtumblr_settings");
        assertNotNull(dialog);
        page = page(dialog);
        assertNotSame(earlier, page);
        assertTrue(pause().isChecked());

        finish();

        assertFalse(BaseSettings.PAUSED.savedValue());
        assertFalse(pause().isChecked());
        assertTrue(card().isEnabled());
        assertNull(ShadowToast.getTextOfLatestToast());
    }

    @Test public void aClosedWindowCannotStartOrReceiveResumeFeedback() {
        page.resumeFromOverview();
        dialog.dismiss();
        page.resumeFromOverview();
        assertEquals(1, work.size());
        finish();
        assertFalse(BaseSettings.PAUSED.savedValue());
        assertNull(ShadowToast.getTextOfLatestToast());
        page.resumeFromOverview();
        assertTrue(work.isEmpty());
    }

    private void finish() {
        while (!work.isEmpty()) work.remove().run();
        ShadowLooper.idleMainLooper();
    }

    private Preference card() {
        ListView list = dialog.getView().findViewById(android.R.id.list);
        return (Preference) list.getAdapter().getItem(0);
    }

    private SwitchPreference pause() {
        return (SwitchPreference) page.findPreference(BaseSettings.PAUSED.key);
    }

    private static HushTumblrPreferenceFragment page(SettingsDialog host) {
        return (HushTumblrPreferenceFragment) host.getChildFragmentManager().findFragmentById(SettingsDialog.CONTAINER_ID);
    }
}
