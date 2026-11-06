package dev.twitchpatches.extension.emotes;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import org.junit.Test;

public class FavoriteEmoteKeysTest {
    @Test public void twitchEmotesUseTheirIdAndProviderEmotesTheirProviderId() {
        assertEquals("t:emotesv2_abc", FavoriteEmoteKeys.ofPickerId("emotesv2_abc"));
        assertEquals("c:betterttv:5f1b", FavoriteEmoteKeys.ofPickerId(EmotePickerRuntime.PREFIX + "https://cdn.betterttv.net/emote/5f1b/2x.gif"));
        assertEquals("c:7tv:01GB", FavoriteEmoteKeys.ofProviderImage("https://cdn.7tv.app/emote/01GB/2x.webp"));
        assertEquals("c:frankerfacez:128054", FavoriteEmoteKeys.ofProviderImage("https://cdn.frankerfacez.com/emote/128054/animated/2.gif"));
        assertNull(FavoriteEmoteKeys.ofProviderImage("https://cdn.example.test/emote/1/2x.webp"));
    }

    @Test public void onlyWellFormedKeysAreAccepted() {
        assertTrue(FavoriteEmoteKeys.valid("t:25"));
        assertTrue(FavoriteEmoteKeys.valid("c:7tv:01GB"));
        for (String invalid : new String[] {null, "", "t:", "x:25", "25", "c:two words", "t:" + "a".repeat(129)})
            assertFalse(String.valueOf(invalid), FavoriteEmoteKeys.valid(invalid));
    }

    @Test public void togglingAddsToTheEndAndRemovesInPlace() {
        List<String> keys = FavoriteEmoteKeys.toggled(Arrays.asList("t:1", "t:2"), "t:3");
        assertEquals(Arrays.asList("t:1", "t:2", "t:3"), keys);
        assertEquals(Arrays.asList("t:1", "t:3"), FavoriteEmoteKeys.toggled(keys, "t:2"));
        assertEquals(Collections.singletonList("t:1"), FavoriteEmoteKeys.toggled(Collections.emptyList(), "t:1"));
    }

    @Test public void lockedEmoteDetailsRequireATokenChannelAndKnownKind() {
        assertEquals("aurumWave", FavoriteEmoteDetails.of("aurumWave", "12345", "SUBSCRIPTIONS").token);
        assertEquals("FOLLOWER", FavoriteEmoteDetails.of("x", "1", "FOLLOWER").kind);
        assertNull(FavoriteEmoteDetails.of(null, "1", "FOLLOWER"));
        assertNull(FavoriteEmoteDetails.of("", "1", "FOLLOWER"));
        assertNull(FavoriteEmoteDetails.of("x", null, "FOLLOWER"));
        assertNull(FavoriteEmoteDetails.of("x", "channel", "FOLLOWER"));
        assertNull(FavoriteEmoteDetails.of("x", "1", "MADE_UP"));
        assertNull(FavoriteEmoteDetails.of("x", "1", null));
    }

    @Test public void theOldestFavoriteLeavesAtTheLimit() {
        List<String> keys = new ArrayList<>();
        for (int index = 0; index < FavoriteEmoteKeys.LIMIT; index++) keys.add("t:" + index);
        List<String> next = FavoriteEmoteKeys.toggled(keys, "t:new");
        assertEquals(FavoriteEmoteKeys.LIMIT, next.size());
        assertEquals("t:1", next.get(0));
        assertEquals("t:new", next.get(next.size() - 1));
    }
}
