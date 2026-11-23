package nl.johninnl.eclipse.auto.data;

import java.util.Collections;
import java.util.List;
import org.json.JSONException;

/** Builds Home and Discover views for any feed state without a catalogue (the state types are package-private). */
public final class Views {
    public static HomeBuilder builder(FakeApp app) { return new HomeBuilder(app, new LibraryStore(app), new RadioStore(app)); }

    public static ComposeFeed.Home home() {
        try {
            return ComposeParser.parseHome(Fixtures.home());
        } catch (JSONException broken) {
            throw new IllegalStateException(broken);
        }
    }

    public static ComposeFeed.Discover discover() {
        try {
            return ComposeParser.parseDiscover(Fixtures.discover());
        } catch (JSONException broken) {
            throw new IllegalStateException(broken);
        }
    }

    public static HomeView home(FakeApp app, Catalog.Phase phase, boolean refreshFailed, List<Model.LiveStation> live) {
        ComposeFeed.Home value = phase == Catalog.Phase.READY ? home() : null;
        return builder(app).home(new Catalog.State<>(phase, value, refreshFailed), HomeLayout.defaults(), live);
    }

    public static HomeView home(FakeApp app, Catalog.Phase phase, boolean refreshFailed) {
        return home(app, phase, refreshFailed, Collections.<Model.LiveStation>emptyList());
    }

    public static HomeView discover(FakeApp app, Catalog.Phase phase, boolean refreshFailed) {
        ComposeFeed.Discover value = phase == Catalog.Phase.READY ? discover() : null;
        return builder(app).discover(new Catalog.State<>(phase, value, refreshFailed));
    }

    /** A Home with one songs row of {@code songs} entries ("Song 0", "Song 1", ...). */
    public static HomeView homeWithSongRow(FakeApp app, int songs) {
        List<ComposeFeed.Item> items = new java.util.ArrayList<>();
        for (int i = 0; i < songs; i++) {
            try {
                items.add(ComposeParser.item("tracks", new org.json.JSONObject().put("title", "Song " + i).put("artist", "A")));
            } catch (JSONException broken) {
                throw new IllegalStateException(broken);
            }
        }
        ComposeFeed.Home feed = new ComposeFeed.Home(java.util.Arrays.asList(new ComposeFeed.Row("top_songs", "tracks", "Top", "taste", items)));
        return builder(app).home(new Catalog.State<>(Catalog.Phase.READY, feed, false), HomeLayout.defaults(),
            Collections.<Model.LiveStation>emptyList());
    }

    private Views() { }
}
