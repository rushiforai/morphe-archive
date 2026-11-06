/*
 * Forked from https://github.com/SysAdminDoc/Hushfacebook at 837bac40 (GPL-3.0),
 * modified for HushThreads (Threads), 2026.
 *
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.hushthreads.settings;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

import android.app.Activity;
import android.preference.Preference;
import android.view.View;
import android.widget.ListView;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.android.controller.ActivityController;
import org.robolectric.annotation.Config;

import java.util.ArrayList;
import java.util.EnumSet;
import java.util.List;

import app.morphe.extension.shared.SettingsContextRule;

/**
 * Every section stays on the main list. A requested section expands in place and scrolls into
 * view, and Back closes settings without walking through a page history.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30, qualifiers = "w411dp-h891dp-xxhdpi")
@SuppressWarnings("deprecation")
public class SectionJumpTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    private ActivityController<Activity> controller;

    @Before
    public void everyPatchIn() {
        PatchFamily.inBuildForTests = EnumSet.allOf(PatchFamily.class);
    }

    @After
    public void restore() {
        if (controller != null) controller.close();
        PatchFamily.inBuildForTests = null;
    }

    @Test
    public void theMainListContainsEverySectionInOrderWithoutAMoreHeading() {
        SettingsDialog dialog = show();
        HushThreadsPreferenceFragment page = page(dialog);
        ListView list = laidOut(dialog);

        // HushThreads is on, so no status card: Quick setups leads, then one header per section.
        assertEquals(SettingsNavigation.QUICK_SETUPS, ((Preference) list.getItemAtPosition(0)).getKey());
        List<String> titles = new ArrayList<>();
        for (int i = 0; i < page.sections().size(); i++) {
            Preference header = (Preference) list.getItemAtPosition(i + 1);
            assertTrue(header.getKey(), header.getKey().startsWith("section_"));
            titles.add(header.getTitle().toString());
        }
        assertEquals(java.util.Arrays.asList("Feed", "Privacy", "Comments", "Downloads", "Posts", "Appearance", "Links",
                "Updates", "Set when you patched", "Pause, backup and diagnostics", "About"), titles);
        assertEquals(SettingsNavigation.SUPPORT, ((Preference) list.getItemAtPosition(12)).getKey());
        assertEquals("Support closes the list, and the build line sits under it", 14, list.getCount());
        assertFalse(titles.contains("More settings"));
        assertFalse(titles.contains("Browse settings"));
    }

    @Test
    public void aSectionIsRevealedInTheMainListAndBackClosesSettings() {
        SettingsDialog dialog = show();
        HushThreadsPreferenceFragment page = page(dialog);
        ListView list = laidOut(dialog);
        assertEquals(0, list.getFirstVisiblePosition());

        Preference privacy = sectionTitled(page, "Privacy");
        assertTrue(page.jumpTo(privacy));
        relayout(list);
        assertTrue(page.navigation.isExpanded("Privacy"));
        assertEquals(14 + ((android.preference.PreferenceCategory) privacy).getPreferenceCount(), list.getCount());
        int header = -1;
        for (int i = 0; i < list.getCount(); i++) {
            if ("section_Privacy".equals(((Preference) list.getItemAtPosition(i)).getKey())) header = i;
        }
        assertTrue("the Privacy header is off screen", header >= list.getFirstVisiblePosition()
                && header <= list.getLastVisiblePosition());
        assertTrue(privacy == ((Preference) list.getItemAtPosition(header + 1)).getParent());
        assertFalse(page.backFromJump());
        dialog.getDialog().onBackPressed();
        assertFalse("Back should close settings directly", dialog.getDialog().isShowing());
        assertFalse("Back should leave Threads running", controller.get().isFinishing());
    }

    @Test
    public void withoutAJumpBackClosesThePageAsBefore() {
        SettingsDialog dialog = show();
        laidOut(dialog);
        assertFalse(page(dialog).backFromJump());
        dialog.getDialog().onBackPressed();
        assertFalse(dialog.getDialog().isShowing());
    }

    private SettingsDialog show() {
        if (controller == null) controller = Robolectric.buildActivity(Activity.class).setup();
        return SettingsL10nTest.show(controller.get());
    }

    private static HushThreadsPreferenceFragment page(SettingsDialog dialog) {
        Object page = dialog.getChildFragmentManager().findFragmentById(SettingsDialog.CONTAINER_ID);
        assertTrue("no settings page in the dialog", page instanceof HushThreadsPreferenceFragment);
        return (HushThreadsPreferenceFragment) page;
    }

    private static Preference sectionTitled(HushThreadsPreferenceFragment page, String title) {
        for (Preference section : page.sections()) {
            if (title.contentEquals(String.valueOf(section.getTitle()))) return section;
        }
        throw new AssertionError("no section titled " + title);
    }

    /** The list laid out a phone screen tall, so it has somewhere to scroll to. */
    private ListView laidOut(SettingsDialog dialog) {
        ListView list = dialog.getView().findViewById(android.R.id.list);
        assertNotNull("no list in the dialog", list);
        relayout(list);
        return list;
    }

    private void relayout(ListView list) {
        int width = controller.get().getResources().getDisplayMetrics().widthPixels;
        int height = controller.get().getResources().getDisplayMetrics().heightPixels;
        list.measure(View.MeasureSpec.makeMeasureSpec(width, View.MeasureSpec.EXACTLY),
                View.MeasureSpec.makeMeasureSpec(height, View.MeasureSpec.EXACTLY));
        list.layout(0, 0, width, height);
    }
}
