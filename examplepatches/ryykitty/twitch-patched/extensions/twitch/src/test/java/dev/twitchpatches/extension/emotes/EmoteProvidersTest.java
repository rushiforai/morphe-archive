package dev.twitchpatches.extension.emotes;

import java.util.Collections;
import java.util.Map;
import org.junit.Test;
import static org.junit.Assert.*;

public class EmoteProvidersTest {
    @Test public void channelLocalBttvOverridesSharedCodeAndRecognizesGif() throws Exception {
        Map<String, Emote> emotes = EmoteProviders.bttv("{\"sharedEmotes\":[{\"id\":\"shared\",\"code\":\"Wave\"}],\"channelEmotes\":[{\"id\":\"local\",\"code\":\"Wave\",\"imageType\":\"gif\"}]}", false);
        assertEquals(1, emotes.size());
        assertTrue(emotes.get("Wave").url.contains("/local/"));
        assertTrue(emotes.get("Wave").animated);
    }

    @Test public void sevenTvUsesAliasAndPreferredWebpAndPreservesOverlayFlag() throws Exception {
        Map<String, Emote> emotes = EmoteProviders.sevenTv("{\"emote_set\":{\"emotes\":[{\"name\":\"Alias\",\"flags\":1,\"data\":{\"animated\":true,\"host\":{\"url\":\"//cdn.7tv.app/emote/example\",\"files\":[{\"name\":\"1x.webp\",\"format\":\"WEBP\"},{\"name\":\"2x.webp\",\"format\":\"WEBP\"}]}}}]}}", false);
        Emote emote = emotes.get("Alias");
        assertEquals("https://cdn.7tv.app/emote/example/2x.webp", emote.url);
        assertTrue(emote.animated);
        assertTrue(emote.overlay);
    }

    @Test public void malformedEntriesAndUntrustedImageHostsAreIgnored() throws Exception {
        assertTrue(EmoteProviders.bttv("[{\"code\":\"two words\",\"id\":\"ok\"},{\"code\":\"ok\",\"id\":\"../other\"}]", true).isEmpty());
        assertFalse(EmoteProviders.imageUrl("http://cdn.7tv.app/a.webp"));
        assertFalse(EmoteProviders.imageUrl("https://cdn.7tv.app.example/a.webp"));
        assertFalse(EmoteProviders.imageUrl("https://user@cdn.7tv.app/a.webp"));
        assertFalse(EmoteProviders.imageUrl("https://cdn.7tv.app:8080/a.webp"));
    }

    @Test public void channelAndProviderPrecedenceIsDeterministic() {
        Emote global = new Emote("Code", "global", false, false);
        Emote bttv = new Emote("Code", "bttv", false, false);
        Emote seven = new Emote("Code", "seven", false, false);
        Map<String, Emote> globals = Collections.singletonMap("Code", global);
        assertSame(bttv, EmoteCatalog.combine(globals, Collections.singletonMap("Code", bttv), Collections.emptyMap()).get("Code"));
        assertSame(seven, EmoteCatalog.combine(globals, Collections.singletonMap("Code", bttv), Collections.singletonMap("Code", seven)).get("Code"));
        assertSame(global, globals.get("Code"));
    }

    @Test public void channelIdsCannotInjectRequestPaths() {
        assertEquals("123", EmoteProviders.channelId("123"));
        assertNull(EmoteProviders.channelId("123/../../other"));
        assertNull(EmoteProviders.channelId("channel-name"));
        assertNull(EmoteProviders.channelId("0"));
    }

    @Test public void absentProviderChannelIsAnEmptyCatalog() throws Exception {
        assertTrue(EmoteProviders.bttv("{}", false).isEmpty());
        assertTrue(EmoteProviders.sevenTv("{}", false).isEmpty());
    }
}
