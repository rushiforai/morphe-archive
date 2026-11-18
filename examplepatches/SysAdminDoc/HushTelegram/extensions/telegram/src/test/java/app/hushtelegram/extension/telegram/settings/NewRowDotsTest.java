/*
 * Forked from https://github.com/SysAdminDoc/HushGram at 9aecf67 (GPL-3.0),
 * modified for HushTelegram (Telegram), 2026.
 *
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.hushtelegram.extension.telegram.settings;

import static org.junit.Assert.*;

import android.app.Activity;
import android.content.SharedPreferences;
import android.preference.Preference;
import android.preference.PreferenceCategory;
import android.text.Spanned;
import android.view.View;
import android.widget.ListView;
import android.widget.TextView;

import java.util.EnumSet;
import java.util.HashSet;
import java.util.Set;

import app.hushtelegram.extension.shared.SettingsContextRule;
import app.hushtelegram.extension.shared.settings.PauseForTests;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;
import org.robolectric.android.controller.ActivityController;
import org.robolectric.shadows.ShadowLooper;

/** The dot on a switch this build added, and on the closed section that holds it (#96). */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30, qualifiers = "w390dp-h844dp-night-xhdpi")
@SuppressWarnings("deprecation")
public class NewRowDotsTest {
    @Rule public final SettingsContextRule settings = new SettingsContextRule();
    private ActivityController<Activity> controller;
    private SettingsDialog dialog;
    private HushTelegramPreferenceFragment page;

    @Before public void open() {
        PatchFamily.inBuildForTests = EnumSet.allOf(PatchFamily.class);
        PauseForTests.resume();
        controller = Robolectric.buildActivity(Activity.class).setup().visible();
        show();
    }

    @After public void close() {
        controller.close();
        PatchFamily.inBuildForTests = null;
        PauseForTests.resume();
    }

    @Test public void aFreshInstallShowsNoDotAndCountsEverySectionRowSeen() {
        for (Preference section : page.sections()) assertFalse(dotted(heading(section)));
        Set<String> seen = seen();
        assertTrue(seen.contains(Settings.REVEAL_SPOILERS.key));
        assertTrue(seen.contains(Settings.HIDE_ADS.key));
        // Only saved settings count: a section heading is no setting.
        for (String key : seen) assertFalse(key, key.startsWith("section_"));
    }

    @Test public void aNewSwitchDotsItsClosedSectionThenItselfUntilTheSectionCloses() {
        String key = Settings.REVEAL_SPOILERS.key;
        reopenWithUnseen(key);
        PreferenceCategory holder = holder(key);
        String id = holder.getTitle().toString();

        // Closed: the section's heading has the dot, read aloud after its name, and no other heading does.
        View head = heading(holder);
        assertTrue(dotted(head));
        TextView title = head.findViewById(android.R.id.title);
        assertEquals(holder.getTitle() + ", New", String.valueOf(title.getContentDescription()));
        assertEquals(holder.getTitle().toString(), NewRowDots.plain(title.getText()).toString());
        for (Preference section : page.sections()) {
            if (section != holder) assertFalse(section.getTitle() + " has a dot", dotted(heading(section)));
        }

        // Open: the dot moves from the heading to the new switch, and only that switch.
        assertTrue(page.navigation.open(page.findPreference(key)));
        assertFalse(dotted(heading(holder)));
        assertTrue(dotted(row(key)));
        for (int i = 0; i < holder.getPreferenceCount(); i++) {
            String other = holder.getPreference(i).getKey();
            if (other != null && !other.equals(key) && position(other) >= 0) assertFalse(other, dotted(row(other)));
        }

        // A search lists rows from everywhere, so it shows no dots and marks nothing seen.
        page.navigation.search("spoiler");
        ShadowLooper.idleMainLooper();
        assertTrue(position(key) >= 0);
        assertFalse(dotted(row(key)));
        page.navigation.search("");
        ShadowLooper.idleMainLooper();
        assertFalse(seen().contains(key));
        assertTrue(dotted(row(key)));

        // Closing the section counts it seen: no dot on the heading now, nor on the next visit.
        tap("section_" + id);
        assertTrue(seen().contains(key));
        assertFalse(dotted(heading(holder)));
        reopen();
        assertFalse(dotted(heading(holder)));
    }

    @Test public void closingTheSettingsWithTheSectionOpenCountsItSeen() {
        String key = Settings.HIDE_ADS.key;
        reopenWithUnseen(key);
        assertTrue(page.navigation.open(page.findPreference(key)));
        assertTrue(dotted(row(key)));
        assertFalse(seen().contains(key));
        reopen();
        assertTrue(seen().contains(key));
        assertFalse(dotted(heading(holder(key))));
    }

    @Test public void aStoredValueOfAnotherKindStartsOverWithNoDots() {
        dialog.dismissAllowingStateLoss();
        ShadowLooper.idleMainLooper();
        store().edit().clear().putString(NewRowDots.SEEN, "not a set").commit();
        show();
        for (Preference section : page.sections()) assertFalse(dotted(heading(section)));
    }

    private void reopenWithUnseen(String key) {
        Set<String> seen = seen();
        assertTrue(seen.remove(key));
        dialog.dismissAllowingStateLoss();
        ShadowLooper.idleMainLooper();
        store().edit().putStringSet(NewRowDots.SEEN, seen).commit();
        show();
    }

    private void reopen() {
        dialog.dismissAllowingStateLoss();
        ShadowLooper.idleMainLooper();
        show();
    }

    private void show() {
        dialog = SettingsL10nTest.show(controller.get());
        page = SettingsL10nTest.pageOf(dialog);
    }

    private static SharedPreferences store() {
        return RuntimeEnvironment.getApplication().getSharedPreferences(NewRowDots.FILE, 0);
    }

    private static Set<String> seen() {
        return new HashSet<>(store().getStringSet(NewRowDots.SEEN, new HashSet<>()));
    }

    private PreferenceCategory holder(String key) {
        Preference row = page.findPreference(key);
        assertNotNull(key, row);
        for (Preference section : page.sections()) {
            if (row.getParent() == section) return (PreferenceCategory) section;
        }
        throw new AssertionError("no section holds " + key);
    }

    private ListView list() { return dialog.getView().findViewById(android.R.id.list); }

    private int position(String key) {
        for (int i = 0; i < list().getCount(); i++) {
            if (key.equals(((Preference) list().getItemAtPosition(i)).getKey())) return i;
        }
        return -1;
    }

    private View row(String key) {
        int at = position(key);
        assertTrue("no visible row " + key, at >= 0);
        return list().getAdapter().getView(at, null, list());
    }

    private View heading(Preference section) {
        return row("section_" + section.getTitle());
    }

    /**
     * Whether [row]'s title ends in the dot, right after its own text. A row's title spans the row
     * up to its switch, so an end drawable stood by the switch instead (S22, 2026-11-17).
     */
    private static boolean dotted(View row) {
        TextView title = row.findViewById(android.R.id.title);
        if (title == null || !NewRowDots.TAG.equals(title.getTag())) return false;
        CharSequence text = title.getText();
        if (!(text instanceof Spanned) || text.length() < 2 || text.charAt(text.length() - 1) != NewRowDots.HOLDER) return false;
        NewRowDots.Dot[] dots = ((Spanned) text).getSpans(0, text.length(), NewRowDots.Dot.class);
        assertEquals(1, dots.length);
        assertEquals(text.length() - 1, ((Spanned) text).getSpanStart(dots[0]));
        assertNull(title.getCompoundDrawablesRelative()[2]);
        return true;
    }

    private void tap(String key) {
        int at = position(key);
        assertTrue("no visible row " + key, at >= 0);
        View view = list().getAdapter().getView(at, null, list());
        assertTrue(list().performItemClick(view, at, list().getAdapter().getItemId(at)));
        ShadowLooper.idleMainLooper();
    }
}
