package io.github.sabopura.morphe.extension.twitch.chat.emotes;

import org.json.JSONArray;
import org.json.JSONObject;
import org.junit.Test;

import java.util.HashMap;
import java.util.Map;

import static org.junit.Assert.*;

public class EmoteCatalogTest {
    @Test
    public void ffzGlobalUsesOnlyDefaultSetsAndPrefersAnimatedImages() throws Exception {
        Map<String, Emote> out = new HashMap<>();
        EmoteCatalog.parseFfz(new JSONObject("{\"default_sets\":[1],\"sets\":{"
                + "\"1\":{\"emoticons\":[{\"name\":\"Plain\",\"urls\":{\"2\":\"//cdn.frankerfacez.com/emote/1/2\"}},"
                + "{\"name\":\"Moving\",\"urls\":{\"2\":\"//cdn.frankerfacez.com/emote/2/2\"},"
                + "\"animated\":{\"2\":\"//cdn.frankerfacez.com/emote/2/animated/2\"}}]},"
                + "\"9\":{\"emoticons\":[{\"name\":\"Other\",\"urls\":{\"2\":\"//cdn.frankerfacez.com/emote/9/2\"}}]}}}"), out, true);
        assertEquals(2, out.size());
        assertFalse(out.get("Plain").animated);
        assertTrue(out.get("Moving").animated);
        assertEquals("https://cdn.frankerfacez.com/emote/2/animated/2", out.get("Moving").url);
    }

    @Test
    public void ffzChannelTakesEverySet() throws Exception {
        Map<String, Emote> out = new HashMap<>();
        EmoteCatalog.parseFfz(new JSONObject("{\"sets\":{\"7\":{\"emoticons\":[{\"name\":\"C\","
                + "\"urls\":{\"1\":\"//cdn.frankerfacez.com/emote/7/1\"}}]}}}"), out, false);
        assertEquals("https://cdn.frankerfacez.com/emote/7/1", out.get("C").url);
    }

    @Test
    public void sevenTvPicksTheDoubleWebpAndReadsFlags() throws Exception {
        Map<String, Emote> out = new HashMap<>();
        EmoteCatalog.parseSevenTv(new JSONObject("{\"emotes\":[{\"name\":\"Wide\",\"flags\":1,\"data\":{\"animated\":true,"
                + "\"host\":{\"url\":\"//cdn.7tv.app/emote/abc\",\"files\":["
                + "{\"name\":\"1x.webp\",\"format\":\"WEBP\"},{\"name\":\"2x.avif\",\"format\":\"AVIF\"},{\"name\":\"2x.webp\",\"format\":\"WEBP\"}]}}}]}"), out, false);
        Emote emote = out.get("Wide");
        assertEquals("https://cdn.7tv.app/emote/abc/2x.webp", emote.url);
        assertTrue(emote.animated);
        assertTrue(emote.zeroWidth);
        assertEquals("Wide", emote.name);
        assertFalse(emote.global);
    }

    @Test
    public void everyProviderGivesAStableFavouriteKey() throws Exception {
        Map<String, Emote> out = new HashMap<>();
        EmoteCatalog.parseSevenTv(new JSONObject("{\"emotes\":[{\"id\":\"tv1\",\"name\":\"Sv\",\"data\":{\"host\":"
                + "{\"url\":\"//cdn.7tv.app/emote/tv1\",\"files\":[{\"name\":\"2x.webp\",\"format\":\"WEBP\"}]}}}]}"), out, true);
        EmoteCatalog.parseBetterTtvArray(new JSONArray("[{\"id\":\"bt1\",\"code\":\"Bt\"}]"), out, false);
        EmoteCatalog.parseFfz(new JSONObject("{\"sets\":{\"1\":{\"emoticons\":[{\"id\":55,\"name\":\"Fz\","
                + "\"urls\":{\"2\":\"//cdn.frankerfacez.com/emote/55/2\"}}]}}}"), out, false);
        assertEquals("c:7tv:tv1", out.get("Sv").favoriteKey());
        assertEquals("c:bttv:bt1", out.get("Bt").favoriteKey());
        assertEquals("c:ffz:55", out.get("Fz").favoriteKey());
        assertTrue(out.get("Sv").global);
    }

    @Test
    public void betterTtvRejectsUnsafeIds() throws Exception {
        Map<String, Emote> out = new HashMap<>();
        EmoteCatalog.parseBetterTtvArray(new JSONArray("[{\"id\":\"abc123\",\"code\":\"Good\",\"animated\":true},"
                + "{\"id\":\"../x\",\"code\":\"Bad\"}]"), out, true);
        assertEquals("https://cdn.betterttv.net/emote/abc123/2x.webp", out.get("Good").url);
        assertTrue(out.get("Good").animated);
        assertNull(out.get("Bad"));
    }

    /** A list read back from disk is as old as its download, so it is refreshed six hours after that. */
    @Test
    public void aSavedListIsRefreshedSixHoursAfterItsDownload() {
        long now = System.currentTimeMillis(), minute = 60_000L;
        EmoteCatalog.ProviderState state = new EmoteCatalog.ProviderState();
        state.publish(new HashMap<>(), now - 300 * minute);
        assertFalse(state.needsRefresh(now));
        assertTrue(state.needsRefresh(now + 61 * minute));
    }

    @Test
    public void anExpiredCopyUsedAfterAFailedDownloadIsRetriedSoon() {
        long now = System.currentTimeMillis(), minute = 60_000L;
        EmoteCatalog.ProviderState state = new EmoteCatalog.ProviderState();
        state.publish(new HashMap<>(), 0L);
        assertFalse(state.needsRefresh(now));
        assertTrue(state.needsRefresh(now + 6 * minute));
    }
}
