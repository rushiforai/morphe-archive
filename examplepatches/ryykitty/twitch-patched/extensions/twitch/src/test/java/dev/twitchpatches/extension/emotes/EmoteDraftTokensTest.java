package dev.twitchpatches.extension.emotes;

import org.junit.Test;
import java.util.LinkedHashMap;
import java.util.Map;
import static org.junit.Assert.*;

public class EmoteDraftTokensTest {
    private static Map<String, Emote> catalog() {
        Map<String, Emote> catalog = new LinkedHashMap<>();
        for (String code : new String[] {"KEK", "KEKW", "xKEK", "FFZ"})
            catalog.put(code, new Emote(code, "https://example.test/" + code + ".gif", true, false));
        return catalog;
    }

    @Test public void onlyCompleteKnownTokensLoseTheirWrapper() {
        assertEquals("KEK FFZ :Unknown: :kek: :KE", EmoteDraftTokens.normalize(":KEK: :FFZ: :Unknown: :kek: :KE", catalog()));
        assertEquals("/me :KEK:", EmoteDraftTokens.normalize("/me :KEK:", catalog()));
        assertEquals("https://host/:KEK: hello:KEK:", EmoteDraftTokens.normalize("https://host/:KEK: hello:KEK:", catalog()));
        assertEquals("KEK\nFFZ", EmoteDraftTokens.normalize(":KEK:\n:FFZ:", catalog()));
    }

    @Test public void selectionTracksRemovedColonsBeforeAndInsideTokens() {
        String text = "hi :KEK: :FFZ: tail";
        assertEquals(0, EmoteDraftTokens.selection(text, 0, catalog()));
        assertEquals(3, EmoteDraftTokens.selection(text, 3, catalog()));
        assertEquals(3, EmoteDraftTokens.selection(text, 4, catalog()));
        assertEquals(6, EmoteDraftTokens.selection(text, 8, catalog()));
        assertEquals(10, EmoteDraftTokens.selection(text, 14, catalog()));
        assertEquals(text.length() - 4, EmoteDraftTokens.selection(text, text.length(), catalog()));
    }

    @Test public void suggestionsPreferPrefixesAndDoNotMatchCommandsOrMentions() {
        assertEquals("KEK", EmoteDraftTokens.suggestions(":kek", catalog()).get(0).code);
        assertEquals("KEKW", EmoteDraftTokens.suggestions(":kek", catalog()).get(1).code);
        assertEquals("xKEK", EmoteDraftTokens.suggestions(":kek", catalog()).get(2).code);
        assertTrue(EmoteDraftTokens.suggestions(":", catalog()).isEmpty());
        assertTrue(EmoteDraftTokens.suggestions("@kek", catalog()).isEmpty());
        assertTrue(EmoteDraftTokens.suggestions("/kek", catalog()).isEmpty());
    }
}
