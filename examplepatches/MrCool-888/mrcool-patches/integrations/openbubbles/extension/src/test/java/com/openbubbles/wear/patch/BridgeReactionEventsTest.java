package com.openbubbles.wear.patch;

import com.localob.messaging.backend.domain.ReactionKind;
import org.json.JSONObject;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;
import android.app.Application;

import static org.junit.Assert.*;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 32, manifest = Config.NONE, application = Application.class,
        instrumentedPackages = {"com.localob.messaging", "kotlinx.datetime"})
public class BridgeReactionEventsTest {
    private static JSONObject event(ReactionKind reaction, boolean enabled, boolean fromMe,
                                    long timestamp, String targetGuid) throws Exception {
        return BridgeOps.reactionEventJson("reaction-1", "iMessage;-;+15551234567", timestamp,
                "Alice", reaction, enabled, fromMe, targetGuid, "target-1", "Hello there");
    }

    @Test public void mapsStandardAndCustomEmojiToBoundedEventJson() throws Exception {
        JSONObject standard = event(ReactionKind.Standard.LOVE, true, false, 1234, "target-1");
        assertEquals("reaction-1", standard.getString("id"));
        assertEquals("iMessage;-;+15551234567", standard.getString("threadId"));
        assertEquals(1234, standard.getLong("timestamp"));
        assertEquals("Alice", standard.getString("sender"));
        assertEquals("❤️ to: Hello there", standard.getString("text"));

        JSONObject custom = event(new ReactionKind.Emoji("😎"), true, false, 1234, "target-1");
        assertEquals("😎 to: Hello there", custom.getString("text"));
    }

    @Test public void excludesOwnRemovedUnknownAndUnmatchedReactions() throws Exception {
        assertNull(event(ReactionKind.Standard.LIKE, true, true, 1234, "target-1"));
        assertNull(event(ReactionKind.Standard.LIKE, false, false, 1234, "target-1"));
        assertEquals("🏷️ to: Hello there", event(ReactionKind.Sticker.INSTANCE, true, false, 1234, "target-1").getString("text"));
        assertNull(event(ReactionKind.Standard.LIKE, true, false, 1234, "other-target"));
        assertNull(event(ReactionKind.Standard.LIKE, true, false, 0, "target-1"));
        assertNull(BridgeOps.reactionEventJson("", "thread", 1234, "Alice",
                ReactionKind.Standard.LIKE, true, false, "target-1", "target-1", "Hello"));
        assertNull(BridgeOps.reactionEventJson("id", "thread", 1234, " ",
                ReactionKind.Standard.LIKE, true, false, "target-1", "target-1", "Hello"));
        assertNull(event(new ReactionKind.Emoji(""), true, false, 1234, "target-1"));
    }

    @Test public void clipsSenderAndRenderedTextTo160Characters() throws Exception {
        String longSender = new String(new char[180]).replace('\0', 's');
        String longText = new String(new char[180]).replace('\0', 'x');
        JSONObject result = BridgeOps.reactionEventJson("id", "thread", 1, longSender,
                ReactionKind.Standard.LIKE, true, false, "target-1", "target-1", longText);
        assertEquals(160, result.getString("sender").length());
        assertEquals(160, result.getString("text").length());
    }
}
