package dev.jason.gboardpatches.extension.wisprflow;

import org.junit.Test;

import java.lang.reflect.Field;
import java.util.concurrent.atomic.AtomicInteger;

import static dev.jason.gboardpatches.extension.wisprflow.WisprFlowSessionState.Action.*;
import static dev.jason.gboardpatches.extension.wisprflow.WisprFlowSessionState.Phase.*;
import static org.junit.Assert.*;

public final class WisprFlowSessionStateTest {
    @Test public void cancelReplacesFinishQueuedDuringStartup() {
        var state = new WisprFlowSessionState(100);
        assertTrue(state.queue(FINISH, 200));
        assertNull(state.takeReadyAction(200));
        assertTrue(state.queue(CANCEL, 300));
        state.update(LISTENING, false, 400);
        assertEquals(CANCEL, state.takeReadyAction(400));
        assertFalse(state.submitted());
        assertNull(state.takeReadyAction(500));
    }

    @Test public void cancelKeepsItsPhaseEvenIfWisprReportsProcessing() {
        var state = new WisprFlowSessionState(100);
        state.update(LISTENING, false, 300);
        assertTrue(state.queue(CANCEL, 400));
        assertEquals(CANCEL, state.takeReadyAction(500));
        state.update(PROCESSING, false, 700);
        assertEquals(CANCELING, state.phase());
        assertFalse(state.canCancel());
        assertFalse(state.canShowHeader());
        assertFalse(state.submitted());
    }

    @Test public void transientRepliesCannotRenewTheirDeadlines() {
        var state = new WisprFlowSessionState(100);
        state.update(STARTING, false, 2_000);
        assertEquals(12_100, state.deadline());

        state.update(LISTENING, false, 3_000);
        assertEquals(0, state.deadline());
        assertTrue(state.queue(FINISH, 4_000));
        assertEquals(FINISH, state.takeReadyAction(4_200));
        assertFalse(state.canCancel());
        assertTrue(state.canShowHeader());
        state.update(PROCESSING, true, 5_000);
        state.update(PROCESSING, false, 15_000);
        state.update(LISTENING, false, 24_000);
        assertEquals(34_200, state.deadline());

        var canceling = new WisprFlowSessionState(100);
        assertTrue(canceling.queue(CANCEL, 200));
        canceling.update(CANCELING, false, 5_000);
        assertEquals(8_200, canceling.deadline());
    }

    @Test public void rejectedFinishRestoresTheControls() {
        var state = new WisprFlowSessionState(100);
        state.update(LISTENING, false, 200);
        assertTrue(state.queue(FINISH, 300));
        assertEquals(FINISH, state.takeReadyAction(300));
        state.update(LISTENING, true, 400);
        assertTrue(state.canCancel());
        assertFalse(state.submitted());
        assertEquals(0, state.deadline());
    }

    @Test public void restartDrainsOnlyTheOwnedNativeCleanup() throws Exception {
        var shader = new FakeShader();
        Field slot = FakeShader.class.getField("callback");
        var completed = new AtomicInteger();
        Runnable cleanup = () -> {
            shader.callback = null;
            completed.incrementAndGet();
        };
        shader.callback = cleanup;
        var dismissal = new WisprFlowNativeHeader.PendingDismissal(shader, cleanup, slot);
        dismissal.complete();
        dismissal.complete();
        assertEquals(1, completed.get());
        shader.callback = completed::incrementAndGet;
        dismissal.complete();
        assertEquals(1, completed.get());
    }

    public static final class FakeShader {
        public Runnable callback;
    }
}
