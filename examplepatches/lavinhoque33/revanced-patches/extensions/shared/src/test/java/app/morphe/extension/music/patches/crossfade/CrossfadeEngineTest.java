/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0 or later.
 * Modified by lavinhoque33, 2026-11-13.
 * Written by lavinhoque33, 2026-11-12.
 */
package app.morphe.extension.music.patches.crossfade;

import static org.junit.Assert.*;

import java.util.ArrayList;
import java.util.IdentityHashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.atomic.AtomicReference;

import org.junit.Test;

public class CrossfadeEngineTest {
    private static final class Harness implements CrossfadeEngine.Output {
        final CrossfadeEngine engine = new CrossfadeEngine(this);
        final Object first = new Object();
        final Map<Object, Integer> releases = new IdentityHashMap<>();
        final Map<Object, Float> anchors = new IdentityHashMap<>();
        final Map<Object, Boolean> playing = new IdentityHashMap<>();
        final List<Object> envelopes = new ArrayList<>();
        final List<Long> durations = new ArrayList<>();
        Object selected;
        int outputCommands;

        Harness() { engine.observe(first, 0.6f, true); }
        public void anchor(Object player, float gain) {
            outputCommands++;
            anchors.put(player, gain);
        }
        public void envelope(Object player, float target, long duration, int curve) {
            outputCommands++;
            envelopes.add(player);
            durations.add(duration);
        }
        public void play(Object player, boolean play) {
            outputCommands++;
            playing.put(player, play);
        }
        public void select(Object previous, Object current) {
            outputCommands++;
            selected = current;
        }
        public void release(Object player) {
            outputCommands++;
            releases.put(player, releases.getOrDefault(player, 0) + 1);
        }
        public void role(Object player, CrossfadeEngine.Role role) { outputCommands++; }

        CrossfadeEngine.Player next(CrossfadeEngine.Kind kind) {
            long transition = engine.reserve(kind, 10_000, 0);
            assertTrue(engine.prepared(transition, new Object(), 0.4f));
            return engine.current();
        }

        void frames(CrossfadeEngine.Player player, long sink, long submitted, long played, float gain) {
            engine.frames(player, player.transitionGeneration, facts(sink, submitted, played, 48000, true, gain));
        }

        CrossfadeEngine.Player overlap() {
            CrossfadeEngine.Player incoming = next(CrossfadeEngine.Kind.MANUAL_SKIP);
            frames(incoming, 1, 512, 0, 0);
            return incoming;
        }
    }

    private static CrossfadeEngine.Frames facts(long sink, long submitted, long played,
                                               int rate, boolean supported, float gain) {
        return new CrossfadeEngine.Frames(sink, submitted, played, submitted,
                rate, true, supported, false, false, gain);
    }

    @Test public void firstLoadIsSteadyWithoutAllocationOrEnvelope() {
        Harness h = new Harness();
        assertEquals(CrossfadeEngine.State.STEADY, h.engine.state());
        assertFalse(h.engine.transitioning());
        assertTrue(h.envelopes.isEmpty());
    }

    @Test public void idleCannotReserveOutgoing() {
        Harness h = new Harness();
        h.engine.dispose(null);
        assertEquals(-1, h.engine.reserve(CrossfadeEngine.Kind.MANUAL_SKIP, 10000, 0));
    }

    @Test public void manualSkipAnchorsIncomingAtZeroBeforeSelect() {
        Harness h = new Harness();
        CrossfadeEngine.Player in = h.next(CrossfadeEngine.Kind.MANUAL_SKIP);
        assertEquals(0f, h.anchors.get(in.identity), 0f);
        assertSame(in.identity, h.selected);
        assertEquals(CrossfadeEngine.State.PREPARING, h.engine.state());
        assertTrue(h.envelopes.isEmpty());
    }

    @Test public void autoAdvanceWaitsForNegotiatedPcmFramesNotReadyTime() {
        Harness h = new Harness();
        CrossfadeEngine.Player in = h.next(CrossfadeEngine.Kind.AUTO_ADVANCE);
        h.frames(in, 1, 0, 0, 0);
        assertTrue(h.envelopes.isEmpty());
        h.frames(in, 1, 512, 0, 0);
        assertEquals(2, h.envelopes.size());
        assertEquals(CrossfadeEngine.State.OVERLAPPING, h.engine.state());
    }

    @Test public void realQueueAvailableAllowsAutomaticFadeWithoutNativeLinkedNextInput() {
        Harness h = new Harness();
        h.engine.loopState("LOOP_OFF");
        h.engine.nextAvailability(CrossfadeEngine.NextAvailability.AVAILABLE);
        assertTrue(h.engine.canAutoAdvance());

        CrossfadeEngine.Player outgoing = h.engine.current();
        CrossfadeEngine.Player incoming = h.next(CrossfadeEngine.Kind.AUTO_ADVANCE);
        h.frames(incoming, 1, 512, 0, 0);

        assertNotSame(outgoing, incoming);
        assertSame(incoming.identity, h.selected);
        assertEquals(CrossfadeEngine.Kind.AUTO_ADVANCE, h.engine.kind());
        assertEquals(CrossfadeEngine.State.OVERLAPPING, h.engine.state());
        assertEquals(2, h.envelopes.size());
    }

    @Test public void unknownAvailabilityPermitsOrdinaryAutomaticFade() {
        Harness h = new Harness();
        assertTrue(h.engine.canAutoAdvance());
        CrossfadeEngine.Player incoming = h.next(CrossfadeEngine.Kind.AUTO_ADVANCE);
        h.frames(incoming, 1, 512, 0, 0);

        assertEquals(CrossfadeEngine.State.OVERLAPPING, h.engine.state());
        assertEquals(2, h.envelopes.size());
    }

    @Test public void unavailableFinalItemPreservesNativeCurrentAndEndAfterSeekInsideFadeWindow() {
        Harness h = new Harness();
        CrossfadeEngine.Player current = h.engine.current();
        h.engine.loopState("LOOP_OFF");
        h.frames(current, 1, 48000, 47000, 1);
        h.engine.nextAvailability(CrossfadeEngine.NextAvailability.UNAVAILABLE);
        long generation = h.engine.generation();
        long track = current.trackGeneration;
        long transition = current.transitionGeneration;
        int commands = h.outputCommands;

        assertFalse(h.engine.canAutoAdvance());
        assertEquals(-1, h.engine.reserve(CrossfadeEngine.Kind.AUTO_ADVANCE, 10000, 0));

        // A seek starts a new sink epoch with five seconds left inside the ten-second fade window.
        h.frames(current, 2, 512, 0, 1);
        h.engine.nextAvailability(CrossfadeEngine.NextAvailability.UNAVAILABLE);
        assertFalse(h.engine.canAutoAdvance());
        assertEquals(-1, h.engine.reserve(CrossfadeEngine.Kind.AUTO_ADVANCE, 10000, 0));
        h.engine.frames(current, transition,
                new CrossfadeEngine.Frames(2, 240000, 240000, 240000, 48000, true, true, true, false, 1));

        assertSame(current, h.engine.current());
        assertEquals(1, h.engine.players().size());
        assertEquals(generation, h.engine.generation());
        assertEquals(track, current.trackGeneration);
        assertEquals(transition, current.transitionGeneration);
        assertEquals(CrossfadeEngine.Role.CURRENT, current.role);
        assertEquals(CrossfadeEngine.State.STEADY, h.engine.state());
        assertNull(h.engine.kind());
        assertFalse(h.engine.transitioning());
        assertEquals(1f, current.gain, 0);
        assertTrue(current.playIntent);
        assertFalse(current.released);
        assertEquals(commands, h.outputCommands);

        // PCM EOS did not synthesize or consume the genuine native end callback.
        assertTrue(h.engine.ended(current, transition));
        assertFalse(h.engine.ended(current, transition));
        assertSame(current, h.engine.current());
        assertEquals(commands, h.outputCommands);
    }

    @Test public void deniedAutomaticAdmissionDoesNotInvalidateExistingManualReservation() {
        Harness h = new Harness();
        long manual = h.engine.reserve(CrossfadeEngine.Kind.MANUAL_SKIP, 7000, 0);
        CrossfadeEngine.Player current = h.engine.current();
        int commands = h.outputCommands;
        h.engine.nextAvailability(CrossfadeEngine.NextAvailability.UNAVAILABLE);

        assertEquals(-1, h.engine.reserve(CrossfadeEngine.Kind.AUTO_ADVANCE, 10000, 1));
        assertEquals(manual, h.engine.generation());
        assertEquals(CrossfadeEngine.Kind.MANUAL_SKIP, h.engine.kind());
        assertEquals(CrossfadeEngine.State.PREPARING, h.engine.state());
        assertSame(current, h.engine.current());
        assertEquals(1, h.engine.players().size());
        assertEquals(commands, h.outputCommands);

        assertTrue(h.engine.prepared(manual, new Object(), 1));
        h.frames(h.engine.current(), 1, 512, 0, 0);
        assertEquals(Long.valueOf(7000), h.durations.get(0));
    }

    @Test public void repeatAllWrapUsesAvailableRealQueueAndOrdinaryAutomaticFade() {
        Harness h = new Harness();
        h.engine.loopState("LOOP_ALL");
        h.engine.nextAvailability(CrossfadeEngine.NextAvailability.AVAILABLE);
        assertFalse(h.engine.repeatOne());
        assertTrue(h.engine.canAutoAdvance());

        CrossfadeEngine.Player incoming = h.next(CrossfadeEngine.Kind.AUTO_ADVANCE);
        h.frames(incoming, 1, 512, 0, 0);
        assertEquals(CrossfadeEngine.Kind.AUTO_ADVANCE, h.engine.kind());
        assertEquals(CrossfadeEngine.State.OVERLAPPING, h.engine.state());
        assertEquals(2, h.envelopes.size());
    }

    @Test public void repeatAllDoesNotInventQueueAvailability() {
        Harness h = new Harness();
        h.engine.loopState("LOOP_ALL");
        h.engine.nextAvailability(CrossfadeEngine.NextAvailability.UNAVAILABLE);

        assertFalse(h.engine.canAutoAdvance());
        assertEquals(-1, h.engine.reserve(CrossfadeEngine.Kind.AUTO_ADVANCE, 10000, 0));
        assertFalse(h.engine.transitioning());
    }

    @Test public void resampledAvailabilityAfterSeekDoesNotLatchQueueExhaustion() {
        for (CrossfadeEngine.NextAvailability availability : new CrossfadeEngine.NextAvailability[]{
                CrossfadeEngine.NextAvailability.AVAILABLE, CrossfadeEngine.NextAvailability.UNKNOWN}) {
            Harness h = new Harness();
            CrossfadeEngine.Player current = h.engine.current();
            h.frames(current, 1, 48000, 47000, 1);
            h.engine.nextAvailability(CrossfadeEngine.NextAvailability.UNAVAILABLE);
            assertEquals(-1, h.engine.reserve(CrossfadeEngine.Kind.AUTO_ADVANCE, 10000, 0));

            h.frames(current, 2, 512, 0, 1);
            h.engine.nextAvailability(availability);
            assertTrue(h.engine.canAutoAdvance());
            CrossfadeEngine.Player incoming = h.next(CrossfadeEngine.Kind.AUTO_ADVANCE);
            h.frames(incoming, 1, 512, 0, 0);
            assertEquals(CrossfadeEngine.State.OVERLAPPING, h.engine.state());
        }
    }

    @Test public void newNativeCurrentDoesNotInheritPreviousQueueExhaustion() {
        Harness h = new Harness();
        h.engine.nextAvailability(CrossfadeEngine.NextAvailability.UNAVAILABLE);
        assertFalse(h.engine.canAutoAdvance());

        h.engine.observe(new Object(), 1, true);
        assertTrue(h.engine.canAutoAdvance());
        assertTrue(h.engine.reserve(CrossfadeEngine.Kind.AUTO_ADVANCE, 10000, 0) >= 0);
    }

    @Test public void nativeLoadDoesNotInheritPreviousQueueExhaustion() {
        Harness h = new Harness();
        CrossfadeEngine.Player current = h.engine.current();
        h.engine.nextAvailability(CrossfadeEngine.NextAvailability.UNAVAILABLE);
        assertFalse(h.engine.canAutoAdvance());

        h.engine.nativeLoad();
        assertSame(current, h.engine.current());
        assertTrue(h.engine.canAutoAdvance());
        assertTrue(h.engine.reserve(CrossfadeEngine.Kind.AUTO_ADVANCE, 10000, 0) >= 0);
    }

    @Test public void preparedNewCurrentDoesNotInheritPreviousQueueExhaustion() {
        Harness h = new Harness();
        h.engine.nextAvailability(CrossfadeEngine.NextAvailability.UNAVAILABLE);
        assertFalse(h.engine.canAutoAdvance());

        CrossfadeEngine.Player incoming = h.next(CrossfadeEngine.Kind.MANUAL_SKIP);
        assertSame(incoming, h.engine.current());
        assertTrue(h.engine.canAutoAdvance());
    }

    @Test public void repeatedFramesDoNotRestartEnvelopes() {
        Harness h = new Harness();
        CrossfadeEngine.Player in = h.overlap();
        h.frames(in, 1, 1024, 512, 0.1f);
        h.frames(in, 1, 1024, 512, 0.1f);
        assertEquals(2, h.envelopes.size());
    }

    @Test public void chainedSkipDemotesIncomingFromPartialGainNotUnity() {
        Harness h = new Harness();
        CrossfadeEngine.Player in = h.overlap();
        h.frames(in, 1, 5000, 4000, 0.3f);
        CrossfadeEngine.Player chained = h.next(CrossfadeEngine.Kind.MANUAL_SKIP);
        assertEquals(0.3f, in.gain, 0f);
        assertEquals(CrossfadeEngine.Role.OUTGOING, in.role);
        h.frames(chained, 1, 512, 0, 0);
        assertTrue(h.envelopes.contains(in.identity));
        assertNotEquals(Float.valueOf(1), h.anchors.get(in.identity));
    }

    @Test public void reserveInvalidatesOldPrepareBeforeAllocation() {
        Harness h = new Harness();
        long old = h.engine.reserve(CrossfadeEngine.Kind.MANUAL_SKIP, 10000, 0);
        long next = h.engine.reserve(CrossfadeEngine.Kind.MANUAL_SKIP, 10000, 0);
        assertFalse(h.engine.prepared(old, new Object(), 1));
        assertTrue(h.engine.prepared(next, new Object(), 1));
    }

    @Test public void staleTransitionCannotMutateChainedPlayer() {
        Harness h = new Harness();
        CrossfadeEngine.Player in = h.overlap();
        long stale = in.transitionGeneration;
        h.frames(in, 1, 500, 200, 0.3f);
        h.next(CrossfadeEngine.Kind.MANUAL_SKIP);
        h.engine.frames(in, stale, facts(1, 100000, 100000, 48000, true, 0));
        assertEquals(0.3f, in.gain, 0f);
        assertFalse(in.released);
    }

    @Test public void pauseDuringOverlapPausesBothRolesWithoutNewEnvelope() {
        Harness h = new Harness();
        CrossfadeEngine.Player in = h.overlap();
        h.engine.pause(true);
        assertEquals(CrossfadeEngine.State.PAUSED, h.engine.state());
        assertFalse(h.playing.get(in.identity));
        assertFalse(h.playing.get(h.first));
        h.frames(in, 1, 512, 0, 0);
        assertEquals(2, h.envelopes.size());
        h.engine.pause(false);
        assertTrue(h.playing.get(in.identity));
        assertTrue(h.playing.get(h.first));
    }

    @Test public void pauseDuringPreparingDefersEnvelopeUntilResume() {
        Harness h = new Harness();
        CrossfadeEngine.Player in = h.next(CrossfadeEngine.Kind.MANUAL_SKIP);
        h.engine.pause(true);
        h.frames(in, 1, 512, 0, 0);
        assertTrue(h.envelopes.isEmpty());
        h.engine.pause(false);
        h.frames(in, 1, 512, 0, 0);
        assertEquals(2, h.envelopes.size());
    }

    @Test public void seekDuringOverlapPreservesGainAndRejectsOldSinkFacts() {
        Harness h = new Harness();
        CrossfadeEngine.Player in = h.overlap();
        h.frames(in, 1, 20000, 18000, 0.4f);
        h.frames(in, 2, 512, 0, 0.4f);
        h.frames(in, 1, 90000, 90000, 1);
        assertEquals(2, in.sinkGeneration);
        assertEquals(512, in.submittedFrames);
        assertEquals(0.4f, in.gain, 0);
        assertEquals(2, h.envelopes.size());
    }

    @Test public void speedChangeDoesNotApplySpeedTwiceOrRestartOutputTimeEnvelope() {
        Harness h = new Harness();
        CrossfadeEngine.Player in = h.overlap();
        // Twice as much media advances, but these are output frames after the native time stretcher.
        h.frames(in, 1, 48000, 46000, 0.2f);
        h.frames(in, 1, 96000, 94000, 0.4f);
        assertEquals(2, h.envelopes.size());
        assertEquals(Long.valueOf(10000), h.durations.get(0));
        assertEquals(94000, in.playedFrames);
    }

    @Test public void formatRateChangeUpdatesFactsWithoutRestartingEnvelope() {
        Harness h = new Harness();
        CrossfadeEngine.Player in = h.overlap();
        h.engine.frames(in, in.transitionGeneration, facts(2, 441, 220, 44100, true, 0.2f));
        assertEquals(44100, in.sampleRate);
        assertEquals(2, h.envelopes.size());
    }

    @Test public void unsupportedIncomingBecomesOrdinaryTransitionWithoutUnityOverlap() {
        Harness h = new Harness();
        CrossfadeEngine.Player in = h.next(CrossfadeEngine.Kind.MANUAL_SKIP);
        h.engine.frames(in, in.transitionGeneration, facts(1, 0, 0, 0, false, 0));
        assertEquals(Integer.valueOf(1), h.releases.get(h.first));
        assertEquals(1f, in.gain, 0);
        assertEquals(CrossfadeEngine.State.STEADY, h.engine.state());
        assertTrue(h.envelopes.isEmpty());
    }

    @Test public void outputRouteLosingPcmEndsOverlapOrdinarily() {
        Harness h = new Harness();
        CrossfadeEngine.Player outgoing = h.engine.current();
        h.overlap();
        h.engine.frames(outgoing, outgoing.transitionGeneration, facts(2, 0, 0, 0, false, 0.4f));
        assertEquals(Integer.valueOf(1), h.releases.get(h.first));
        assertEquals(CrossfadeEngine.State.STEADY, h.engine.state());
    }

    @Test public void outgoingReleaseWaitsForPlayedFrameWatermark() {
        Harness h = new Harness();
        CrossfadeEngine.Player outgoing = h.engine.current();
        h.overlap();
        h.frames(outgoing, 1, 480000, 470000, 0);
        assertFalse(outgoing.released);
        h.frames(outgoing, 1, 481024, 479999, 0);
        assertFalse(outgoing.released);
        h.frames(outgoing, 1, 482048, 480000, 0);
        assertTrue(outgoing.released);
        assertEquals(Integer.valueOf(1), h.releases.get(h.first));
    }

    @Test public void seekFlushDuringDrainDiscardsOldTailWithoutWaitingForNewSilentFrames() {
        Harness h = new Harness();
        CrossfadeEngine.Player outgoing = h.engine.current();
        h.overlap();
        h.frames(outgoing, 1, 4000, 2000, 0);
        assertFalse(outgoing.released);
        h.frames(outgoing, 2, 512, 0, 0);
        assertTrue(outgoing.released);
        h.frames(outgoing, 1, 5000, 5000, 0);
        h.frames(outgoing, 2, 1024, 512, 0);
        assertEquals(Integer.valueOf(1), h.releases.get(h.first));
    }

    @Test public void failedLoadRestoresAuthoritativeOutgoingAndItsNormalization() {
        Harness h = new Harness();
        CrossfadeEngine.Player original = h.engine.current();
        CrossfadeEngine.Player in = h.next(CrossfadeEngine.Kind.MANUAL_SKIP);
        h.engine.normalization(original.identity, 0.33f);
        h.engine.failed(in, in.transitionGeneration);
        assertSame(original, h.engine.current());
        assertSame(h.first, h.selected);
        assertEquals(0.33f, original.normalization, 0);
        assertEquals(Integer.valueOf(1), h.releases.get(in.identity));
    }

    @Test public void failedOverlapPreservesActualPartialOutgoingGain() {
        Harness h = new Harness();
        CrossfadeEngine.Player outgoing = h.engine.current();
        CrossfadeEngine.Player in = h.overlap();
        h.frames(outgoing, 1, 10000, 8000, 0.45f);
        h.engine.failed(in, in.transitionGeneration);
        assertEquals(0.45f, h.anchors.get(h.first), 0);
    }

    @Test public void genuinelyPausedOutgoingNeverRevivesOnReadyOrFailure() {
        Harness h = new Harness();
        CrossfadeEngine.Player outgoing = h.engine.current();
        h.engine.intent(outgoing, outgoing.transitionGeneration, false, false);
        CrossfadeEngine.Player in = h.next(CrossfadeEngine.Kind.MANUAL_SKIP);
        assertEquals(0f, h.anchors.get(h.first), 0);
        h.engine.failed(in, in.transitionGeneration);
        assertEquals(0f, h.anchors.get(h.first), 0);
        assertFalse(h.playing.get(h.first));
    }

    @Test public void failedAllocationDoesNotChangeNativeCurrent() {
        Harness h = new Harness();
        long transition = h.engine.reserve(CrossfadeEngine.Kind.MANUAL_SKIP, 10000, 0);
        h.engine.allocationFailed(transition);
        assertSame(h.first, h.engine.current().identity);
        assertEquals(CrossfadeEngine.State.STEADY, h.engine.state());
    }

    @Test public void modeSwitchDuringOverlapRetainsIncomingWithoutNewFadeOrAllocation() {
        Harness h = new Harness();
        CrossfadeEngine.Player in = h.overlap();
        int commands = h.envelopes.size();
        h.engine.modeSwitch();
        assertSame(in, h.engine.current());
        assertEquals(CrossfadeEngine.Kind.MODE_SWITCH, h.engine.kind());
        assertEquals(CrossfadeEngine.State.STEADY, h.engine.state());
        assertEquals(commands, h.envelopes.size());
        assertEquals(Integer.valueOf(1), h.releases.get(h.first));
        assertEquals(1f, h.anchors.get(in.identity), 0);
    }

    @Test public void sameStreamDisplaySwitchStaysSteadyWithOneNativePlayer() {
        Harness h = new Harness();
        h.engine.modeSwitch();
        assertEquals(CrossfadeEngine.State.STEADY, h.engine.state());
        assertSame(h.first, h.engine.current().identity);
        assertEquals(1, h.engine.players().size());
        assertTrue(h.releases.isEmpty());
        assertTrue(h.envelopes.isEmpty());
    }

    @Test public void modeSwitchInvalidatesOldFailureAndFrames() {
        Harness h = new Harness();
        CrossfadeEngine.Player in = h.overlap();
        long stale = in.transitionGeneration;
        h.engine.modeSwitch();
        h.engine.failed(in, stale);
        h.engine.frames(in, stale, facts(1, 10000, 10000, 48000, true, 0));
        assertSame(in, h.engine.current());
        assertEquals(1f, in.gain, 0);
    }

    @Test public void genuineSkipAfterModeSwitchStillCrossfades() {
        Harness h = new Harness();
        h.engine.modeSwitch();
        CrossfadeEngine.Player in = h.overlap();
        assertSame(in, h.engine.current());
        assertEquals(CrossfadeEngine.Kind.MANUAL_SKIP, h.engine.kind());
        assertEquals(2, h.envelopes.size());
    }

    @Test public void repeatOneUsesSameOwnedTransitionWithoutQueueAdvance() {
        Harness h = new Harness();
        h.engine.loopState("LOOP_ONE");
        h.engine.nextAvailability(CrossfadeEngine.NextAvailability.UNAVAILABLE);
        assertTrue(h.engine.canAutoAdvance());
        CrossfadeEngine.Player outgoing = h.engine.current();
        CrossfadeEngine.Player in = h.next(CrossfadeEngine.Kind.REPEAT_ONE);
        h.frames(in, 1, 512, 0, 0);
        assertEquals(CrossfadeEngine.Kind.REPEAT_ONE, h.engine.kind());
        assertFalse(h.engine.ended(outgoing, outgoing.transitionGeneration));
        assertFalse(h.engine.ended(outgoing, outgoing.transitionGeneration));
        assertEquals(2, h.envelopes.size());
    }

    @Test public void sleepEndBlocksAutomaticAndRepeatButNotExplicitSkip() {
        Harness h = new Harness();
        h.engine.sleepEnd(true);
        assertEquals(-1, h.engine.reserve(CrossfadeEngine.Kind.AUTO_ADVANCE, 10000, 0));
        assertEquals(-1, h.engine.reserve(CrossfadeEngine.Kind.REPEAT_ONE, 10000, 0));
        assertTrue(h.engine.reserve(CrossfadeEngine.Kind.MANUAL_SKIP, 10000, 0) > 0);
    }

    @Test public void sleepEndPausesAtEndWithoutQueueAdvance() {
        Harness h = new Harness();
        h.engine.sleepEnd(true);
        CrossfadeEngine.Player current = h.engine.current();
        assertFalse(h.engine.ended(current, current.transitionGeneration));
        assertFalse(h.playing.get(h.first));
        assertEquals(CrossfadeEngine.State.PAUSED, h.engine.state());
    }

    @Test public void dismissalAndRecreationReleaseEachRetiredPlayerExactlyOnce() {
        Harness h = new Harness();
        CrossfadeEngine.Player outgoing = h.engine.current();
        CrossfadeEngine.Player in = h.overlap();
        h.engine.dispose(in.identity);
        h.engine.dispose(in.identity);
        h.engine.frames(outgoing, outgoing.transitionGeneration, facts(1, 500000, 500000, 48000, true, 0));
        assertEquals(Integer.valueOf(1), h.releases.get(h.first));
        assertNull(h.releases.get(in.identity));
        h.engine.observe(in.identity, 0.4f, true);
        assertEquals(CrossfadeEngine.State.STEADY, h.engine.state());
    }

    @Test public void normalizationChangesNeverModifyPcmEnvelope() {
        Harness h = new Harness();
        CrossfadeEngine.Player in = h.overlap();
        h.frames(in, 1, 10000, 9000, 0.3f);
        h.engine.normalization(in.identity, 0.8f);
        assertEquals(0.8f, in.normalization, 0);
        assertEquals(0.3f, in.gain, 0);
        assertEquals(2, h.envelopes.size());
    }

    @Test public void outgoingEndingBeforeFirstIncomingBufferDoesNotStrandPcmAtZero() {
        Harness h = new Harness();
        CrossfadeEngine.Player outgoing = h.engine.current();
        CrossfadeEngine.Player in = h.next(CrossfadeEngine.Kind.AUTO_ADVANCE);
        h.engine.frames(outgoing, outgoing.transitionGeneration,
                new CrossfadeEngine.Frames(1, 1000, 1000, 1000, 48000, true, true, true, false, 1));
        assertTrue(outgoing.released);
        assertEquals(CrossfadeEngine.State.PREPARING, h.engine.state());
        h.frames(in, 1, 512, 0, 0);
        assertTrue(h.envelopes.contains(in.identity));
        assertEquals(CrossfadeEngine.State.STEADY, h.engine.state());
    }

    @Test public void currentEndAdvancesAtMostOncePerTrackGeneration() {
        Harness h = new Harness();
        CrossfadeEngine.Player current = h.engine.current();
        assertTrue(h.engine.ended(current, current.transitionGeneration));
        assertFalse(h.engine.ended(current, current.transitionGeneration));
    }

    @Test public void nativeLoopOneUsesActualLoopEnumNamesAndIgnoresUnrelatedCallbacks() {
        Harness h = new Harness();
        h.engine.loopState("LOOP_ONE");
        assertTrue(h.engine.repeatOne());
        h.engine.loopState("ACTIVE_END_OF_TRACK");
        assertTrue(h.engine.repeatOne());
        for (String state : new String[]{"LOOP_OFF", "LOOP_ALL", "LOOP_DISABLED"}) {
            h.engine.loopState("LOOP_ONE");
            h.engine.loopState(state);
            assertFalse(h.engine.repeatOne());
        }
    }

    @Test public void ordinaryNativeLoadInvalidatesOldTrackEventsWithoutAllocatingAPlayer() {
        Harness h = new Harness();
        CrossfadeEngine.Player player = h.engine.current();
        long oldTransition = player.transitionGeneration;
        long oldTrack = player.trackGeneration;
        h.engine.nativeLoad();
        assertTrue(player.trackGeneration > oldTrack);
        assertFalse(h.engine.ended(player, oldTransition));
        assertTrue(h.engine.ended(player, player.transitionGeneration));
        assertSame(h.first, h.engine.current().identity);
        assertTrue(h.envelopes.isEmpty());
        assertTrue(h.releases.isEmpty());
    }

    @Test public void pendingNativeLoadKeepsItsReservedTransitionAndZeroAnchor() {
        Harness h = new Harness();
        CrossfadeEngine.Player player = h.next(CrossfadeEngine.Kind.MANUAL_SKIP);
        long transition = player.transitionGeneration;
        long track = player.trackGeneration;
        h.engine.nativeLoad();
        assertEquals(transition, player.transitionGeneration);
        assertEquals(track, player.trackGeneration);
        assertEquals(0f, player.gain, 0);
        h.frames(player, 1, 512, 0, 0);
        assertEquals(2, h.envelopes.size());
    }

    @Test public void tapStartedCurrentClearsStalePauseOverlayUsingItsActualIntent() {
        Harness h = new Harness();
        CrossfadeEngine.Player in = h.overlap();
        h.engine.pause(true);
        h.engine.intent(in, in.transitionGeneration, true, false);
        assertEquals(CrossfadeEngine.State.OVERLAPPING, h.engine.state());
        assertTrue(h.playing.get(in.identity));
        assertTrue(h.playing.get(h.first));
        assertEquals(2, h.envelopes.size());
    }

    @Test public void pausedDrainingOutgoingReleasesWithoutAnotherFrameOrEpoch() {
        Harness h = new Harness();
        CrossfadeEngine.Player outgoing = h.engine.current();
        h.overlap();
        h.frames(outgoing, 1, 4000, 2000, 0);
        h.engine.intent(outgoing, outgoing.transitionGeneration, false, false);
        assertTrue(outgoing.released);
        h.engine.intent(outgoing, outgoing.transitionGeneration, false, false);
        h.engine.modeSwitch();
        assertEquals(Integer.valueOf(1), h.releases.get(h.first));
    }

    @Test public void stoppedDrainingOutgoingReleasesWithStalledHardwareHead() {
        Harness h = new Harness();
        CrossfadeEngine.Player outgoing = h.engine.current();
        h.overlap();
        h.frames(outgoing, 1, 4000, 2000, 0);
        h.engine.frames(outgoing, outgoing.transitionGeneration,
                new CrossfadeEngine.Frames(1, 4000, 2000, 4000, 48000, true, true, false, true, 0));
        assertTrue(outgoing.released);
        assertEquals(CrossfadeEngine.State.STEADY, h.engine.state());
        assertEquals(Integer.valueOf(1), h.releases.get(h.first));
    }

    @Test public void globalPauseRetiresDrainingButPreservesAudibleOverlap() {
        Harness h = new Harness();
        CrossfadeEngine.Player outgoing = h.engine.current();
        CrossfadeEngine.Player incoming = h.overlap();
        h.frames(outgoing, 1, 4000, 2000, 0.5f);
        h.engine.pause(true);
        h.engine.frames(outgoing, outgoing.transitionGeneration,
                new CrossfadeEngine.Frames(1, 4000, 2000, 4000, 48000, true, true, false, true, 0.5f));
        assertFalse(outgoing.released);
        h.engine.pause(false);
        assertTrue(h.playing.get(h.first));
        assertTrue(h.playing.get(incoming.identity));
        h.frames(outgoing, 1, 5000, 3000, 0);
        h.engine.pause(true);
        assertTrue(outgoing.released);
        assertEquals(Integer.valueOf(1), h.releases.get(h.first));
    }

    @Test public void eosBeforeEnvelopeCompletionPreservesBufferedAudibleTail() {
        Harness h = new Harness();
        CrossfadeEngine.Player outgoing = h.engine.current();
        h.overlap();
        h.engine.frames(outgoing, outgoing.transitionGeneration,
                new CrossfadeEngine.Frames(1, 428617, 416640, 428617, 48000, true, true, true, false, 0.4f));
        assertEquals(CrossfadeEngine.Role.DRAINING, outgoing.role);
        assertFalse(outgoing.released);
        h.engine.frames(outgoing, outgoing.transitionGeneration,
                new CrossfadeEngine.Frames(1, 428617, 428616, 428617, 48000, true, true, true, false, 0));
        assertFalse(outgoing.released);
        h.engine.frames(outgoing, outgoing.transitionGeneration,
                new CrossfadeEngine.Frames(1, 428617, 428617, 428617, 48000, true, true, true, false, 0));
        assertTrue(outgoing.released);
        assertEquals(Integer.valueOf(1), h.releases.get(h.first));
    }

    @Test public void silentSubmittedSuffixDoesNotExtendAudibleDrainWatermark() {
        Harness h = new Harness();
        CrossfadeEngine.Player outgoing = h.engine.current();
        h.overlap();
        h.engine.frames(outgoing, outgoing.transitionGeneration,
                new CrossfadeEngine.Frames(1, 481024, 479999, 480000, 48000, true, true, false, false, 0));
        assertFalse(outgoing.released);
        h.engine.frames(outgoing, outgoing.transitionGeneration,
                new CrossfadeEngine.Frames(1, 482048, 480000, 480000, 48000, true, true, false, false, 0));
        assertTrue(outgoing.released);
    }

    @Test public void immediateWatermarkCompletionReleasesWhenIncomingStartsDrain() {
        Harness h = new Harness();
        CrossfadeEngine.Player outgoing = h.engine.current();
        h.frames(outgoing, 1, 4000, 4000, 0);
        h.overlap();
        assertTrue(outgoing.released);
        assertFalse(h.engine.hasRetiredPlayers());
        assertEquals(Integer.valueOf(1), h.releases.get(h.first));
    }

    @Test public void audibleIncomingCompletionRetiresZeroGainOutgoingWithStalledHead() {
        Harness h = new Harness();
        CrossfadeEngine.Player outgoing = h.engine.current();
        CrossfadeEngine.Player incoming = h.overlap();
        h.frames(outgoing, 1, 480000, 470000, 0);
        h.frames(incoming, 2, 480512, 470000, 1);
        assertFalse(outgoing.released);
        h.frames(incoming, 2, 481024, 480511, 1);
        assertFalse(outgoing.released);
        h.frames(incoming, 2, 481536, 480512, 1);
        assertTrue(outgoing.released);
        h.frames(outgoing, 1, 480000, 480000, 0);
        h.engine.modeSwitch();
        assertEquals(Integer.valueOf(1), h.releases.get(h.first));
    }

    @Test public void chainedOutgoingCompletesDrainUsingItsOwnTransitionGeneration() {
        Harness h = new Harness();
        CrossfadeEngine.Player outgoing = h.engine.current();
        h.overlap();
        h.frames(outgoing, 1, 4000, 2000, 0);
        long drainingTransition = outgoing.transitionGeneration;
        h.overlap();
        assertNotEquals(h.engine.generation(), drainingTransition);
        h.engine.frames(outgoing, drainingTransition, facts(1, 5000, 4000, 48000, true, 0));
        assertTrue(outgoing.released);
        assertEquals(Integer.valueOf(1), h.releases.get(h.first));
    }

    @Test public void nextAvailabilityRejectsForeignThreadMutation() throws Exception {
        Harness h = new Harness();
        AtomicReference<Throwable> failure = new AtomicReference<>();
        Thread thread = new Thread(() -> {
            try {
                h.engine.nextAvailability(CrossfadeEngine.NextAvailability.UNAVAILABLE);
            } catch (Throwable error) {
                failure.set(error);
            }
        });
        thread.start();
        thread.join();

        assertTrue(failure.get() instanceof IllegalStateException);
        assertTrue(h.engine.canAutoAdvance());
    }

    @Test public void reducerRejectsForeignThreadOwnershipMutation() throws Exception {
        Harness h = new Harness();
        AtomicReference<Throwable> failure = new AtomicReference<>();
        Thread thread = new Thread(() -> {
            try { h.engine.modeSwitch(); } catch (Throwable error) { failure.set(error); }
        });
        thread.start();
        thread.join();
        assertTrue(failure.get() instanceof IllegalStateException);
    }
}
