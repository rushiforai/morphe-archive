package app.wordfeudwordfinder.extension.hooks;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;

import java.lang.ref.WeakReference;
import java.nio.ByteBuffer;
import java.nio.charset.StandardCharsets;
import org.junit.Test;

public class RouteTapJniTest {
    @Test
    public void capturesTheLatestJniAndStillHandlesTheMessage() {
        Object first = new Object();
        Object second = new Object();
        String json = "{\"method\":\"routeInformationUpdated\",\"args\":{\"uri\":\"/game/777\"}}";
        ByteBuffer msg = ByteBuffer.wrap(json.getBytes(StandardCharsets.UTF_8));
        RouteTap.onPlatformMessage(first, "flutter/navigation", msg);
        assertSame(first, RouteTap.flutterJni());
        assertEquals(Long.valueOf(777L), RouteTap.currentGameId()); // delegates to the message handling
        assertEquals("/game/777", RouteTap.lastRoute()); // kept for Copy details (route=)
        assertEquals(0, msg.position());
        RouteTap.onPlatformMessage(second, "x", ByteBuffer.wrap(new byte[0]));
        assertSame(second, RouteTap.flutterJni());
        RouteTap.onPlatformMessage(null, "x", null); // no JNI, no message: ignored, keeps the last one
        assertSame(second, RouteTap.flutterJni());
    }

    @Test
    public void doesNotKeepTheJniAlive() throws Exception {
        Object jni = new Object();
        WeakReference<Object> probe = new WeakReference<>(jni);
        RouteTap.onPlatformMessage(jni, "y", ByteBuffer.wrap(new byte[0]));
        jni = null;
        for (int i = 0; i < 50 && probe.get() != null; i++) {
            System.gc();
            Thread.sleep(20);
        }
        assertNull(probe.get());
        assertNull(RouteTap.flutterJni());
    }
}
