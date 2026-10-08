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
import app.hushtelegram.extension.shared.SettingsContextRule;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.shared.settings.HushTelegramPause;
import app.hushtelegram.extension.shared.settings.PauseForTests;
import app.hushtelegram.extension.shared.settings.SettingReadsForTests;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.Settings;
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
@Config(sdk = 30, shadows = {ProfileDcTest.NativeMenu.class, ProfileDcTest.CachedPhotos.class},
        instrumentedPackages = "app.hushtelegram.extension.telegram.misc")
public class ProfileDcTest {
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

    /** Stands in for the photo Telegram caches. The fixture test checks the real lookups. */
    @Implements(value = ProfileDc.class, isInAndroidSdk = false)
    public static class CachedPhotos {
        static int userDc, chatDc;
        @Implementation protected static int userPhotoDc(long userId) { return userDc; }
        @Implementation protected static int chatPhotoDc(long chatId) { return chatDc; }
    }

    @Before public void reset() { restore(); }
    @After public void restore() {
        PauseForTests.resume();
        SettingReadsForTests.mend(Settings.SHOW_LOCAL_IDS);
        SettingReadsForTests.mend(Settings.PROFILE_DATA_CENTER);
        Settings.SHOW_LOCAL_IDS.resetToDefault();
        Settings.PROFILE_DATA_CENTER.resetToDefault();
        CachedPhotos.userDc = 2;
        CachedPhotos.chatDc = 4;
        NativeMenu.dismisses = 0;
        HookStatus.clear();
    }

    @Test public void offByDefaultTheMenuGetsNoDataCenter() {
        assertFalse(Settings.PROFILE_DATA_CENTER.get());
        Settings.SHOW_LOCAL_IDS.save(true);
        assertEquals(1, rows(42, 0).getChildCount());
        Settings.SHOW_LOCAL_IDS.save(false);
        assertEquals(0, rows(42, 0).getChildCount());
    }

    @Test public void onItGoesUnderTheIdRowOrStandsAlone() {
        Settings.PROFILE_DATA_CENTER.save(true);
        Settings.SHOW_LOCAL_IDS.save(true);
        FrameLayout menu = rows(42, 0);
        assertEquals(2, menu.getChildCount());
        assertEquals("User ID 42", ((TextView) menu.getChildAt(0)).getText().toString());
        assertEquals("Data center 2", ((TextView) menu.getChildAt(1)).getText().toString());
        Settings.SHOW_LOCAL_IDS.save(false);
        menu = rows(0, 77);
        assertEquals(1, menu.getChildCount());
        TextView row = (TextView) menu.getChildAt(0);
        assertEquals("Data center 4", row.getText().toString());
        assertEquals("Copy data center 4", row.getContentDescription());
        assertTrue(row.performClick());
        assertEquals("Data center 4", clipboard().getPrimaryClip().getItemAt(0).getText().toString());
        assertEquals("Data center copied", ShadowToast.getTextOfLatestToast());
        assertEquals(1, NativeMenu.dismisses);
    }

    @Test public void noPhotoOrAnUnknownNumberShowsNothing() {
        Settings.PROFILE_DATA_CENTER.save(true);
        for (int dc : new int[]{0, -1, 6, Integer.MAX_VALUE}) {
            CachedPhotos.userDc = dc;
            assertEquals("dc " + dc, 0, rows(42, 0).getChildCount());
        }
        assertEquals(0, rows(0, 0).getChildCount());
        assertEquals(0, rows(1, 2).getChildCount());
    }

    @Test public void pauseAnEarlyStartOrAnUnreadableSwitchKeepsTheStockMenu() {
        Settings.PROFILE_DATA_CENTER.save(true);
        View row = rows(42, 0).getChildAt(0);
        for (HushTelegramPause.Reason reason : HushTelegramPause.Reason.values()) {
            if (reason == HushTelegramPause.Reason.NONE) continue;
            PauseForTests.pause(reason);
            assertEquals(reason.name(), 0, rows(42, 0).getChildCount());
            row.getViewTreeObserver().dispatchOnPreDraw();
            assertEquals(View.GONE, row.getVisibility());
            PauseForTests.resume();
            row.getViewTreeObserver().dispatchOnPreDraw();
            assertEquals(View.VISIBLE, row.getVisibility());
        }
        SettingsContextRule.withoutContext(() -> assertEquals(0, rows(42, 0).getChildCount()));
        SettingReadsForTests.breakReads(Settings.PROFILE_DATA_CENTER);
        assertEquals(0, rows(42, 0).getChildCount());
        assertFalse(HookStatus.missing(FamilyNames.SHOW_LOCAL_IDS).isEmpty());
    }

    private static FrameLayout rows(long userId, long chatId) {
        FrameLayout menu = new FrameLayout(context());
        LocalIds.addToProfile(menu, userId, chatId);
        return menu;
    }

    private static Context context() { return RuntimeEnvironment.getApplication(); }
    private static ClipboardManager clipboard() { return (ClipboardManager) context().getSystemService(Context.CLIPBOARD_SERVICE); }
}
