package nl.johninnl.eclipse.auto.screens;

import androidx.car.app.ScreenManager;
import java.util.ArrayList;
import java.util.List;
import nl.johninnl.eclipse.auto.data.AppPort;
import nl.johninnl.eclipse.auto.data.Model;
import nl.johninnl.eclipse.auto.data.Playback;
import nl.johninnl.eclipse.auto.data.ProviderSearch;
import nl.johninnl.eclipse.auto.ui.Navigator;
import nl.johninnl.eclipse.auto.ui.Pages;

/** What a tap on the search page, or on its sectioned results page, does; both screens share one search. */
final class SearchActionsImpl implements Pages.SearchActions {
    private final BaseScreen owner;
    private final Host host;
    private final ProviderSearch search;

    SearchActionsImpl(BaseScreen owner, Host host, ProviderSearch search) {
        this.owner = owner;
        this.host = host;
        this.search = search;
    }

    /** The page's state: the answer plus the tiles that open its albums, artists and playlists. */
    static Pages.SearchState stateOf(Host host, ProviderSearch search) {
        Model.Found found = search.found();
        Model.SearchProvider active = search.active();
        return new Pages.SearchState(search.query(), search.loading(), search.failed(), found, search.filter(),
            active == null ? null : active.name, search.providers().size() > 1,
            tiles(host, found.albums), tiles(host, found.artists), tiles(host, found.playlists));
    }

    private static List<Model.Tile> tiles(Host host, List<Model.SearchHit> hits) {
        List<Model.Tile> tiles = new ArrayList<>(hits.size());
        for (Model.SearchHit hit : hits) tiles.add(host.homeBuilder().searchTile(hit));
        return tiles;
    }

    @Override public void textChanged(String text) { search.onTextChanged(text); }

    @Override public void submitted(String text) { search.onSubmitted(text); }

    @Override public void open(Model.SearchResult result) {
        if (!owner.onTop()) return;
        if (result.browsable) {
            // The app's browsable results are playlists, "playlist::<id>".
            String id = result.mediaId.startsWith("playlist::") ? result.mediaId.substring("playlist::".length()) : result.mediaId;
            Model.Ref playlist = host.library().playlistById(id);
            if (playlist != null) host.open(owner, host.library().playlist(playlist));
            else host.toast("Couldn't open that playlist");
            return;
        }
        host.app().playSearchResult(result);
        host.showPlayer();
    }

    /** Plays the provider's songs from the tapped one, so the rest of the answer follows it. */
    @Override public void playTrack(int index) {
        if (!owner.onTop()) return;
        AppPort app = host.app();
        List<Model.Track> tracks = search.found().tracks;
        if (index < 0 || index >= tracks.size()) return;
        Playback.play(app, tracks, index, app.composedOrigin("search", search.query(), "Search results"));
        host.showPlayer();
    }

    @Override public void openTile(Model.Tile tile) {
        if (owner.onTop() && tile.enabled()) host.open(owner, tile.opener.open());
    }

    @Override public void filter(ProviderSearch.Filter filter) { search.setFilter(filter); }

    @Override public void pickProvider() {
        if (!owner.onTop()) return;
        ScreenManager screens = owner.getScreenManager();
        Navigator.push(screens, new ProviderScreen(owner.getCarContext(), host, search));
    }
}
