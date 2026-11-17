/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import static org.junit.Assert.*;

import android.content.ClipboardManager;
import android.content.Context;
import android.view.View;
import android.widget.FrameLayout;
import android.widget.TextView;
import app.hushtelegram.extension.shared.L10nTablesForTests;
import app.hushtelegram.extension.shared.SettingsContextRule;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.shared.settings.HushTelegramPause;
import app.hushtelegram.extension.shared.settings.PauseForTests;
import app.hushtelegram.extension.shared.settings.SettingReadsForTests;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.Settings;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.Implementation;
import org.robolectric.annotation.Implements;
import org.robolectric.shadows.ShadowToast;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30, shadows = {RegistrationDateTest.NativeMenu.class, RegistrationDateTest.CachedUsers.class},
        instrumentedPackages = "app.hushtelegram.extension.telegram.misc")
public class RegistrationDateTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    /** The fixture test checks the real menu bridge; this one adds a plain row to a plain menu. */
    @Implements(value = LocalIds.class, isInAndroidSdk = false)
    public static class NativeMenu {
        static int dismisses;
        @Implementation protected static View nativeAddRow(Object menu, String text) {
            TextView row = new TextView(((View) menu).getContext());
            row.setText(text);
            ((FrameLayout) menu).addView(row);
            return row;
        }
        @Implementation protected static void nativeDismiss(Object menu) { dismisses++; }
    }

    /** Stands in for the users Telegram caches. The fixture test checks the real lookup. */
    @Implements(value = RegistrationDate.class, isInAndroidSdk = false)
    public static class CachedUsers {
        static boolean person;
        @Implementation protected static boolean isPerson(long userId) { return person; }
    }

    /** IDs 100, 200 and 400 signed up on days 1000, 1100 and 1300. */
    private static final long[][] TABLE = {{100, 1000}, {200, 1100}, {400, 1300}};

    private Locale locale;

    @Before public void reset() {
        locale = Locale.getDefault();
        Locale.setDefault(Locale.US);
        restore();
    }

    @After public void restore() {
        PauseForTests.resume();
        SettingReadsForTests.mend(Settings.REGISTRATION_DATE);
        Settings.SHOW_LOCAL_IDS.resetToDefault();
        Settings.PROFILE_DATA_CENTER.resetToDefault();
        Settings.REGISTRATION_DATE.resetToDefault();
        CachedUsers.person = true;
        NativeMenu.dismisses = 0;
        HookStatus.clear();
        if (locale != null) Locale.setDefault(locale);
    }

    @Test public void anAnchorGivesItsOwnDay() {
        for (long[] anchor : TABLE) assertEstimate(anchor[1], false, RegistrationDate.estimate(anchor[0], TABLE));
        for (long[] anchor : RegistrationDate.ANCHORS) {
            if (anchor[0] > 0) assertEstimate(anchor[1], false, RegistrationDate.estimate(anchor[0]));
        }
        // 171295414 signed up on 9 March 2016.
        assertEquals("March 2016", RegistrationDate.month(RegistrationDate.estimate(171_295_414L).day, Locale.US));
    }

    @Test public void betweenTwoAnchorsTheDayFallsOnTheLineBetweenThem() {
        assertEstimate(1050, false, RegistrationDate.estimate(150, TABLE));
        assertEstimate(1200, false, RegistrationDate.estimate(300, TABLE));
        assertEstimate(1101, false, RegistrationDate.estimate(201, TABLE));
        // Halfway between 9 March 2016 and 8 June 2016 is late April.
        RegistrationDate.Estimate halfway = RegistrationDate.estimate((171_295_414L + 222_021_233L) / 2);
        assertEquals(16914, halfway.day);
        assertEquals("April 2016", RegistrationDate.month(halfway.day, Locale.US));
    }

    @Test public void beforeTheFirstAnchorItIsTheFirstDayAndPastTheLastItIsAfterTheLast() {
        assertEstimate(1000, false, RegistrationDate.estimate(1, TABLE));
        assertEstimate(1000, false, RegistrationDate.estimate(99, TABLE));
        assertEstimate(1300, true, RegistrationDate.estimate(401, TABLE));
        assertEstimate(1300, true, RegistrationDate.estimate(Long.MAX_VALUE, TABLE));
        assertNull(RegistrationDate.estimate(0, TABLE));
        assertNull(RegistrationDate.estimate(-100, TABLE));
        assertNull(RegistrationDate.estimate(150, new long[0][]));
        long[] last = RegistrationDate.ANCHORS[RegistrationDate.ANCHORS.length - 1];
        assertEstimate(last[1], true, RegistrationDate.estimate(last[0] + 1));
        assertEquals("Registered after September 2026", RegistrationDate.label(context(), 9_000_000_000L));
    }

    @Test public void theTableRisesInBothColumns() {
        long[][] table = RegistrationDate.ANCHORS;
        assertTrue(table.length > 20);
        for (int i = 1; i < table.length; i++) {
            assertTrue("ID at " + i, table[i][0] > table[i - 1][0]);
            assertTrue("day at " + i, table[i][1] > table[i - 1][1]);
        }
    }

    @Test public void offByDefaultTheProfileMenuGetsNoMonth() {
        assertFalse(Settings.REGISTRATION_DATE.get());
        assertEquals(0, rows(171_295_414L, 0).getChildCount());
    }

    @Test public void onAPersonGetsACopyableMonthUnderTheIdRow() {
        Settings.REGISTRATION_DATE.save(true);
        Settings.SHOW_LOCAL_IDS.save(true);
        FrameLayout menu = rows(171_295_414L, 0);
        assertEquals(2, menu.getChildCount());
        assertEquals("User ID 171295414", ((TextView) menu.getChildAt(0)).getText().toString());
        TextView row = (TextView) menu.getChildAt(1);
        assertEquals("Registered about March 2016", row.getText().toString());
        assertEquals("Copy Registered about March 2016", row.getContentDescription());
        assertTrue(row.performClick());
        assertEquals("Registered about March 2016", clipboard().getPrimaryClip().getItemAt(0).getText().toString());
        assertEquals("Registration date copied", ShadowToast.getTextOfLatestToast());
        assertEquals(1, NativeMenu.dismisses);
        Settings.SHOW_LOCAL_IDS.save(false);
        assertEquals("Registered after September 2026",
                ((TextView) rows(9_000_000_000L, 0).getChildAt(0)).getText().toString());
    }

    @Test public void botsChannelsAndGroupsGetNoRow() {
        Settings.REGISTRATION_DATE.save(true);
        CachedUsers.person = false;
        assertEquals("a bot or a user the app hasn't cached", 0, rows(171_295_414L, 0).getChildCount());
        CachedUsers.person = true;
        assertEquals("a channel or group", 0, rows(0, 1_234_567_890L).getChildCount());
        assertEquals(0, rows(0, 0).getChildCount());
        assertEquals(0, rows(5, 6).getChildCount());
    }

    @Test public void pauseAnEarlyStartOrAnUnreadableSwitchKeepsTheStockMenu() {
        Settings.REGISTRATION_DATE.save(true);
        View row = rows(171_295_414L, 0).getChildAt(0);
        for (HushTelegramPause.Reason reason : HushTelegramPause.Reason.values()) {
            if (reason == HushTelegramPause.Reason.NONE) continue;
            PauseForTests.pause(reason);
            assertEquals(reason.name(), 0, rows(171_295_414L, 0).getChildCount());
            row.getViewTreeObserver().dispatchOnPreDraw();
            assertEquals(View.GONE, row.getVisibility());
            PauseForTests.resume();
            row.getViewTreeObserver().dispatchOnPreDraw();
            assertEquals(View.VISIBLE, row.getVisibility());
        }
        SettingsContextRule.withoutContext(() -> assertEquals(0, rows(171_295_414L, 0).getChildCount()));
        SettingReadsForTests.breakReads(Settings.REGISTRATION_DATE);
        assertEquals(0, rows(171_295_414L, 0).getChildCount());
        assertFalse(HookStatus.missing(FamilyNames.SHOW_LOCAL_IDS).isEmpty());
    }

    @Test public void theCopiedToastFitsTwoLinesInEveryLanguage() {
        String text = "Registration date copied";
        assertFitsATwoLineToast("en", text);
        for (String language : new String[]{"bg", "de", "es", "in", "pt-rbr", "tr", "zh-hans"}) {
            String row = L10nTablesForTests.of(language).get(text);
            assertNotNull(language + ": " + text, row);
            assertFitsATwoLineToast(language, row);
        }
    }

    /** A toast line holds about 34 characters on a small phone; 28 leaves room for wider letters. */
    private static void assertFitsATwoLineToast(String language, String text) {
        List<String> lines = new ArrayList<>();
        StringBuilder line = new StringBuilder();
        for (String word : text.split(" ")) {
            if (line.length() > 0 && line.length() + 1 + word.length() > 28) {
                lines.add(line.toString());
                line.setLength(0);
            }
            if (line.length() > 0) line.append(' ');
            line.append(word);
        }
        if (line.length() > 0) lines.add(line.toString());
        assertTrue(language + ": " + text, lines.size() <= 2);
        for (String each : lines) assertTrue(language + ": " + each, each.length() <= 28);
    }

    private static void assertEstimate(long day, boolean after, RegistrationDate.Estimate estimate) {
        assertNotNull(estimate);
        assertEquals(day, estimate.day);
        assertEquals(after, estimate.after);
    }

    private static FrameLayout rows(long userId, long chatId) {
        FrameLayout menu = new FrameLayout(context());
        LocalIds.addToProfile(menu, userId, chatId);
        return menu;
    }

    private static Context context() { return RuntimeEnvironment.getApplication(); }
    private static ClipboardManager clipboard() { return (ClipboardManager) context().getSystemService(Context.CLIPBOARD_SERVICE); }
}
