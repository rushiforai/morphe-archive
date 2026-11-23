package nl.johninnl.eclipse.auto.data;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

import java.util.ArrayList;
import java.util.List;
import org.junit.Test;

public class RadioStoreTest {
    private final FakeApp app = new FakeApp();

    @Test public void eachCategoryIsATileThatOpensItsStations() {
        app.categories.add(new Model.Category("genre", "Genres"));
        app.categories.add(new Model.Category("mood", "Moods"));
        List<Model.Station> jazz = new ArrayList<>();
        jazz.add(new Model.Station(new Object(), "Jazz FM", "Smooth", "genre"));
        app.stations.put("genre", jazz);
        List<Model.Tile> tiles = new RadioStore(app).categories();
        assertEquals(2, tiles.size());
        assertEquals("Genres", tiles.get(0).title);
        assertEquals("radio_genre", tiles.get(0).icon);
        assertEquals("radio_mood", tiles.get(1).icon);
        Model.Collection genres = tiles.get(0).opener.open();
        assertEquals(Model.Kind.STATIONS, genres.kind);
        assertEquals(1, genres.stations.size());
        assertTrue("a category with no stations yet is empty, not an error", tiles.get(1).opener.open().stations.isEmpty());
    }

    @Test public void unknownCategoriesGetTheGenreIcon() {
        assertEquals("radio_decade", RadioStore.iconFor("Decades"));
        assertEquals("radio_activity", RadioStore.iconFor("activity"));
        assertEquals("radio_genre", RadioStore.iconFor("something-new"));
    }
}
