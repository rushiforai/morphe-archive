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
import android.widget.FrameLayout;
import android.widget.LinearLayout;
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
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicInteger;
import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.android.controller.ActivityController;
import org.robolectric.annotation.Config;
import org.robolectric.shadows.ShadowDialog;
import org.robolectric.shadows.ShadowLooper;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class SendConfirmTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    /** Built when a test runs, after the rule gave the settings a context; run alone, a field here would load Settings without one. */
    private static List<BooleanSetting> switches() {
        return Arrays.asList(Settings.ASK_BEFORE_STICKER, Settings.ASK_BEFORE_GIF, Settings.ASK_BEFORE_VOICE_VIDEO, Settings.ASK_BEFORE_CALL);
    }

    @Before public void reset() { restore(); }
    @After public void restore() {
        // A question left up would read as one still showing to the next test's preview send.
        for (Dialog dialog : ShadowDialog.getShownDialogs()) dialog.dismiss();
        PauseForTests.resume();
        for (BooleanSetting setting : switches()) {
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
        for (BooleanSetting setting : switches()) assertFalse(setting.key, setting.get());
        Activity window = window();
        View view = new View(window);
        assertTrue(sticker(view));
        assertTrue(SendConfirm.gif(new Object(), view, null, null, null, true, 0, 0, null, false));
        assertTrue(SendConfirm.voice(new Object(), 1, true, 0, false, 0L));
        assertTrue(SendConfirm.video(new Object(), 1, true, 0, 0, 0L, 0L));
        assertTrue(SendConfirm.videoReordered(new Object(), 1, 0, 0, 0L, 0L, true));
        assertTrue(SendConfirm.stripSticker(new Object(), 0L));
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

    @Test public void theStripAsksOnlyWhenTelegramDidNotAndItsAnsweredSendTakesOnlyItsOwnFlag() {
        Settings.ASK_BEFORE_STICKER.save(true);
        Object send = new Object();
        assertTrue(SendConfirm.paid(1L));
        assertFalse(SendConfirm.paid(0L));
        assertFalse(SendConfirm.paid(null));
        assertFalse(SendConfirm.paid("25"));
        assertTrue("Telegram's own paid-message question already asked", SendConfirm.stripSticker(send, 25L));
        assertTrue("no main window in front, so Telegram goes on", SendConfirm.stripSticker(send, 0L));
        assertNull(ShadowDialog.getLatestDialog());

        AtomicBoolean through = new AtomicBoolean();
        AtomicBoolean left = new AtomicBoolean(true);
        SendConfirm.answered(6, () -> {
            through.set(SendConfirm.stripSticker(send, 0L));
            left.set(SendConfirm.passed(6));
        });
        assertTrue(through.get());
        assertFalse("the strip's hook used its flag up", left.get());
        AtomicBoolean kept = new AtomicBoolean();
        SendConfirm.answered(1, () -> {
            SendConfirm.stripSticker(send, 0L);
            kept.set(SendConfirm.passed(1));
        });
        assertTrue("the chat bar's flag is left for the chat bar", kept.get());
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

    @Test public void aRecordingIsHeldOnlyWhenItsQuestionCanShowAndAVideoSendsFromItsPreview() {
        Settings.ASK_BEFORE_VOICE_VIDEO.save(true);
        // No main window to ask in: nothing is paused, and Telegram sends as it always did.
        assertTrue(SendConfirm.voice(new Object(), 1, true, 0, false, 0L));
        assertTrue(SendConfirm.video(new Object(), 1, true, 0, 0, 0L, 0L));
        assertTrue(SendConfirm.videoReordered(new Object(), 1, 0, 0, 0L, 0L, true));
        assertNull(ShadowDialog.getLatestDialog());
        // Unpatched, the pauses do nothing and nothing reads as paused, so the hold goes on to the question.
        assertTrue(SendConfirm.holdVoice(new Object(), false));
        assertTrue(SendConfirm.holdVideo(new Object()));
        assertEquals("the state Telegram's chat bar sends a paused round video in", 4, SendConfirm.VIDEO_PREVIEW);
    }

    @Test public void aClipSentFromItsPreviewAsksAndItsAnsweredSendGoesThroughOnce() {
        assertTrue(SendConfirm.previewSend(0, 1, 0, 0L));
        assertFalse("scheduled", SendConfirm.previewSend(1_790_000_000, 1, 0, 0L));
        assertFalse("without sound", SendConfirm.previewSend(0, 0, 0, 0L));
        assertFalse("repeating", SendConfirm.previewSend(0, 1, 86_400, 0L));
        assertFalse("already confirmed as paid", SendConfirm.previewSend(0, 1, 0, 5L));

        View bar = new View(window());
        assertTrue("off by default", SendConfirm.previewVoice(bar, 0, 1, 0, 1, 0L));
        assertTrue(SendConfirm.previewVideo(bar, 0, 1, 0, 1, 0L));
        Settings.ASK_BEFORE_VOICE_VIDEO.save(true);
        assertTrue("no window to ask in", SendConfirm.previewVoice(new Object(), 0, 1, 0, 1, 0L));
        assertTrue("a scheduled send", SendConfirm.previewVideo(bar, 1_790_000_000, 1, 0, 0, 0L));
        assertNull(ShadowDialog.getLatestDialog());

        // Asked, the send returns as it does once it has sent, and Cancel leaves the clip in its preview.
        for (boolean voice : new boolean[] {true, false}) {
            assertFalse("asked instead", voice ? SendConfirm.previewVoice(bar, 0, 1, 0, 1, 0L) : SendConfirm.previewVideo(bar, 0, 1, 0, 1, 0L));
            Dialog dialog = ShadowDialog.getLatestDialog();
            assertNotNull(dialog);
            assertTrue(dialog.isShowing());
            assertNotNull(button(dialog.getWindow().getDecorView(), "Send"));
            button(dialog.getWindow().getDecorView(), "Cancel").performClick();
            assertFalse(dialog.isShowing());
        }

        // Send runs the bar's send once, as the answered call of its kind, and the pass ends with it.
        // A second tap while the question is up asks nothing more and sends nothing.
        for (int kind : new int[] {3, 4}) {
            AtomicInteger sends = new AtomicInteger();
            AtomicBoolean asItsKind = new AtomicBoolean();
            assertFalse(SendConfirm.preview(kind, bar, 0, 1, 0, 0L, () -> {
                sends.incrementAndGet();
                asItsKind.set(SendConfirm.passed(kind));
            }));
            Dialog dialog = ShadowDialog.getLatestDialog();
            assertFalse("kept in its preview", SendConfirm.preview(kind, bar, 0, 1, 0, 0L, sends::incrementAndGet));
            assertSame("no second question", dialog, ShadowDialog.getLatestDialog());
            assertEquals(0, sends.get());
            button(dialog.getWindow().getDecorView(), "Send").performClick();
            ShadowLooper.idleMainLooper();
            assertEquals(1, sends.get());
            assertTrue(asItsKind.get());
            assertFalse(SendConfirm.passed(kind));
            assertFalse(dialog.isShowing());
        }

        // Send runs the bar's send again: the voice clip's send takes the flag, and the round video's
        // leaves it for the chat's handling of the recorder that its send goes on to.
        AtomicBoolean through = new AtomicBoolean();
        AtomicBoolean left = new AtomicBoolean(true);
        SendConfirm.answered(3, () -> {
            through.set(SendConfirm.previewVoice(bar, 0, 1, 0, 0, 0L));
            left.set(SendConfirm.passed(3));
        });
        assertTrue(through.get());
        assertFalse("the voice clip's send took the flag", left.get());
        through.set(false);
        SendConfirm.answered(4, () -> {
            through.set(SendConfirm.previewVideo(bar, 0, 1, 0, 0, 0L));
            left.set(SendConfirm.passed(4));
        });
        assertTrue(through.get());
        assertTrue("left for the recorder's hook", left.get());
        // The other kind's flag lets nothing through.
        SendConfirm.answered(3, () -> through.set(SendConfirm.previewVideo(bar, 0, 1, 0, 0, 0L)));
        assertFalse(through.get());
        ShadowDialog.getLatestDialog().dismiss();
    }

    @Test public void aHeldRecordingSendsOnceOnSendAndAtOnceWhenItsQuestionCantShow() throws Exception {
        Activity window = window();
        AtomicInteger sent = new AtomicInteger();
        assertFalse(SendConfirm.askHeld(3, window, "Send voice message", "Send this voice message to this chat?", sent::incrementAndGet));
        Dialog dialog = ShadowDialog.getLatestDialog();
        assertNotNull(dialog);
        assertEquals("nothing goes out while it asks", 0, sent.get());
        button(dialog.getWindow().getDecorView(), "Cancel").performClick();
        ShadowLooper.idleMainLooper();
        assertEquals("Cancel leaves the paused clip where it is", 0, sent.get());

        assertFalse(SendConfirm.askHeld(3, window, "Send voice message", "Send this voice message to this chat?", sent::incrementAndGet));
        button(ShadowDialog.getLatestDialog().getWindow().getDecorView(), "Send").performClick();
        ShadowLooper.idleMainLooper();
        assertEquals(1, sent.get());

        // Off the main thread no question can show, so the clip goes out the way Send sends it, once, and
        // Telegram's own send, which would no longer find it recording, is held back.
        AtomicBoolean heldBack = new AtomicBoolean();
        Thread other = new Thread(() -> heldBack.set(!SendConfirm.askHeld(4, window, "Send video message",
                "Send this video message to this chat?", sent::incrementAndGet)));
        other.start();
        other.join();
        assertTrue(heldBack.get());
        assertEquals(2, sent.get());
    }

    @Test public void aSecondSendWhileTheQuestionIsUpAsksNothingMoreAndSendsNothing() {
        Settings.ASK_BEFORE_VOICE_VIDEO.save(true);
        AtomicInteger sent = new AtomicInteger();
        assertFalse(SendConfirm.askHeld(3, window(), "Send voice message", "Send this voice message to this chat?", sent::incrementAndGet));
        Dialog dialog = ShadowDialog.getLatestDialog();
        assertTrue(SendConfirm.asking());
        // Telegram's own send held back, so no second pause can start the recording again behind the question.
        assertFalse(SendConfirm.voice(new Object(), 1, true, 0, false, 0L));
        assertFalse(SendConfirm.video(new Object(), 1, true, 0, 0, 0L, 0L));
        assertFalse(SendConfirm.videoReordered(new Object(), 4, 0, 0, 0L, 0L, true));
        assertSame("no second question", dialog, ShadowDialog.getLatestDialog());
        assertEquals(0, sent.get());

        // A recording's other ends still go through, and so does the answered send.
        assertTrue("a cancel", SendConfirm.voice(new Object(), 0, true, 0, false, 0L));
        AtomicBoolean through = new AtomicBoolean();
        SendConfirm.answered(3, () -> through.set(SendConfirm.voice(new Object(), 1, true, 0, false, 0L)));
        assertTrue(through.get());
        SendConfirm.answered(4, () -> through.set(SendConfirm.video(new Object(), 4, true, 0, 0, 0L, 0L)));
        assertTrue(through.get());

        // With the question gone a send goes on as before: unpatched there's no main window to ask in.
        dialog.dismiss();
        assertFalse(SendConfirm.asking());
        assertTrue(SendConfirm.voice(new Object(), 1, true, 0, false, 0L));
        assertEquals("backing out counts as Cancel", 0, sent.get());
    }

    @Test public void sendWaitsForThePausedClipsPreviewAndEndsTheRecordingWhenNoneShows() throws Exception {
        Activity window = window();
        FrameLayout root = new FrameLayout(window);
        LinearLayout row = new LinearLayout(window);
        View leaf = new View(window);
        row.addView(leaf);
        root.addView(row);
        assertSame("the whole tree is searched", leaf, SendConfirm.find(root, view -> view == leaf));
        assertSame("the root counts", root, SendConfirm.find(root, view -> true));
        assertNull(SendConfirm.find(root, view -> false));
        // Unpatched no view is the chat bar, so nothing holds a clip.
        window.setContentView(root);
        assertNull(SendConfirm.previewBar(window, 3));
        assertNull(SendConfirm.previewBar(window, 4));
        assertNull(SendConfirm.previewBar(null, 4));

        AtomicInteger stopped = new AtomicInteger();
        AtomicBoolean letThrough = new AtomicBoolean();
        Runnable stop = () -> {
            stopped.incrementAndGet();
            letThrough.set(SendConfirm.passed(4));
        };
        SendConfirm.fromPreview(4, window, stop, SendConfirm.PREVIEW_TRIES);
        long wait = SendConfirm.PREVIEW_TRIES * SendConfirm.PREVIEW_STEP_MS;
        ShadowLooper.idleMainLooper(wait - SendConfirm.PREVIEW_STEP_MS, TimeUnit.MILLISECONDS);
        assertEquals("it looks for the preview until the last try", 0, stopped.get());
        ShadowLooper.idleMainLooper(SendConfirm.PREVIEW_STEP_MS, TimeUnit.MILLISECONDS);
        assertEquals("with none, Telegram's end of the recording sends the clip, once", 1, stopped.get());
        assertTrue("and that end goes through its hook without asking again", letThrough.get());
        assertFalse("the pass is used up", SendConfirm.passed(4));
        ShadowLooper.idleMainLooper(wait, TimeUnit.MILLISECONDS);
        assertEquals(1, stopped.get());

        // A window closed meanwhile gives way to the main window in front. Unpatched there's none, so
        // the recording ends after the last try, once, as the answered call.
        ActivityController<Activity> closing = Robolectric.buildActivity(Activity.class).setup();
        Activity closed = closing.get();
        closing.pause().stop().destroy();
        assertFalse(SendConfirm.usable(closed, false));
        assertNull(SendConfirm.previewBar(closed, 3));
        AtomicInteger endedClosed = new AtomicInteger();
        AtomicBoolean closedThrough = new AtomicBoolean();
        SendConfirm.fromPreview(3, closed, () -> {
            endedClosed.incrementAndGet();
            closedThrough.set(SendConfirm.passed(3));
        }, 1);
        assertEquals(0, endedClosed.get());
        ShadowLooper.idleMainLooper(SendConfirm.PREVIEW_STEP_MS, TimeUnit.MILLISECONDS);
        assertEquals(1, endedClosed.get());
        assertTrue(closedThrough.get());
        ShadowLooper.idleMainLooper(wait, TimeUnit.MILLISECONDS);
        assertEquals(1, endedClosed.get());

        // Off the main thread the wait moves onto it.
        Thread other = new Thread(() -> SendConfirm.fromPreview(3, window, stopped::incrementAndGet, 0));
        other.start();
        other.join();
        assertEquals(1, stopped.get());
        ShadowLooper.idleMainLooper();
        assertEquals(2, stopped.get());
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
        for (BooleanSetting setting : switches()) {
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
