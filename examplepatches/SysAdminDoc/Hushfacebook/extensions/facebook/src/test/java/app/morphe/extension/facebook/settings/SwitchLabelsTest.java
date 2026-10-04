/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.settings;

import android.app.Activity;

import app.morphe.extension.shared.SettingsContextRule;
import app.morphe.extension.shared.L10n;
import app.morphe.extension.shared.settings.BooleanSetting;

import org.junit.After;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.android.controller.ActivityController;
import org.robolectric.annotation.Config;

import java.util.EnumSet;

import static org.junit.Assert.*;

/** Existing feed, video and app pages consume the same exact names as imports. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class SwitchLabelsTest {
    @Rule public final SettingsContextRule settings = new SettingsContextRule();

    @After public void reset() {
        PatchFamily.inBuildForTests = null;
    }

    @Test public void everyBackedUpSwitchHasANameWithoutAnyPatchSelected() {
        PatchFamily.inBuildForTests = EnumSet.noneOf(PatchFamily.class);
        for (BooleanSetting setting : SettingsBackup.ALLOWLIST) {
            String label = SwitchLabels.title(setting);
            assertFalse(setting.key, label.isEmpty());
            assertNotEquals(setting.key, label);
            assertFalse(label, label.contains("hushfacebook_"));
        }
    }

    @Test public void theExistingFeedVideoAndAppLabelsRemainUnchanged() {
        assertEquals("Hide sponsored posts", SwitchLabels.title(Settings.HIDE_SPONSORED_POSTS));
        assertEquals("Save videos other apps can open", SwitchLabels.title(Settings.DOWNLOAD_COMPATIBLE));
        assertEquals("Hide Meta AI in search", SwitchLabels.title(Settings.HIDE_META_AI_IN_SEARCH));
        PatchFamily.inBuildForTests = EnumSet.allOf(PatchFamily.class);
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            HushfacebookPreferenceFragment page = SettingsL10nTest.pageOf(SettingsL10nTest.show(controller.get()));
            for (BooleanSetting setting : SettingsBackup.ALLOWLIST) {
                assertNotNull(setting.key, page.findPreference(setting.key));
                assertEquals(setting.key, SwitchLabels.title(setting), page.findPreference(setting.key).getTitle());
            }
        }
    }

    @Test @Config(qualifiers = "de")
    public void bothStoriesChoicesAndWholeWordModeKeepTheirOwnLocalizedNames() {
        PatchFamily.inBuildForTests = EnumSet.noneOf(PatchFamily.class);
        assertEquals(L10n.t("Hide the Stories tray"), SwitchLabels.title(Settings.HIDE_TOP_STORIES_TRAY));
        assertEquals(L10n.t("Hide Stories between posts"), SwitchLabels.title(Settings.HIDE_STORIES_BETWEEN_POSTS));
        assertEquals(L10n.t("Match whole words"), SwitchLabels.title(Settings.POST_WORDS_WHOLE_WORDS));
        assertNotEquals(SwitchLabels.title(Settings.HIDE_TOP_STORIES_TRAY),
                SwitchLabels.title(Settings.HIDE_STORIES_BETWEEN_POSTS));
        assertNotEquals("Hide Stories between posts", SwitchLabels.title(Settings.HIDE_STORIES_BETWEEN_POSTS));
        assertNotEquals("Match whole words", SwitchLabels.title(Settings.POST_WORDS_WHOLE_WORDS));
    }
}
