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
 * Modified for Hushfacebook (Facebook), 2026.
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 *
 * Built on icysymmetra/tiktok-patches-for-morphe (GPL-3.0).
 */
package app.hushpinterest.extension.shared.settings.preference;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import android.app.Activity;
import android.app.AlertDialog;
import android.widget.ListView;

import app.hushpinterest.extension.shared.Utils;
import app.hushpinterest.extension.shared.settings.BaseSettings;
import app.hushpinterest.extension.shared.SettingsContextRule;

import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;
import org.robolectric.shadows.ShadowAlertDialog;

/** What the included-events picker will and won't save. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class LogExportFilterPreferenceTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @Test
    public void clearingEveryKindLeavesNothingToApply() {
        try (var controller = Robolectric.buildActivity(Activity.class).setup()) {
            Activity activity = controller.get();
            activity.setTheme(android.R.style.Theme_Material_Light);
            Utils.setContext(activity);
            BaseSettings.DEBUG_LOG_FILTERS.save("all");
            LogExportFilterPreference row = new LogExportFilterPreference(activity);

            row.getOnPreferenceClickListener().onPreferenceClick(row);
            AlertDialog picker = (AlertDialog) ShadowAlertDialog.getLatestAlertDialog();
            ListView kinds = picker.getListView();
            assertTrue("all events is the starting choice", picker.getButton(AlertDialog.BUTTON_POSITIVE).isEnabled());

            // Clearing the only box leaves nothing chosen, and nothing to apply.
            kinds.performItemClick(kinds.getAdapter().getView(0, null, kinds), 0, 0);
            assertFalse(picker.getButton(AlertDialog.BUTTON_POSITIVE).isEnabled());

            // Choosing one kind makes it something again, and that is what is saved.
            kinds.performItemClick(kinds.getAdapter().getView(1, null, kinds), 1, 1);
            assertTrue(picker.getButton(AlertDialog.BUTTON_POSITIVE).isEnabled());
            picker.getButton(AlertDialog.BUTTON_POSITIVE).performClick();
            // The dialog hands the click to its listener through the main looper.
            org.robolectric.Shadows.shadowOf(android.os.Looper.getMainLooper()).idle();
            assertEquals("feed", BaseSettings.DEBUG_LOG_FILTERS.get());
        } finally {
            BaseSettings.DEBUG_LOG_FILTERS.save("all");
        }
    }
}
