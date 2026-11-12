/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import java.util.ArrayList;
import java.util.Collections;

import app.hushtelegram.extension.shared.SettingsContextRule;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.shared.settings.HushTelegramPause;
import app.hushtelegram.extension.shared.settings.PauseForTests;
import app.hushtelegram.extension.shared.settings.SettingReadsForTests;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.Settings;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class ChannelRestrictionsTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    /** What Telegram hands over for a channel blocked for copyright: one reason. */
    private static final ArrayList<String> COPYRIGHT = new ArrayList<>(Collections.singletonList("copyright"));

    @Before public void setUp() {
        Settings.OPEN_RESTRICTED_CHATS.resetToDefault();
        HookStatus.clear();
    }

    @After public void tearDown() {
        PauseForTests.resume();
        SettingReadsForTests.mend(Settings.OPEN_RESTRICTED_CHATS);
        Settings.OPEN_RESTRICTED_CHATS.resetToDefault();
        HookStatus.clear();
    }

    @Test public void offByDefaultSoRestrictedChannelsStayClosed() {
        assertFalse(Settings.OPEN_RESTRICTED_CHATS.get());
        assertFalse(ChannelRestrictions.ignoreRestrictionReason(COPYRIGHT));
    }

    @Test public void switchedOnEveryRestrictionReasonIsIgnoredAndCounted() {
        Settings.OPEN_RESTRICTED_CHATS.save(true);
        assertTrue(ChannelRestrictions.ignoreRestrictionReason(COPYRIGHT));
        assertTrue(ChannelRestrictions.ignoreRestrictionReason(COPYRIGHT));
        String report = String.join("\n", HookStatus.report());
        assertTrue(report, report.contains("restriction reason ignored 2"));
    }

    @Test public void anOrdinaryChatGoesToTelegramsOwnAnswerUncounted() {
        Settings.OPEN_RESTRICTED_CHATS.save(true);
        assertFalse(ChannelRestrictions.ignoreRestrictionReason(new ArrayList<>()));
        assertFalse(ChannelRestrictions.ignoreRestrictionReason(null));
        String report = String.join(", ", HookStatus.report());
        assertFalse(report, report.contains("restriction reason ignored"));
    }

    @Test public void theForwardingSwitchAloneLeavesRestrictedChannelsClosed() {
        Settings.BYPASS_CHANNEL_RESTRICTIONS.save(true);
        try {
            assertFalse(ChannelRestrictions.ignoreRestrictionReason(COPYRIGHT));
        } finally {
            Settings.BYPASS_CHANNEL_RESTRICTIONS.resetToDefault();
        }
    }

    @Test public void everyPauseReasonKeepsRestrictedChannelsClosed() {
        Settings.OPEN_RESTRICTED_CHATS.save(true);
        for (HushTelegramPause.Reason reason : HushTelegramPause.Reason.values()) {
            if (reason == HushTelegramPause.Reason.NONE) continue;
            PauseForTests.pause(reason);
            assertFalse(reason.name(), ChannelRestrictions.ignoreRestrictionReason(COPYRIGHT));
            PauseForTests.resume();
        }
        assertTrue(ChannelRestrictions.ignoreRestrictionReason(COPYRIGHT));
    }

    @Test public void unavailableSettingsKeepRestrictedChannelsClosed() {
        Settings.OPEN_RESTRICTED_CHATS.save(true);
        SettingsContextRule.withoutContext(() -> assertFalse(ChannelRestrictions.ignoreRestrictionReason(COPYRIGHT)));
    }

    @Test public void aProtectedStoryOpensUpWithTheForwardingSwitchAndCountsEach() {
        assertEquals("off by default the story stays protected", 0, ChannelRestrictions.storyAllowed(0));
        Settings.BYPASS_CHANNEL_RESTRICTIONS.save(true);
        try {
            assertEquals(1, ChannelRestrictions.storyAllowed(0));
            assertEquals(1, ChannelRestrictions.storyAllowed(0));
            assertEquals("an open story goes as Telegram says", 1, ChannelRestrictions.storyAllowed(1));
            String report = String.join("\n", HookStatus.report());
            assertTrue(report, report.contains("story restriction bypassed 2"));
            for (HushTelegramPause.Reason reason : HushTelegramPause.Reason.values()) {
                if (reason == HushTelegramPause.Reason.NONE) continue;
                PauseForTests.pause(reason);
                assertEquals(reason.name(), 0, ChannelRestrictions.storyAllowed(0));
                PauseForTests.resume();
            }
            SettingsContextRule.withoutContext(() -> assertEquals(0, ChannelRestrictions.storyAllowed(0)));
        } finally {
            Settings.BYPASS_CHANNEL_RESTRICTIONS.resetToDefault();
        }
    }

    @Test public void unreadableSettingFailsClosedAndReportsItsStateFailure() {
        Settings.OPEN_RESTRICTED_CHATS.save(true);
        SettingReadsForTests.breakReads(Settings.OPEN_RESTRICTED_CHATS);
        assertFalse(ChannelRestrictions.ignoreRestrictionReason(COPYRIGHT));
        assertEquals(Collections.singletonList("a working 'switch read' hook (it threw java.lang.NullPointerException)"),
                HookStatus.missing(FamilyNames.BYPASS_CHANNEL_RESTRICTIONS));
    }
}
