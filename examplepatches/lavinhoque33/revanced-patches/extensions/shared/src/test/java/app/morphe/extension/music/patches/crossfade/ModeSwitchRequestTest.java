/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0 or later.
 * Written by lavinhoque33, 2026-11-13.
 */
package app.morphe.extension.music.patches.crossfade;

import org.junit.Test;

import static org.junit.Assert.*;

public class ModeSwitchRequestTest {
    private final Object owner = new Object();
    private final Object player = new Object();

    private ModeSwitchRequest request() {
        return new ModeSwitchRequest(owner, player, 7, 9, 11, "song", "video");
    }

    @Test public void ownLoadCompletesOnlyItsRequest() {
        ModeSwitchRequest request = request();
        assertTrue(request.queueCommand(12));
        request.dispatched();
        assertTrue(request.loaded(owner, player, 7, 9, 12, "video"));
        assertTrue(request.loadStarted);
        assertTrue(request.ended);
        assertFalse(request.loaded(owner, player, 7, 9, 12, "video"));
    }

    @Test public void unrelatedLoadCannotAcknowledgeTheSwitch() {
        ModeSwitchRequest request = request();
        request.dispatched();
        assertFalse(request.loaded(owner, player, 7, 9, 11, "another-song"));
        assertFalse(request.loadStarted);
        assertTrue(request.ended);
    }

    @Test public void realNextWhileSwitchLoadIsPendingInvalidatesTheRequest() {
        ModeSwitchRequest request = request();
        assertTrue(request.queueCommand(12));
        request.dispatched();
        assertFalse(request.queueCommand(13));
        assertFalse(request.matches(owner, player, 7, 9, 13));
        assertFalse(request.loaded(owner, player, 7, 9, 13, "video"));
    }

    @Test public void displayOnlySwitchCannotClaimALaterLoad() {
        ModeSwitchRequest request = new ModeSwitchRequest(owner, player, 7, 9, 11, null, null);
        request.dispatched();
        assertFalse(request.loaded(owner, player, 7, 9, 11, "next-song"));
        assertFalse(request.loadStarted);
    }

    @Test public void synchronousStockSwitchMayAcknowledgeItsOwnLoad() {
        ModeSwitchRequest request = new ModeSwitchRequest(owner, player, 7, 9, 11, null, null);
        assertTrue(request.loaded(owner, player, 7, 9, 11, "video"));
    }

    @Test public void unfinishedSwitchExpiresAndRejectsLateCallbacks() {
        ModeSwitchRequest request = request();
        request.dispatched();
        assertTrue(request.finish());
        assertFalse(request.finish());
        assertFalse(request.loaded(owner, player, 7, 9, 11, "video"));
    }

    @Test public void changedTransitionGenerationCancelsAnUnfinishedSwitch() {
        ModeSwitchRequest request = request();
        assertFalse(request.matches(owner, player, 7, 10, 11));
        assertTrue(request.ended);
        assertFalse(request.loadStarted);
    }

    @Test public void changedLoadGenerationCannotCompleteAnOldRequest() {
        ModeSwitchRequest request = request();
        assertFalse(request.loaded(owner, player, 8, 9, 11, "video"));
        assertTrue(request.ended);
    }

    @Test public void changedPlayerCannotConsumeOldModeIntent() {
        assertFalse(request().matches(owner, new Object(), 7, 9, 11));
    }

    @Test public void changedCoordinatorCannotConsumeOldModeIntent() {
        assertFalse(request().matches(new Object(), player, 7, 9, 11));
    }

    @Test public void queueGenerationMustBelongToTheDispatch() {
        assertFalse(request().matches(owner, player, 7, 9, 12));
    }

    @Test public void oldTimeoutCannotFinishANewerRequest() {
        ModeSwitchRequest old = request();
        ModeSwitchRequest newer = request();
        old.finish();
        assertTrue(newer.matches(owner, player, 7, 9, 11));
    }

    private static final class Output implements CrossfadeEngine.Output {
        float incomingGain = -1;
        public void anchor(Object player, float gain) { incomingGain = gain; }
        public void envelope(Object player, float target, long durationMs, int curve) { }
        public void play(Object player, boolean playing) { }
        public void select(Object previous, Object current) { }
        public void release(Object player) { }
        public void role(Object player, CrossfadeEngine.Role role) { }
    }

    private void assertNextFades(boolean pending) {
        Output output = new Output();
        CrossfadeEngine engine = new CrossfadeEngine(output);
        engine.observe(player, 0.6f, true);
        engine.modeSwitch();
        ModeSwitchRequest request = new ModeSwitchRequest(owner, player, 7, engine.generation(), 11,
                "song", "video");
        request.dispatched();
        if (!pending) request.finish();
        assertFalse(request.queueCommand(12));

        long transition = engine.reserve(CrossfadeEngine.Kind.MANUAL_SKIP, 10_000, 0);
        assertTrue(engine.prepared(transition, new Object(), 0.6f));
        assertEquals(CrossfadeEngine.Kind.MANUAL_SKIP, engine.kind());
        assertEquals(CrossfadeEngine.State.PREPARING, engine.state());
        assertEquals(0, output.incomingGain, 0);
    }

    @Test public void completedSwitchThenImmediateNextUsesTheFadeReducer() {
        assertNextFades(false);
    }

    @Test public void nextWhileSwitchLoadPendingUsesTheFadeReducer() {
        assertNextFades(true);
    }
}
