package dev.twitchpatches.extension.emotes;

import java.util.Collections;
import java.util.Map;
import org.junit.Test;
import static org.junit.Assert.*;

public class FrankerFaceZTest {
    private static final String SETS = "\"sets\":{\"1\":{\"emoticons\":[{\"name\":\"Global\",\"urls\":{\"2\":\"//cdn.frankerfacez.com/emote/1/2\"}}]},"
            + "\"2\":{\"emoticons\":[{\"name\":\"Channel\",\"urls\":{\"1\":\"https://cdn.frankerfacez.com/emote/2/1\"},"
            + "\"animated\":{\"2\":\"https://cdn.frankerfacez.com/emote/2/animated/2\"}}]},"
            + "\"3\":{\"emoticons\":[{\"name\":\"Private\",\"urls\":{\"2\":\"https://cdn.frankerfacez.com/emote/3/2\"}}]}}";

    @Test public void globalsOnlyIncludeDefaultSets() throws Exception {
        Map<String, Emote> entries = EmoteProviders.frankerFaceZ("{\"default_sets\":[1]," + SETS + "}", true);
        assertEquals(Collections.singleton("Global"), entries.keySet());
        assertEquals("FrankerFaceZ", entries.get("Global").providerLabel());
    }

    @Test public void channelOnlyIncludesAssignedSetAndItsAnimation() throws Exception {
        Map<String, Emote> entries = EmoteProviders.frankerFaceZ("{\"room\":{\"set\":2}," + SETS + "}", false);
        assertEquals(Collections.singleton("Channel"), entries.keySet());
        assertTrue(entries.get("Channel").animated);
        assertEquals("https://cdn.frankerfacez.com/emote/2/animated/2", entries.get("Channel").url);
    }

    @Test public void untrustedImagesAndAbsentRoomsAreIgnored() throws Exception {
        assertTrue(EmoteProviders.frankerFaceZ("{}", false).isEmpty());
        assertTrue(EmoteProviders.frankerFaceZ("{\"default_sets\":[1],\"sets\":{\"1\":{\"emoticons\":["
                + "{\"name\":\"Invalid\",\"urls\":{\"2\":\"https://cdn.7tv.app/emote/2/2x.webp\"}}]}}}", true).isEmpty());
        assertEquals("https://api.frankerfacez.com/v1/room/id/123", EmoteProviders.catalogUrl(2, "123"));
    }

    @Test public void channelProvidersOverrideGlobalProvidersWithoutChangingExistingPriority() {
        Emote ffz = new Emote("Code", "ffz", false, false);
        Emote bttv = new Emote("Code", "bttv", false, false);
        Emote seven = new Emote("Code", "seven", false, false);
        assertSame(ffz, EmoteCatalog.combine(Collections.singletonMap("Code", seven), Collections.singletonMap("Code", ffz)).get("Code"));
        assertSame(seven, EmoteCatalog.combine(Collections.emptyMap(), Collections.singletonMap("Code", ffz),
                Collections.singletonMap("Code", bttv), Collections.singletonMap("Code", seven)).get("Code"));
    }
}
