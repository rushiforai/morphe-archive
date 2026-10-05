/*
 * Forked from https://github.com/SysAdminDoc/HushTelegram at 8c54a1d (GPL-3.0),
 * modified for HushPinterest (Pinterest), 2026.
 *
 * Forked from https://github.com/SysAdminDoc/HushThreads at b141524 (GPL-3.0),
 * modified for HushTelegram (Telegram), 2026.
 *
 * Forked from https://github.com/SysAdminDoc/Hushfacebook at c15d4f79 (GPL-3.0),
 * modified for HushThreads (Threads), 2026.
 *
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.hushpinterest.extension.pinterest.settings;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNotSame;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import android.app.Activity;
import android.app.Fragment;
import android.content.res.ColorStateList;
import android.content.res.TypedArray;
import android.graphics.Color;
import android.os.Bundle;
import android.preference.Preference;
import android.preference.SwitchPreference;
import android.view.View;
import android.view.ViewGroup;
import android.view.accessibility.AccessibilityNodeInfo;
import android.widget.Button;
import android.widget.EditText;
import android.widget.FrameLayout;
import android.widget.TextView;

import app.hushpinterest.extension.shared.L10n;
import app.hushpinterest.extension.shared.SettingsContextRule;
import app.hushpinterest.extension.shared.settings.Setting;

import org.junit.After;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.android.controller.ActivityController;
import org.robolectric.annotation.Config;
import org.robolectric.shadows.ShadowLooper;
import org.robolectric.util.ReflectionHelpers;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Map;

/**
 * The settings dialog as Pinterest hosts it: a dialog fragment over an activity that isn't ours,
 * with the preference page in the dialog's child manager.
 *
 * <p>The recovery page's Retry used to commit through the activity's manager, which can't see the
 * dialog's container; its Back finished the activity when the activity's back stack was empty,
 * which inside Pinterest is Pinterest itself; and a new container id on every view creation left a
 * page restored after rotation with no container to go back into.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
@SuppressWarnings("deprecation")
public class SettingsDialogTest {
    private static final String TAG = "hushpinterest_settings";
    private static final String ERROR = "morphe_settings_error_message";
    private static final String RETRY = "morphe_settings_error_retry";
    private static final String BACK = "morphe_settings_error_back";

    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    private final ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup();

    @After
    public void tearDown() {
        HushPinterestPreferenceFragment.failNextInitialization = null;
        SettingsDialog.failNextMount = null;
        Settings.CHECK_FOR_RELEASES.resetToDefault();
        controller.close();
    }

    @Test
    public void aFailedInitializationShowsATitledReadableRecoveryPage() {
        HushPinterestPreferenceFragment.failNextInitialization = new IllegalStateException("injected");
        HushPinterestPreferenceFragment page = pageOf(show(controller.get()));

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
        HushPinterestPreferenceFragment.failNextInitialization = new IllegalStateException("injected");
        SettingsDialog dialog = show(controller.get());
        HushPinterestPreferenceFragment failed = pageOf(dialog);

        click(failed.findPreference(RETRY));
        dialog.getChildFragmentManager().executePendingTransactions();
        ShadowLooper.idleMainLooper();

        HushPinterestPreferenceFragment rebuilt = pageOf(dialog);
        assertNotSame("Retry left the failed page in place", failed, rebuilt);
        assertNull("the rebuilt page is still the recovery page", rebuilt.findPreference(ERROR));
        assertTrue("the rebuilt page is empty", rebuilt.getPreferenceScreen().getPreferenceCount() > 0);
        assertEquals(1, pages(dialog).size());
        assertFalse(controller.get().isFinishing());
    }

    @Test
    public void theRecoveryPagesBackClosesOnlyTheSettings() {
        HushPinterestPreferenceFragment.failNextInitialization = new IllegalStateException("injected");
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
        HushPinterestPreferenceFragment page = pageOf(restored);
        assertNotNull("recreation replaced the saved page with a new one", page.getArguments());
        assertEquals("the page the framework saved", page.getArguments().getString("marker"));
        View view = page.getView();
        assertNotNull("the restored page has no view", view);
        assertEquals(SettingsDialog.CONTAINER_ID, ((View) view.getParent()).getId());
        assertNull(page.findPreference(ERROR));
        assertTrue(page.getPreferenceScreen().getPreferenceCount() > 0);
    }

    @Test
    @Config(sdk = {28, 30, 33, 36})
    public void aFailedMountOffersReadableFocusedActionsAndRetryCreatesOneChild() {
        SettingsDialog healthy = show(controller.get());
        int healthyListeners = preferenceListeners();
        healthy.dismiss();
        ShadowLooper.idleMainLooper();
        int listeners = preferenceListeners();
        SettingsDialog.failNextMount = new IllegalStateException("injected child mount failure");
        SettingsDialog dialog = show(controller.get());
        View recovery = recoveryOf(dialog);
        assertEquals(L10n.t(controller.get(), "HushPinterest settings couldn't open"),
                ((TextView) recovery.findViewById(android.R.id.title)).getText().toString());
        assertEquals(L10n.t(controller.get(), "Try again, or go back to Pinterest."),
                ((TextView) recovery.findViewById(android.R.id.summary)).getText().toString());
        assertTrue(pages(dialog).isEmpty());
        assertEquals(listeners, preferenceListeners());
        assertFalse("search took focus behind recovery", searchOf(dialog.getView()).hasFocus());
        assertEquals(View.GONE, ((View) searchOf(dialog.getView()).getParent()).getVisibility());
        Button retry = mountAction(dialog, SettingsDialog.MOUNT_RETRY);
        assertTrue("recovery left focus on the empty container", retry.hasFocus());
        for (String tag : new String[]{SettingsDialog.MOUNT_RETRY, SettingsDialog.MOUNT_BACK}) {
            Button action = mountAction(dialog, tag);
            AccessibilityNodeInfo node = action.createAccessibilityNodeInfo();
            assertEquals(Button.class.getName(), String.valueOf(node.getClassName()));
            assertTrue(node.isEnabled());
            assertTrue(node.getActionList().contains(AccessibilityNodeInfo.AccessibilityAction.ACTION_CLICK));
            int surface = tag.equals(SettingsDialog.MOUNT_RETRY) ? ScreenColors.DEFAULT.accent : ScreenColors.DEFAULT.background;
            double text = Color.luminance(action.getCurrentTextColor());
            double background = Color.luminance(surface);
            assertTrue("recovery text lacks contrast", (Math.max(text, background) + 0.05) / (Math.min(text, background) + 0.05) >= 4.5);
        }

        retry.performClick();
        retry.performClick();
        ShadowLooper.idleMainLooper();
        HushPinterestPreferenceFragment page = pageOf(dialog);
        assertNull(dialog.getView().findViewWithTag(SettingsDialog.MOUNT_ERROR));
        assertEquals(1, pages(dialog).size());
        assertEquals(healthyListeners, preferenceListeners());
        assertNotNull(page.navigation);
        assertTrue("successful Retry did not return focus to the settings list",
                page.getView().findViewById(android.R.id.list).hasFocus());
        assertFalse(controller.get().isFinishing());
        retry.performClick();
        ShadowLooper.idleMainLooper();
        assertSame("an obsolete Retry button remounted the healthy child", page, pageOf(dialog));
        assertEquals(healthyListeners, preferenceListeners());
    }

    @Test
    public void aFailedRetryKeepsItsActionsUsableUntilASuccessfulRetry() {
        SettingsDialog.failNextMount = new IllegalStateException("first failure");
        SettingsDialog dialog = show(controller.get());
        SettingsDialog.failNextMount = new IllegalStateException("retry failure");
        mountAction(dialog, SettingsDialog.MOUNT_RETRY).performClick();
        ShadowLooper.idleMainLooper();
        assertNotNull(recoveryOf(dialog));
        assertTrue(mountAction(dialog, SettingsDialog.MOUNT_RETRY).isEnabled());
        assertTrue(mountAction(dialog, SettingsDialog.MOUNT_BACK).isEnabled());
        assertTrue(pages(dialog).isEmpty());
        mountAction(dialog, SettingsDialog.MOUNT_RETRY).performClick();
        ShadowLooper.idleMainLooper();
        assertEquals(1, pages(dialog).size());
        assertNull(dialog.getView().findViewWithTag(SettingsDialog.MOUNT_ERROR));
    }

    @Test
    public void theMountRecoverySurvivesRotationUntilThePersonRetries() {
        SettingsDialog.failNextMount = new IllegalStateException("initial failure");
        show(controller.get());
        controller.recreate();
        ShadowLooper.idleMainLooper();
        SettingsDialog dialog = restored();
        assertNotNull(recoveryOf(dialog));
        assertTrue("rotation silently retried the failed operation", pages(dialog).isEmpty());
        assertTrue(mountAction(dialog, SettingsDialog.MOUNT_RETRY).hasFocus());
        controller.recreate();
        ShadowLooper.idleMainLooper();
        dialog = restored();
        mountAction(dialog, SettingsDialog.MOUNT_RETRY).performClick();
        ShadowLooper.idleMainLooper();
        assertEquals(1, pages(dialog).size());
        assertNull(dialog.getView().findViewWithTag(SettingsDialog.MOUNT_ERROR));
        controller.recreate();
        ShadowLooper.idleMainLooper();
        assertEquals(1, pages(restored()).size());
        assertNull(restored().getView().findViewWithTag(SettingsDialog.MOUNT_ERROR));
    }

    @Test
    public void everyMountRecoveryBackPathClosesSettingsAndKeepsTheHostUsable() {
        for (int path = 0; path < 3; path++) {
            SettingsDialog.failNextMount = new IllegalStateException("mount failure");
            SettingsDialog dialog = show(controller.get());
            if (path == 0) mountAction(dialog, SettingsDialog.MOUNT_BACK).performClick();
            else if (path == 1) SettingsL10nTest.backOf(dialog).performClick();
            else dialog.getDialog().onBackPressed();
            controller.get().getFragmentManager().executePendingTransactions();
            ShadowLooper.idleMainLooper();
            assertNull("Back path " + path + " left settings open", controller.get().getFragmentManager().findFragmentByTag(TAG));
            assertFalse("Back path " + path + " finished Pinterest", controller.get().isFinishing());
        }
    }

    @Test
    public void restoredCategoryAndSearchRecoveryKeepOneChildAndTheirExistingListeners() {
        SettingsDialog dialog = show(controller.get());
        for (boolean search : new boolean[]{false, true}) {
            HushPinterestPreferenceFragment page = pageOf(dialog);
            page.navigation.navigate(search ? "" : "Updates");
            if (search) searchOf(dialog.getView()).setText("release");
            Bundle before = navigationState(page);
            int listeners = preferenceListeners();
            int observers = navigationObservers(page);
            SettingsDialog.failNextMount = new IllegalStateException("restored mount failure");
            controller.recreate();
            ShadowLooper.idleMainLooper();
            dialog = restored();
            HushPinterestPreferenceFragment restoredPage = pageOf(dialog);
            assertNotNull(recoveryOf(dialog));
            assertEquals(View.INVISIBLE, restoredPage.getView().getVisibility());
            assertEquals(View.IMPORTANT_FOR_ACCESSIBILITY_NO_HIDE_DESCENDANTS, restoredPage.getView().getImportantForAccessibility());
            mountAction(dialog, SettingsDialog.MOUNT_RETRY).performClick();
            ShadowLooper.idleMainLooper();
            assertSame("Retry discarded a healthy restored page", restoredPage, pageOf(dialog));
            assertEquals(before.getString("route"), navigationState(restoredPage).getString("route"));
            assertEquals(before.getString("query"), navigationState(restoredPage).getString("query"));
            assertEquals(before.getString("query"), searchOf(dialog.getView()).getText().toString());
            assertEquals(1, pages(dialog).size());
            assertEquals(listeners, preferenceListeners());
            assertEquals(observers, navigationObservers(restoredPage));
            assertEquals(View.VISIBLE, restoredPage.getView().getVisibility());
            assertEquals(View.IMPORTANT_FOR_ACCESSIBILITY_AUTO, restoredPage.getView().getImportantForAccessibility());
            assertFalse(searchOf(dialog.getView()).hasFocus());
            Settings.CHECK_FOR_RELEASES.save(true);
            ShadowLooper.idleMainLooper();
            assertTrue("the preserved preference listener stopped updating rows",
                    ((SwitchPreference) restoredPage.findPreference(Settings.CHECK_FOR_RELEASES.key)).isChecked());
            Settings.CHECK_FOR_RELEASES.save(false);
            ShadowLooper.idleMainLooper();
        }
    }

    @Test
    public void retryReplacesAChildWithoutItsContainerAndPreservesItsNavigationState() {
        SettingsDialog dialog = show(controller.get());
        HushPinterestPreferenceFragment original = pageOf(dialog);
        original.navigation.navigate("Updates");
        Bundle marker = new Bundle();
        marker.putString("marker", "saved child arguments");
        original.setArguments(marker);
        int listeners = preferenceListeners();
        int observers = navigationObservers(original);
        ((FrameLayout) dialog.getView().findViewById(SettingsDialog.CONTAINER_ID)).removeView(original.getView());
        SettingsDialog.failNextMount = new IllegalStateException("view mount failure");
        dialog.onViewCreated(dialog.getView(), null);
        mountAction(dialog, SettingsDialog.MOUNT_RETRY).performClick();
        ShadowLooper.idleMainLooper();
        HushPinterestPreferenceFragment replacement = pageOf(dialog);
        assertNotSame(original, replacement);
        assertEquals("saved child arguments", replacement.getArguments().getString("marker"));
        assertEquals("Updates", navigationState(replacement).getString("route"));
        assertEquals(1, pages(dialog).size());
        assertEquals(listeners, preferenceListeners());
        assertEquals(observers, navigationObservers(replacement));
        assertFalse(controller.get().isFinishing());
    }

    private SettingsDialog restored() {
        SettingsDialog dialog = (SettingsDialog) controller.get().getFragmentManager().findFragmentByTag(TAG);
        assertNotNull("settings did not survive rotation", dialog);
        return dialog;
    }

    private static View recoveryOf(SettingsDialog dialog) {
        View recovery = dialog.getView().findViewWithTag(SettingsDialog.MOUNT_ERROR);
        assertNotNull("no child-mount recovery view", recovery);
        return recovery;
    }

    private static Button mountAction(SettingsDialog dialog, String tag) {
        Button action = dialog.getView().findViewWithTag(tag);
        assertNotNull(tag, action);
        return action;
    }

    private static Bundle navigationState(HushPinterestPreferenceFragment page) {
        Bundle saved = new Bundle();
        page.navigation.save(saved);
        return saved.getBundle("hushpinterest_navigation");
    }

    private static int preferenceListeners() {
        Map<?, ?> listeners = ReflectionHelpers.getField(Setting.preferences.preferences, "mListeners");
        return listeners.size();
    }

    private static int navigationObservers(HushPinterestPreferenceFragment page) {
        Object observable = ReflectionHelpers.getField(page.getPreferenceScreen().getRootAdapter(), "mDataSetObservable");
        Collection<?> observers = ReflectionHelpers.getField(observable, "mObservers");
        return observers.size();
    }

    private static EditText searchOf(View view) {
        if (view instanceof EditText) return (EditText) view;
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) {
                EditText found = searchOf(group.getChildAt(i));
                if (found != null) return found;
            }
        }
        return null;
    }

    private static SettingsDialog show(Activity activity) {
        SettingsDialog dialog = new SettingsDialog();
        dialog.show(activity.getFragmentManager(), TAG);
        activity.getFragmentManager().executePendingTransactions();
        ShadowLooper.idleMainLooper();
        return dialog;
    }

    private static HushPinterestPreferenceFragment pageOf(SettingsDialog dialog) {
        Fragment page = dialog.getChildFragmentManager().findFragmentById(SettingsDialog.CONTAINER_ID);
        assertTrue("no preference page in the dialog: " + page, page instanceof HushPinterestPreferenceFragment);
        return (HushPinterestPreferenceFragment) page;
    }

    private static List<Fragment> pages(SettingsDialog dialog) {
        List<Fragment> pages = new ArrayList<>();
        for (Fragment fragment : dialog.getChildFragmentManager().getFragments()) {
            if (fragment instanceof HushPinterestPreferenceFragment) pages.add(fragment);
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
