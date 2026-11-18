package io.github.sabopura.morphe.extension.twitch.danmaku;

import io.github.sabopura.morphe.extension.twitch.chat.ChatRules;

import org.junit.Test;

import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

import static org.junit.Assert.*;

public class ChatMessageReaderTest {
    private static Object token(String description) {
        return new Object() {
            @Override
            public String toString() {
                return description;
            }
        };
    }

    private static Map<String, String> tags() {
        Map<String, String> tags = new HashMap<>();
        tags.put("id", "m1");
        tags.put("display-name", "Alice");
        tags.put("user-id", "42");
        return tags;
    }

    @Test
    public void readsTheSenderForTheChatFilters() {
        ChatMessageReader.Comment c = ChatMessageReader.read(tags(), "alice", 0xFF00FF, Arrays.asList(token("TextToken(text=hello)")), null);
        assertEquals("Alice", c.author);
        assertEquals("alice", c.login);
        assertEquals("42", c.userId);
        assertEquals("hello", c.plainText);
    }

    /** IRC chat messages have no "login" tag, so a user hidden by login name is matched through the sender. */
    @Test
    public void aUserHiddenByLoginNameIsHiddenFromChatWithoutALoginTag() {
        ChatMessageReader.Comment c = ChatMessageReader.read(tags(), "alice", null, Arrays.asList(token("TextToken(text=hello)")), null);
        assertTrue(new ChatRules("", "@alice", "", "").blocks(c.plainText, c.login, c.userId));
    }

    @Test
    public void aSenderWithoutDisplayNameIsShownByLogin() {
        Map<String, String> tags = tags();
        tags.remove("display-name");
        assertEquals("alice", ChatMessageReader.read(tags, "alice", null, Arrays.asList(token("TextToken(text=hi)")), null).author);
    }

    @Test
    public void addsTheGigantifiedEmote() {
        ChatMessageReader.Comment c = ChatMessageReader.read(tags(), "alice", null, Arrays.asList(token("TextToken(text=hi )")),
                token("EmoteToken(id=25, text=Kappa)"));
        assertEquals(2, c.segments.size());
        assertTrue(c.segments.get(1).isEmote());
    }

    @Test
    public void aMessageWithNothingToShowIsDropped() {
        assertNull(ChatMessageReader.read(tags(), "alice", null, Arrays.asList(token("UnknownToken(x=1)")), null));
    }

    @Test
    public void sentTimePrefersTheTagAndConvertsSeconds() {
        Map<String, String> tags = tags();
        tags.put("tmi-sent-ts", "1700000000123");
        assertEquals(1700000000123L, ChatMessageReader.sentAt(tags, 5L));
        assertEquals(1700000000000L, ChatMessageReader.sentAt(tags(), 1700000000L));
        assertEquals(1700000000123L, ChatMessageReader.sentAt(null, 1700000000123L));
        assertEquals(0L, ChatMessageReader.sentAt(null, null));
    }
}
