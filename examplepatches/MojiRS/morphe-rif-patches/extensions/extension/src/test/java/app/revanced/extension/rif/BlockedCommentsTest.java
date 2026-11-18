package app.revanced.extension.rif;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

public class BlockedCommentsTest {

    @Test
    public void hidesOnlyWhenEnabledNearBlockedAndDistinguished() {
        assertTrue(BlockedComments.shouldHide(true, true, "moderator"));
        assertTrue(BlockedComments.shouldHide(true, true, "admin"));
        assertFalse(BlockedComments.shouldHide(false, true, "moderator"));
        assertFalse(BlockedComments.shouldHide(true, false, "moderator"));
        assertFalse(BlockedComments.shouldHide(true, true, null));
        assertFalse(BlockedComments.shouldHide(true, true, ""));
    }
}
