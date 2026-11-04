package app.wordfeudwordfinder.extension.play;

import static org.junit.Assert.assertArrayEquals;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import java.nio.ByteBuffer;
import org.junit.Test;

public class JniDispatchTest {
    /** Same signature as Flutter's public FlutterJNI.dispatchPlatformMessage. */
    public static class FakeJni {
        String channel;
        byte[] bytes;
        int position;
        int responseId = -1;
        boolean direct;

        public void dispatchPlatformMessage(String channel, ByteBuffer message, int position, int responseId) {
            this.channel = channel;
            this.position = position;
            this.responseId = responseId;
            this.direct = message.isDirect();
            ByteBuffer d = message.duplicate();
            d.flip();
            bytes = new byte[d.remaining()];
            d.get(bytes);
        }
    }

    /** Non-public variant in a super class: found with getDeclaredMethod up the hierarchy. */
    static class HiddenBase {
        Object[] got;

        @SuppressWarnings("unused")
        private void dispatchPlatformMessage(String channel, ByteBuffer message, int position, int responseId) {
            got = new Object[] {channel, position, responseId};
        }
    }

    static final class HiddenJni extends HiddenBase {
    }

    static final class NoJni {
        @SuppressWarnings("unused")
        public void dispatchPlatformMessage(String channel, ByteBuffer message, int position) {
        }
    }

    @Test
    public void publicMethodViaGetMethod() throws Exception {
        JniDispatch.Lookup l = JniDispatch.lookup(FakeJni.class);
        assertEquals("getMethod", l.how);
        assertSame(l, JniDispatch.lookup(FakeJni.class)); // cached
        FakeJni jni = new FakeJni();
        JniDispatch.dispatch(l, jni, "flutter/navigation", new byte[] {1, 2, 3});
        assertEquals("flutter/navigation", jni.channel);
        assertArrayEquals(new byte[] {1, 2, 3}, jni.bytes);
        assertEquals(3, jni.position); // position = message length
        assertEquals(0, jni.responseId); // no reply
        assertTrue(jni.direct);
    }

    @Test
    public void declaredMethodUpTheHierarchy() throws Exception {
        JniDispatch.Lookup l = JniDispatch.find(HiddenJni.class);
        assertEquals("getDeclaredMethod on HiddenBase", l.how);
        HiddenJni jni = new HiddenJni();
        JniDispatch.dispatch(l, jni, "c", new byte[5]);
        assertArrayEquals(new Object[] {"c", 5, 0}, jni.got);
    }

    @Test
    public void missingMethod() {
        assertNull(JniDispatch.find(NoJni.class));
        assertNull(JniDispatch.lookup(NoJni.class));
        assertNull(JniDispatch.find(null));
    }
}
