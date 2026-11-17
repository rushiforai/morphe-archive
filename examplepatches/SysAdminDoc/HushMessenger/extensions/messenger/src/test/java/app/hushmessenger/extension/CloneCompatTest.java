package app.hushmessenger.extension;

import android.content.Context;
import android.content.ContextWrapper;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;
import static org.junit.Assert.*;

/** A copy another patch renamed asks for its own provider names, since the name it runs under isn't in its code. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = {28, 36})
public class CloneCompatTest {
    private static final String MESSENGER = "com.facebook.orca";
    private static final String COPY = "com.example.copy";
    private static final String MUTED = "content://" + MESSENGER + ".ClientMessagePushDedupInfoProvider/mutestatus";

    private static Context runningAs(String packageName) {
        return new ContextWrapper(RuntimeEnvironment.getApplication()) {
            @Override public String getPackageName() { return packageName; }
        };
    }

    @Test public void messengersOwnNamesAreLeftAloneAndACopysAreMoved() {
        assertEquals(MESSENGER + ".tam-attachment", CloneCompat.swap(MESSENGER + ".tam-attachment", MESSENGER));
        assertEquals(MUTED, CloneCompat.swap(MUTED, MESSENGER));
        assertEquals(COPY + ".tam-attachment", CloneCompat.swap(MESSENGER + ".tam-attachment", COPY));
        assertEquals("content://" + COPY + ".ClientMessagePushDedupInfoProvider/mutestatus", CloneCompat.swap(MUTED, COPY));
        // The Facebook app's own names are nobody's copy.
        assertEquals("com.facebook.katana.tam-attachment", CloneCompat.swap("com.facebook.katana.tam-attachment", COPY));
    }

    @Test public void aNameItCantWorkOutStaysMessengersOwn() {
        assertEquals(MUTED, CloneCompat.swap(MUTED, null));
    }

    @Test public void theRunningCopyComesFromItsContextAndOtherwiseFromItsProcess() {
        assertEquals(COPY, CloneCompat.packageOf(runningAs(COPY), "com.facebook.orca"));
        // Providers are built before the Application, so the earliest names come from the process name.
        assertEquals(COPY, CloneCompat.packageOf(null, COPY));
        assertEquals(COPY, CloneCompat.packageOf(null, COPY + ":push"));
        assertEquals(MESSENGER, CloneCompat.packageOf(null, null));
        assertEquals(MESSENGER, CloneCompat.packageOf(null, ""));
    }

    @Test public void everyNameItHandsBackNamesTheSameCopy() {
        assertEquals(CloneCompat.own(MESSENGER + ".tam-attachment"), CloneCompat.ATTACHMENTS);
        assertTrue(CloneCompat.ATTACHMENTS.endsWith(".tam-attachment"));
        assertTrue(CloneCompat.PUSH_DEDUP.endsWith(".ClientMessagePushDedupInfoProvider"));
        // Messenger's provider matches the authority its own URIs carry, so the two have to agree.
        assertEquals("content://" + CloneCompat.PUSH_DEDUP + "/mutestatus", CloneCompat.MUTED_CHATS);
        assertEquals("content://" + CloneCompat.PUSH_DEDUP + "/userfriendship", CloneCompat.FRIENDSHIPS);
        String copy = CloneCompat.PUSH_DEDUP.substring(0, CloneCompat.PUSH_DEDUP.indexOf(".ClientMessage"));
        assertEquals(copy + ".tam-attachment", CloneCompat.ATTACHMENTS);
    }
}
