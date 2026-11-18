package io.github.sabopura.morphe.extension.twitch.chat;

import android.content.SharedPreferences;

import io.github.sabopura.morphe.extension.twitch.chat.emotes.EmotePicker;

import org.json.JSONArray;
import org.json.JSONObject;
import org.junit.Test;

import java.lang.reflect.Proxy;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.Set;

import static org.junit.Assert.*;

public class ChatParsersTest {
    /** Twitch reports refused joins with an empty or missing name; they do not move chat to another channel. */
    @Test
    public void onlyAJoinWithAChannelNameChangesTheCurrentChannel() {
        ChatEnhancements.onChannelJoin(new Object() {
            @Override
            public String toString() {
                return "123";
            }
        }, "alice");
        ChatEnhancements.onChannelJoin("999", "");
        ChatEnhancements.onChannelJoin("999", null);
        ChatEnhancements.onChannelJoin(null, "bob");
        assertEquals("123", ChatEnhancements.channelId());
        assertEquals("alice", ChatEnhancements.channelName());
        ChatEnhancements.onChannelJoin(7, "bob");
        assertEquals("7", ChatEnhancements.channelId());
        assertEquals("bob", ChatEnhancements.channelName());
    }

    @Test
    public void badgesOfEveryProviderMapToUserIds() throws Exception {
        Map<String, List<ChatMetadata.Badge>> ffz = ChatMetadata.parseBadges("ffz", new JSONObject(
                "{\"badges\":[{\"id\":7,\"title\":\"Dev\",\"urls\":{\"2\":\"//cdn/x.png\"}}],\"users\":{\"7\":[\"123\"]}}"));
        assertEquals("https://cdn/x.png", ffz.get("123").get(0).url);
        assertEquals("T", ChatMetadata.parseBadges("chatterino", new JSONObject(
                "{\"badges\":[{\"tooltip\":\"T\",\"image2\":\"https://x/2.png\",\"users\":[\"1\",\"not-an-id\"]}]}")).get("1").get(0).title);
        assertEquals("D", ChatMetadata.parseBadges("bttv", new JSONArray(
                "[{\"providerId\":\"5\",\"badge\":{\"description\":\"D\",\"svg\":\"https://b/s.svg\"}}]")).get("5").get(0).title);
        assertEquals("Top", ChatMetadata.parseBadges("dankchat", new JSONArray(
                "[{\"type\":\"Top\",\"url\":\"https://d/x.png\",\"users\":[\"9\"]}]")).get("9").get(0).title);
        assertEquals("Chat", ChatMetadata.parseBadges("chatsen", new JSONObject(
                "{\"badges\":[{\"name\":\"n\",\"title\":\"Chat\",\"image\":\"https://c/i.png\"}],\"users\":[{\"id\":\"3\",\"badges\":[{\"badgeName\":\"n\"}]}]}")).get("3").get(0).title);
    }

    @Test
    public void loginIsShownOnlyWhenTheNameHidesIt() {
        assertEquals(5, ChatEnhancements.loginInsertion("表示名さん: hi", "alice"));
        assertEquals(-1, ChatEnhancements.loginInsertion("ALICE: hi", "alice"));
        assertEquals(-1, ChatEnhancements.loginInsertion("no sender here", "alice"));
        assertEquals(-1, ChatEnhancements.loginInsertion("Name: hi", "bad login"));
    }

    @Test
    public void tokenStartFindsTheWordBeforeTheCursor() {
        assertEquals(6, EmotePicker.tokenStart("hello :Se tail", 9));
        assertEquals(0, EmotePicker.tokenStart("hello", 3));
        assertEquals(0, EmotePicker.tokenStart("hello", -1));
        assertEquals(3, EmotePicker.tokenStart("hi there", 3));
    }

    private static SharedPreferences prefs(String... enabled) {
        Set<String> on = new java.util.HashSet<>(Arrays.asList(enabled));
        return (SharedPreferences) Proxy.newProxyInstance(SharedPreferences.class.getClassLoader(), new Class<?>[]{SharedPreferences.class},
                (proxy, method, args) -> method.getName().equals("getBoolean") ? on.contains(args[0]) : null);
    }

    @Test
    public void followingSectionsDisappearWithTheirRows() {
        List<String> rows = Arrays.asList("#ContinueWatching", "a", "#FollowedOfflineChannels", "b", "c");
        java.util.function.Function<String, String> section = r -> r.startsWith("#") ? r.substring(1) : null;
        assertSame(rows, FeedFilters.filterSections(rows, prefs(), section));
        assertEquals(Arrays.asList("#ContinueWatching", "a"),
                FeedFilters.filterSections(rows, prefs("hide_offline_channels"), section));
    }

    static class HighlightBase {
        final String key;
        final boolean flag;

        HighlightBase(String key) {
            this.key = key;
            flag = false;
        }
    }

    static final class HypeTrain extends HighlightBase {
        HypeTrain() {
            super("hype_train");
        }
    }

    static final class Wrapper {
        final Object inner = new HypeTrain();
    }

    @Test
    public void highlightTypeIsFoundByItsShapeEvenInsideAWrapper() {
        assertEquals("hype_train", ViewCustomization.highlightType(new HypeTrain(), 0));
        assertEquals("hype_train", ViewCustomization.highlightType(new Wrapper(), 0));
        assertNull(ViewCustomization.highlightType(new Object(), 0));
    }
}
