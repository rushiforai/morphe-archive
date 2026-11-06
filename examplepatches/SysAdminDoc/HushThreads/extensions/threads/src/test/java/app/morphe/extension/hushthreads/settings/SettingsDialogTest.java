/*
 * Forked from https://github.com/SysAdminDoc/Hushfacebook at c15d4f79 (GPL-3.0),
 * modified for HushThreads (Threads), 2026.
 *
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.hushthreads.settings;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNotSame;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import android.app.Activity;
import android.app.Fragment;
import android.content.Intent;
import android.content.res.ColorStateList;
import android.content.res.TypedArray;
import android.graphics.Color;
import android.preference.Preference;
import android.preference.SwitchPreference;
import android.view.View;
import android.widget.TextView;

import app.morphe.extension.shared.SettingsContextRule;

import org.junit.After;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.android.controller.ActivityController;
import org.robolectric.annotation.Config;
import org.robolectric.shadows.ShadowLooper;

import java.util.ArrayList;
import java.util.EnumSet;
import java.util.List;
import java.util.Map;

/**
 * The settings dialog as Threads hosts it: a dialog fragment over an activity that isn't ours,
 * with the preference page in the dialog's child manager.
 *
 * <p>The recovery page's Retry used to commit through the activity's manager, which can't see the
 * dialog's container; its Back finished the activity when the activity's back stack was empty,
 * which inside Threads is Threads itself; and a new container id on every view creation left a
 * page restored after rotation with no container to go back into.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
@SuppressWarnings("deprecation")
public class SettingsDialogTest {
    private static final String TAG = "hushthreads_settings";
    private static final String ERROR = "morphe_settings_error_message";
    private static final String RETRY = "morphe_settings_error_retry";
    private static final String BACK = "morphe_settings_error_back";

    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    private final ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup();

    @After
    public void tearDown() {
        HushThreadsPreferenceFragment.failNextInitialization = null;
        HushThreadsPreferenceFragment.failNextAttachment = null;
        PatchFamily.inBuildForTests = null;
        Settings.HIDE_ADS.resetToDefault();
        Settings.PURE_BLACK.resetToDefault();
        controller.close();
    }

    /**
     * A page that fails inside the dialog's own transaction, before initialize(), never gets to
     * draw its recovery. The dialog shows Retry and Back in its place, in Threads' language, and
     * Retry opens the page it was asked for, on the choices that were saved.
     */
    @Test
    @Config(qualifiers = "de")
    public void aPageThatFailsToAttachLeavesRetryAndBackAndRetryOpensOnTheSavedChoices() {
        PatchFamily.inBuildForTests = EnumSet.allOf(PatchFamily.class);
        assertTrue(Settings.HIDE_ADS.save(false));
        assertTrue(Settings.PURE_BLACK.save(true));
        HushThreadsPreferenceFragment.failNextAttachment = new IllegalStateException("injected attach");
        SettingsDialog dialog = SettingsDialog.onPage("Appearance");
        dialog.show(controller.get().getFragmentManager(), TAG);
        controller.get().getFragmentManager().executePendingTransactions();
        ShadowLooper.idleMainLooper();

        assertEquals("the page that failed stayed in the dialog", 0, pages(dialog).size());
        Map<String, String> german = SettingsL10nTest.TranslationsForTests.of("de");
        View failure = attachFailure(dialog);
        TextView title = failure.findViewById(android.R.id.title);
        assertEquals(german.get("HushThreads settings couldn't open"), String.valueOf(title.getText()));
        for (String[] action : new String[][]{{SettingsDialog.ATTACH_RETRY, "Retry"}, {SettingsDialog.ATTACH_BACK, "Back"}}) {
            TextView row = failure.findViewWithTag(action[0]);
            assertNotNull(action[1] + " is missing", row);
            assertTrue(action[1] + " isn't on screen", row.isShown());
            assertNotEquals("the table doesn't translate " + action[1], action[1], german.get(action[1]));
            assertEquals(german.get(action[1]), String.valueOf(row.getText()));
            assertTrue(action[1] + " is shorter than 48 dp", row.getMinimumHeight()
                    >= Math.round(48 * row.getResources().getDisplayMetrics().density));
            android.view.accessibility.AccessibilityNodeInfo info = row.createAccessibilityNodeInfo();
            assertEquals(action[1] + " role", android.widget.Button.class.getName(), String.valueOf(info.getClassName()));
            assertTrue(action[1] + " takes no double tap", info.isClickable());
        }
        assertFalse("the first try's choices changed", Settings.HIDE_ADS.get());

        assertTrue(failure.<View>findViewWithTag(SettingsDialog.ATTACH_RETRY).performClick());
        ShadowLooper.idleMainLooper();

        assertNull("Retry left its recovery on screen", dialog.getView().findViewWithTag(SettingsDialog.ATTACH_FAILURE));
        assertEquals(1, pages(dialog).size());
        HushThreadsPreferenceFragment page = pageOf(dialog);
        assertNull("Retry reached the page's own recovery", page.findPreference(ERROR));
        assertNotNull(page.navigation);
        // Sections open in place on the main list, so the asked-for one is the one folded open.
        assertTrue("Retry didn't open the section it was asked for", page.navigation.isExpanded("Appearance"));
        TextView pageTitle = dialog.getView().findViewWithTag("hushthreads_page_title");
        assertEquals("HushThreads", String.valueOf(pageTitle.getText()));
        assertFalse(Settings.HIDE_ADS.get());
        assertTrue(Settings.PURE_BLACK.get());
        assertFalse(((SwitchPreference) page.findPreference(Settings.HIDE_ADS.key)).isChecked());
        assertTrue(((SwitchPreference) page.findPreference(Settings.PURE_BLACK.key)).isChecked());
        assertFalse(controller.get().isFinishing());
    }

    @Test
    public void theAttachRecoverysBackClosesOnlyTheSettingsAndTheNextOpenAttaches() {
        HushThreadsPreferenceFragment.failNextAttachment = new IllegalStateException("injected attach");
        Activity activity = controller.get();
        SettingsDialog dialog = show(activity);
        assertTrue(attachFailure(dialog).<View>findViewWithTag(SettingsDialog.ATTACH_BACK).performClick());
        activity.getFragmentManager().executePendingTransactions();
        ShadowLooper.idleMainLooper();

        assertNull("the settings stayed open", activity.getFragmentManager().findFragmentByTag(TAG));
        assertFalse("Back finished the host activity", activity.isFinishing());
        SettingsDialog again = show(activity);
        assertNull(again.getView().findViewWithTag(SettingsDialog.ATTACH_FAILURE));
        assertNull(pageOf(again).findPreference(ERROR));
    }

    /**
     * A retry that fails too shows the one recovery again, not a second one under the first, and
     * the page that failed isn't what recreation brings back: a fresh page is attached instead.
     */
    @Test
    public void aRetryThatFailsAgainShowsOneRecoveryAndRecreationAttachesAFreshPage() {
        HushThreadsPreferenceFragment.failNextAttachment = new IllegalStateException("first");
        SettingsDialog dialog = show(controller.get());
        HushThreadsPreferenceFragment.failNextAttachment = new IllegalStateException("second");
        assertTrue(attachFailure(dialog).<View>findViewWithTag(SettingsDialog.ATTACH_RETRY).performClick());
        ShadowLooper.idleMainLooper();

        android.view.ViewGroup container = dialog.getView().findViewById(SettingsDialog.CONTAINER_ID);
        assertEquals("views in the container", 1, container.getChildCount());
        assertEquals(SettingsDialog.ATTACH_FAILURE, container.getChildAt(0).getTag());
        assertEquals(0, pages(dialog).size());

        controller.recreate();
        ShadowLooper.idleMainLooper();
        SettingsDialog restored = (SettingsDialog) controller.get().getFragmentManager().findFragmentByTag(TAG);
        assertNotNull("the settings didn't come back after recreation", restored);
        assertEquals(1, pages(restored).size());
        assertNull(restored.getView().findViewWithTag(SettingsDialog.ATTACH_FAILURE));
        assertNull(pageOf(restored).findPreference(ERROR));
        assertTrue(pageOf(restored).getPreferenceScreen().getPreferenceCount() > 0);
    }

    /**
     * A saved page is put back inside the dialog's own onCreate, where attachPage's recovery can't
     * reach, so a page that fails to attach there used to crash the host. It gives way to a fresh
     * page instead. The marker tells the fresh page from the saved one, which the next lifecycle
     * step would attach again if it weren't taken away.
     */
    @Test
    @Config(sdk = {28, 36})
    public void aRestoredPageThatFailsToAttachGivesWayToAFreshPage() {
        android.os.Bundle marker = new android.os.Bundle();
        marker.putString("marker", "the page the framework saved");
        pageOf(show(controller.get())).setArguments(marker);
        HushThreadsPreferenceFragment.failNextAttachment = new IllegalStateException("injected restore");

        controller.recreate();
        ShadowLooper.idleMainLooper();

        assertNull("the saved page was never attached", HushThreadsPreferenceFragment.failNextAttachment);
        assertFreshPageAfterRestore((SettingsDialog) controller.get().getFragmentManager().findFragmentByTag(TAG));
    }

    /**
     * The same on a Threads screen that doesn't keep fragment state: the entry saves the screen
     * with the activity and shows it again through setInitialSavedState, whose commit runs after
     * open() has returned, so open()'s own catch can't reach the failure either.
     */
    @Test
    @Config(sdk = {28, 36})
    public void aReopenedScreenWhoseSavedPageFailsToAttachGetsAFreshPage() {
        Activity activity = controller.get();
        SettingsEntry.OpenWhenResumed watcher = new SettingsEntry.OpenWhenResumed();
        SettingsDialog shown = show(activity);
        android.os.Bundle marker = new android.os.Bundle();
        marker.putString("marker", "the page the entry saved");
        pageOf(shown).setArguments(marker);
        android.os.Bundle state = new android.os.Bundle();
        watcher.onActivitySaveInstanceState(activity, state);
        assertNotNull("the entry didn't save the screen", state.getParcelable(SettingsEntry.RECREATED_SCREEN));
        activity.getFragmentManager().beginTransaction().remove(shown).commitNow();
        watcher.onActivityCreated(activity, state);
        HushThreadsPreferenceFragment.failNextAttachment = new IllegalStateException("injected restore");

        watcher.onActivityResumed(activity);
        ShadowLooper.idleMainLooper();
        activity.getFragmentManager().executePendingTransactions();

        assertNull("the saved page was never attached", HushThreadsPreferenceFragment.failNextAttachment);
        assertFreshPageAfterRestore((SettingsDialog) activity.getFragmentManager().findFragmentByTag(TAG));
    }

    private void assertFreshPageAfterRestore(SettingsDialog restored) {
        assertNotNull("the settings didn't come back", restored);
        assertEquals("pages after the failed restore", 1, pages(restored).size());
        HushThreadsPreferenceFragment page = pageOf(restored);
        assertTrue("the page that failed is still the one shown",
                page.getArguments() == null || !page.getArguments().containsKey("marker"));
        assertEquals(SettingsDialog.CONTAINER_ID, ((View) page.getView().getParent()).getId());
        assertNull(restored.getView().findViewWithTag(SettingsDialog.ATTACH_FAILURE));
        assertNull(page.findPreference(ERROR));
        assertTrue(page.getPreferenceScreen().getPreferenceCount() > 0);
        assertFalse(controller.get().isFinishing());
    }

    private static View attachFailure(SettingsDialog dialog) {
        View failure = dialog.getView().findViewWithTag(SettingsDialog.ATTACH_FAILURE);
        assertNotNull("no Retry and Back where the page failed to attach", failure);
        assertEquals(SettingsDialog.CONTAINER_ID, ((View) failure.getParent()).getId());
        return failure;
    }

    @Test
    public void aFailedInitializationShowsATitledReadableRecoveryPage() {
        HushThreadsPreferenceFragment.failNextInitialization = new IllegalStateException("injected");
        HushThreadsPreferenceFragment page = pageOf(show(controller.get()));

        Preference message = page.findPreference(ERROR);
        assertNotNull("no recovery page", message);
        assertEquals(String.valueOf(page.initializationErrorTitle(controller.get())), String.valueOf(message.getTitle()));
        assertTrue(String.valueOf(message.getTitle()), String.valueOf(message.getTitle()).contains("couldn't open"));
        for (String key : new String[]{ERROR, RETRY, BACK}) {
            Preference row = page.findPreference(key);
            assertNotNull(key, row);
            assertTrue(key + " has no title", row.getTitle() != null && row.getTitle().length() > 0);
            assertLightText(row);
        }
    }

    @Test
    public void retryRebuildsThePageInsideTheDialog() {
        HushThreadsPreferenceFragment.failNextInitialization = new IllegalStateException("injected");
        SettingsDialog dialog = show(controller.get());
        HushThreadsPreferenceFragment failed = pageOf(dialog);

        click(failed.findPreference(RETRY));
        dialog.getChildFragmentManager().executePendingTransactions();
        ShadowLooper.idleMainLooper();

        HushThreadsPreferenceFragment rebuilt = pageOf(dialog);
        assertNotSame("Retry left the failed page in place", failed, rebuilt);
        assertNull("the rebuilt page is still the recovery page", rebuilt.findPreference(ERROR));
        assertTrue("the rebuilt page is empty", rebuilt.getPreferenceScreen().getPreferenceCount() > 0);
        assertEquals(1, pages(dialog).size());
        assertFalse(controller.get().isFinishing());
    }

    @Test
    public void theRecoveryPagesBackClosesOnlyTheSettings() {
        HushThreadsPreferenceFragment.failNextInitialization = new IllegalStateException("injected");
        Activity activity = controller.get();
        click(pageOf(show(activity)).findPreference(BACK));
        activity.getFragmentManager().executePendingTransactions();
        ShadowLooper.idleMainLooper();

        assertNull("the settings stayed open", activity.getFragmentManager().findFragmentByTag(TAG));
        assertFalse("Back finished the host activity", activity.isFinishing());
    }

    @Test
    public void theBackKeyClosesOnlyTheSettings() {
        Activity activity = controller.get();
        show(activity).getDialog().onBackPressed();
        activity.getFragmentManager().executePendingTransactions();
        ShadowLooper.idleMainLooper();

        assertNull("the settings stayed open", activity.getFragmentManager().findFragmentByTag(TAG));
        assertFalse("Back finished the host activity", activity.isFinishing());
    }

    /**
     * Recreation hands back the page the framework saved, with its state, rather than a fresh one
     * built over it. A marker in the saved page's arguments is how the test tells the two apart: a
     * dialog that built a new page on every view would pass the count and container checks alone,
     * and the list would jump back to the top on every rotation.
     */
    @Test
    public void recreationKeepsOnePageInItsContainer() {
        android.os.Bundle marker = new android.os.Bundle();
        marker.putString("marker", "the page the framework saved");
        pageOf(show(controller.get())).setArguments(marker);

        controller.recreate();
        ShadowLooper.idleMainLooper();

        SettingsDialog restored = (SettingsDialog) controller.get().getFragmentManager().findFragmentByTag(TAG);
        assertNotNull("the settings didn't come back after recreation", restored);
        assertEquals("pages after recreation", 1, pages(restored).size());
        HushThreadsPreferenceFragment page = pageOf(restored);
        assertNotNull("recreation replaced the saved page with a new one", page.getArguments());
        assertEquals("the page the framework saved", page.getArguments().getString("marker"));
        View view = page.getView();
        assertNotNull("the restored page has no view", view);
        assertEquals(SettingsDialog.CONTAINER_ID, ((View) view.getParent()).getId());
        assertNull(page.findPreference(ERROR));
        assertTrue(page.getPreferenceScreen().getPreferenceCount() > 0);
    }

    /** The two entry intents and both recovery/platform Back paths work at the supported endpoints. */
    @Test
    @Config(sdk = {28, 36})
    public void platformEndpointsConsumeEntryRequestsAndBackKeepsTheHostRunning() {
        Activity activity = controller.get();
        SettingsEntry.OpenWhenResumed watcher = new SettingsEntry.OpenWhenResumed();
        for (Intent request : new Intent[]{new Intent(Intent.ACTION_APPLICATION_PREFERENCES),
                new Intent(Intent.ACTION_VIEW).putExtra(SettingsEntry.EXTRA_OPEN_SETTINGS, true)}) {
            boolean recovery = Intent.ACTION_APPLICATION_PREFERENCES.equals(request.getAction());
            if (recovery) HushThreadsPreferenceFragment.failNextInitialization = new IllegalStateException("injected");
            SettingsEntry.onNewIntent(activity, request);
            assertFalse("the shortcut extra wasn't consumed", request.hasExtra(SettingsEntry.EXTRA_OPEN_SETTINGS));
            if (recovery) assertEquals(Intent.ACTION_MAIN, request.getAction());
            watcher.onActivityResumed(activity);
            ShadowLooper.idleMainLooper();
            activity.getFragmentManager().executePendingTransactions();

            SettingsDialog dialog = (SettingsDialog) activity.getFragmentManager().findFragmentByTag(TAG);
            assertNotNull("the entry request didn't open settings", dialog);
            assertEquals(1, pages(dialog).size());
            HushThreadsPreferenceFragment page = pageOf(dialog);
            if (recovery) assertNotNull("App info didn't reach recovery", page.findPreference(ERROR));
            else assertNull(page.findPreference(ERROR));

            SettingsEntry.onNewIntent(activity, request);
            watcher.onActivityResumed(activity);
            ShadowLooper.idleMainLooper();
            assertSame("reading the spent intent created another dialog", dialog,
                    activity.getFragmentManager().findFragmentByTag(TAG));
            if (recovery) click(page.findPreference(BACK));
            else dialog.getDialog().onBackPressed();
            ShadowLooper.idleMainLooper();
            activity.getFragmentManager().executePendingTransactions();
            assertNull("Back left settings open", activity.getFragmentManager().findFragmentByTag(TAG));
            assertFalse("Back finished Threads", activity.isFinishing());

            SettingsEntry.onNewIntent(activity, request);
            watcher.onActivityResumed(activity);
            ShadowLooper.idleMainLooper();
            assertNull("a spent entry reopened settings after Back", activity.getFragmentManager().findFragmentByTag(TAG));
        }
    }

    /** A retried child page must still restore into the dialog's container after the host is rebuilt. */
    @Test
    @Config(sdk = {28, 36})
    public void platformEndpointsRestoreTheRetriedPageInItsDialogContainer() {
        HushThreadsPreferenceFragment.failNextInitialization = new IllegalStateException("injected");
        assertTrue(SettingsEntry.open(controller.get()));
        ShadowLooper.idleMainLooper();
        controller.get().getFragmentManager().executePendingTransactions();
        SettingsDialog dialog = (SettingsDialog) controller.get().getFragmentManager().findFragmentByTag(TAG);
        HushThreadsPreferenceFragment failed = pageOf(dialog);
        assertNotNull(failed.findPreference(ERROR));
        click(failed.findPreference(RETRY));
        dialog.getChildFragmentManager().executePendingTransactions();
        ShadowLooper.idleMainLooper();
        HushThreadsPreferenceFragment rebuilt = pageOf(dialog);
        assertNotSame(failed, rebuilt);
        assertNull(rebuilt.findPreference(ERROR));
        android.os.Bundle marker = new android.os.Bundle();
        marker.putString("platform-retry", "saved child page");
        rebuilt.setArguments(marker);

        controller.recreate();
        ShadowLooper.idleMainLooper();
        SettingsDialog restored = (SettingsDialog) controller.get().getFragmentManager().findFragmentByTag(TAG);
        assertNotNull("the retried dialog didn't return", restored);
        assertEquals(1, pages(restored).size());
        HushThreadsPreferenceFragment page = pageOf(restored);
        assertNotNull(page.getArguments());
        assertEquals("saved child page", page.getArguments().getString("platform-retry"));
        assertEquals(SettingsDialog.CONTAINER_ID, ((View) page.getView().getParent()).getId());
        assertNull(page.findPreference(ERROR));
        assertTrue(page.getPreferenceScreen().getPreferenceCount() > 0);
        restored.getDialog().onBackPressed();
        ShadowLooper.idleMainLooper();
        controller.get().getFragmentManager().executePendingTransactions();
        assertNull(controller.get().getFragmentManager().findFragmentByTag(TAG));
        assertFalse("Back after recreation finished Threads", controller.get().isFinishing());
    }

    private static SettingsDialog show(Activity activity) {
        SettingsDialog dialog = new SettingsDialog();
        dialog.show(activity.getFragmentManager(), TAG);
        activity.getFragmentManager().executePendingTransactions();
        ShadowLooper.idleMainLooper();
        return dialog;
    }

    private static HushThreadsPreferenceFragment pageOf(SettingsDialog dialog) {
        Fragment page = dialog.getChildFragmentManager().findFragmentById(SettingsDialog.CONTAINER_ID);
        assertTrue("no preference page in the dialog: " + page, page instanceof HushThreadsPreferenceFragment);
        return (HushThreadsPreferenceFragment) page;
    }

    private static List<Fragment> pages(SettingsDialog dialog) {
        List<Fragment> pages = new ArrayList<>();
        for (Fragment fragment : dialog.getChildFragmentManager().getFragments()) {
            if (fragment instanceof HushThreadsPreferenceFragment) pages.add(fragment);
        }
        return pages;
    }

    private static void click(Preference row) {
        assertNotNull("no such row", row);
        row.getOnPreferenceClickListener().onPreferenceClick(row);
    }

    private static void assertLightText(Preference row) {
        TypedArray styled = row.getContext().obtainStyledAttributes(new int[]{android.R.attr.textColorPrimary});
        try {
            ColorStateList primary = styled.getColorStateList(0);
            assertNotNull(primary);
            assertTrue("\"" + row.getTitle() + "\" is drawn dark on the black page",
                    Color.luminance(primary.getDefaultColor()) > 0.5f);
        } finally {
            styled.recycle();
        }
    }
}
