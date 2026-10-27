/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import static org.junit.Assert.*;

import android.view.View;
import android.widget.FrameLayout;
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

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class ChannelMuteTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @Before public void reset() { restore(); }
    @After public void restore() {
        PauseForTests.resume();
        SettingReadsForTests.mend(Settings.HIDE_CHANNEL_MUTE);
        Settings.HIDE_CHANNEL_MUTE.resetToDefault();
        ChannelMute.begin();
        HookStatus.clear();
    }

    private static View bar() {
        return new View(RuntimeEnvironment.getApplication());
    }

    private static void update(View bar, boolean mute) {
        ChannelMute.begin();
        if (mute) ChannelMute.muteLabelled();
        ChannelMute.finish(bar);
    }

    @Test public void offByDefaultTheBarStays() {
        assertFalse(Settings.HIDE_CHANNEL_MUTE.get());
        View bar = bar();
        update(bar, true);
        assertEquals(View.VISIBLE, bar.getVisibility());
        assertEquals(View.VISIBLE, ChannelMute.visibility(bar, View.VISIBLE));
        assertTrue(String.join("\n", HookStatus.report()).contains(FamilyNames.HIDE_CHANNEL_BUTTONS));
    }

    @Test public void onAMuteBarGoesAndStaysGoneWhenTelegramShowsItAgain() {
        Settings.HIDE_CHANNEL_MUTE.save(true);
        View bar = bar();
        update(bar, true);
        assertEquals(View.GONE, bar.getVisibility());
        assertEquals(View.GONE, ChannelMute.visibility(bar, View.VISIBLE));
        assertEquals(View.GONE, ChannelMute.visibility(bar, View.GONE));
        assertTrue(String.join("\n", HookStatus.report()).contains("channel Mute button hidden"));
    }

    @Test public void anyOtherStateKeepsTheBarAndLetsAGoneBarComeBack() {
        Settings.HIDE_CHANNEL_MUTE.save(true);
        View bar = bar();
        update(bar, false);
        assertEquals(View.VISIBLE, bar.getVisibility());
        update(bar, true);
        assertEquals(View.GONE, bar.getVisibility());
        // The same chat screen now shows Join: Telegram asks for the bar before the update ends, the
        // hold keeps it off until then, and the update gives back what was asked.
        assertEquals(View.GONE, ChannelMute.visibility(bar, View.VISIBLE));
        update(bar, false);
        assertEquals(View.VISIBLE, bar.getVisibility());
        assertEquals(View.VISIBLE, ChannelMute.visibility(bar, View.VISIBLE));
        assertEquals(View.INVISIBLE, ChannelMute.visibility(bar, View.INVISIBLE));
    }

    @Test public void aBarTelegramHidItselfComesBackTheSameWay() {
        Settings.HIDE_CHANNEL_MUTE.save(true);
        View bar = bar();
        bar.setVisibility(View.INVISIBLE);
        update(bar, true);
        assertEquals(View.GONE, bar.getVisibility());
        update(bar, false);
        assertEquals(View.INVISIBLE, bar.getVisibility());
    }

    @Test public void aLabelFromEarlierDoesNotLeakIntoTheNextUpdate() {
        Settings.HIDE_CHANNEL_MUTE.save(true);
        View first = bar();
        ChannelMute.begin();
        ChannelMute.muteLabelled();
        // The update returned early and never reached finish. The next one starts clean.
        View second = bar();
        update(second, false);
        assertEquals(View.VISIBLE, second.getVisibility());
        assertEquals(View.VISIBLE, first.getVisibility());
    }

    @Test public void theBubbleBehindATakenOffBarGoesWithIt() {
        Settings.HIDE_CHANNEL_MUTE.save(true);
        FrameLayout holder = new FrameLayout(RuntimeEnvironment.getApplication());
        FrameLayout island = new FrameLayout(RuntimeEnvironment.getApplication());
        holder.addView(island);
        View bar = bar();
        island.addView(bar);
        FrameLayout otherChat = new FrameLayout(RuntimeEnvironment.getApplication());
        assertTrue(ChannelMute.bubble(holder, 1));
        update(bar, true);
        assertFalse(ChannelMute.bubble(holder, 1));
        assertFalse(ChannelMute.bubble(holder, 0));
        assertTrue("another chat screen keeps its bubble", ChannelMute.bubble(otherChat, 1));
        Settings.HIDE_CHANNEL_MUTE.save(false);
        assertTrue(ChannelMute.bubble(holder, 1));
        Settings.HIDE_CHANNEL_MUTE.save(true);
        update(bar, false);
        assertTrue("a bar given back brings the bubble back", ChannelMute.bubble(holder, 1));
        assertTrue(ChannelMute.bubble(null, 1));
    }

    @Test public void turningTheSwitchOffBringsAHeldBarBack() {
        Settings.HIDE_CHANNEL_MUTE.save(true);
        View bar = bar();
        update(bar, true);
        Settings.HIDE_CHANNEL_MUTE.save(false);
        assertEquals(View.VISIBLE, ChannelMute.visibility(bar, View.VISIBLE));
    }

    @Test public void aMissingBarOrANonViewIsLeftAlone() {
        Settings.HIDE_CHANNEL_MUTE.save(true);
        ChannelMute.begin();
        ChannelMute.muteLabelled();
        ChannelMute.finish(null);
        ChannelMute.begin();
        ChannelMute.muteLabelled();
        ChannelMute.finish(new Object());
        assertEquals(View.VISIBLE, ChannelMute.visibility(null, View.VISIBLE));
    }

    @Test public void pausingAnEarlyStartOrAnUnreadableSwitchKeepsTheBar() {
        Settings.HIDE_CHANNEL_MUTE.save(true);
        for (HushTelegramPause.Reason reason : HushTelegramPause.Reason.values()) {
            if (reason == HushTelegramPause.Reason.NONE) continue;
            PauseForTests.pause(reason);
            View bar = bar();
            update(bar, true);
            assertEquals(reason.name(), View.VISIBLE, bar.getVisibility());
            PauseForTests.resume();
        }
        SettingsContextRule.withoutContext(() -> assertFalse(ChannelMute.on()));
        SettingReadsForTests.breakReads(Settings.HIDE_CHANNEL_MUTE);
        View bar = bar();
        update(bar, true);
        assertEquals(View.VISIBLE, bar.getVisibility());
        assertFalse(HookStatus.missing(FamilyNames.HIDE_CHANNEL_BUTTONS).isEmpty());
    }
}
