/*
 * Forked from https://github.com/SysAdminDoc/HushPinterest at 44fb933 (GPL-3.0),
 * modified for HushTumblr (Tumblr), 2026.
 *
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 *
 * Built on SysAdminDoc/hushfeed (GPL-3.0).
 */
package app.hushtumblr.extension.tumblr.settings;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import app.hushtumblr.extension.shared.SettingsContextRule;
import app.hushtumblr.extension.shared.settings.BaseSettings;
import app.hushtumblr.extension.shared.settings.BooleanSetting;
import app.hushtumblr.extension.shared.settings.Setting;

/** Quick setups' lists name real switches, none twice, and only the feature switches a settings file carries. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class QuickSetupKeysTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @Test
    public void everyKeyIsASwitchInSettingsAndNoListIsEmpty() throws Exception {
        Set<BooleanSetting> declared = new HashSet<>();
        for (Field field : Settings.class.getDeclaredFields()) {
            if (Modifier.isStatic(field.getModifiers()) && Modifier.isPublic(field.getModifiers())
                    && field.getType() == BooleanSetting.class) {
                declared.add((BooleanSetting) field.get(null));
            }
        }
        assertTrue("found too few switches to compare against: " + declared.size(), declared.size() > 20);
        for (List<BooleanSetting> list : Arrays.asList(QuickSetupKeys.QUIET, QuickSetupKeys.PRIVACY, QuickSetupKeys.DEFAULTS)) {
            assertFalse(list.isEmpty());
            assertEquals("a switch is listed twice: " + list, list.size(), new HashSet<>(list).size());
            for (BooleanSetting setting : list) {
                assertTrue(setting.key + " isn't one of Settings' switches", declared.contains(setting));
                assertSame(setting, Setting.getSettingFromPath(setting.key));
            }
        }
    }

    @Test
    public void quietAndPrivacyOnlyTurnFeatureSwitchesOn() {
        for (List<BooleanSetting> list : Arrays.asList(QuickSetupKeys.QUIET, QuickSetupKeys.PRIVACY)) {
            assertTrue("a choice reaches past the feature switches: " + list, SettingsBackup.ALLOWLIST.containsAll(list));
        }
        for (Map<BooleanSetting, Boolean> choice : Arrays.asList(QuickSetupKeys.quiet(), QuickSetupKeys.privacy())) {
            for (Boolean value : choice.values()) assertTrue(value);
        }
        Map<BooleanSetting, Boolean> defaults = QuickSetupKeys.defaults();
        assertEquals(SettingsBackup.ALLOWLIST.size(), defaults.size());
        for (Map.Entry<BooleanSetting, Boolean> value : defaults.entrySet()) {
            assertEquals(value.getKey().key, value.getKey().defaultValue, value.getValue());
        }
        // Pause, debug and the release check are nobody's quick setup.
        for (BooleanSetting kept : Arrays.asList(BaseSettings.PAUSED, BaseSettings.DEBUG, Settings.CHECK_FOR_RELEASES)) {
            assertFalse(kept.key, defaults.containsKey(kept));
        }
    }

    /**
     * Quiet and Privacy leave alone what someone would miss: the posts they follow, the tabs, the
     * parts of reading a post, and the Notifications count and activity.
     */
    @Test
    public void neitherChoiceHidesPostsTabsOrReplies() {
        Set<BooleanSetting> chosen = new HashSet<>(QuickSetupKeys.QUIET);
        chosen.addAll(QuickSetupKeys.PRIVACY);
        List<BooleanSetting> missed = Arrays.asList(
                Settings.HIDE_REBLOGS, Settings.HIDE_VIDEO_POSTS, Settings.HIDE_PHOTO_POSTS, Settings.HIDE_TEXT_POSTS,
                Settings.HIDE_POSTS_WITH_WORDS, Settings.HIDE_FILTERED_POSTS, Settings.HIDE_TUMBLR_TV, Settings.HIDE_COMMUNITIES_TAB,
                Settings.HIDE_EXPLORE_TAB, Settings.HIDE_NOTIFICATIONS_TAB, Settings.HIDE_LIKE_BUTTON,
                Settings.HIDE_REBLOG_BUTTON, Settings.HIDE_COMMENT_BUTTON, Settings.HIDE_SHARE_BUTTON,
                Settings.HIDE_SAVE_BUTTON, Settings.HIDE_NOTE_COUNTS, Settings.HIDE_HASHTAGS,
                Settings.HIDE_FOLLOW_BUTTON, Settings.HIDE_NOTIFICATIONS_COUNT, Settings.HIDE_NOTIFICATION_REPLIES,
                Settings.HIDE_NOTIFICATION_MENTIONS, Settings.HIDE_NOTIFICATION_ASKS);
        for (BooleanSetting setting : missed) assertFalse(setting.key + " is in a quick setup", chosen.contains(setting));
    }
}
