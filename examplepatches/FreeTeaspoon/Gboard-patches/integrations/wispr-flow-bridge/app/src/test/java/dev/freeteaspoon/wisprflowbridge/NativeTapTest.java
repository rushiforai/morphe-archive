package dev.freeteaspoon.wisprflowbridge;

import org.junit.Test;
import static org.junit.Assert.*;

public class NativeTapTest {
    public static class Gate {
        boolean handled;
        public Object invoke() { return handled; }
    }
    public static class Toggle {
        int calls;
        Object submit;
        Object longPress;
        final Result result = new Result();
        public Object invoke(Object submit, Object longPress) {
            this.submit = submit;
            this.longPress = longPress;
            calls++;
            return result;
        }
    }
    public static class Result {
        Object event;
        public Object getFollowUp() { return event; }
    }
    public static class Sink {
        Object event;
        public Object invoke(Object event) { this.event = event; return null; }
    }

    @Test public void permissionGatewayPreventsRecording() throws Exception {
        Gate gate = new Gate(); gate.handled = true;
        Toggle toggle = new Toggle();
        NativeTap.run(gate, toggle, new Sink());
        assertEquals(0, toggle.calls);
    }

    @Test public void shortTapSubmitsAndDispatchesTheNativeFollowUp() throws Exception {
        Toggle toggle = new Toggle();
        toggle.result.event = new Object();
        Sink sink = new Sink();
        NativeTap.run(new Gate(), toggle, sink);
        assertEquals(1, toggle.calls);
        assertEquals(Boolean.TRUE, toggle.submit);
        assertEquals(Boolean.FALSE, toggle.longPress);
        assertSame(toggle.result.event, sink.event);
    }

    @Test public void ignoredToggleDoesNotDispatchAnEvent() throws Exception {
        Sink sink = new Sink();
        NativeTap.run(new Gate(), new Toggle(), sink);
        assertNull(sink.event);
    }
}
