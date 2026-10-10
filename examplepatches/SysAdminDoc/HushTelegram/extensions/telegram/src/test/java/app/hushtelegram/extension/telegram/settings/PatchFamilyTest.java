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
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertThrows;
import static org.junit.Assert.assertTrue;

import org.json.JSONArray;
import org.json.JSONObject;
import org.junit.After;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import java.io.File;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.util.Arrays;
import java.util.Collections;
import java.util.EnumSet;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeSet;

import app.hushtelegram.extension.shared.L10n;
import app.hushtelegram.extension.shared.SettingsContextRule;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.shared.settings.BooleanSetting;
import app.hushtelegram.extension.shared.settings.HushTelegramPause;
import app.hushtelegram.extension.shared.settings.PauseForTests;
import app.hushtelegram.extension.shared.settings.preference.LogBufferManager;

/**
 * The one list the settings screen and the diagnostic report read to say what Pause turns off
 * and what it can't reach. It has to cover every switch, every patch and every status flag, or
 * one of them goes unmentioned.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class PatchFamilyTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @After
    public void restore() {
        PatchFamily.inBuildForTests = null;
        PatchFamily.staysWhilePausedForTests = null;
        PatchFamily.capabilitiesForTests = null;
        PauseForTests.resume();
        Settings.HIDE_ADS.resetToDefault();
        Settings.DISABLE_ANALYTICS.resetToDefault();
        Settings.DISABLE_UPDATE_CHECKS.resetToDefault();
        Settings.NORMAL_PASTE.resetToDefault();
        Settings.SHOW_LOCAL_IDS.resetToDefault();
        Settings.DISABLE_DOUBLE_TAP_REACTIONS.resetToDefault();
        Settings.HIDE_CONTACTS_BLOCK.resetToDefault();
        Settings.HIDE_GREETING_STICKERS.resetToDefault();
        Settings.USE_SYSTEM_FONT.resetToDefault();
        Settings.AMOLED_BLACK.resetToDefault();
        Settings.HIDE_TRANSLATE_BAR.resetToDefault();
        Settings.EXACT_NUMBERS.resetToDefault();
        Settings.REVEAL_SPOILERS.resetToDefault();
        Settings.HIDE_KEYBOARD_ON_SCROLL.resetToDefault();
        Settings.KEEP_VIDEOS_MUTED.resetToDefault();
        Settings.SWIPE_BACK_ON_PROFILES.resetToDefault();
        Settings.HIDE_PHONE_NUMBER.resetToDefault();
        Settings.MESSAGE_SECONDS.resetToDefault();
        Settings.ALLOW_CHAT_BLUR.resetToDefault();
        Settings.VOICE_ONE_AT_A_TIME.resetToDefault();
        Settings.NO_HAPTICS.resetToDefault();
        Settings.REACTION_EFFECTS_OFF.resetToDefault();
        Settings.HIDE_FOLDER_COUNTERS.resetToDefault();
        Settings.FORWARD_HIDE_SENDER.resetToDefault();
        Settings.VOICE_MUSIC_PLAYER.resetToDefault();
        Settings.SILENCE_NON_CONTACTS.resetToDefault();
        Settings.DISABLE_ARCHIVE_PULL.resetToDefault();
        Settings.REAR_CAMERA_FIRST.resetToDefault();
        Settings.HIDE_GALLERY_CAMERA_TILE.resetToDefault();
        Settings.HIDE_STICKER_TIME.resetToDefault();
        Settings.IGNORE_MUTED_MENTIONS.resetToDefault();
        Settings.HIDE_BLOCKED_IN_GROUPS.resetToDefault();
        Settings.HIDE_FEATURES_AND_INVITE.resetToDefault();
        Settings.MESSAGE_MENU_REPEAT.resetToDefault();
        Settings.KEEP_DELETED_MESSAGES.resetToDefault();
        Settings.ASK_BEFORE_STICKER.resetToDefault();
        Settings.BETA_LOGS_OFF.resetToDefault();
        Settings.ASK_BEFORE_GIF.resetToDefault();
        Settings.ASK_BEFORE_VOICE_VIDEO.resetToDefault();
        Settings.ASK_BEFORE_CALL.resetToDefault();
        Settings.MESSAGE_MENU_COPY_PHOTO.resetToDefault();
        Settings.MESSAGE_MENU_DETAILS.resetToDefault();
        Settings.MESSAGE_MENU_QUICK_FORWARD.resetToDefault();
        HookStatus.clear();
    }

    /**
     * A switch is a family's, or the settings entry's own (the release check), and never both: a
     * switch in neither list goes unmentioned by the screen and the tests that hold Pause to it.
     */
    @Test
    public void turnOffBetaLogsHasItsOwnOffByDefaultSwitchThatAppliesAfterARestart() {
        PatchFamily family = PatchFamily.BETA_LOGS_OFF;
        assertEquals("Turn off beta debug logs", family.patchName);
        assertEquals(Collections.singletonList(Settings.BETA_LOGS_OFF), family.switches);
        assertFalse(Settings.BETA_LOGS_OFF.defaultValue);
        assertTrue(Settings.BETA_LOGS_OFF.rebootApp);
        assertTrue(family.expectedCapabilities().isEmpty());
        assertTrue(PatchFamily.CHATS_PAGE.contains(family));
    }

    @Test
    public void askBeforeSendingHasFourOwnOffByDefaultSwitchesThatApplyAtOnce() {
        PatchFamily family = PatchFamily.ASK_BEFORE_STICKER;
        assertEquals("Ask before sending a sticker", family.patchName);
        assertEquals(Arrays.asList(Settings.ASK_BEFORE_STICKER, Settings.ASK_BEFORE_GIF, Settings.ASK_BEFORE_VOICE_VIDEO, Settings.ASK_BEFORE_CALL), family.switches);
        for (BooleanSetting setting : family.switches) {
            assertFalse(setting.key, setting.defaultValue);
            assertFalse(setting.key, setting.rebootApp);
        }
        assertTrue(family.expectedCapabilities().isEmpty());
        assertTrue(PatchFamily.CHATS_PAGE.contains(family));
    }

    @Test
    public void keepDeletedMessagesHasItsOwnOffByDefaultSwitchThatAppliesAtOnce() {
        PatchFamily family = PatchFamily.KEEP_DELETED_MESSAGES;
        assertEquals("Keep deleted messages", family.patchName);
        assertEquals(Collections.singletonList(Settings.KEEP_DELETED_MESSAGES), family.switches);
        assertFalse(Settings.KEEP_DELETED_MESSAGES.defaultValue);
        assertFalse(Settings.KEEP_DELETED_MESSAGES.rebootApp);
        assertTrue(family.expectedCapabilities().isEmpty());
        assertTrue(PatchFamily.CHATS_PAGE.contains(family));
    }

    @Test
    public void messageMenuHasFourOwnOffByDefaultSwitchesThatApplyAtOnce() {
        PatchFamily family = PatchFamily.MESSAGE_MENU_REPEAT;
        assertEquals("Add Repeat to the message menu", family.patchName);
        assertEquals(Arrays.asList(Settings.MESSAGE_MENU_REPEAT, Settings.MESSAGE_MENU_COPY_PHOTO, Settings.MESSAGE_MENU_DETAILS,
                Settings.MESSAGE_MENU_QUICK_FORWARD), family.switches);
        for (BooleanSetting setting : family.switches) {
            assertFalse(setting.key, setting.defaultValue);
            assertFalse(setting.key, setting.rebootApp);
        }
        assertTrue(family.expectedCapabilities().isEmpty());
        assertTrue(PatchFamily.CHATS_PAGE.contains(family));
    }

    @Test
    public void hideFeaturesAndInviteHasItsOwnOffByDefaultSwitchThatAppliesAtOnce() {
        PatchFamily family = PatchFamily.HIDE_FEATURES_AND_INVITE;
        assertEquals("Hide Telegram Features and Invite Friends", family.patchName);
        assertEquals(Collections.singletonList(Settings.HIDE_FEATURES_AND_INVITE), family.switches);
        assertFalse(Settings.HIDE_FEATURES_AND_INVITE.defaultValue);
        assertFalse(Settings.HIDE_FEATURES_AND_INVITE.rebootApp);
        assertTrue(family.expectedCapabilities().isEmpty());
        assertTrue(PatchFamily.CHATS_PAGE.contains(family));
    }

    @Test
    public void hideBlockedInGroupsHasItsOwnOffByDefaultSwitchThatAppliesAtOnce() {
        PatchFamily family = PatchFamily.HIDE_BLOCKED_IN_GROUPS;
        assertEquals("Hide blocked users in groups", family.patchName);
        assertEquals(Collections.singletonList(Settings.HIDE_BLOCKED_IN_GROUPS), family.switches);
        assertFalse(Settings.HIDE_BLOCKED_IN_GROUPS.defaultValue);
        assertFalse(Settings.HIDE_BLOCKED_IN_GROUPS.rebootApp);
        assertTrue(family.expectedCapabilities().isEmpty());
        assertTrue(PatchFamily.CHATS_PAGE.contains(family));
    }

    @Test
    public void ignoreMutedMentionsHasItsOwnOffByDefaultSwitchThatAppliesAtOnce() {
        PatchFamily family = PatchFamily.IGNORE_MUTED_MENTIONS;
        assertEquals("Ignore mentions in muted chats", family.patchName);
        assertEquals(Collections.singletonList(Settings.IGNORE_MUTED_MENTIONS), family.switches);
        assertFalse(Settings.IGNORE_MUTED_MENTIONS.defaultValue);
        assertFalse(Settings.IGNORE_MUTED_MENTIONS.rebootApp);
        assertTrue(family.expectedCapabilities().isEmpty());
        assertTrue(PatchFamily.CHATS_PAGE.contains(family));
    }

    @Test
    public void hideStickerTimeHasItsOwnOffByDefaultSwitchThatAppliesAtOnce() {
        PatchFamily family = PatchFamily.HIDE_STICKER_TIME;
        assertEquals("Hide time on stickers", family.patchName);
        assertEquals(Collections.singletonList(Settings.HIDE_STICKER_TIME), family.switches);
        assertFalse(Settings.HIDE_STICKER_TIME.defaultValue);
        assertFalse(Settings.HIDE_STICKER_TIME.rebootApp);
        assertTrue(family.expectedCapabilities().isEmpty());
        assertTrue(PatchFamily.CHATS_PAGE.contains(family));
    }

    @Test
    public void hideGalleryCameraTileHasItsOwnOffByDefaultSwitch() {
        PatchFamily family = PatchFamily.HIDE_GALLERY_CAMERA_TILE;
        assertEquals("Hide gallery camera tile", family.patchName);
        assertEquals(Collections.singletonList(Settings.HIDE_GALLERY_CAMERA_TILE), family.switches);
        assertFalse(Settings.HIDE_GALLERY_CAMERA_TILE.defaultValue);
        assertFalse(Settings.HIDE_GALLERY_CAMERA_TILE.rebootApp);
        assertTrue(family.expectedCapabilities().isEmpty());
        assertTrue(PatchFamily.CHATS_PAGE.contains(family));
    }

    @Test
    public void rearCameraFirstHasItsOwnOffByDefaultSwitchThatAppliesAtOnce() {
        PatchFamily family = PatchFamily.REAR_CAMERA_FIRST;
        assertEquals("Start the camera on the rear lens", family.patchName);
        assertEquals(Collections.singletonList(Settings.REAR_CAMERA_FIRST), family.switches);
        assertFalse(Settings.REAR_CAMERA_FIRST.defaultValue);
        assertFalse(Settings.REAR_CAMERA_FIRST.rebootApp);
        assertTrue(family.expectedCapabilities().isEmpty());
        assertTrue(PatchFamily.CHATS_PAGE.contains(family));
    }

    @Test
    public void disableArchivePullHasItsOwnOffByDefaultSwitchThatRestartsTheApp() {
        PatchFamily family = PatchFamily.DISABLE_ARCHIVE_PULL;
        assertEquals("Disable pull to archive", family.patchName);
        assertEquals(Collections.singletonList(Settings.DISABLE_ARCHIVE_PULL), family.switches);
        assertFalse(Settings.DISABLE_ARCHIVE_PULL.defaultValue);
        assertTrue(Settings.DISABLE_ARCHIVE_PULL.rebootApp);
        assertTrue(family.expectedCapabilities().isEmpty());
        assertTrue(PatchFamily.CHATS_PAGE.contains(family));
    }

    @Test
    public void silenceNonContactsHasItsOwnOffByDefaultSwitchThatAppliesAtOnce() {
        PatchFamily family = PatchFamily.SILENCE_NON_CONTACTS;
        assertEquals("Silence people outside your contacts", family.patchName);
        assertEquals(Collections.singletonList(Settings.SILENCE_NON_CONTACTS), family.switches);
        assertFalse(Settings.SILENCE_NON_CONTACTS.defaultValue);
        assertFalse(Settings.SILENCE_NON_CONTACTS.rebootApp);
        assertTrue(family.expectedCapabilities().isEmpty());
        assertTrue(PatchFamily.CHATS_PAGE.contains(family));
    }

    @Test
    public void voiceMusicPlayerHasItsOwnOffByDefaultSwitchThatAppliesAtOnce() {
        PatchFamily family = PatchFamily.VOICE_MUSIC_PLAYER;
        assertEquals("Voice messages in the music player", family.patchName);
        assertEquals(Collections.singletonList(Settings.VOICE_MUSIC_PLAYER), family.switches);
        assertFalse(Settings.VOICE_MUSIC_PLAYER.defaultValue);
        assertFalse(Settings.VOICE_MUSIC_PLAYER.rebootApp);
        assertTrue(family.expectedCapabilities().isEmpty());
        assertTrue(PatchFamily.CHATS_PAGE.contains(family));
    }

    @Test
    public void forwardHideSenderHasItsOwnOffByDefaultSwitchThatAppliesAtOnce() {
        PatchFamily family = PatchFamily.FORWARD_HIDE_SENDER;
        assertEquals("Hide sender names when forwarding", family.patchName);
        assertEquals(Collections.singletonList(Settings.FORWARD_HIDE_SENDER), family.switches);
        assertFalse(Settings.FORWARD_HIDE_SENDER.defaultValue);
        assertFalse(Settings.FORWARD_HIDE_SENDER.rebootApp);
        assertTrue(family.expectedCapabilities().isEmpty());
        assertTrue(PatchFamily.CHATS_PAGE.contains(family));
    }

    @Test
    public void hideFolderCountersHasItsOwnOffByDefaultSwitchThatAppliesAtOnce() {
        PatchFamily family = PatchFamily.HIDE_FOLDER_COUNTERS;
        assertEquals("Hide folder tab counters", family.patchName);
        assertEquals(Collections.singletonList(Settings.HIDE_FOLDER_COUNTERS), family.switches);
        assertFalse(Settings.HIDE_FOLDER_COUNTERS.defaultValue);
        assertFalse(Settings.HIDE_FOLDER_COUNTERS.rebootApp);
        assertTrue(family.expectedCapabilities().isEmpty());
        assertTrue(PatchFamily.CHATS_PAGE.contains(family));
    }

    @Test
    public void reactionEffectsOffHasItsOwnOffByDefaultSwitchThatAppliesAtOnce() {
        PatchFamily family = PatchFamily.REACTION_EFFECTS_OFF;
        assertEquals("Turn off reaction effects", family.patchName);
        assertEquals(Collections.singletonList(Settings.REACTION_EFFECTS_OFF), family.switches);
        assertFalse(Settings.REACTION_EFFECTS_OFF.defaultValue);
        assertFalse(Settings.REACTION_EFFECTS_OFF.rebootApp);
        assertTrue(family.expectedCapabilities().isEmpty());
        assertTrue(PatchFamily.CHATS_PAGE.contains(family));
    }

    @Test
    public void noHapticsHasItsOwnOffByDefaultSwitchThatAppliesAtOnce() {
        PatchFamily family = PatchFamily.NO_HAPTICS;
        assertEquals("Turn off haptic feedback", family.patchName);
        assertEquals(Collections.singletonList(Settings.NO_HAPTICS), family.switches);
        assertFalse(Settings.NO_HAPTICS.defaultValue);
        assertFalse(Settings.NO_HAPTICS.rebootApp);
        assertTrue(family.expectedCapabilities().isEmpty());
        assertTrue(PatchFamily.CHATS_PAGE.contains(family));
    }

    @Test
    public void voiceOneAtATimeHasItsOwnOffByDefaultSwitchThatAppliesAtOnce() {
        PatchFamily family = PatchFamily.VOICE_ONE_AT_A_TIME;
        assertEquals("Play voice messages one at a time", family.patchName);
        assertEquals(Collections.singletonList(Settings.VOICE_ONE_AT_A_TIME), family.switches);
        assertFalse(Settings.VOICE_ONE_AT_A_TIME.defaultValue);
        assertFalse(Settings.VOICE_ONE_AT_A_TIME.rebootApp);
        assertTrue(family.expectedCapabilities().isEmpty());
        assertTrue(PatchFamily.CHATS_PAGE.contains(family));
    }

    @Test
    public void allowChatBlurHasItsOwnOffByDefaultSwitchThatAppliesAtOnce() {
        PatchFamily family = PatchFamily.ALLOW_CHAT_BLUR;
        assertEquals("Allow chat blur on slower phones", family.patchName);
        assertEquals(Collections.singletonList(Settings.ALLOW_CHAT_BLUR), family.switches);
        assertFalse(Settings.ALLOW_CHAT_BLUR.defaultValue);
        assertFalse(Settings.ALLOW_CHAT_BLUR.rebootApp);
        assertTrue(family.expectedCapabilities().isEmpty());
        assertTrue(PatchFamily.CHATS_PAGE.contains(family));
    }

    @Test
    public void messageSecondsHasItsOwnOffByDefaultSwitchThatAppliesAtOnce() {
        PatchFamily family = PatchFamily.MESSAGE_SECONDS;
        assertEquals("Message times with seconds", family.patchName);
        assertEquals(Collections.singletonList(Settings.MESSAGE_SECONDS), family.switches);
        assertFalse(Settings.MESSAGE_SECONDS.defaultValue);
        assertFalse(Settings.MESSAGE_SECONDS.rebootApp);
        assertTrue(family.expectedCapabilities().isEmpty());
        assertTrue(PatchFamily.CHATS_PAGE.contains(family));
    }

    @Test
    public void hidePhoneNumberHasItsOwnOffByDefaultSwitchThatAppliesAtOnce() {
        PatchFamily family = PatchFamily.HIDE_PHONE_NUMBER;
        assertEquals("Hide phone number", family.patchName);
        assertEquals(Collections.singletonList(Settings.HIDE_PHONE_NUMBER), family.switches);
        assertFalse(Settings.HIDE_PHONE_NUMBER.defaultValue);
        assertFalse(Settings.HIDE_PHONE_NUMBER.rebootApp);
        assertTrue(family.expectedCapabilities().isEmpty());
        assertTrue(PatchFamily.CHATS_PAGE.contains(family));
    }

    @Test
    public void swipeBackOnProfilesHasItsOwnOffByDefaultSwitchThatAppliesAtOnce() {
        PatchFamily family = PatchFamily.SWIPE_BACK_ON_PROFILES;
        assertEquals("Swipe back on profiles", family.patchName);
        assertEquals(Collections.singletonList(Settings.SWIPE_BACK_ON_PROFILES), family.switches);
        assertFalse(Settings.SWIPE_BACK_ON_PROFILES.defaultValue);
        assertFalse(Settings.SWIPE_BACK_ON_PROFILES.rebootApp);
        assertTrue(family.expectedCapabilities().isEmpty());
        assertTrue(PatchFamily.CHATS_PAGE.contains(family));
    }

    @Test
    public void keepVideosMutedHasItsOwnOffByDefaultSwitchThatAppliesAtOnce() {
        PatchFamily family = PatchFamily.KEEP_VIDEOS_MUTED;
        assertEquals("Keep videos muted on volume keys", family.patchName);
        assertEquals(Collections.singletonList(Settings.KEEP_VIDEOS_MUTED), family.switches);
        assertFalse(Settings.KEEP_VIDEOS_MUTED.defaultValue);
        assertFalse(Settings.KEEP_VIDEOS_MUTED.rebootApp);
        assertTrue(family.expectedCapabilities().isEmpty());
        assertTrue(PatchFamily.CHATS_PAGE.contains(family));
    }

    @Test
    public void keyboardOnScrollHasItsOwnOffByDefaultSwitchThatAppliesAtOnce() {
        PatchFamily family = PatchFamily.HIDE_KEYBOARD_ON_SCROLL;
        assertEquals("Hide keyboard on scroll", family.patchName);
        assertEquals(Collections.singletonList(Settings.HIDE_KEYBOARD_ON_SCROLL), family.switches);
        assertFalse(Settings.HIDE_KEYBOARD_ON_SCROLL.defaultValue);
        assertFalse(Settings.HIDE_KEYBOARD_ON_SCROLL.rebootApp);
        assertTrue(family.expectedCapabilities().isEmpty());
        assertTrue(PatchFamily.CHATS_PAGE.contains(family));
    }

    @Test
    public void revealSpoilersHasItsOwnOffByDefaultSwitchThatAppliesAtOnce() {
        PatchFamily family = PatchFamily.REVEAL_SPOILERS;
        assertEquals("Reveal spoilers", family.patchName);
        assertEquals(Collections.singletonList(Settings.REVEAL_SPOILERS), family.switches);
        assertFalse(Settings.REVEAL_SPOILERS.defaultValue);
        assertFalse(Settings.REVEAL_SPOILERS.rebootApp);
        assertTrue(family.expectedCapabilities().isEmpty());
        assertTrue(PatchFamily.CHATS_PAGE.contains(family));
    }

    @Test
    public void exactNumbersHasItsOwnOffByDefaultSwitchThatAppliesAtOnce() {
        PatchFamily family = PatchFamily.EXACT_NUMBERS;
        assertEquals("Exact numbers", family.patchName);
        assertEquals(Collections.singletonList(Settings.EXACT_NUMBERS), family.switches);
        assertFalse(Settings.EXACT_NUMBERS.defaultValue);
        assertFalse(Settings.EXACT_NUMBERS.rebootApp);
        assertTrue(family.expectedCapabilities().isEmpty());
        assertTrue(PatchFamily.CHATS_PAGE.contains(family));
    }

    @Test
    public void everySwitchBelongsToExactlyOneFamily() {
        Map<BooleanSetting, String> owners = new HashMap<>();
        for (PatchFamily family : PatchFamily.values()) {
            for (BooleanSetting setting : family.switches) {
                String earlier = owners.put(setting, family.name());
                assertNull(setting.key + " belongs to " + earlier + " and to " + family, earlier);
            }
        }
        for (BooleanSetting setting : PatchFamily.ENTRY_SWITCHES) {
            String earlier = owners.put(setting, "the settings entry");
            assertNull(setting.key + " belongs to " + earlier + " and to the settings entry", earlier);
        }
        assertEquals(new HashSet<>(PausedHooksTest.settingsSwitches()), owners.keySet());
        assertTrue("the release check is the settings entry's own",
                PatchFamily.ENTRY_SWITCHES.contains(Settings.CHECK_FOR_RELEASES));
    }

    @Test
    public void everyStatusFlagBelongsToExactlyOneFamily() {
        Set<String> flags = new TreeSet<>();
        for (Method method : SettingsStatus.class.getDeclaredMethods()) {
            int modifiers = method.getModifiers();
            if (Modifier.isPublic(modifiers) && Modifier.isStatic(modifiers)
                    && method.getReturnType() == boolean.class && method.getParameterCount() == 0) {
                flags.add(method.getName());
            }
        }
        Set<String> named = new TreeSet<>();
        for (PatchFamily family : PatchFamily.values()) {
            assertTrue("two families share " + family.statusMethod, named.add(family.statusMethod));
            for (PatchFamily.Capability capability : family.expectedCapabilities()) {
                assertEquals("a target belongs to the wrong family", family, capability.family);
                assertTrue("two targets share " + capability.statusMethod, named.add(capability.statusMethod));
            }
        }
        assertEquals(flags, named);
    }

    @Test
    public void capabilityListsAreImmutableBuildFactsIndependentOfSavedSwitchesAndPause() {
        PatchFamily.inBuildForTests = EnumSet.allOf(PatchFamily.class);
        PatchFamily.capabilitiesForTests = EnumSet.of(PatchFamily.Capability.CHANNEL_ADS,
                PatchFamily.Capability.SEARCH_ADS, PatchFamily.Capability.READ_METRICS);
        Set<PatchFamily.Capability> expectedAds = EnumSet.of(PatchFamily.Capability.CHANNEL_ADS,
                PatchFamily.Capability.VIDEO_ADS, PatchFamily.Capability.SEARCH_ADS);
        Set<PatchFamily.Capability> installedAds = EnumSet.of(PatchFamily.Capability.CHANNEL_ADS,
                PatchFamily.Capability.SEARCH_ADS);
        assertEquals(expectedAds, PatchFamily.HIDE_ADS.expectedCapabilities());
        assertEquals(installedAds, PatchFamily.HIDE_ADS.installedCapabilities());
        assertEquals(EnumSet.of(PatchFamily.Capability.DEVICE_STATS, PatchFamily.Capability.READ_METRICS,
                        PatchFamily.Capability.PREMIUM_PROMO_SHOW, PatchFamily.Capability.PREMIUM_PROMO_TAP,
                        PatchFamily.Capability.PREMIUM_PROMO_ACCEPT, PatchFamily.Capability.PREMIUM_PROMO_FAIL,
                        PatchFamily.Capability.CRASH_REPORTS, PatchFamily.Capability.SESSION_REPORTS),
                PatchFamily.DISABLE_ANALYTICS.expectedCapabilities());
        assertEquals(EnumSet.of(PatchFamily.Capability.READ_METRICS),
                PatchFamily.DISABLE_ANALYTICS.installedCapabilities());
        assertTrue(PatchFamily.DISABLE_UPDATE_CHECKS.expectedCapabilities().isEmpty());
        assertEquals(EnumSet.of(PatchFamily.Capability.FIREBASE_CERTIFICATE_HEADER, PatchFamily.Capability.FIREBASE_LOCAL_STATUS),
                PatchFamily.REPAIR_FIREBASE_PUSH.expectedCapabilities());
        assertThrows(UnsupportedOperationException.class, () -> PatchFamily.HIDE_ADS.expectedCapabilities().clear());
        assertThrows(UnsupportedOperationException.class, () -> PatchFamily.HIDE_ADS.installedCapabilities().clear());

        Settings.HIDE_ADS.save(false);
        Settings.DISABLE_ANALYTICS.save(false);
        PauseForTests.pause(HushTelegramPause.Reason.SWITCH);
        assertEquals(installedAds, PatchFamily.HIDE_ADS.installedCapabilities());
        assertEquals(EnumSet.of(PatchFamily.Capability.READ_METRICS),
                PatchFamily.DISABLE_ANALYTICS.installedCapabilities());
        assertEquals("capabilities must never become saved settings", 0, SettingsStatus.class.getDeclaredFields().length);
    }

    @Test
    public void contactsBlockHasItsOwnOffByDefaultSwitchApartFromTheContactsPrompt() {
        PatchFamily family = PatchFamily.HIDE_CONTACTS_BLOCK;
        assertEquals("Hide contacts on Telegram", family.patchName);
        assertEquals(Collections.singletonList(Settings.HIDE_CONTACTS_BLOCK), family.switches);
        assertFalse(Settings.HIDE_CONTACTS_BLOCK.defaultValue);
        assertTrue(family.expectedCapabilities().isEmpty());
        assertFalse(PatchFamily.QUIET_CONTACTS_NAG.switches.contains(Settings.HIDE_CONTACTS_BLOCK));
        assertTrue(PatchFamily.CHATS_PAGE.contains(family));
    }

    @Test
    public void translateBarHasItsOwnOffByDefaultSwitchThatAppliesAtOnce() {
        PatchFamily family = PatchFamily.HIDE_TRANSLATE_BAR;
        assertEquals("Hide translate bar", family.patchName);
        assertEquals(Collections.singletonList(Settings.HIDE_TRANSLATE_BAR), family.switches);
        assertFalse(Settings.HIDE_TRANSLATE_BAR.defaultValue);
        assertFalse(Settings.HIDE_TRANSLATE_BAR.rebootApp);
        assertTrue(family.expectedCapabilities().isEmpty());
        assertTrue(PatchFamily.CHATS_PAGE.contains(family));
    }

    @Test
    public void amoledBlackHasItsOwnOffByDefaultSwitchThatWaitsForARestart() {
        PatchFamily family = PatchFamily.AMOLED_BLACK;
        assertEquals("AMOLED black", family.patchName);
        assertEquals(Collections.singletonList(Settings.AMOLED_BLACK), family.switches);
        assertFalse(Settings.AMOLED_BLACK.defaultValue);
        assertTrue(Settings.AMOLED_BLACK.rebootApp);
        assertTrue(family.expectedCapabilities().isEmpty());
        assertTrue(PatchFamily.CHATS_PAGE.contains(family));
    }

    @Test
    public void systemFontHasItsOwnOffByDefaultSwitchThatWaitsForARestart() {
        PatchFamily family = PatchFamily.USE_SYSTEM_FONT;
        assertEquals("Use system font", family.patchName);
        assertEquals(Collections.singletonList(Settings.USE_SYSTEM_FONT), family.switches);
        assertFalse(Settings.USE_SYSTEM_FONT.defaultValue);
        assertTrue(Settings.USE_SYSTEM_FONT.rebootApp);
        assertTrue(family.expectedCapabilities().isEmpty());
        assertTrue(PatchFamily.CHATS_PAGE.contains(family));
    }

    @Test
    public void greetingStickersHaveTheirOwnOffByDefaultSwitch() {
        PatchFamily family = PatchFamily.HIDE_GREETING_STICKERS;
        assertEquals("Hide greeting stickers", family.patchName);
        assertEquals(Collections.singletonList(Settings.HIDE_GREETING_STICKERS), family.switches);
        assertFalse(Settings.HIDE_GREETING_STICKERS.defaultValue);
        assertTrue(family.expectedCapabilities().isEmpty());
        assertTrue(PatchFamily.CHATS_PAGE.contains(family));
    }

    @Test
    public void localControlsHaveIndependentOffByDefaultSwitchesAndExactCoverageWhilePaused() {
        Map<PatchFamily, Set<PatchFamily.Capability>> expected = new LinkedHashMap<>();
        expected.put(PatchFamily.NORMAL_PASTE, EnumSet.of(PatchFamily.Capability.COMPOSE_PLAIN_PASTE, PatchFamily.Capability.CAPTION_PLAIN_PASTE));
        expected.put(PatchFamily.SHOW_LOCAL_IDS, EnumSet.of(PatchFamily.Capability.PROFILE_LOCAL_IDS));
        expected.put(PatchFamily.DISABLE_DOUBLE_TAP_REACTIONS, EnumSet.of(PatchFamily.Capability.CHAT_DOUBLE_TAP_REACTION, PatchFamily.Capability.PREVIEW_DOUBLE_TAP_REACTION));
        PatchFamily.inBuildForTests = expected.keySet();
        for (Map.Entry<PatchFamily, Set<PatchFamily.Capability>> entry : expected.entrySet()) {
            PatchFamily family = entry.getKey();
            assertEquals(entry.getValue(), family.expectedCapabilities());
            // Show user and chat IDs carries a second switch, for the profile's data center.
            assertEquals(family == PatchFamily.SHOW_LOCAL_IDS ? 2 : 1, family.switches.size());
            for (BooleanSetting setting : family.switches) assertFalse(setting.key, setting.defaultValue);
            for (PatchFamily.Capability only : entry.getValue()) {
                PatchFamily.capabilitiesForTests = EnumSet.of(only);
                assertEquals(EnumSet.of(only), family.installedCapabilities());
                family.switches.get(0).save(true);
                PauseForTests.pause(HushTelegramPause.Reason.SWITCH);
                assertEquals(EnumSet.of(only), family.installedCapabilities());
                assertTrue(family.switches.get(0).savedValue());
                assertTrue(PatchFamily.reportLines(expected.keySet(), true).stream().anyMatch(line -> line.startsWith(family.patchName + " coverage: " + only.label)));
                PauseForTests.resume();
                family.switches.get(0).save(false);
            }
        }
    }

    /** The names are Morphe Manager's, so a report and the patch list say the same thing. */
    @Test
    public void everyRuntimePatchButTheSettingsEntryIsAFamily() throws Exception {
        JSONArray patches = new JSONObject(new String(Files.readAllBytes(patchesList().toPath()),
                StandardCharsets.UTF_8)).getJSONArray("patches");
        Set<String> listed = new TreeSet<>();
        for (int i = 0; i < patches.length(); i++) {
            JSONObject patch = patches.getJSONObject(i);
            String name = patch.getString("name");
            if ("Use registered Telegram API credentials".equals(name) || "Use registered Maps API key".equals(name)) {
                assertFalse("patch-time credentials must be optional", patch.getBoolean("use"));
                JSONArray options = patch.getJSONArray("options");
                Set<String> keys = new TreeSet<>();
                for (int option = 0; option < options.length(); option++) {
                    JSONObject input = options.getJSONObject(option);
                    assertFalse(input.getBoolean("required"));
                    assertTrue(input.isNull("default"));
                    keys.add(input.getString("key"));
                }
                Set<String> expected = "Use registered Telegram API credentials".equals(name)
                        ? new TreeSet<>(Arrays.asList("apiId", "apiHash"))
                        : Collections.singleton("apiKey");
                assertEquals(expected, keys);
                assertEquals(expected.size(), options.length());
            } else listed.add(patch.getString("name"));
        }
        assertTrue("the settings entry left the patch list", listed.remove("HushTelegram settings"));

        Set<String> families = new TreeSet<>();
        for (PatchFamily family : PatchFamily.values()) families.add(family.patchName);
        assertEquals(listed, families);
    }

    @Test
    public void aPatchWithNoSwitchSaysWhatOfItStaysIn() {
        for (PatchFamily family : PatchFamily.values()) {
            if (family.switches.isEmpty()) {
                assertNotNull(family.patchName + " has no switch, so Pause can't reach it", family.staysWhilePaused);
            }
        }
    }

    /**
     * Every family in this build has a switch, so none has a {@link PatchFamily#staysWhilePaused}
     * of its own, and a real build's summary is always null (asserted first, below). The rest of
     * this test substitutes one through {@link PatchFamily#staysWhilePausedForTests} to keep the
     * sentence-building logic, including its pluralization, covered.
     */
    @Test
    public void theStaysRowNamesWhatPauseCantReach() {
        assertNull("a build of switches alone has nothing that stays in",
                PatchFamily.staysWhilePausedSummary(EnumSet.of(PatchFamily.HIDE_ADS,
                        PatchFamily.DISABLE_ANALYTICS, PatchFamily.DISABLE_UPDATE_CHECKS)));

        // Each item names the patch Morphe Manager lists it under, so the reader knows which one
        // to leave out.
        PatchFamily.staysWhilePausedForTests = Collections.singletonMap(PatchFamily.HIDE_ADS,
                "the sponsored message cache cleared when you patched");
        assertEquals("The sponsored message cache cleared when you patched (" + L10n.isolate("Hide ads")
                        + "). It was set when you patched, so Pause can't turn it off. To get rid of it, patch again "
                        + "without that patch.",
                PatchFamily.staysWhilePausedSummary(EnumSet.of(PatchFamily.HIDE_ADS)));

        Map<PatchFamily, String> two = new LinkedHashMap<>();
        two.put(PatchFamily.HIDE_ADS, "the sponsored message cache cleared when you patched");
        two.put(PatchFamily.DISABLE_ANALYTICS, "the device stats endpoint rewritten when you patched");
        PatchFamily.staysWhilePausedForTests = two;
        assertEquals("The sponsored message cache cleared when you patched (" + L10n.isolate("Hide ads")
                        + ") and the device stats endpoint rewritten when you patched ("
                        + L10n.isolate("Disable analytics")
                        + "). They were set when you patched, so Pause can't turn them off. To get rid of one, patch "
                        + "again without the patch named in brackets after it.",
                PatchFamily.staysWhilePausedSummary(EnumSet.of(PatchFamily.HIDE_ADS, PatchFamily.DISABLE_ANALYTICS)));

        String everything = PatchFamily.staysWhilePausedSummary(EnumSet.allOf(PatchFamily.class));
        for (Map.Entry<PatchFamily, String> entry : two.entrySet()) {
            assertTrue(entry.getKey().patchName + " is missing from: " + everything,
                    everything.toLowerCase().contains(entry.getValue().toLowerCase()));
            assertTrue(entry.getKey().patchName + " isn't named in: " + everything,
                    everything.contains("(" + L10n.isolate(entry.getKey().patchName) + ")"));
        }
        // DISABLE_UPDATE_CHECKS has no override here, so it contributes nothing of its own.
        assertFalse(everything, everything.contains(L10n.isolate(PatchFamily.DISABLE_UPDATE_CHECKS.patchName)));
    }

    @Test
    public void theReportSaysWhatASwitchRunsAndWhatStaysIn() {
        Set<PatchFamily> build = EnumSet.of(PatchFamily.HIDE_ADS, PatchFamily.DISABLE_ANALYTICS);
        PatchFamily.inBuildForTests = build;
        Settings.DISABLE_ANALYTICS.save(false);

        List<String> running = PatchFamily.reportLines(build, false);
        assertEquals(Arrays.asList(
                "Hide ads: on (hushtelegram_hide_ads=on)",
                "Disable analytics: disabled by its switch (hushtelegram_disable_analytics=off)",
                "not in this build: Hide Stories, Hide recommendations, Hide Premium, gifts and Stars, Hide promotional banners, Hide sponsored proxy channel, Hide popular apps, Hide contacts on Telegram, Hide greeting stickers, Disable chat swipe actions, Disable pull to next channel, Use normal paste, Show user and chat IDs, Disable double-tap reactions, Quiet contacts nag, Holiday look all year, Use system font, AMOLED black, Hide translate bar, Exact numbers, Reveal spoilers, Hide keyboard on scroll, Keep videos muted on volume keys, Swipe back on profiles, Hide phone number, Message times with seconds, Allow chat blur on slower phones, Play voice messages one at a time, Turn off haptic feedback, Turn off reaction effects, Hide folder tab counters, Hide sender names when forwarding, Voice messages in the music player, Silence people outside your contacts, Disable pull to archive, Start the camera on the rear lens, Hide gallery camera tile, Hide time on stickers, Ignore mentions in muted chats, Hide blocked users in groups, Hide Telegram Features and Invite Friends, Add Repeat to the message menu, Keep deleted messages, Ask before sending a sticker, Turn off beta debug logs, Disable call debug upload, Disable draft link previews, Gallery camera on tap, Open links externally, Strip link tracking, Disable update checks, Repair Firebase push registration",
                "Hide ads coverage: channel ads, video ads, search ads",
                "Disable analytics coverage: device statistics reports, channel read metrics, Premium promo views, Premium promo taps, Premium promo accepts, Premium promo failures, Firebase crash reports, Firebase session reports"),
                running);

        // Every family in this build has a switch, but the line still has room, after the switch's
        // own state, for something a patch set that Pause can't reach. staysWhilePausedForTests
        // substitutes one, since no family here needs it for real.
        PatchFamily.staysWhilePausedForTests = Collections.singletonMap(PatchFamily.HIDE_ADS,
                "the sponsored message cache cleared when you patched");
        assertEquals("Hide ads: on (hushtelegram_hide_ads=on); stays in while paused: "
                        + "the sponsored message cache cleared when you patched",
                PatchFamily.reportLines(build, false).get(0));

        List<String> paused = PatchFamily.reportLines(build, true);
        assertEquals("Hide ads: disabled while paused (saved hushtelegram_hide_ads=on); stays in while paused: "
                + "the sponsored message cache cleared when you patched", paused.get(0));
        assertEquals("Disable analytics: disabled while paused (saved hushtelegram_disable_analytics=off)",
                paused.get(1));
        assertEquals(running.get(2), paused.get(2));
        assertEquals("Pause must keep patch-time coverage facts", running.subList(3, 5), paused.subList(3, 5));
    }

    @Test
    public void partialCoverageNamesEveryMissingTargetInTheReportWhileOffAndPaused() {
        Set<PatchFamily> build = EnumSet.of(PatchFamily.HIDE_ADS, PatchFamily.DISABLE_ANALYTICS);
        PatchFamily.inBuildForTests = build;
        PatchFamily.capabilitiesForTests = EnumSet.of(PatchFamily.Capability.CHANNEL_ADS,
                PatchFamily.Capability.READ_METRICS);
        List<String> running = PatchFamily.reportLines(build, false);
        assertTrue(running.toString(), running.contains("Hide ads coverage: channel ads; missing: video ads, search ads"));
        assertTrue(running.toString(), running.contains("Disable analytics coverage: channel read metrics; missing: device statistics reports, Premium promo views, Premium promo taps, Premium promo accepts, Premium promo failures"));
        Settings.HIDE_ADS.save(false);
        Settings.DISABLE_ANALYTICS.save(false);
        List<String> disabled = PatchFamily.reportLines(build, false);
        assertEquals(running.subList(3, 5), disabled.subList(3, 5));
        assertEquals(running.subList(3, 5), PatchFamily.reportLines(build, true).subList(3, 5));

        PatchFamily.capabilitiesForTests = EnumSet.noneOf(PatchFamily.Capability.class);
        List<String> none = PatchFamily.reportLines(build, false);
        assertTrue(none.toString(), none.contains("Hide ads coverage: none; missing: channel ads, video ads, search ads"));
        assertTrue(none.toString(), none.contains("Disable analytics coverage: none; missing: device statistics reports, channel read metrics, Premium promo views, Premium promo taps, Premium promo accepts, Premium promo failures"));
    }

    /** Telegram's regular build has no Firebase reporters, so a build without them is complete, not partial. */
    @Test
    public void firebaseReportersCountOnlyWhereTheBuildCarriesThem() {
        Set<PatchFamily> build = EnumSet.of(PatchFamily.DISABLE_ANALYTICS);
        PatchFamily.inBuildForTests = build;
        Set<PatchFamily.Capability> regular = EnumSet.noneOf(PatchFamily.Capability.class);
        for (PatchFamily.Capability capability : PatchFamily.DISABLE_ANALYTICS.expectedCapabilities()) {
            assertEquals(capability.name(), capability == PatchFamily.Capability.CRASH_REPORTS
                    || capability == PatchFamily.Capability.SESSION_REPORTS, capability.onlyWhereCarried);
            if (!capability.onlyWhereCarried) regular.add(capability);
        }
        for (PatchFamily.Capability capability : PatchFamily.Capability.values()) {
            if (capability.family != PatchFamily.DISABLE_ANALYTICS) assertFalse(capability.name(), capability.onlyWhereCarried);
        }
        PatchFamily.capabilitiesForTests = regular;
        assertEquals("complete", PatchFamily.DISABLE_ANALYTICS.coverageSummary("complete"));
        assertEquals(regular, PatchFamily.DISABLE_ANALYTICS.shownCapabilities());
        assertTrue(PatchFamily.reportLines(build, false).contains("Disable analytics coverage: device statistics reports, channel read metrics, "
                + "Premium promo views, Premium promo taps, Premium promo accepts, Premium promo failures"));

        // One of the two hooked: the other is left out, never called missing.
        Set<PatchFamily.Capability> crashOnly = EnumSet.copyOf(regular);
        crashOnly.add(PatchFamily.Capability.CRASH_REPORTS);
        PatchFamily.capabilitiesForTests = crashOnly;
        assertEquals("complete", PatchFamily.DISABLE_ANALYTICS.coverageSummary("complete"));
        assertTrue(PatchFamily.reportLines(build, true).contains("Disable analytics coverage: device statistics reports, channel read metrics, "
                + "Premium promo views, Premium promo taps, Premium promo accepts, Premium promo failures, Firebase crash reports"));

        // A carried target that's hooked still counts when a regular one is missing.
        Set<PatchFamily.Capability> partial = EnumSet.of(PatchFamily.Capability.READ_METRICS, PatchFamily.Capability.SESSION_REPORTS);
        PatchFamily.capabilitiesForTests = partial;
        String summary = PatchFamily.DISABLE_ANALYTICS.coverageSummary("complete");
        assertTrue(summary, summary.startsWith("This patched app changes "));
        assertTrue(summary, summary.contains("Firebase session reports"));
        assertFalse(summary, summary.contains("Firebase crash reports"));
        assertTrue(PatchFamily.reportLines(build, false).contains("Disable analytics coverage: channel read metrics, Firebase session reports; "
                + "missing: device statistics reports, Premium promo views, Premium promo taps, Premium promo accepts, Premium promo failures"));
    }

    /**
     * A paused export marks the Hook status lines of the families a switch runs. Every family in
     * this build has one, so registerDiagnostics() exempts none of them: each invoked family's line
     * gets the mark. The exemption itself, for a family with no switch, is HookStatus's own and is
     * covered directly in HookStatusTest, since no family here can drive it.
     */
    @Test
    public void aPausedExportMarksEveryFamilyASwitchRuns() {
        HookStatus.clear();
        PatchFamily.registerDiagnostics();
        HookStatus.invoked(FamilyNames.HIDE_ADS);
        HookStatus.invoked(FamilyNames.DISABLE_ANALYTICS);

        List<String> lines = HookStatus.report(" (paused)");
        assertTrue(String.join("\n", lines),
                lines.contains("Hide ads: invoked 1, 0 found, 0 missing (paused)"));
        assertTrue(String.join("\n", lines),
                lines.contains("Disable analytics: invoked 1, 0 found, 0 missing (paused)"));
    }

    /** The section goes through the redactor like every other one, and has to come out whole. */
    @Test
    public void theExportCarriesTheSectionWhole() {
        PatchFamily.inBuildForTests = EnumSet.allOf(PatchFamily.class);
        LogBufferManager.registerReportSection(PatchFamily.REPORT);
        // A paused process always makes a report, so nothing else has to go wrong first.
        PauseForTests.pause(HushTelegramPause.Reason.SWITCH);

        String report = LogBufferManager.buildExportText();
        assertTrue(report, report.contains("\n[PATCHES]\n"));
        assertTrue(report, report.contains("what was set when patching stays in"));
        for (String line : PatchFamily.reportLines(EnumSet.allOf(PatchFamily.class), true)) {
            assertTrue("the export changed or lost \"" + line + "\":\n" + report, report.contains("\n" + line + "\n"));
        }
    }

    /** patches-list.json at the repository root, found from wherever Gradle runs the test. */
    private static File patchesList() {
        for (File dir = new File("").getAbsoluteFile(); dir != null; dir = dir.getParentFile()) {
            File candidate = new File(dir, "patches-list.json");
            if (candidate.isFile()) return candidate;
        }
        throw new AssertionError("no patches-list.json above " + new File("").getAbsolutePath());
    }
}
