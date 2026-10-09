/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import static org.junit.Assert.*;

import android.app.Activity;
import android.app.Dialog;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import app.hushtelegram.extension.shared.SettingsContextRule;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.shared.settings.BooleanSetting;
import app.hushtelegram.extension.shared.settings.HushTelegramPause;
import app.hushtelegram.extension.shared.settings.PauseForTests;
import app.hushtelegram.extension.shared.settings.SettingReadsForTests;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.Settings;
import java.util.Arrays;
import java.util.List;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicInteger;
import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;
import org.robolectric.shadows.ShadowDialog;
import org.robolectric.shadows.ShadowLooper;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class SendConfirmTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    private static final List<BooleanSetting> SWITCHES = Arrays.asList(Settings.ASK_BEFORE_STICKER, Settings.ASK_BEFORE_GIF,
            Settings.ASK_BEFORE_VOICE_VIDEO, Settings.ASK_BEFORE_CALL);

    @Before public void reset() { restore(); }
    @After public void restore() {
        PauseForTests.resume();
        for (BooleanSetting setting : SWITCHES) {
            SettingReadsForTests.mend(setting);
            setting.resetToDefault();
        }
        HookStatus.clear();
    }

    private static boolean sticker(Object view) {
        return SendConfirm.sticker(view, null, null, null, null, false, true, 0, 0);
    }

    /** The first clickable text with this label in the dialog. */
    private static TextView button(View root, String text) {
        if (root instanceof TextView && root.isClickable() && text.contentEquals(((TextView) root).getText())) return (TextView) root;
        if (root instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) root;
            for (int i = 0; i < group.getChildCount(); i++) {
                TextView found = button(group.getChildAt(i), text);
                if (found != null) return found;
            }
        }
        return null;
    }

    private static Activity window() {
        return Robolectric.buildActivity(Activity.class).setup().get();
    }

    @Test public void offByDefaultEveryHookLetsTelegramGoOn() {
        for (BooleanSetting setting : SWITCHES) assertFalse(setting.key, setting.get());
        Activity window = window();
        View view = new View(window);
        assertTrue(sticker(view));
        assertTrue(SendConfirm.gif(new Object(), view, null, null, null, true, 0, 0, null, false));
        assertTrue(SendConfirm.voice(new Object(), 1, true, 0, false, 0L));
        assertTrue(SendConfirm.video(new Object(), 1, true, 0, 0, 0L, 0L));
        assertTrue(SendConfirm.videoReordered(new Object(), 1, 0, 0, 0L, 0L, true));
        assertNull("no question was put", ShadowDialog.getLatestDialog());
        assertTrue(String.join("\n", HookStatus.report()).contains(FamilyNames.ASK_BEFORE_STICKER));
    }

    @Test public void aStickerAsksFirstAndSendRunsOnceWhileCancelRunsNothing() {
        Settings.ASK_BEFORE_STICKER.save(true);
        View view = new View(window());
        assertFalse("asked instead", sticker(view));
        Dialog dialog = ShadowDialog.getLatestDialog();
        assertNotNull(dialog);
        assertTrue(dialog.isShowing());
        TextView cancel = button(dialog.getWindow().getDecorView(), "Cancel");
        assertNotNull(cancel);
        cancel.performClick();
        assertFalse(dialog.isShowing());
    }

    @Test public void theAnsweredCallGoesThroughOnceAndTheNextOneAsksAgain() {
        Settings.ASK_BEFORE_STICKER.save(true);
        View view = new View(window());
        AtomicBoolean first = new AtomicBoolean();
        AtomicBoolean second = new AtomicBoolean(true);
        AtomicBoolean other = new AtomicBoolean(true);
        SendConfirm.answered(1, () -> {
            first.set(sticker(view));
            second.set(sticker(view));
        });
        assertTrue("the answered call goes straight through", first.get());
        assertFalse("the flag was used up, so the next call asks", second.get());
        assertFalse("the flag is clear afterwards", SendConfirm.passed(1));
        // A flag for another kind doesn't let a sticker through.
        SendConfirm.answered(2, () -> other.set(sticker(view)));
        assertFalse(other.get());
    }

    @Test public void backingOutCountsAsCancelOnceAndSendAnswersOnce() {
        Activity window = window();
        AtomicInteger sent = new AtomicInteger();
        AtomicInteger dropped = new AtomicInteger();
        assertFalse(SendConfirm.ask(3, window, "Send voice message", "Send this voice message to this chat?", "Send",
                sent::incrementAndGet, dropped::incrementAndGet));
        Dialog dialog = ShadowDialog.getLatestDialog();
        dialog.cancel();
        ShadowLooper.idleMainLooper();
        assertEquals(1, dropped.get());
        assertEquals(0, sent.get());
        dialog.dismiss();
        ShadowLooper.idleMainLooper();
        assertEquals("a late dismiss does nothing more", 1, dropped.get());

        assertFalse(SendConfirm.ask(3, window, "Send voice message", "Send this voice message to this chat?", "Send",
                sent::incrementAndGet, dropped::incrementAndGet));
        Dialog next = ShadowDialog.getLatestDialog();
        TextView send = button(next.getWindow().getDecorView(), "Send");
        assertNotNull(send);
        send.performClick();
        send.performClick();
        ShadowLooper.idleMainLooper();
        assertEquals(1, sent.get());
        assertEquals(1, dropped.get());

        // No window to ask in: Telegram goes on at once.
        assertTrue(SendConfirm.ask(3, null, "t", "m", "Send", sent::incrementAndGet, null));
        assertEquals(1, sent.get());
    }

    @Test public void onlyTheSendsAHandStartedAreAsked() {
        assertTrue(SendConfirm.voiceSend(1, true, 0, 0L));
        assertFalse("cancelling", SendConfirm.voiceSend(0, false, 0, 0L));
        assertFalse("keeping it in preview", SendConfirm.voiceSend(2, true, 0, 0L));
        assertFalse("waiting for a date", SendConfirm.voiceSend(3, true, 0, 0L));
        assertFalse("without sound", SendConfirm.voiceSend(1, false, 0, 0L));
        assertFalse("scheduled", SendConfirm.voiceSend(1, true, 1_790_000_000, 0L));
        assertFalse("already confirmed as paid", SendConfirm.voiceSend(1, true, 0, 50L));
        assertTrue(SendConfirm.videoSend(1, true, 0, 0L));
        assertTrue(SendConfirm.videoSend(4, true, 0, 0L));
        assertFalse("pausing", SendConfirm.videoSend(3, true, 0, 0L));
        assertFalse("cancelling", SendConfirm.videoSend(2, true, 0, 0L));
        assertFalse("scheduled", SendConfirm.videoSend(1, true, 5, 0L));
        assertFalse("already confirmed as paid", SendConfirm.videoSend(4, true, 0, 5L));
        Settings.ASK_BEFORE_STICKER.save(true);
        Settings.ASK_BEFORE_GIF.save(true);
        View view = new View(window());
        assertTrue(SendConfirm.sticker(view, null, null, null, null, false, true, 1_790_000_000, 0));
        assertTrue(SendConfirm.gif(new Object(), view, null, null, null, true, 1_790_000_000, 0, null, false));
        assertNull(ShadowDialog.getLatestDialog());
    }

    @Test public void aCallAsksOnlyWithAWindowAndTheSwitchOn() {
        Activity window = window();
        Settings.ASK_BEFORE_CALL.save(true);
        SendConfirm.call(new Object(), true, true, window, null, null);
        Dialog dialog = ShadowDialog.getLatestDialog();
        assertNotNull(dialog);
        assertTrue(dialog.isShowing());
        assertNotNull(button(dialog.getWindow().getDecorView(), "Call"));
        dialog.dismiss();
    }

    @Test public void pausingAnEarlyStartOrAnUnreadableSwitchKeepsTelegramsOwnWay() {
        for (BooleanSetting setting : SWITCHES) {
            setting.save(true);
            assertTrue(setting.key, SendConfirm.on(setting));
            for (HushTelegramPause.Reason reason : HushTelegramPause.Reason.values()) {
                if (reason == HushTelegramPause.Reason.NONE) continue;
                PauseForTests.pause(reason);
                assertFalse(reason.name(), SendConfirm.on(setting));
                PauseForTests.resume();
            }
            SettingsContextRule.withoutContext(() -> assertFalse(SendConfirm.on(setting)));
            SettingReadsForTests.breakReads(setting);
            assertFalse(SendConfirm.on(setting));
            SettingReadsForTests.mend(setting);
        }
        assertFalse(HookStatus.missing(FamilyNames.ASK_BEFORE_STICKER).isEmpty());
    }
}
