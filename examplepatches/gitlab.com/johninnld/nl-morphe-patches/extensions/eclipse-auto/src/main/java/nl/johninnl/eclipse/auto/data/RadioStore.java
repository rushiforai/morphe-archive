package nl.johninnl.eclipse.auto.data;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

/**
 * The Radio block at the end of Home: the algorithmic categories (genres, moods, decades,
 * activities), each opening a list of its stations. Live stations come with the compose feed.
 */
public final class RadioStore {
    private final AppPort app;

    public RadioStore(AppPort app) { this.app = app; }

    /** One tile per radio category the app knows. */
    public List<Model.Tile> categories() {
        List<Model.Tile> tiles = new ArrayList<>();
        for (final Model.Category category : app.radioCategories()) {
            tiles.add(new Model.Tile(category.name, "", null, iconFor(category.key), true, new Model.Opener() {
                @Override public Model.Collection open() {
                    return Model.Collection.ofStations(category.name, app.radioStations(category.key));
                }
            }, null));
        }
        return tiles;
    }

    /** The bundled icon for a category key; unknown keys get the genre icon. */
    static String iconFor(String key) {
        String lower = key.toLowerCase(Locale.ROOT);
        if (lower.contains("mood")) return "radio_mood";
        if (lower.contains("decade")) return "radio_decade";
        if (lower.contains("activit")) return "radio_activity";
        return "radio_genre";
    }
}
