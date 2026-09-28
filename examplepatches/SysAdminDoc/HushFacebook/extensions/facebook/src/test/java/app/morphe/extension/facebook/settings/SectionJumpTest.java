/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.settings;

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
 * The settings page is long enough that reaching Downloads took several screens of swiping on a
 * phone. A row at the top lists the sections, a tap on one scrolls its heading to the top, and Back
 * goes back once to where the list was before closing the page as it always did.
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
        ScreenColors.shown = null;
    }

    @Test
    public void theRowUnderTheStatusCardListsEverySectionInOrder() {
        SettingsDialog dialog = show();
        HushfacebookPreferenceFragment page = page(dialog);
        ListView list = laidOut(dialog);

        assertEquals("Browse settings", ((Preference) list.getItemAtPosition(1)).getTitle());
        List<String> titles = new ArrayList<>();
        for (int i = 2; i < list.getCount() - 1; i++) titles.add(((Preference) list.getItemAtPosition(i)).getTitle().toString());
        Preference more = (Preference) list.getItemAtPosition(list.getCount() - 1);
        assertEquals("More settings", more.getTitle());
        assertTrue(more.getOnPreferenceClickListener().onPreferenceClick(more));
        for (int i = 0; i < list.getCount(); i++) titles.add(((Preference) list.getItemAtPosition(i)).getTitle().toString());
        List<String> expected = new ArrayList<>();
        for (Preference section : page.sections()) expected.add(section.getTitle().toString());
        assertEquals(new java.util.HashSet<>(expected), new java.util.HashSet<>(titles));
        assertEquals(expected.size(), titles.size());
        assertTrue(titles.contains("Downloads"));
        assertTrue(titles.contains("Links"));
    }

    @Test
    public void aSectionComesToTheTopAndBackReturnsOnceBeforeClosing() {
        SettingsDialog dialog = show();
        HushfacebookPreferenceFragment page = page(dialog);
        ListView list = laidOut(dialog);
        assertEquals(0, list.getFirstVisiblePosition());

        Preference downloads = sectionTitled(page, "Downloads");
        assertTrue(page.jumpTo(downloads));
        relayout(list);
        assertEquals(((android.preference.PreferenceCategory) downloads).getPreferenceCount(), list.getCount());
        assertEquals(downloads, ((Preference) list.getItemAtPosition(0)).getParent());

        dialog.getDialog().onBackPressed();
        relayout(list);
        assertTrue("Back closed the page instead of going back", dialog.getDialog().isShowing());
        // The status card at 0 can't be selected while Hushfacebook is on, so outside touch mode
        // the same rule lands on the row under it.
        assertTrue("Back didn't return to the top: " + list.getFirstVisiblePosition(), list.getFirstVisiblePosition() <= 1);

        dialog.getDialog().onBackPressed();
        assertFalse("a second Back should close the page", dialog.getDialog().isShowing());
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

    private static HushfacebookPreferenceFragment page(SettingsDialog dialog) {
        Object page = dialog.getChildFragmentManager().findFragmentById(SettingsDialog.CONTAINER_ID);
        assertTrue("no settings page in the dialog", page instanceof HushfacebookPreferenceFragment);
        return (HushfacebookPreferenceFragment) page;
    }

    private static Preference sectionTitled(HushfacebookPreferenceFragment page, String title) {
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
