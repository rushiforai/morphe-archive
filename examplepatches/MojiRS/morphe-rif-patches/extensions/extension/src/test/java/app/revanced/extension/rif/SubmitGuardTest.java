package app.revanced.extension.rif;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;
import static org.junit.Assert.fail;

import org.junit.Test;

/** JVM tests for the cancel check in {@link SubmitGuard} (the orientation lock needs a real Activity). */
public class SubmitGuardTest {

    /** Stands for rif's x4.a: a public abstract base with a public final p() = isCancelled. */
    public abstract static class Base {
        boolean cancelled;

        public final boolean p() {
            return cancelled;
        }
    }

    /** Stands for SubmitTask: inherits p(). */
    public static class Task extends Base {}

    public static class NoCheck {}

    public static class WrongType {
        public int p() {
            return 1;
        }
    }

    @Test
    public void findsTheInheritedCheck() {
        assertNotNull(SubmitGuard.findCancelCheck(Task.class));
        assertNull(SubmitGuard.findCancelCheck(NoCheck.class));
        assertNull(SubmitGuard.findCancelCheck(WrongType.class));
    }

    @Test
    public void followsTheTasksCancelFlag() {
        Task task = new Task();
        assertFalse(SubmitGuard.isCancelled(task));
        SubmitGuard.throwIfCancelled(task);
        task.cancelled = true;
        assertTrue(SubmitGuard.isCancelled(task));
        try {
            SubmitGuard.throwIfCancelled(task);
            fail("a cancelled task must stop");
        } catch (SubmitGuard.Cancelled expected) {
            assertEquals("submit cancelled", expected.getMessage());
        }
    }

    @Test
    public void anythingElseIsNotCancelled() {
        assertFalse(SubmitGuard.isCancelled(null));
        assertFalse(SubmitGuard.isCancelled(new NoCheck()));
        assertFalse(SubmitGuard.isCancelled(new WrongType()));
        SubmitGuard.throwIfCancelled(null);
    }
}
