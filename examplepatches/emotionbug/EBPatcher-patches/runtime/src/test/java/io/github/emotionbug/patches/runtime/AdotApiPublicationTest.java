package io.github.emotionbug.patches.runtime;

import org.junit.Test;
import static org.junit.Assert.*;

public final class AdotApiPublicationTest {
    @Test public void endingOneSuspendedResponseCannotAdmitLocalWritesDuringAnother() {
        Object first = new Object(), second = new Object();
        try {
            AdotApiPublication.begin(first);
            AdotApiPublication.begin(second);
            assertTrue(AdotApiPublication.active());
            assertFalse(AdotApiPublication.end(first));
            assertTrue(AdotApiPublication.active());
            // Exceptional cleanup or a repeated completion must not release someone else's owner.
            assertFalse(AdotApiPublication.end(first));
            assertFalse(AdotApiPublication.end(new Object()));
            assertTrue(AdotApiPublication.active());
            assertTrue(AdotApiPublication.end(second));
            assertFalse(AdotApiPublication.active());
        } finally {
            AdotApiPublication.end(first);
            AdotApiPublication.end(second);
        }
    }
}
