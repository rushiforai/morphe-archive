package app.template.extension.extension;

import static org.junit.Assert.assertArrayEquals;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

/**
 * Unit tests for the Mereframe native-integrity fail-open handlers.
 *
 * These cover the two decisions the injected wrapper handlers depend on:
 * an integrity failure is answered with a well-formed value, and anything
 * else is re-thrown untouched so unrelated bugs keep their own stack.
 */
public class MereframeIntegrityHookTest {

    @Test
    public void securityExceptionIsAnsweredWithFailOpenLongArray() {
        long[] result = MereframeIntegrityHook.failOpenLongArray(
                new SecurityException("app integrity check failed"));

        assertArrayEquals(new long[]{0L, 1L}, result);
    }

    @Test
    public void integrityMessageWithoutSecurityExceptionIsStillContained() {
        // The native engine could JNI-throw a differently typed error; the
        // message is the second signal the hook matches on.
        assertArrayEquals(
                new int[]{0, 1},
                MereframeIntegrityHook.failOpenIntArray(new RuntimeException("app integrity check failed")));
    }

    @Test
    public void scalarAndReferenceHandlersFailOpen() {
        assertEquals(0, MereframeIntegrityHook.failOpenInt(new SecurityException("app integrity check failed")));
        assertEquals(0L, MereframeIntegrityHook.failOpenLong(new SecurityException("app integrity check failed")));
        assertEquals("", MereframeIntegrityHook.failOpenString(new SecurityException("app integrity check failed")));
        assertTrue(MereframeIntegrityHook.failOpenBooleanArray(new SecurityException("app integrity check failed"))[1]);
    }

    @Test(expected = IllegalStateException.class)
    public void unrelatedThrowableIsRethrownUnchanged() {
        MereframeIntegrityHook.failOpenLongArray(new IllegalStateException("unrelated native failure"));
    }

    @Test(expected = IllegalStateException.class)
    public void voidHandlerAlsoRethrowsUnrelatedThrowable() {
        MereframeIntegrityHook.failOpenVoid(new IllegalStateException("unrelated native failure"));
    }
}
