/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0 or later.
 * Written by lavinhoque33, 2026-11-13.
 */
package app.morphe.extension.music.patches.crossfade;

import android.media.session.MediaController;
import android.media.session.PlaybackState;

import org.junit.Test;

import app.morphe.extension.music.patches.crossfade.CrossfadeEngine.NextAvailability;

import static org.junit.Assert.*;

public class QueueAdvanceBridgeTest {
    private static final long BASE_ACTIONS = PlaybackState.ACTION_PLAY | PlaybackState.ACTION_PAUSE
            | PlaybackState.ACTION_SEEK_TO;

    private static NextAvailability published(long actions) {
        return QueueAdvanceBridge.fromPlaybackState(true, true, PlaybackState.STATE_PLAYING, actions);
    }

    @Test public void hiddenNotificationButtonsDoNotHideNativeNextFromTheBridge() {
        long nativeActions = BASE_ACTIONS | PlaybackState.ACTION_SKIP_TO_NEXT | PlaybackState.ACTION_SKIP_TO_PREVIOUS;
        long notificationActions = nativeActions
                & ~PlaybackState.ACTION_SKIP_TO_NEXT & ~PlaybackState.ACTION_SKIP_TO_PREVIOUS;
        assertEquals(BASE_ACTIONS, notificationActions);
        assertEquals(NextAvailability.UNAVAILABLE, published(notificationActions));
        // The injection captures nativeActions before changePlaybackState creates this presentation-only copy.
        assertEquals(NextAvailability.AVAILABLE, published(nativeActions));
        Output output = playing();
        output.engine.nextAvailability(published(nativeActions));
        assertTrue(output.engine.canAutoAdvance());
    }

    @Test public void hidingNotificationButtonsDoesNotInventNextAtTheRealQueueEnd() {
        long nativeActions = BASE_ACTIONS | PlaybackState.ACTION_SKIP_TO_PREVIOUS;
        long notificationActions = nativeActions
                & ~PlaybackState.ACTION_SKIP_TO_NEXT & ~PlaybackState.ACTION_SKIP_TO_PREVIOUS;
        assertEquals(BASE_ACTIONS, notificationActions);
        assertEquals(NextAvailability.UNAVAILABLE, published(nativeActions));
        Output output = playing();
        output.engine.nextAvailability(published(nativeActions));
        assertFalse(output.engine.canAutoAdvance());
    }

    private static final class Output implements CrossfadeEngine.Output {
        final CrossfadeEngine engine = new CrossfadeEngine(this);
        float incomingGain = -1;
        int selections;
        int releases;
        int envelopes;
        public void anchor(Object player, float gain) { incomingGain = gain; }
        public void envelope(Object player, float target, long duration, int curve) { envelopes++; }
        public void play(Object player, boolean playing) { }
        public void select(Object previous, Object current) { selections++; }
        public void release(Object player) { releases++; }
        public void role(Object player, CrossfadeEngine.Role role) { }
    }

    private static Output playing() {
        Output output = new Output();
        output.engine.observe(new Object(), 0.6f, true);
        return output;
    }

    @Test public void realNextFadesWithoutAnyCoordinatorLinkedNextSignal() {
        Output output = playing();
        output.engine.nextAvailability(published(BASE_ACTIONS | PlaybackState.ACTION_SKIP_TO_NEXT));
        long request = output.engine.reserve(CrossfadeEngine.Kind.AUTO_ADVANCE, 10_000, 0);
        assertTrue(output.engine.prepared(request, new Object(), 0.6f));
        assertEquals(0, output.incomingGain, 0);
        assertEquals(1, output.selections);
    }

    @Test public void lastItemLateSeekKeepsNativeEndAndNeverAllocates() {
        Output output = playing();
        output.engine.loopState("LOOP_OFF");
        CrossfadeEngine.Player current = output.engine.current();
        // The new sink epoch is the real seek reset, with five seconds remaining in the fade window.
        output.engine.frames(current, current.transitionGeneration,
                new CrossfadeEngine.Frames(2, 512, 0, 512, 48000, true, true, false, false, 1));
        output.engine.nextAvailability(published(BASE_ACTIONS));
        assertEquals(-1, output.engine.reserve(CrossfadeEngine.Kind.AUTO_ADVANCE, 10_000, 0));
        assertSame(current, output.engine.current());
        assertEquals(0, output.selections);
        assertEquals(0, output.releases);
        assertEquals(0, output.envelopes);
        assertTrue(output.engine.ended(current, current.transitionGeneration));
        assertFalse(output.engine.ended(current, current.transitionGeneration));
    }

    @Test public void repeatAllWrapUsesAppNextCapability() {
        Output output = playing();
        output.engine.loopState("LOOP_ALL");
        output.engine.nextAvailability(published(BASE_ACTIONS | PlaybackState.ACTION_SKIP_TO_NEXT));
        long request = output.engine.reserve(CrossfadeEngine.Kind.AUTO_ADVANCE, 10_000, 0);
        assertTrue(output.engine.prepared(request, new Object(), 0.6f));
        assertEquals(CrossfadeEngine.Kind.AUTO_ADVANCE, output.engine.kind());
        assertEquals(1, output.selections);
    }

    @Test public void repeatOneReloadDoesNotNeedNextCapability() {
        Output output = playing();
        output.engine.loopState("LOOP_ONE");
        output.engine.nextAvailability(published(BASE_ACTIONS));
        assertTrue(output.engine.canAutoAdvance());
        long request = output.engine.reserve(CrossfadeEngine.Kind.REPEAT_ONE, 10_000, 0);
        assertTrue(output.engine.prepared(request, new Object(), 0.6f));
        assertEquals(CrossfadeEngine.Kind.REPEAT_ONE, output.engine.kind());
        assertEquals(1, output.selections);
    }

    @Test public void dispatchKeepsSourceAdmissionWhenDestinationIsTheLastItem() {
        NextAvailability dispatched = published(BASE_ACTIONS | PlaybackState.ACTION_SKIP_TO_NEXT);
        assertEquals(NextAvailability.UNAVAILABLE, published(BASE_ACTIONS));
        Output output = playing();
        output.engine.nextAvailability(dispatched);
        assertTrue(output.engine.reserve(CrossfadeEngine.Kind.AUTO_ADVANCE, 10_000, 0) >= 0);
    }

    @Test public void missingInactiveOrUnpublishedSessionIsUnknownNotExhausted() {
        assertEquals(NextAvailability.UNKNOWN,
                QueueAdvanceBridge.fromPlaybackState(false, true, PlaybackState.STATE_PLAYING, BASE_ACTIONS));
        assertEquals(NextAvailability.UNKNOWN,
                QueueAdvanceBridge.fromPlaybackState(true, false, PlaybackState.STATE_NONE, 0));
        assertEquals(NextAvailability.UNKNOWN, published(0));
    }

    @Test public void unknownCapabilityStillPermitsAutomaticAdvance() {
        Output output = playing();
        output.engine.nextAvailability(QueueAdvanceBridge.fromPlaybackState(false, false, PlaybackState.STATE_NONE, 0));
        assertTrue(output.engine.canAutoAdvance());
        assertTrue(output.engine.reserve(CrossfadeEngine.Kind.AUTO_ADVANCE, 10_000, 0) >= 0);
    }

    @Test public void castAndForeignSessionsCannotReportLocalQueueExhaustion() {
        assertTrue(QueueAdvanceBridge.localPlayer("YouTube playerlib",
                MediaController.PlaybackInfo.PLAYBACK_TYPE_LOCAL));
        assertFalse(QueueAdvanceBridge.localPlayer("Cast",
                MediaController.PlaybackInfo.PLAYBACK_TYPE_LOCAL));
        assertFalse(QueueAdvanceBridge.localPlayer("YouTube playerlib",
                MediaController.PlaybackInfo.PLAYBACK_TYPE_REMOTE));
    }

    @Test public void missingPublicationAfterLoadOrReleaseRemainsUnknown() {
        QueueAdvanceBridge.capture(null, null);
        QueueAdvanceBridge.invalidate();
        assertEquals(NextAvailability.UNKNOWN, QueueAdvanceBridge.availability());
        QueueAdvanceBridge.release(null);
        assertEquals(NextAvailability.UNKNOWN, QueueAdvanceBridge.availability());
    }

    @Test public void connectingOrStoppedStateIsNotAQueueExhaustionReport() {
        for (int state : new int[]{PlaybackState.STATE_NONE, PlaybackState.STATE_CONNECTING,
                PlaybackState.STATE_STOPPED, PlaybackState.STATE_ERROR}) {
            assertEquals(NextAvailability.UNKNOWN,
                    QueueAdvanceBridge.fromPlaybackState(true, true, state, BASE_ACTIONS));
        }
    }
}
