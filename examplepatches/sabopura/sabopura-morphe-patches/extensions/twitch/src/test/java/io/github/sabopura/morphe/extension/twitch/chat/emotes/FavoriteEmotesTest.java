package io.github.sabopura.morphe.extension.twitch.chat.emotes;

import org.junit.Test;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import static org.junit.Assert.*;

public class FavoriteEmotesTest {
    private static Emote emote(String provider, String id, String name) {
        return new Emote(provider, id, name, "https://cdn.7tv.app/emote/" + id + "/2x.webp", false, false, false);
    }

    private static List<String> keys(FavoriteEmotes favorites) {
        List<String> keys = new ArrayList<>();
        for (FavoriteEmotes.Entry entry : favorites.entries) keys.add(entry.key);
        return keys;
    }

    @Test public void togglingKeepsTheOrderItWasAddedIn() {
        FavoriteEmotes favorites = FavoriteEmotes.parse("[]");
        favorites.toggle(emote("7tv", "b", "Bee"));
        favorites.toggle(emote("bttv", "a", "Ant"));
        favorites.toggle(emote("ffz", "c", "Cat"));
        assertEquals(Arrays.asList("c:7tv:b", "c:bttv:a", "c:ffz:c"), keys(favorites));
        assertEquals(1, favorites.indexOf(emote("bttv", "a", "Ant")));
        assertEquals(-1, favorites.indexOf(emote("7tv", "a", "Ant")));
        favorites.toggle(emote("bttv", "a", "Ant"));
        assertEquals(Arrays.asList("c:7tv:b", "c:ffz:c"), keys(favorites));
    }

    @Test public void saveAndLoadKeepKeysAndOrder() {
        FavoriteEmotes favorites = FavoriteEmotes.parse("[]");
        favorites.toggle(emote("7tv", "x", "Xan"));
        favorites.toggle(emote("ffz", "1", "One"));
        FavoriteEmotes loaded = FavoriteEmotes.parse(favorites.toJson());
        assertEquals(keys(favorites), keys(loaded));
        assertEquals("Xan", loaded.entries.get(0).name);
    }

    @Test public void migrationKeepsEveryOldNameEvenPastTheLimit() {
        List<String> names = new ArrayList<>();
        for (int i = 0; i < 300; i++) names.add("emote" + i);
        FavoriteEmotes migrated = FavoriteEmotes.fromNames(names);
        assertEquals(300, migrated.entries.size());
        assertEquals("n:emote0", migrated.entries.get(0).key);
        assertFalse("past the limit, adding is refused", migrated.toggle(emote("7tv", "new", "New")));
        assertEquals(300, migrated.entries.size());
    }

    @Test public void oldNamesTakeTheirIdWhenTheCatalogKnowsThem() {
        FavoriteEmotes favorites = FavoriteEmotes.fromNames(Arrays.asList("Known", "Unknown"));
        boolean changed = favorites.resolve(name -> name.equals("Known") ? emote("7tv", "k1", "Known") : null);
        assertTrue(changed);
        assertEquals(Arrays.asList("c:7tv:k1", "n:Unknown"), keys(favorites));
        assertFalse(favorites.resolve(name -> null));
    }

    @Test public void limitAppliesOnlyWhenAdding() {
        FavoriteEmotes favorites = FavoriteEmotes.parse("[]");
        for (int i = 0; i < FavoriteEmotes.LIMIT; i++) assertTrue(favorites.toggle(emote("7tv", "e" + i, "E" + i)));
        assertFalse(favorites.toggle(emote("7tv", "over", "Over")));
        assertTrue("removing is always allowed", favorites.toggle(emote("7tv", "e0", "E0")));
        assertTrue(favorites.toggle(emote("7tv", "over", "Over")));
    }

    @Test public void damagedStoreStartsEmptyAndBadKeysAreDropped() {
        assertTrue(FavoriteEmotes.parse("not json").entries.isEmpty());
        assertEquals(Arrays.asList("t:42"), keys(FavoriteEmotes.parse("[[\"t:42\",\"Kappa\"],[\"nope\",\"x\"],[\"c:\",\"y\"]]")));
    }
}
