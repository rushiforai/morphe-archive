package io.github.sabopura.morphe.extension.twitch.ui;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertThrows;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Set;

public class SettingsTransferTest {
    private static final Set<String> STORES = new HashSet<>(Arrays.asList("CHAT", "DANMAKU", "ADS"));

    private static Map<String, Map<String, ?>> stores(Map<String, Object> chat) {
        Map<String, Map<String, ?>> stores = new LinkedHashMap<>();
        stores.put("CHAT", chat);
        return stores;
    }

    @Test
    public void everyTypeComesBackAsItWas() throws Exception {
        Map<String, Object> chat = new LinkedHashMap<>();
        chat.put("enabled", false);
        chat.put("font_percent", 130);
        chat.put("sleep_until", 1_700_000_000_000L);
        chat.put("ratio", 1.5f);
        chat.put("words", "草\nw\"quoted\"");
        chat.put("favorite_emotes", new HashSet<>(Arrays.asList("KEKW", "catJAM")));

        Map<String, Map<String, Object>> back = SettingsTransfer.decode(SettingsTransfer.encode(stores(chat)), STORES);

        assertEquals(chat, back.get("CHAT"));
        assertTrue("an int stays an int", back.get("CHAT").get("font_percent") instanceof Integer);
        assertTrue("a long stays a long", back.get("CHAT").get("sleep_until") instanceof Long);
        assertTrue(back.get("CHAT").get("ratio") instanceof Float);
    }

    @Test
    public void totalsAndShownHintsStayBehind() throws Exception {
        Map<String, Object> chat = new LinkedHashMap<>();
        chat.put("stat_points", 12L);
        chat.put("hint_player_button_shown", true);
        chat.put("timestamps", true);

        String text = SettingsTransfer.encode(stores(chat));

        assertFalse(text.contains("stat_points"));
        assertFalse(text.contains("hint_player_button_shown"));
        assertEquals(Collections.singletonMap("timestamps", (Object) true), SettingsTransfer.decode(text, STORES).get("CHAT"));
    }

    @Test
    public void totalsInPastedTextAreIgnored() {
        String text = "{\"format\":\"sabopura-twitch-settings\",\"version\":1,\"stores\":{\"CHAT\":"
                + "{\"stat_points\":[\"l\",999],\"timestamps\":[\"b\",true]}}}";

        assertEquals(Collections.singletonMap("timestamps", (Object) true), SettingsTransfer.decode(text, STORES).get("CHAT"));
    }

    @Test
    public void unknownStoresAndTypesAreSkipped() {
        String text = "{\"format\":\"sabopura-twitch-settings\",\"version\":1,\"stores\":{"
                + "\"OTHER\":{\"x\":[\"b\",true]},\"ADS\":{\"enabled\":[\"b\",false],\"odd\":[\"zz\",1]}}}";

        Map<String, Map<String, Object>> found = SettingsTransfer.decode(text, STORES);

        assertEquals(Collections.singleton("ADS"), found.keySet());
        assertEquals(Collections.singletonMap("enabled", (Object) false), found.get("ADS"));
    }

    @Test
    public void textThatIsNotOursIsRefused() {
        for (String text : new String[]{"", "hello", "{}", "[1,2]",
                "{\"format\":\"something-else\",\"version\":1,\"stores\":{\"CHAT\":{}}}",
                "{\"format\":\"sabopura-twitch-settings\",\"version\":2,\"stores\":{\"CHAT\":{}}}",
                "{\"format\":\"sabopura-twitch-settings\",\"version\":1,\"stores\":{\"OTHER\":{}}}",
                "{\"format\":\"sabopura-twitch-settings\",\"version\":1,\"stores\":{\"CHAT\":{\"a\":true}}}",
                "{\"format\":\"sabopura-twitch-settings\",\"version\":1,\"stores\":{\"CHAT\":{\"a\":[\"i\",\"x\"]}}}"})
            assertThrows(text, IllegalArgumentException.class, () -> SettingsTransfer.decode(text, STORES));
        assertThrows(IllegalArgumentException.class, () -> SettingsTransfer.decode(null, STORES));
    }
}
