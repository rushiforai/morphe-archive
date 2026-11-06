package com.openbubbles.wear.patch;

import android.app.Application;
import org.json.JSONArray;
import org.json.JSONObject;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;
import java.util.concurrent.atomic.AtomicInteger;
import static org.junit.Assert.*;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 32, manifest = Config.NONE, application = Application.class)
public class ChatNamesTest {
    private static final String ID = "12345678-1234-5678-9abc-123456789abc";
    private JSONObject chat(String title, boolean group, String... members) throws Exception {
        JSONObject chat = new JSONObject().put("id", "chat_" + ID).put("title", title)
                .put("isGroup", group).put("participants", new JSONArray(members));
        if (!group && members.length > 0) chat.put("address", members[0]);
        return chat;
    }

    @Test public void resolvesDirectNamesWithoutChangingRoutingFields() throws Exception {
        for (String fallback : new String[]{ID, "Conversation", "+15551234567", "chat125428204935"}) {
            JSONObject row = chat(fallback, false, "+15551234567");
            new ChatNames(address -> "Alex").apply(row);
            assertEquals("Alex", row.getString("title"));
            assertEquals("chat_" + ID, row.getString("id"));
            assertEquals("+15551234567", row.getString("address"));
            assertEquals("+15551234567", row.getJSONArray("participants").getString(0));
        }
    }

    @Test public void keepsCustomGroupNamesAndResolvesUnnamedGroups() throws Exception {
        ChatNames names = new ChatNames(address -> address.equals("alex@example.com") ? "Alex" : "Sam");
        JSONObject named = chat("Class 2026", true, "alex@example.com", "+15557654321");
        new ChatNames(address -> { throw new AssertionError("Custom title must be preserved"); }).apply(named);
        assertEquals("Class 2026", named.getString("title"));
        for (String fallback : new String[]{"a".repeat(72), "Group", "alex@example.com, +15557654321", "chat125428204935"}) {
            JSONObject row = chat(fallback, true, "alex@example.com", "+15557654321");
            names.apply(row);
            assertEquals("Alex, Sam", row.getString("title"));
            assertEquals(2, row.getJSONArray("participants").length());
        }
    }

    @Test public void missingContactsAndLookupFailuresKeepUsableFallbacks() throws Exception {
        JSONObject row = chat("Group", true, "alex@example.com", "+15557654321");
        new ChatNames(address -> { throw new Exception("Contact lookup unavailable"); }).apply(row);
        assertEquals("alex@example.com, +15557654321", row.getString("title"));
        ChatNames names = new ChatNames(address -> address);
        assertEquals("alex@example.com", names.sender("alex@example.com"));
        assertEquals("Existing name", names.sender("Existing name"));
    }

    @Test public void resolvesEachAddressOncePerRequestAcrossChatsAndSenders() throws Exception {
        AtomicInteger calls = new AtomicInteger();
        ChatNames names = new ChatNames(address -> { calls.incrementAndGet(); return "Alex"; });
        for (int i = 0; i < 90; i++) names.apply(chat("Conversation", false, "alex@example.com"));
        assertEquals("Alex", names.sender("MAILTO:Alex@example.com"));
        assertEquals(1, calls.get());
        names.apply(chat("Conversation", false, "new@example.com"));
        assertEquals(2, calls.get());
    }

    @Test public void boundsResolvedNamesWithoutSplittingEmoji() throws Exception {
        JSONObject row = chat("Conversation", false, "alex@example.com");
        new ChatNames(address -> "x".repeat(159) + "😀").apply(row);
        assertEquals("x".repeat(159), row.getString("title"));
    }
}
