package app.voidhack.extension.applemusic.library;

import org.json.JSONObject;
import org.junit.Test;

import java.io.IOException;
import java.util.Map;
import java.util.Set;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertThrows;

public class MetadataCatalogTest {
    @Test public void selectsExactCatalogIdentityEvenWhenAnotherSongHasTheSameTitle() throws Exception {
        JSONObject response = new JSONObject("{\"storePlatformData\":{\"product\":{\"results\":{"
                + "\"1406769093\":{\"id\":\"1406769093\",\"kind\":\"song\",\"name\":\"星のダイアローグ\"},"
                + "\"999\":{\"id\":\"999\",\"kind\":\"song\",\"name\":\"星のダイアローグ\"}}}}}");

        Map<String, JSONObject> songs = MetadataCatalog.decode(response, Set.of("1406769093"));

        assertEquals(Set.of("1406769093"), songs.keySet());
        assertEquals("1406769093", songs.get("1406769093").getString("id"));
    }

    @Test public void rejectsConflictingCatalogEntriesInsteadOfPickingOne() throws Exception {
        JSONObject response = new JSONObject("{\"results\":["
                + "{\"id\":\"123\",\"kind\":\"song\",\"name\":\"First\"},"
                + "{\"id\":\"123\",\"kind\":\"song\",\"name\":\"Second\"}]}");

        assertThrows(IOException.class, () -> MetadataCatalog.decode(response, Set.of("123")));
    }
}
