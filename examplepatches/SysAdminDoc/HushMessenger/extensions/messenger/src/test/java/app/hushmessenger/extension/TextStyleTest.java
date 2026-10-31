package app.hushmessenger.extension;

import android.app.Activity;
import android.app.Application;
import android.content.ComponentName;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.net.Uri;
import android.os.Looper;
import android.view.View;
import android.widget.EditText;
import java.util.Arrays;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.android.controller.ActivityController;
import org.robolectric.annotation.Config;
import org.robolectric.shadows.ShadowActivity;
import org.robolectric.shadows.ShadowToast;
import static org.junit.Assert.*;
import static org.robolectric.Shadows.shadowOf;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = {28, 36})
public class TextStyleTest {
    Application app;
    private java.util.concurrent.Executor realWork;

    @Before public void reset() {
        app = RuntimeEnvironment.getApplication();
        Settings.initialize(app);
        Settings.preferences.edit().clear().commit();
        Settings.activeAt.clear();
        CrashGuard.resetForTests();
        Settings.hookErrors.clear();
        TextStyleActivity.entries = null;
        realWork = TextStyleActivity.work;
        TextStyleActivity.work = Runnable::run;
    }

    /** A failed-start case hands HostScreens this test's app, so later tests mustn't start settings against it. */
    @org.junit.After public void forgetApplication() {
        TextStyleActivity.work = realWork;
        HostScreens.applicationCreated(null);
        Settings.initialize(app);
    }

    private static String points(int... points) { return new String(points, 0, points.length); }
    private static String bold(String text) { return TextStyleActivity.restyle(text, TextStyleActivity.BOLD_STYLE); }
    private static String italic(String text) { return TextStyleActivity.restyle(text, TextStyleActivity.ITALIC_STYLE); }

    private Intent selection(String entry, String text) {
        return new Intent(Intent.ACTION_PROCESS_TEXT).setType("text/plain").setClassName(app.getPackageName(), entry)
            .putExtra(Intent.EXTRA_PROCESS_TEXT, text);
    }

    private int state(String entry) {
        return app.getPackageManager().getComponentEnabledSetting(new ComponentName(app.getPackageName(), entry));
    }

    @Test public void lettersAndDigitsTakeTheStyleAndEverythingElseStays() {
        assertEquals(points(0x1D5D4, 0x1D607, 0x1D7EC, 0x1D7F5), bold("Az09"));
        assertEquals("Unicode has no italic digits", points(0x1D608, 0x1D63B) + "09", italic("Az09"));
        String hello = "Hi, привет 👋!";
        assertEquals(points(0x1D5DB, 0x1D5F6) + ", привет 👋!", bold(hello));
        assertEquals("Picking it again turns the letters back", hello, bold(bold(hello)));
        assertEquals("Hello world 2026", italic(italic("Hello world 2026")));
        for (String nothing : new String[] {"", "  !?", "ß", "привет", "👋"}) {
            assertNull(nothing, bold(nothing));
            assertNull(nothing, italic(nothing));
        }
        assertNull(italic("2026"));
    }

    @Test public void keycapEmojiStayWhole() {
        String keycap = "1\uFE0F\u20E3";
        assertEquals(keycap + " " + points(0x1D5F5, 0x1D5F6), bold(keycap + " hi"));
        assertEquals(keycap + " " + points(0x1D7ED), bold(keycap + " 1"));
        assertNull(bold(keycap));
        assertNull("A keycap without the selector is still an emoji", bold("1\u20E3"));
    }

    @Test public void boldAndItalicCombineAndComeOffOneAtATime() {
        String both = points(0x1D63C, 0x1D657);
        assertEquals(both, italic(bold("Ab")));
        assertEquals(both, bold(italic("Ab")));
        assertEquals(points(0x1D608, 0x1D623), bold(both));
        assertEquals(points(0x1D5D4, 0x1D5EF), italic(both));
        assertEquals("A selection that's only partly bold turns all bold first", points(0x1D5D4, 0x1D5D5), bold("A" + points(0x1D5D5)));
        assertEquals("Bold digits stay bold under italic", points(0x1D656, 0x1D7ED), italic(bold("a1")));
    }

    @Test public void accentsRideAlongAndJoinBackWhenPlain() {
        assertEquals(points(0x1D5F2, 0x0301), bold("é"));
        String word = "ação Ñandú";
        assertEquals(word, bold(bold(word)));
        assertEquals(word, italic(italic(word)));
        assertEquals("Marks typed apart stay with their letter and join it once plain", "é", bold(bold("é")));
        assertNull("A lone mark is left alone", bold("́"));
    }

    @Test public void onlyAMenuEntryWithTheSwitchOnRestylesAnEditableSelection() {
        Intent boldEntry = selection(TextStyleActivity.BOLD, "Hi");
        assertNull("Off leaves the text alone", TextStyleActivity.styledFor(boldEntry));
        assertEquals(0, Settings.lastActive(TextStyleActivity.KEY));
        Settings.preferences.edit().putBoolean(TextStyleActivity.KEY, true).commit();
        assertEquals(points(0x1D5DB, 0x1D5F6), TextStyleActivity.styledFor(boldEntry));
        assertTrue(Settings.lastActive(TextStyleActivity.KEY) > 0);
        assertEquals(points(0x1D60F, 0x1D62A), TextStyleActivity.styledFor(selection(TextStyleActivity.ITALIC, "Hi")));
        assertNull(TextStyleActivity.styledFor(selection(TextStyleActivity.BOLD, "Hi").putExtra(Intent.EXTRA_PROCESS_TEXT_READONLY, true)));
        assertNull(TextStyleActivity.styledFor(selection(TextStyleActivity.class.getName(), "Hi")));
        assertNull(TextStyleActivity.styledFor(new Intent(Intent.ACTION_PROCESS_TEXT).setClassName(app.getPackageName(), TextStyleActivity.BOLD)));
        assertNull(TextStyleActivity.styledFor(null));
        Settings.preferences.edit().putBoolean("paused", true).commit();
        assertNull("Pause leaves the text alone", TextStyleActivity.styledFor(boldEntry));
    }

    @Test public void theScreenHandsTheStyledTextBackAndCloses() {
        Settings.preferences.edit().putBoolean(TextStyleActivity.KEY, true).commit();
        try (ActivityController<TextStyleActivity> controller =
                 Robolectric.buildActivity(TextStyleActivity.class, selection(TextStyleActivity.BOLD, "Hi")).create()) {
            ShadowActivity screen = shadowOf(controller.get());
            assertEquals(Activity.RESULT_OK, screen.getResultCode());
            assertEquals(points(0x1D5DB, 0x1D5F6), screen.getResultIntent().getStringExtra(Intent.EXTRA_PROCESS_TEXT));
            assertTrue(controller.get().isFinishing());
        }
        Settings.preferences.edit().putBoolean(TextStyleActivity.KEY, false).commit();
        try (ActivityController<TextStyleActivity> controller =
                 Robolectric.buildActivity(TextStyleActivity.class, selection(TextStyleActivity.BOLD, "Hi")).create()) {
            assertEquals(Activity.RESULT_CANCELED, shadowOf(controller.get()).getResultCode());
            assertTrue(controller.get().isFinishing());
        }
        assertNull("Off says nothing", ShadowToast.getLatestToast());
    }

    @Test public void aReadOnlySelectionSaysWhyNothingChanged() {
        Intent received = selection(TextStyleActivity.BOLD, "Hi").putExtra(Intent.EXTRA_PROCESS_TEXT_READONLY, true);
        try (ActivityController<TextStyleActivity> controller = Robolectric.buildActivity(TextStyleActivity.class, received).create()) {
            assertEquals(Activity.RESULT_CANCELED, shadowOf(controller.get()).getResultCode());
        }
        assertNull("Off says nothing, even on read-only text", ShadowToast.getLatestToast());
        Settings.preferences.edit().putBoolean(TextStyleActivity.KEY, true).commit();
        try (ActivityController<TextStyleActivity> controller = Robolectric.buildActivity(TextStyleActivity.class, received).create()) {
            assertEquals(Activity.RESULT_CANCELED, shadowOf(controller.get()).getResultCode());
            assertTrue(controller.get().isFinishing());
        }
        assertEquals(new SettingsText(app).get("text_style_read_only"), ShadowToast.getTextOfLatestToast());
        assertEquals("Nothing was styled, so it isn't a use", 0, Settings.lastActive(TextStyleActivity.KEY));
    }

    /** Cyrillic, Arabic and Italic digits have no styled letters, so the entry used to vanish with no word why. */
    @Test public void aSelectionWithNothingToStyleSaysWhy() {
        Settings.preferences.edit().putBoolean(TextStyleActivity.KEY, true).commit();
        SettingsText text = new SettingsText(app);
        String[][] cases = {
            {TextStyleActivity.BOLD, "привет", "text_style_bold_none"},
            {TextStyleActivity.BOLD, "مرحبا", "text_style_bold_none"},
            {TextStyleActivity.ITALIC, "2026", "text_style_italic_none"},
            {TextStyleActivity.ITALIC, "привет", "text_style_italic_none"},
        };
        for (String[] each : cases) {
            ShadowToast.reset();
            try (ActivityController<TextStyleActivity> controller =
                     Robolectric.buildActivity(TextStyleActivity.class, selection(each[0], each[1])).create()) {
                assertEquals(each[1], Activity.RESULT_CANCELED, shadowOf(controller.get()).getResultCode());
                assertTrue(controller.get().isFinishing());
            }
            assertEquals(each[1], 1, ShadowToast.shownToastCount());
            assertEquals(each[1], text.get(each[2]), ShadowToast.getTextOfLatestToast());
        }
        assertEquals("Nothing was styled, so it isn't a use", 0, Settings.lastActive(TextStyleActivity.KEY));

        // What can take the style still does, quietly, and keeps the letters it can't style.
        ShadowToast.reset();
        try (ActivityController<TextStyleActivity> controller =
                 Robolectric.buildActivity(TextStyleActivity.class, selection(TextStyleActivity.BOLD, "é 2026 привет")).create()) {
            ShadowActivity screen = shadowOf(controller.get());
            assertEquals(Activity.RESULT_OK, screen.getResultCode());
            String styled = screen.getResultIntent().getStringExtra(Intent.EXTRA_PROCESS_TEXT);
            assertEquals(points(0x1D5F2, 0x0301) + " " + points(0x1D7EE, 0x1D7EC, 0x1D7EE, 0x1D7F2) + " привет", styled);
            assertEquals("Bold again turns it back", "é 2026 привет", TextStyleActivity.restyle(styled, TextStyleActivity.BOLD_STYLE));
        }
        assertEquals(0, ShadowToast.shownToastCount());
    }

    @Test public void offPauseOtherEntriesAndEmptySelectionsStayQuiet() {
        Intent cyrillic = selection(TextStyleActivity.BOLD, "привет");
        assertNull("Off", TextStyleActivity.whyUnchanged(cyrillic));
        Settings.preferences.edit().putBoolean(TextStyleActivity.KEY, true).commit();
        assertEquals("text_style_bold_none", TextStyleActivity.whyUnchanged(cyrillic));
        assertNull("Text it can style needs no tip", TextStyleActivity.whyUnchanged(selection(TextStyleActivity.BOLD, "Hi")));
        assertNull("Bold digits", TextStyleActivity.whyUnchanged(selection(TextStyleActivity.BOLD, "2026")));
        assertNull("Another entry", TextStyleActivity.whyUnchanged(selection(TextStyleActivity.class.getName(), "привет")));
        assertNull("Empty", TextStyleActivity.whyUnchanged(selection(TextStyleActivity.ITALIC, "")));
        assertNull("No selection", TextStyleActivity.whyUnchanged(new Intent(Intent.ACTION_PROCESS_TEXT).setClassName(app.getPackageName(), TextStyleActivity.BOLD)));
        assertNull(TextStyleActivity.whyUnchanged(null));
        assertEquals("Read-only keeps its own tip", "text_style_read_only",
            TextStyleActivity.whyUnchanged(selection(TextStyleActivity.ITALIC, "2026").putExtra(Intent.EXTRA_PROCESS_TEXT_READONLY, true)));
        Settings.preferences.edit().putBoolean("paused", true).commit();
        assertNull("Pause", TextStyleActivity.whyUnchanged(cyrillic));
        try (ActivityController<TextStyleActivity> controller = Robolectric.buildActivity(TextStyleActivity.class, cyrillic).create()) {
            assertEquals(Activity.RESULT_CANCELED, shadowOf(controller.get()).getResultCode());
        }
        assertNull("Pause says nothing", ShadowToast.getLatestToast());
        assertEquals(0, Settings.lastActive(TextStyleActivity.KEY));
    }

    @Test public void theMenuEntriesFollowTheSwitchPauseAndSafeMode() {
        int off = PackageManager.COMPONENT_ENABLED_STATE_DEFAULT, on = PackageManager.COMPONENT_ENABLED_STATE_ENABLED;
        assertTrue(TextStyleActivity.present(app));
        TextStyleActivity.watch();
        assertEquals(off, state(TextStyleActivity.BOLD));
        Settings.preferences.edit().putBoolean(TextStyleActivity.KEY, true).commit();
        assertEquals(on, state(TextStyleActivity.BOLD));
        assertEquals(on, state(TextStyleActivity.ITALIC));
        Settings.preferences.edit().putBoolean("paused", true).commit();
        assertEquals(off, state(TextStyleActivity.BOLD));
        assertEquals(off, state(TextStyleActivity.ITALIC));
        Settings.preferences.edit().putBoolean("paused", false).commit();
        assertEquals(on, state(TextStyleActivity.ITALIC));
        Settings.preferences.edit().putBoolean("analytics_uploads", true).commit();
        assertEquals("Other switches leave the entries alone", on, state(TextStyleActivity.BOLD));
        Settings.preferences.edit().putBoolean(TextStyleActivity.KEY, false).commit();
        assertEquals(off, state(TextStyleActivity.BOLD));

        Settings.preferences.edit().putBoolean(TextStyleActivity.KEY, true).putBoolean("safe_mode", true).commit();
        CrashGuard.resetForTests();
        CrashGuard.onProcessStart(app);
        TextStyleActivity.refresh();
        assertEquals("Safe mode takes the entries out", off, state(TextStyleActivity.BOLD));
        HostScreens.started = true;
        assertTrue(CrashGuard.clearSafeMode());
        assertEquals("Leaving safe mode brings them back", on, state(TextStyleActivity.BOLD));
    }

    // Messenger's first start after an install enables every component in its manifest, after this start's sync.
    @Test public void entriesMessengerEnablesAfterTheSyncGoBackOffInTheSameRun() {
        TextStyleActivity.watch();
        String[] entries = {TextStyleActivity.BOLD, TextStyleActivity.ITALIC};
        for (String entry : entries)
            app.getPackageManager().setComponentEnabledSetting(new ComponentName(app.getPackageName(), entry),
                PackageManager.COMPONENT_ENABLED_STATE_ENABLED, PackageManager.DONT_KILL_APP);
        app.sendBroadcast(new Intent(Intent.ACTION_PACKAGE_CHANGED, Uri.fromParts("package", app.getPackageName(), null))
            .putExtra(Intent.EXTRA_CHANGED_COMPONENT_NAME_LIST, entries));
        shadowOf(Looper.getMainLooper()).idle();
        assertEquals(PackageManager.COMPONENT_ENABLED_STATE_DEFAULT, state(TextStyleActivity.BOLD));
        assertEquals(PackageManager.COMPONENT_ENABLED_STATE_DEFAULT, state(TextStyleActivity.ITALIC));
        assertTrue(Settings.hookErrors.isEmpty());
    }

    @Test public void aStartThatFailsTakesOutEntriesAnEarlierRunLeftOn() {
        Settings.preferences.edit().putBoolean(TextStyleActivity.KEY, true).commit();
        TextStyleActivity.watch();
        assertEquals(PackageManager.COMPONENT_ENABLED_STATE_ENABLED, state(TextStyleActivity.BOLD));

        // The next process can't start settings: a safe-mode flag stored as the wrong type makes CrashGuard throw.
        Settings.preferences.edit().putString("safe_mode", "on").commit();
        Settings.preferences = null;
        CrashGuard.resetForTests();
        HostScreens.applicationCreated(app);
        assertFalse(Settings.enabled(TextStyleActivity.KEY));
        assertTrue(HostScreens.failed);
        assertEquals(PackageManager.COMPONENT_ENABLED_STATE_DEFAULT, state(TextStyleActivity.BOLD));
        assertEquals(PackageManager.COMPONENT_ENABLED_STATE_DEFAULT, state(TextStyleActivity.ITALIC));
    }

    // Android adds text actions only to a field with a view id, and Messenger's chat box has none.
    @Test public void theChatBoxGetsAnIdWhileTheSwitchIsOn() {
        EditText box = new EditText(app);
        TextStyleActivity.textFieldFocused(box);
        assertEquals("Off leaves the field as Messenger made it", View.NO_ID, box.getId());
        assertTrue(box.isSaveEnabled());

        Settings.preferences.edit().putBoolean(TextStyleActivity.KEY, true).commit();
        TextStyleActivity.textFieldFocused(box);
        int id = box.getId();
        assertNotEquals(View.NO_ID, id);
        assertFalse("The draft stays out of saved state, as it did without an id", box.isSaveEnabled());
        TextStyleActivity.textFieldFocused(box);
        assertEquals("The next focus change keeps the same id", id, box.getId());
        assertNotEquals("Each field gets its own", id, focused(new EditText(app)).getId());

        EditText named = new EditText(app);
        named.setId(0x7f0b0042);
        TextStyleActivity.textFieldFocused(named);
        assertEquals("A field with an id keeps it", 0x7f0b0042, named.getId());
        assertTrue(named.isSaveEnabled());
        TextStyleActivity.textFieldFocused(null);
        assertTrue(Settings.hookErrors.isEmpty());
        assertEquals("Only styling counts as a use", 0, Settings.lastActive(TextStyleActivity.KEY));
    }

    private static EditText focused(EditText field) {
        TextStyleActivity.textFieldFocused(field);
        return field;
    }

    @Test public void pauseSafeModeAMissingControlAndRootMountLeaveTheChatBoxAlone() {
        for (String state : new String[] {"paused", "safe", "missing", "root"}) {
            Settings.initialize(app);
            Settings.preferences.edit().clear().putBoolean(TextStyleActivity.KEY, true)
                .putBoolean("paused", state.equals("paused")).putBoolean("safe_mode", state.equals("safe")).commit();
            CrashGuard.resetForTests();
            CrashGuard.onProcessStart(app);
            if (state.equals("missing")) Settings.installed = java.util.Collections.emptySet();
            // A Root Mount install keeps Messenger's manifest, so there are no entries for an id to bring in.
            if (state.equals("root")) shadowOf(app.getPackageManager()).removeActivity(new ComponentName(app.getPackageName(), TextStyleActivity.BOLD));
            TextStyleActivity.entries = null;
            EditText box = focused(new EditText(app));
            assertEquals(state, View.NO_ID, box.getId());
            assertTrue(state, box.isSaveEnabled());
        }
        assertTrue(Settings.hookErrors.isEmpty());
    }

    @Test public void aFieldThatThrowsIsReportedInsteadOfCrashing() {
        Settings.preferences.edit().putBoolean(TextStyleActivity.KEY, true).commit();
        EditText broken = new EditText(app) {
            @Override public void setId(int id) { throw new IllegalStateException("not now"); }
        };
        TextStyleActivity.textFieldFocused(broken);
        assertEquals(java.util.Collections.singleton(TextStyleActivity.KEY), Settings.hookErrors.keySet());
    }

    @Test public void onASamsungPhoneTheRowSaysWhereToShowTheEntries() {
        String hint = SettingsText.english("text_style_samsung");
        for (String maker : new String[] {"samsung", "Google"}) {
            org.robolectric.shadows.ShadowBuild.setManufacturer(maker);
            try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
                android.widget.Switch control = screen.get().getWindow().getDecorView().findViewWithTag(TextStyleActivity.KEY);
                assertEquals(maker, maker.equals("samsung"), control.getContentDescription().toString().contains(hint));
            }
        }
        assertTrue(hint.contains("Manage apps"));
    }

    @Test public void theSwitchSitsUnderConversationsAndStartsOff() {
        assertTrue(Settings.installed.contains(TextStyleActivity.KEY));
        String[] row = Arrays.stream(SettingsActivity.CONTROLS).filter(c -> c[0].equals(TextStyleActivity.KEY)).findFirst().orElseThrow();
        assertEquals("Bold and italic text", row[1]);
        assertEquals("conversations", row[3]);
        assertTrue(Settings.available(TextStyleActivity.KEY));
        assertFalse(Settings.preferences.contains(TextStyleActivity.KEY));
        assertFalse(Settings.wouldUse(TextStyleActivity.KEY));
    }
}
