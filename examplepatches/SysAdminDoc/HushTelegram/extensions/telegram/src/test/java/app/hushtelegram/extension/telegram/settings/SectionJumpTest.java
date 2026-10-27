/*
 * Forked from https://github.com/SysAdminDoc/HushThreads at b141524 (GPL-3.0),
 * modified for HushTelegram (Telegram), 2026.
 *
 * Forked from https://github.com/SysAdminDoc/Hushfacebook at c15d4f79 (GPL-3.0),
 * modified for HushThreads (Threads), 2026.
 *
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.hushtelegram.extension.telegram.settings;

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

import app.hushtelegram.extension.shared.SettingsContextRule;

/**
 * At a large text size the settings page runs past one screen. Every section is a heading on the
 * one list, a tap opens it in place under its heading, and a jump from search or a link brings that
 * heading to the top. Back on the list closes the dialog; from Changed switches it goes home first.
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
    public void theHomeListsEverySectionHeadingInOrderAndOpensThemInPlace() {
        SettingsDialog dialog = show();
        HushTelegramPreferenceFragment page = page(dialog);
        ListView list = laidOut(dialog);

        // HushTelegram is on and nothing is waiting, so no status card: the headings lead the list.
        List<String> keys = new ArrayList<>();
        for (int i = 0; i < list.getCount(); i++) keys.add(String.valueOf(((Preference) list.getItemAtPosition(i)).getKey()));
        // Changed switches, Report a problem and Support HushTelegram close the list and open pages or web links.
        assertEquals(SettingsNavigation.CHANGED, keys.get(keys.size() - 3));
        assertEquals(SettingsNavigation.REPORT, keys.get(keys.size() - 2));
        assertEquals(HushTelegramPreferenceFragment.SUPPORT, keys.get(keys.size() - 1));
        List<String> headings = keys.subList(0, keys.size() - 3);
        List<String> expected = new ArrayList<>();
        for (Preference section : page.sections()) expected.add("section_" + section.getTitle());
        assertEquals(new java.util.HashSet<>(expected), new java.util.HashSet<>(headings));
        assertEquals(expected.size(), headings.size());
        // The switch sections lead in the order the pages are drawn, then the tools.
        assertEquals("section_Ads", headings.get(0));
        assertTrue(headings.contains("section_Updates"));
        assertTrue(headings.contains("section_Links"));
        assertTrue(headings.indexOf("section_Privacy") < headings.indexOf("section_Links"));
        assertEquals("section_About", headings.get(headings.size() - 1));

        // A tap opens a section under its heading, and the list is that much longer.
        int closed = list.getCount();
        Preference links = (Preference) list.getItemAtPosition(headings.indexOf("section_Links"));
        assertTrue(links.getOnPreferenceClickListener().onPreferenceClick(links));
        relayout(list);
        assertTrue(page.navigation.isExpanded("Links"));
        assertEquals(closed + ((android.preference.PreferenceCategory) sectionTitled(page, "Links")).getPreferenceCount(),
                list.getCount());
    }

    @Test
    public void aSectionComesToTheTopInPlaceAndBackClosesTheDialog() {
        SettingsDialog dialog = show();
        HushTelegramPreferenceFragment page = page(dialog);
        ListView list = laidOut(dialog);
        assertEquals(0, list.getFirstVisiblePosition());
        int closed = list.getCount();

        Preference privacy = sectionTitled(page, "Privacy");
        assertTrue(page.jumpTo(privacy));
        relayout(list);
        assertTrue(page.navigation.isExpanded("Privacy"));
        assertEquals(closed + ((android.preference.PreferenceCategory) privacy).getPreferenceCount(), list.getCount());
        assertEquals("section_Privacy", ((Preference) list.getItemAtPosition(list.getFirstVisiblePosition())).getKey());

        // The section stays open on the list it was opened on, so there is no earlier place to go back to.
        dialog.getDialog().onBackPressed();
        assertFalse("Back should close the dialog from the list", dialog.getDialog().isShowing());
    }

    @Test
    public void backFromChangedSwitchesReturnsHomeOnceBeforeClosing() {
        SettingsDialog dialog = show();
        HushTelegramPreferenceFragment page = page(dialog);
        ListView list = laidOut(dialog);
        Preference changed = null;
        for (int i = 0; i < list.getCount(); i++) {
            Preference item = (Preference) list.getItemAtPosition(i);
            if (SettingsNavigation.CHANGED.equals(item.getKey())) changed = item;
        }
        assertNotNull(changed);
        assertTrue(page.navigation != null && changed.getOnPreferenceClickListener().onPreferenceClick(changed));
        relayout(list);
        assertEquals("No changed switches", ((Preference) list.getItemAtPosition(0)).getTitle());

        dialog.getDialog().onBackPressed();
        relayout(list);
        assertTrue("Back closed the dialog instead of going home", dialog.getDialog().isShowing());
        assertEquals("section_Ads", ((Preference) list.getItemAtPosition(0)).getKey());

        dialog.getDialog().onBackPressed();
        assertFalse("a second Back should close the dialog", dialog.getDialog().isShowing());
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

    private static HushTelegramPreferenceFragment page(SettingsDialog dialog) {
        Object page = dialog.getChildFragmentManager().findFragmentById(SettingsDialog.CONTAINER_ID);
        assertTrue("no settings page in the dialog", page instanceof HushTelegramPreferenceFragment);
        return (HushTelegramPreferenceFragment) page;
    }

    private static Preference sectionTitled(HushTelegramPreferenceFragment page, String title) {
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
