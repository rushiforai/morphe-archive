package io.github.emotionbug.patcher;

import io.github.emotionbug.patches.runtime.RecorderContract;
import org.junit.Test;
import java.util.*;
import static org.junit.Assert.*;

/** Host tests of the same typed serializer and lifecycle used by the Android Binder adapter. */
public class RecorderContractTest {
    private static final class Wire implements RecorderContract.CallbackWriter {
        final List<Object> values = new ArrayList<>();
        public void token(String value) { values.add(Arrays.asList("token", value)); }
        public void string(String value) { values.add(Arrays.asList("String", value)); }
        public void duration(long value) { values.add(Arrays.asList("long", value)); }
    }
    @Test public void completedWireMatchesOriginalCallbackDecoderAndPreserves64Bits() {
        Wire wire = new Wire();
        RecorderContract.writeCompleted(wire, "01012345678_20261025.3gp", "content://media/external_primary/audio/media/42", 4294967296L);
        assertEquals(Arrays.asList(Arrays.asList("token", "com.skt.prod.tphonerecorder.IRecordCallback"),
                Arrays.asList("String", "01012345678_20261025.3gp"),
                Arrays.asList("String", "content://media/external_primary/audio/media/42"), Arrays.asList("long", 4294967296L)), wire.values);
        assertEquals(2, RecorderContract.COMPLETED);
    }
    @Test public void startedWireHasNoSyntheticUriOrDuration() {
        Wire wire = new Wire(); RecorderContract.writeStarted(wire, "number_time");
        assertEquals(2, wire.values.size()); assertEquals(1, RecorderContract.STARTED);
    }
    @Test public void invalidCompletionDoesNotWritePartialParcel() {
        for (String uri : new String[]{null, "file:///tmp/recording", "content://other/42"}) {
            Wire wire = new Wire(); assertThrows(IllegalArgumentException.class, () -> RecorderContract.writeCompleted(wire, "call", uri, 2000));
            assertTrue(wire.values.isEmpty());
        }
        assertThrows(IllegalArgumentException.class, () -> RecorderContract.requireCompletion(1999, 31999, 100));
        assertThrows(IllegalArgumentException.class, () -> RecorderContract.requireCompletion(2000, 32000, 0));
        RecorderContract.requireCompletion(2000, 32000, 100);
    }
    @Test public void outputNamePreservesNumberAndTimeButUsesRealContainerExtension() {
        assertEquals("010_20261025.m4a", RecorderContract.displayName("010_20261025.3gp"));
        assertEquals("010_20261025.m4a", RecorderContract.displayName("010_20261025"));
        for (String name : new String[]{null, "", "../call", "a\\b", "..", "a\0b"})
            assertThrows(IllegalArgumentException.class, () -> RecorderContract.displayName(name));
    }
    @Test public void lifecycleRequiresActualStartThenRequestedStopBeforeCompletion() {
        RecorderContract.Lifecycle state = new RecorderContract.Lifecycle();
        assertThrows(IllegalStateException.class, state::complete); state.begin();
        assertThrows(IllegalStateException.class, state::complete); state.started();
        assertThrows(IllegalStateException.class, state::complete); state.stop(); state.complete();
        assertEquals(RecorderContract.Phase.FINISHED, state.phase()); assertFalse(state.fail());
        assertThrows(IllegalStateException.class, state::complete);
    }
    @Test public void deathOrFailureIsTerminalAndCannotEmitSuccess() {
        for (int stage = 0; stage < 3; stage++) {
            RecorderContract.Lifecycle state = new RecorderContract.Lifecycle(); state.begin();
            if (stage > 0) state.started(); if (stage > 1) state.stop();
            assertTrue(state.fail()); assertFalse(state.fail()); assertThrows(IllegalStateException.class, state::complete);
        }
    }
}
