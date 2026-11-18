package io.github.sabopura.morphe.extension.twitch.original;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import java.util.LinkedHashMap;
import java.util.Map;

import org.junit.Test;

public class ProfileStoreTest {
    @Test
    public void nothingStoredIsEmpty() {
        assertTrue(ProfileStore.parse(null).isEmpty());
        assertTrue(ProfileStore.parse("not json").isEmpty());
    }

    @Test
    public void entriesRoundTrip() {
        Map<String, ProfileStore.Profile> profiles = new LinkedHashMap<>();
        profiles.put("ayu", new ProfileStore.Profile(.4f, false, 1.5f, 120));
        ProfileStore.Profile back = ProfileStore.parse(ProfileStore.serialize(profiles)).get("ayu");
        assertEquals(.4f, back.volume, .001f);
        assertFalse(back.danmaku);
        assertEquals(1.5f, back.vodSpeed, .001f);
        assertEquals(120, back.chatPercent);
    }

    @Test
    public void missingFieldsUseDefaults() {
        ProfileStore.Profile back = ProfileStore.parse("{\"ayu\":{\"v\":0.5}}").get("ayu");
        assertEquals(.5f, back.volume, .001f);
        assertTrue(back.danmaku);
        assertEquals(0f, back.vodSpeed, .001f);
        assertEquals(100, back.chatPercent);
    }

    @Test
    public void aMalformedEntryIsSkipped() {
        assertEquals(1, ProfileStore.parse("{\"ayu\":{\"v\":1},\"bad\":3}").size());
    }
}
