/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import static org.junit.Assert.*;
import static org.robolectric.Shadows.shadowOf;

import android.Manifest;
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
import java.util.concurrent.atomic.AtomicReference;
import java.util.function.ToLongFunction;
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
        return Arrays.asList(Settings.ASK_BEFORE_STICKER, Settings.ASK_BEFORE_GIF, Settings.ASK_BEFORE_VOICE_VIDEO, Settings.ASK_BEFORE_ROUND_VIDEO,
                Settings.ASK_BEFORE_MESSAGE, Settings.ASK_BEFORE_CALL, Settings.ASK_BEFORE_JOIN);
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
        assertTrue(SendConfirm.text(view, 0, 1, 0, 1, 0L));
        assertTrue(SendConfirm.textReordered(view, 1, 0, 0, 0L, 1));
        assertTrue(SendConfirm.join(new Object(), null, 0, null, window, null, null));
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
        Settings.ASK_BEFORE_ROUND_VIDEO.save(true);
        // No main window to ask in: nothing is paused, and Telegram sends as it always did.
        assertTrue(SendConfirm.voice(new Object(), 1, true, 0, false, 0L));
        assertTrue(SendConfirm.video(new Object(), 1, true, 0, 0, 0L, 0L));
        assertTrue(SendConfirm.videoReordered(new Object(), 1, 0, 0, 0L, 0L, true));
        assertNull(ShadowDialog.getLatestDialog());
        // Unpatched, the pauses do nothing and nothing reads as paused. The voice hold goes on to the
        // question; a round video recorder that still isn't paused after the pause holds nothing.
        assertTrue(SendConfirm.holdVoice(new Object(), false));
        assertFalse(SendConfirm.holdVideo(new Object(), 1));
        assertFalse(SendConfirm.holdVideo(new Object(), SendConfirm.VIDEO_PREVIEW));
        assertEquals("the state Telegram's chat bar sends a paused round video in", 4, SendConfirm.VIDEO_PREVIEW);
    }

    @Test public void aQuickReleaseBeforeTheCameraRecordsGoesOnToTelegram() {
        // Telegram's older recorder reads as paused until the camera's first frame is recorded.
        assertFalse("a release that finds nothing recorded yet is Telegram's to drop, camera and all",
                SendConfirm.holdable(1, true));
        assertTrue("a release while recording may be held", SendConfirm.holdable(1, false));
        assertTrue("the preview's send finds its clip paused on purpose", SendConfirm.holdable(SendConfirm.VIDEO_PREVIEW, true));
        assertTrue(SendConfirm.holdable(SendConfirm.VIDEO_PREVIEW, false));

        // The older recorder before its first frame: paused, so the release goes on untouched.
        Recorder older = new Recorder(true, true);
        assertFalse(SendConfirm.holdRecorder(1, older::paused, older::pause));
        assertEquals("nothing paused", 0, older.pauses);

        // The newer recorder with its camera open but not recording yet: not paused, and its pause
        // does nothing until the camera records, so there's nothing to hold.
        Recorder opening = new Recorder(false, false);
        assertFalse("Telegram's own send drops it and closes the camera",
                SendConfirm.holdRecorder(1, opening::paused, opening::pause));
        assertEquals(1, opening.pauses);

        // Either recorder while recording: paused, then held for the question.
        Recorder recording = new Recorder(false, true);
        assertTrue(SendConfirm.holdRecorder(1, recording::paused, recording::pause));
        assertTrue(recording.paused());
        assertEquals(1, recording.pauses);

        // The preview's send finds its clip paused and holds it without pausing again.
        Recorder preview = new Recorder(true, true);
        assertTrue(SendConfirm.holdRecorder(SendConfirm.VIDEO_PREVIEW, preview::paused, preview::pause));
        assertEquals(0, preview.pauses);

        assertFalse("a recorder that throws holds nothing", SendConfirm.holdRecorder(1, () -> {
            throw new IllegalStateException("gone");
        }, () -> {}));
    }

    /** A round video recorder whose pause takes only when [pausable]. */
    private static final class Recorder {
        private boolean paused;
        private final boolean pausable;
        int pauses;

        Recorder(boolean paused, boolean pausable) {
            this.paused = paused;
            this.pausable = pausable;
        }

        boolean paused() {
            return paused;
        }

        void pause() {
            pauses++;
            if (pausable) paused = true;
        }
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
        Settings.ASK_BEFORE_ROUND_VIDEO.save(true);
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
            assertFalse(SendConfirm.preview(kind, bar, -1L, 0, 1, 0, 0L, () -> {
                sends.incrementAndGet();
                asItsKind.set(SendConfirm.passed(kind));
            }));
            Dialog dialog = ShadowDialog.getLatestDialog();
            assertFalse("kept in its preview", SendConfirm.preview(kind, bar, -1L, 0, 1, 0, 0L, sends::incrementAndGet));
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

    @Test public void thirteenTwoPassesThePreviewSendSoundFirstAndStarsBeforeTheQuestion() {
        View bar = new View(window());
        Settings.ASK_BEFORE_VOICE_VIDEO.save(true);
        Settings.ASK_BEFORE_ROUND_VIDEO.save(true);
        assertTrue("without sound", SendConfirm.previewVideoReordered(bar, 0, 0, 0, 0L, 1));
        assertTrue("scheduled", SendConfirm.previewVoiceReordered(bar, 1, 1_790_000_000, 0, 0L, 1));
        assertTrue("repeating", SendConfirm.previewVideoReordered(bar, 1, 0, 86_400, 0L, 1));
        assertTrue("already confirmed as paid", SendConfirm.previewVoiceReordered(bar, 1, 0, 0, 5L, 0));
        assertNull(ShadowDialog.getLatestDialog());

        for (boolean voice : new boolean[] {true, false}) {
            assertFalse("asked", voice ? SendConfirm.previewVoiceReordered(bar, 1, 0, 0, 0L, 1) : SendConfirm.previewVideoReordered(bar, 1, 0, 0, 0L, 1));
            Dialog dialog = ShadowDialog.getLatestDialog();
            assertNotNull(dialog);
            button(dialog.getWindow().getDecorView(), "Cancel").performClick();
            assertFalse(dialog.isShowing());
        }
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
        Settings.ASK_BEFORE_ROUND_VIDEO.save(true);
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

    @Test public void aRoundVideoAsksOnceItsPausedClipShowsAndNeverForOneTelegramDropped() {
        Activity window = window();
        View bar = new View(window);
        AtomicReference<Object> shown = new AtomicReference<>();
        AtomicInteger sent = new AtomicInteger();
        long wait = SendConfirm.PREVIEW_TRIES * SendConfirm.PREVIEW_STEP_MS;
        ToLongFunction<Object> kept = shownBar -> 1_000L;

        // Paused, the clip shows in the preview a moment later, and the question waits for it.
        SendConfirm.askOnClip(shown::get, kept, sent::incrementAndGet);
        ShadowLooper.idleMainLooper(3 * SendConfirm.PREVIEW_STEP_MS, TimeUnit.MILLISECONDS);
        assertNull("nothing asked before the clip is there", ShadowDialog.getLatestDialog());
        shown.set(bar);
        ShadowLooper.idleMainLooper(SendConfirm.PREVIEW_STEP_MS, TimeUnit.MILLISECONDS);
        Dialog dialog = ShadowDialog.getLatestDialog();
        assertNotNull(dialog);
        assertTrue(dialog.isShowing());
        button(dialog.getWindow().getDecorView(), "Cancel").performClick();
        ShadowLooper.idleMainLooper(wait, TimeUnit.MILLISECONDS);
        assertEquals("Cancel sends nothing", 0, sent.get());
        assertEquals("and the wait asked once", 1, ShadowDialog.getShownDialogs().size());

        // A clip already in the preview, as when its own Send is tapped, is asked about at once.
        SendConfirm.askOnClip(shown::get, kept, sent::incrementAndGet);
        Dialog now = ShadowDialog.getLatestDialog();
        assertNotSame(dialog, now);
        assertTrue(now.isShowing());
        button(now.getWindow().getDecorView(), "Send").performClick();
        ShadowLooper.idleMainLooper();
        assertEquals(1, sent.get());

        // Telegram drops a clip too short to keep: it never shows, so no question comes, even later.
        shown.set(null);
        SendConfirm.askOnClip(shown::get, kept, sent::incrementAndGet);
        ShadowLooper.idleMainLooper(wait, TimeUnit.MILLISECONDS);
        shown.set(bar);
        ShadowLooper.idleMainLooper(wait, TimeUnit.MILLISECONDS);
        assertSame("no question for the dropped clip", now, ShadowDialog.getLatestDialog());

        // A new recording's release while an older one still waits: only the new one asks, and its Send runs its own send.
        shown.set(null);
        AtomicInteger older = new AtomicInteger();
        SendConfirm.askOnClip(shown::get, kept, older::incrementAndGet);
        SendConfirm.askOnClip(shown::get, kept, sent::incrementAndGet);
        shown.set(bar);
        ShadowLooper.idleMainLooper(SendConfirm.PREVIEW_STEP_MS, TimeUnit.MILLISECONDS);
        Dialog newer = ShadowDialog.getLatestDialog();
        assertNotSame(now, newer);
        ShadowLooper.idleMainLooper(wait, TimeUnit.MILLISECONDS);
        assertSame("one question", newer, ShadowDialog.getLatestDialog());
        button(newer.getWindow().getDecorView(), "Send").performClick();
        ShadowLooper.idleMainLooper();
        assertEquals(2, sent.get());
        assertEquals(0, older.get());
    }

    @Test public void aRoundVideoTooShortForTelegramGoesOnToItsSendUnasked() {
        View bar = new View(window());
        AtomicReference<Object> shown = new AtomicReference<>();
        AtomicInteger sent = new AtomicInteger();
        long wait = SendConfirm.PREVIEW_TRIES * SendConfirm.PREVIEW_STEP_MS;
        assertTrue(SendConfirm.tooShort(0L));
        assertTrue(SendConfirm.tooShort(799L));
        assertFalse(SendConfirm.tooShort(800L));
        assertFalse("a length that can't be read", SendConfirm.tooShort(-1L));

        // The newer recorder shows a clip it drops at its send. Released, that one goes on to the
        // send as soon as it shows, unasked, and Telegram's send drops it and closes the camera.
        SendConfirm.askOnClip(shown::get, shownBar -> 640L, sent::incrementAndGet);
        ShadowLooper.idleMainLooper(3 * SendConfirm.PREVIEW_STEP_MS, TimeUnit.MILLISECONDS);
        assertEquals("not before it shows", 0, sent.get());
        shown.set(bar);
        ShadowLooper.idleMainLooper(SendConfirm.PREVIEW_STEP_MS, TimeUnit.MILLISECONDS);
        assertEquals(1, sent.get());
        ShadowLooper.idleMainLooper(wait, TimeUnit.MILLISECONDS);
        assertNull("nothing asked", ShadowDialog.getLatestDialog());
        assertEquals("sent once", 1, sent.get());

        // A clip long enough to keep, or one whose length can't be read, is asked about.
        for (long length : new long[] {800L, -1L}) {
            SendConfirm.askOnClip(shown::get, shownBar -> length, sent::incrementAndGet);
            Dialog dialog = ShadowDialog.getLatestDialog();
            assertNotNull("asked at " + length, dialog);
            assertTrue(dialog.isShowing());
            button(dialog.getWindow().getDecorView(), "Cancel").performClick();
        }
        assertEquals(1, sent.get());

        // The preview's own Send of a clip that short goes on to Telegram's send unasked too. A
        // voice clip's length isn't read, so it asks whatever it's handed.
        Settings.ASK_BEFORE_ROUND_VIDEO.save(true);
        Settings.ASK_BEFORE_VOICE_VIDEO.save(true);
        Dialog last = ShadowDialog.getLatestDialog();
        assertTrue(SendConfirm.preview(4, bar, 640L, 0, 1, 0, 0L, sent::incrementAndGet));
        assertSame("nothing asked", last, ShadowDialog.getLatestDialog());
        for (int kind : new int[] {4, 3}) {
            assertFalse("asked", SendConfirm.preview(kind, bar, kind == 4 ? 800L : 640L, 0, 1, 0, 0L, sent::incrementAndGet));
            Dialog dialog = ShadowDialog.getLatestDialog();
            assertNotSame(last, dialog);
            button(dialog.getWindow().getDecorView(), "Cancel").performClick();
            last = dialog;
        }
        assertEquals(1, sent.get());
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

    @Test public void voiceAndRoundVideoMessagesEachAskUnderTheirOwnSwitch() {
        View bar = new View(window());
        Settings.ASK_BEFORE_VOICE_VIDEO.save(true);
        assertTrue("the voice message switch leaves round videos alone", SendConfirm.previewVideo(bar, 0, 1, 0, 1, 0L));
        assertTrue(SendConfirm.previewVideoReordered(bar, 1, 0, 0, 0L, 1));
        assertNull(ShadowDialog.getLatestDialog());
        assertFalse("and asks about a voice message", SendConfirm.previewVoice(bar, 0, 1, 0, 1, 0L));
        Dialog voice = ShadowDialog.getLatestDialog();
        assertNotNull(voice);
        // While it asks, the round video recorder's own send isn't held back: its switch is off.
        assertTrue(SendConfirm.video(new Object(), 1, true, 0, 0, 0L, 0L));
        voice.dismiss();

        Settings.ASK_BEFORE_VOICE_VIDEO.save(false);
        Settings.ASK_BEFORE_ROUND_VIDEO.save(true);
        assertTrue("the round video switch leaves voice messages alone", SendConfirm.previewVoice(bar, 0, 1, 0, 1, 0L));
        assertSame(voice, ShadowDialog.getLatestDialog());
        assertFalse("and asks about a round video", SendConfirm.previewVideo(bar, 0, 1, 0, 1, 0L));
        Dialog video = ShadowDialog.getLatestDialog();
        assertNotSame(voice, video);
        assertTrue(video.isShowing());
        assertFalse("the recorder's own send waits for the question", SendConfirm.video(new Object(), 1, true, 0, 0, 0L, 0L));
        assertTrue("the voice recorder's doesn't", SendConfirm.voice(new Object(), 1, true, 0, false, 0L));
        video.dismiss();
    }

    @Test public void aTypedMessageAsksUnderItsOwnSwitchAndCancelLeavesItWhereItIs() {
        View bar = new View(window());
        for (BooleanSetting other : switches()) if (other != Settings.ASK_BEFORE_MESSAGE) other.save(true);
        assertTrue("the other questions leave typed messages alone", SendConfirm.text(bar, 0, 1, 0, 1, 0L));
        for (BooleanSetting other : switches()) other.resetToDefault();
        Settings.ASK_BEFORE_MESSAGE.save(true);
        assertTrue("no window to ask in", SendConfirm.text(new Object(), 0, 1, 0, 1, 0L));
        assertTrue("scheduled", SendConfirm.text(bar, 1_790_000_000, 1, 0, 1, 0L));
        assertTrue("without sound", SendConfirm.text(bar, 0, 0, 0, 1, 0L));
        assertTrue("repeating", SendConfirm.text(bar, 0, 1, 86_400, 1, 0L));
        assertTrue("Telegram's own paid-message question asks", SendConfirm.text(bar, 0, 1, 0, 0, 5L));
        assertNull(ShadowDialog.getLatestDialog());

        // Asked, the send returns as one that sent nothing, the way its own checks do.
        assertFalse("asked instead", SendConfirm.text(bar, 0, 1, 0, 1, 0L));
        Dialog dialog = ShadowDialog.getLatestDialog();
        assertNotNull(dialog);
        assertTrue(dialog.isShowing());
        assertNotNull(button(dialog.getWindow().getDecorView(), "Send"));
        assertFalse("a second tap asks nothing more", SendConfirm.text(bar, 0, 1, 0, 1, 0L));
        assertSame("no second question", dialog, ShadowDialog.getLatestDialog());
        button(dialog.getWindow().getDecorView(), "Cancel").performClick();
        ShadowLooper.idleMainLooper();
        assertFalse(dialog.isShowing());
        assertFalse("Cancel leaves no pass behind", SendConfirm.passed(7));

        // Send runs the bar's send again and its pass ends with it.
        assertFalse(SendConfirm.text(bar, 0, 1, 0, 1, 0L));
        Dialog next = ShadowDialog.getLatestDialog();
        assertNotSame(dialog, next);
        button(next.getWindow().getDecorView(), "Send").performClick();
        ShadowLooper.idleMainLooper();
        assertFalse(next.isShowing());
        assertFalse(SendConfirm.asking());
        assertFalse(SendConfirm.passed(7));

        // The answered send goes through once; another kind's pass lets nothing through.
        AtomicBoolean through = new AtomicBoolean();
        AtomicBoolean again = new AtomicBoolean(true);
        SendConfirm.answered(7, () -> {
            through.set(SendConfirm.text(bar, 0, 1, 0, 1, 0L));
            again.set(SendConfirm.text(bar, 0, 1, 0, 1, 0L));
        });
        assertTrue(through.get());
        assertFalse("the pass was used up", again.get());
        ShadowDialog.getLatestDialog().dismiss();
        SendConfirm.answered(3, () -> through.set(SendConfirm.text(bar, 0, 1, 0, 1, 0L)));
        assertFalse(through.get());
        ShadowDialog.getLatestDialog().dismiss();

        // 13.2's send gives the sound flag first and the stars before the question.
        assertTrue("without sound", SendConfirm.textReordered(bar, 0, 0, 0, 0L, 1));
        assertTrue("scheduled", SendConfirm.textReordered(bar, 1, 1_790_000_000, 0, 0L, 1));
        assertTrue("repeating", SendConfirm.textReordered(bar, 1, 0, 86_400, 0L, 1));
        assertTrue("already confirmed as paid", SendConfirm.textReordered(bar, 1, 0, 0, 5L, 0));
        Dialog last = ShadowDialog.getLatestDialog();
        assertFalse(last.isShowing());
        assertFalse("asked", SendConfirm.textReordered(bar, 1, 0, 0, 0L, 1));
        assertNotSame(last, ShadowDialog.getLatestDialog());
        ShadowDialog.getLatestDialog().dismiss();
    }

    @Test public void joiningAVoiceChatAsksOnlyWithAWindowAndItsSwitchOn() throws Exception {
        Activity window = window();
        Object chat = new Object();
        Settings.ASK_BEFORE_CALL.save(true);
        assertTrue("the call switch leaves joins alone", SendConfirm.join(chat, null, 0, null, window, null, null));
        Settings.ASK_BEFORE_JOIN.save(true);
        assertTrue("starting a new one", SendConfirm.join(chat, null, 1, null, window, null, null));
        assertTrue("no window", SendConfirm.join(chat, null, 0, null, new Object(), null, null));
        assertTrue("no window", SendConfirm.join(chat, null, 0, null, null, null, null));
        AtomicBoolean offMain = new AtomicBoolean();
        Thread other = new Thread(() -> offMain.set(SendConfirm.join(chat, null, 0, null, window, null, null)));
        other.start();
        other.join();
        assertTrue("off the main thread nothing can ask", offMain.get());
        assertNull(ShadowDialog.getLatestDialog());

        assertFalse("asked instead", SendConfirm.join(chat, null, 0, null, window, null, null));
        Dialog dialog = ShadowDialog.getLatestDialog();
        assertNotNull(dialog);
        assertTrue(dialog.isShowing());
        assertNotNull(button(dialog.getWindow().getDecorView(), "Join"));
        assertFalse("a second tap asks nothing more", SendConfirm.join(chat, null, 0, null, window, null, null));
        assertSame(dialog, ShadowDialog.getLatestDialog());
        button(dialog.getWindow().getDecorView(), "Cancel").performClick();
        ShadowLooper.idleMainLooper();
        assertFalse(dialog.isShowing());
        assertFalse(SendConfirm.passed(8));

        AtomicBoolean through = new AtomicBoolean();
        SendConfirm.answered(8, () -> through.set(SendConfirm.join(chat, null, 0, null, window, null, null)));
        assertTrue("the answered join goes through", through.get());
        assertFalse(SendConfirm.passed(8));

        // Join with the microphone still off: Telegram asks for it and joins again once it's allowed,
        // and that join goes through without a second question.
        assertFalse(SendConfirm.join(chat, null, 0, null, window, null, null));
        button(ShadowDialog.getLatestDialog().getWindow().getDecorView(), "Join").performClick();
        ShadowLooper.idleMainLooper();
        Dialog answered = ShadowDialog.getLatestDialog();
        assertFalse(answered.isShowing());
        shadowOf(window.getApplication()).grantPermissions(Manifest.permission.RECORD_AUDIO);
        assertTrue("the join after the microphone", SendConfirm.join(chat, null, 0, null, window, null, null));
        assertSame("asked nothing", answered, ShadowDialog.getLatestDialog());
        assertFalse("the next join asks again", SendConfirm.join(chat, null, 0, null, window, null, null));
        ShadowDialog.getLatestDialog().dismiss();
    }

    @Test public void onlyTheJoinTelegramMakesAgainForTheSameChatOnceTheMicrophoneIsOnSkipsTheQuestion() {
        Activity window = window();
        assertFalse("nothing waits", SendConfirm.afterMicrophone(42L, window));
        SendConfirm.waitForMicrophone(42L, window);
        assertFalse("the microphone is still off", SendConfirm.afterMicrophone(42L, window));
        shadowOf(window.getApplication()).grantPermissions(Manifest.permission.RECORD_AUDIO);
        assertFalse("and that join ended the wait", SendConfirm.afterMicrophone(42L, window));

        shadowOf(window.getApplication()).denyPermissions(Manifest.permission.RECORD_AUDIO);
        SendConfirm.waitForMicrophone(42L, window);
        shadowOf(window.getApplication()).grantPermissions(Manifest.permission.RECORD_AUDIO);
        assertFalse("another chat", SendConfirm.afterMicrophone(7L, window));
        assertFalse("which ended the wait too", SendConfirm.afterMicrophone(42L, window));

        shadowOf(window.getApplication()).denyPermissions(Manifest.permission.RECORD_AUDIO);
        SendConfirm.waitForMicrophone(42L, window);
        shadowOf(window.getApplication()).grantPermissions(Manifest.permission.RECORD_AUDIO);
        assertTrue(SendConfirm.afterMicrophone(42L, window));
        assertFalse("once", SendConfirm.afterMicrophone(42L, window));

        // With the microphone already on, Join leaves nothing waiting.
        SendConfirm.waitForMicrophone(42L, window);
        assertFalse(SendConfirm.afterMicrophone(42L, window));

        // A minute on, the wait is over.
        shadowOf(window.getApplication()).denyPermissions(Manifest.permission.RECORD_AUDIO);
        SendConfirm.waitForMicrophone(42L, window);
        shadowOf(window.getApplication()).grantPermissions(Manifest.permission.RECORD_AUDIO);
        ShadowLooper.idleMainLooper(SendConfirm.MICROPHONE_WAIT_MS, TimeUnit.MILLISECONDS);
        assertFalse(SendConfirm.afterMicrophone(42L, window));
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
