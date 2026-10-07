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
public class ForumTopicPullTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @Before public void setUp() {
        Settings.DISABLE_TOPIC_PULL.resetToDefault();
        Settings.DISABLE_CHANNEL_PULL.resetToDefault();
        HookStatus.clear();
    }

    @After public void tearDown() {
        PauseForTests.resume();
        SettingReadsForTests.mend(Settings.DISABLE_TOPIC_PULL);
        Settings.DISABLE_TOPIC_PULL.resetToDefault();
        Settings.DISABLE_CHANNEL_PULL.resetToDefault();
        HookStatus.clear();
    }

    @Test public void offByDefaultKeepsTopicPullAndReleaseStock() {
        assertFalse(Settings.DISABLE_TOPIC_PULL.get());
        stock();
        assertEquals(Collections.singletonList("Disable pull to next channel: invoked 2, 0 found, 0 missing"),
                HookStatus.report());
    }

    @Test public void onStopsTopicPullAndRelease() {
        Settings.DISABLE_TOPIC_PULL.save(true);
        assertTrue(ForumTopicPull.stopTopicPull());
        assertTrue(ForumTopicPull.keepTopicStill());
        assertEquals(Collections.singletonList("Disable pull to next channel: invoked 2, 0 found, 0 missing. Counted: topic bottom pull stopped 1, topic pull release stopped 1"),
                HookStatus.report());
    }

    @Test public void eachSwitchAnswersOnlyForItsOwnPull() {
        for (boolean channel : new boolean[]{false, true}) for (boolean topic : new boolean[]{false, true}) {
            Settings.DISABLE_CHANNEL_PULL.save(channel);
            Settings.DISABLE_TOPIC_PULL.save(topic);
            assertEquals(channel, ChannelPull.stopBottomPull());
            assertEquals(channel, ChannelPull.keepChannelStill());
            assertEquals(topic, ForumTopicPull.stopTopicPull());
            assertEquals(topic, ForumTopicPull.keepTopicStill());
        }
    }

    @Test public void switchingDuringADragAnswersTheRelease() {
        assertFalse(ForumTopicPull.stopTopicPull());
        Settings.DISABLE_TOPIC_PULL.save(true);
        assertTrue(ForumTopicPull.keepTopicStill());
        Settings.DISABLE_TOPIC_PULL.save(false);
        assertFalse(ForumTopicPull.keepTopicStill());
    }

    @Test public void everyPauseReasonRestoresStockAndKeepsTheSavedSwitch() {
        Settings.DISABLE_TOPIC_PULL.save(true);
        for (HushTelegramPause.Reason reason : HushTelegramPause.Reason.values()) {
            if (reason == HushTelegramPause.Reason.NONE) continue;
            PauseForTests.pause(reason);
            stock();
            assertTrue(Settings.DISABLE_TOPIC_PULL.savedValue());
            PauseForTests.resume();
        }
        assertTrue(ForumTopicPull.stopTopicPull());
        assertTrue(ForumTopicPull.keepTopicStill());
    }

    @Test public void unavailableSettingsPreserveStock() {
        Settings.DISABLE_TOPIC_PULL.save(true);
        SettingsContextRule.withoutContext(ForumTopicPullTest::stock);
    }

    @Test public void unreadableSettingFailsOpenAndReportsTheReadFailure() {
        Settings.DISABLE_TOPIC_PULL.save(true);
        SettingReadsForTests.breakReads(Settings.DISABLE_TOPIC_PULL);
        stock();
        assertEquals(Collections.singletonList("a working 'topic switch read' hook (it threw java.lang.NullPointerException)"),
                HookStatus.missing(FamilyNames.DISABLE_CHANNEL_PULL));
    }

    private static void stock() {
        assertFalse(ForumTopicPull.stopTopicPull());
        assertFalse(ForumTopicPull.keepTopicStill());
    }
}
