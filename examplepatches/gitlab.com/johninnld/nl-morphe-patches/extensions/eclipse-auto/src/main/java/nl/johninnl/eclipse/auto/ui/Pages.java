package nl.johninnl.eclipse.auto.ui;

import androidx.car.app.media.model.MediaPlaybackStyle;
import androidx.car.app.media.model.MediaPlaybackTemplate;
import androidx.car.app.model.Action;
import androidx.car.app.model.ActionStrip;
import androidx.car.app.model.GridItem;
import androidx.car.app.model.GridSection;
import androidx.car.app.model.Header;
import androidx.car.app.model.ItemList;
import androidx.car.app.model.MessageTemplate;
import androidx.car.app.model.Row;
import androidx.car.app.model.RowSection;
import androidx.car.app.model.SearchHeader;
import androidx.car.app.model.SearchTemplate;
import androidx.car.app.model.SectionedItemTemplate;
import androidx.car.app.model.StrokeCap;
import androidx.car.app.model.Template;
import java.util.ArrayList;
import java.util.List;
import nl.johninnl.eclipse.auto.data.HomeView;
import nl.johninnl.eclipse.auto.data.LibraryStore;
import nl.johninnl.eclipse.auto.data.Model;
import nl.johninnl.eclipse.auto.data.ProviderSearch;
import nl.johninnl.eclipse.auto.data.QueueView;

/**
 * Every template the car app shows, built from plain inputs and an {@link Env}, so a JVM test can
 * build each page at API 8 and API 9 and inspect it. Screens only hold state and forward here.
 */
public final class Pages {
    /** The one place a browsing template gets its playback action (see {@link Presentation#showPlaybackAction}). */
    static void addPlaybackAction(Env env, SectionedItemTemplate.Builder template) {
        if (Presentation.showPlaybackAction(env.api9())) template.addAction(Action.MEDIA_PLAYBACK);
    }

    private static Action titled(String title, Runnable onClick) {
        return new Action.Builder().setTitle(title).setOnClickListener(onClick::run).build();
    }

    // ---- root ----------------------------------------------------------------------------------

    /** What the root page shows. */
    public static final class RootModel {
        public final Destination selected;
        public final boolean upcoming;
        /** The Library destination's content; null unless Library is selected. */
        public final LibraryStore.View library;
        /** Home or Discover, whichever is selected; null for Library. */
        public final HomeView feed;

        public RootModel(Destination selected, boolean upcoming, LibraryStore.View library, HomeView feed) {
            this.selected = selected;
            this.upcoming = upcoming;
            this.library = library;
            this.feed = feed;
        }
    }

    /** What a tap on the root page does. */
    public interface RootActions {
        void select(Destination destination);
        void search();
        void upNext();
        void open(Model.Tile tile);
        /** Play a row's songs from {@code index}; a null origin means the library. */
        void playTracks(List<Model.Track> tracks, int index, Object origin);
        void shuffleTracks(List<Model.Track> tracks, Object origin);
        void tuneStation(Model.LiveStation station);
        /** Run a tile's "Play" action (the featured artist's top songs). */
        void playTile(Model.Tile tile);
        /** Start the Umbra DJ and show the player. */
        void startDj();
        void stopDj();
        void showPlayer();
        void retry();
    }

    public static Template root(Env env, RootModel model, RootActions actions) {
        Header.Builder header = new Header.Builder().setTitle("Eclipse").setStartHeaderAction(Action.APP_ICON)
            .addEndHeaderAction(titled("Search", actions::search));
        if (model.upcoming) header.addEndHeaderAction(titled("Up next", actions::upNext));
        SectionedItemTemplate.Builder template = new SectionedItemTemplate.Builder().setHeader(header.build());
        addPlaybackAction(env, template);
        if (model.feed != null && model.feed.loading) return template.setLoading(true).build();
        template.addSection(Sections.destinations(env, model.selected, actions::select));
        if (model.selected == Destination.LIBRARY) {
            if (model.library != null) addLibrary(env, template, model.library, actions);
        } else if (model.feed != null) {
            addFeed(env, template, model.feed, actions);
        }
        return template.build();
    }

    private static void addLibrary(Env env, SectionedItemTemplate.Builder template, LibraryStore.View library, RootActions actions) {
        template.addSection(Sections.tiles(env, "Library", library.facets, Presentation.LIBRARY_FACETS, actions::open, null));
        if (!library.recents.isEmpty()) {
            final List<Model.Track> recents = library.recents;
            Runnable seeAll = library.recentFacet == null ? null : () -> actions.open(library.recentFacet);
            template.addSection(Sections.trackRows(env, "Recently played", recents, LibraryStore.RECENT_ROWS, false,
                index -> actions.playTracks(recents, index, null), seeAll));
        }
        if (!library.playlists.isEmpty()) {
            Runnable seeAll = library.morePlaylists == null ? null : () -> actions.open(library.morePlaylists);
            template.addSection(Sections.tiles(env, "Playlists", library.playlists, Presentation.LIBRARY_PLAYLISTS,
                actions::open, seeAll));
        }
    }

    /**
     * A feed's page: its state banner, its sections in the phone's order (nothing behind a "See all"),
     * then (Home only) the Radio categories.
     */
    private static void addFeed(Env env, SectionedItemTemplate.Builder template, HomeView view, RootActions actions) {
        if (view.notice != HomeView.Notice.NONE) template.addSection(Sections.notice(env, view.notice, actions::retry));
        for (final Model.Section section : view.sections) template.addSection(section(env, section, actions));
        if (!view.categories.isEmpty()) {
            template.addSection(Sections.tiles(env, "Radio", view.categories, Presentation.RADIO_CATEGORIES, actions::open, null));
        }
        if (view.empty()) template.addSection(Sections.messageRow("Nothing to show yet", null, actions::retry));
    }

    private static androidx.car.app.model.Section<?> section(Env env, final Model.Section section, final RootActions actions) {
        switch (section.type) {
            case TRACKS:
                return Sections.trackTiles(env, section.title, section.tracks, Presentation.forKey(section.presentationKey),
                    index -> actions.playTracks(section.tracks, index, section.origin));
            case STATIONS:
                return Sections.liveStations(env, section.title, section.stations, Presentation.forKey(section.presentationKey),
                    actions::tuneStation);
            case DJ:
                return Sections.dj(env, section.title, section.active, new Sections.DjActions() {
                    @Override public void start() { actions.startDj(); }

                    @Override public void stop() { actions.stopDj(); }

                    @Override public void showPlayer() { actions.showPlayer(); }
                });
            case SPOTLIGHT:
                return Sections.spotlight(env, section.title, section.feature, Presentation.forKey(section.presentationKey),
                    actions::open, actions::playTile);
            case HERO:
                return Sections.hero(env, section.title, section.feature, section.tracks,
                    Presentation.forKey(section.presentationKey).cap, actions::open,
                    index -> actions.playTracks(section.tracks, index, section.origin),
                    () -> actions.playTracks(section.tracks, 0, section.origin),
                    () -> actions.shuffleTracks(section.tracks, section.origin));
            default:
                return Sections.tiles(env, section.title, section.subtitle, section.tiles,
                    Presentation.forKey(section.presentationKey), actions::open, null);
        }
    }

    // ---- collection ----------------------------------------------------------------------------

    /** What a tap on a collection page does. */
    public interface CollectionActions {
        void play(int index);
        void playAll();
        void shuffle();
        void addToUpNext();
        void upNext();
        void search();
        void open(Model.Tile tile);
        void startStation(Model.Station station);
        void retry();
    }

    /** The loading state of a collection that is still being fetched. */
    public static Template collectionLoading(Env env, String title) {
        SectionedItemTemplate.Builder template = new SectionedItemTemplate.Builder()
            .setHeader(new Header.Builder().setTitle(Sections.nonEmpty(title, "Eclipse")).setStartHeaderAction(Action.BACK).build());
        addPlaybackAction(env, template);
        return template.setLoading(true).build();
    }

    /** A collection that could not be fetched: a retry row. */
    public static Template collectionFailed(Env env, String title, Runnable retry) {
        SectionedItemTemplate.Builder template = new SectionedItemTemplate.Builder()
            .setHeader(new Header.Builder().setTitle(Sections.nonEmpty(title, "Eclipse")).setStartHeaderAction(Action.BACK).build());
        addPlaybackAction(env, template);
        template.addSection(Sections.messageRow("Couldn't load · Retry", null, retry));
        return template.build();
    }

    public static Template collection(Env env, Model.Collection collection, boolean upcoming, boolean addEnabled,
                                      CollectionActions actions) {
        Header.Builder header = new Header.Builder().setTitle(Sections.nonEmpty(collection.title, "Eclipse"))
            .setStartHeaderAction(Action.BACK);
        boolean songs = !collection.tracks.isEmpty();
        if (songs) header.addEndHeaderAction(titled("Shuffle", actions::shuffle));
        if (upcoming) header.addEndHeaderAction(titled("Up next", actions::upNext));
        if (env.api9()) header9(env, header, collection);
        SectionedItemTemplate.Builder template = new SectionedItemTemplate.Builder().setHeader(header.build());
        addPlaybackAction(env, template);
        if (collection.indexed) {
            template.setAlphabeticalIndexingAllowed(true)
                .setAlphabeticalIndexingStrategy(SectionedItemTemplate.ALPHABETICAL_INDEXING_TITLE_IGNORE_ARTICLES_AND_SYMBOLS)
                .setScrollStatePersistenceStrategy(SectionedItemTemplate.SCROLL_STATE_PRESERVE_INDEX);
        }
        boolean empty = true;
        boolean hasTiles = !collection.tiles.isEmpty() || !collection.moreGroups.isEmpty();
        if (songs) {
            empty = false;
            int total = collection.tracks.size();
            boolean truncated = total > LibraryStore.LIST_CAP;
            template.addSection(Sections.collectionActions(env, actions::playAll, actions::addToUpNext, addEnabled));
            if (truncated) template.addSection(Sections.messageRow("Shuffle all " + total + " songs", null, actions::shuffle));
            template.addSection(Sections.trackRows(env, hasTiles ? "Songs" : "", collection.tracks,
                LibraryStore.LIST_CAP, collection.indexed, actions::play, null));
            if (truncated) template.addSection(Sections.messageRow("Search to find more", "Showing the first "
                + LibraryStore.LIST_CAP + " of " + total, actions::search));
        }
        Presentation.Entry entry = collection.kind == Model.Kind.ARTISTS ? Presentation.FACET_ARTISTS : Presentation.FACET_GRID;
        if (!collection.tiles.isEmpty()) {
            empty = false;
            template.addSection(Sections.tiles(env, collection.tilesTitle == null ? "" : collection.tilesTitle, collection.tiles,
                entry, actions::open, null));
        }
        for (Model.TileGroup group : collection.moreGroups) {
            if (group.tiles.isEmpty()) continue;
            empty = false;
            template.addSection(Sections.tiles(env, group.title, group.tiles, entry, actions::open, null));
        }
        if (!collection.stations.isEmpty()) {
            empty = false;
            template.addSection(Sections.stationRows(env, "", collection.stations, actions::startStation));
        }
        if (empty) template.addSection(Sections.messageRow(emptyMessage(collection.kind), null, null));
        return template.build();
    }

    private static void header9(Env env, Header.Builder header, Model.Collection collection) {
        if (!collection.subtitle.isEmpty()) header.setSubtitle(collection.subtitle);
        if (collection.artUrl != null && !collection.artUrl.isEmpty()) header.setStartHeaderImage(env.art(collection.artUrl));
    }

    private static String emptyMessage(Model.Kind kind) {
        switch (kind) {
            case STATIONS: return "No stations are available yet";
            case PLAYLISTS: return "No playlists yet";
            case ALBUMS: return "No albums yet";
            case ARTISTS: return "No artists yet";
            default: return "Nothing here yet";
        }
    }

    // ---- queue ---------------------------------------------------------------------------------

    /** What a tap on the Up Next page does. */
    public interface QueueActions {
        void jumpToUpNext(int index);
        void jumpToContext(QueueView.Row row);
        void clear();
    }

    public static Template queue(Env env, QueueView view, QueueActions actions) {
        Header.Builder header = new Header.Builder().setTitle("Up next").setStartHeaderAction(Action.BACK);
        if (view.clearable()) header.addEndHeaderAction(titled("Clear", actions::clear));
        SectionedItemTemplate.Builder template = new SectionedItemTemplate.Builder().setHeader(header.build());
        addPlaybackAction(env, template);
        if (view.nowPlaying != null) template.addSection(Sections.nowPlaying(env, view.nowPlaying));
        if (!view.upNext.isEmpty()) {
            template.addSection(Sections.queueRows(env, "Next from you", view.upNext, row -> actions.jumpToUpNext(row.index)));
        }
        if (!view.context.isEmpty()) {
            template.addSection(Sections.queueRows(env, view.contextTitle(), view.context, actions::jumpToContext));
        }
        if (!view.hasUpcoming()) template.addSection(Sections.messageRow("Nothing is queued after this song", null, null));
        return template.build();
    }

    // ---- search --------------------------------------------------------------------------------

    /**
     * What the search page shows: the provider's answer (or the library's, labelled), the type filter
     * and the tiles for the albums, artists and playlists it found. {@code providerName} is null while no
     * provider exists; {@code canPick} says there is more than one to choose from.
     */
    public static final class SearchState {
        public final String query;
        public final boolean loading;
        public final boolean failed;
        public final Model.Found found;
        public final ProviderSearch.Filter filter;
        public final String providerName;
        public final boolean canPick;
        public final List<Model.Tile> albums;
        public final List<Model.Tile> artists;
        public final List<Model.Tile> playlists;

        public SearchState(String query, boolean loading, boolean failed, Model.Found found, ProviderSearch.Filter filter,
                           String providerName, boolean canPick, List<Model.Tile> albums, List<Model.Tile> artists,
                           List<Model.Tile> playlists) {
            this.query = query == null ? "" : query;
            this.loading = loading;
            this.failed = failed;
            this.found = found;
            this.filter = filter;
            this.providerName = providerName;
            this.canPick = canPick;
            this.albums = albums;
            this.artists = artists;
            this.playlists = playlists;
        }

        /** A search with no provider: only the library answers. */
        public static SearchState library(String query, boolean loading, boolean failed, List<Model.SearchResult> results) {
            return new SearchState(query, loading, failed, Model.Found.ofLibrary(results, ProviderSearch.NO_PROVIDER),
                ProviderSearch.Filter.ALL, null, false, new ArrayList<Model.Tile>(), new ArrayList<Model.Tile>(),
                new ArrayList<Model.Tile>());
        }
    }

    /** What the search page reports. */
    public interface SearchActions {
        void textChanged(String text);
        void submitted(String text);
        /** A result of the library fallback. */
        void open(Model.SearchResult result);
        /** Play the provider's songs from this index of the answer. */
        void playTrack(int index);
        /** Open an album, artist or playlist the provider found. */
        void openTile(Model.Tile tile);
        void filter(ProviderSearch.Filter filter);
        void pickProvider();
    }

    private static String hint(SearchState state) {
        return state.providerName == null ? "Search your library" : "Search " + state.providerName;
    }

    private static String emptyText(SearchState state) {
        return state.query.trim().isEmpty() ? (state.providerName == null ? "Search your library and playlists"
            : "Search songs, albums, artists and playlists")
            : state.failed ? "Eclipse could not return search results" : "No results";
    }

    /**
     * Search. On API 9 one sectioned page: a SearchHeader (hint "Search {provider}", the provider as an end
     * action when there is a choice), the type chips first, then Tracks, Albums, Artists and Playlists under
     * their titles. On API 8 a SearchTemplate cannot section, so it lists the answer in that order with the
     * type in the second text line, cut to the host's list limit; a submitted query also opens
     * {@link #searchResults} for the sectioned view.
     */
    public static Template search(Env env, SearchState state, int listLimit, SearchActions actions) {
        return env.api9() ? search9(env, state, actions) : search8(env, state, Math.max(1, listLimit), actions);
    }

    private static Row.Builder typed(Row.Builder row, String detail, String type) {
        if (detail != null && !detail.isEmpty()) row.addText(detail);
        return row.addText(type);
    }

    static Template search8(Env env, SearchState state, int listLimit, final SearchActions actions) {
        SearchTemplate.Builder template = new SearchTemplate.Builder(new SearchTemplate.SearchCallback() {
            @Override public void onSearchTextChanged(String text) { actions.textChanged(text); }
            @Override public void onSearchSubmitted(String text) { actions.submitted(text); }
        }).setHeaderAction(Action.BACK).setInitialSearchText(state.query).setSearchHint(hint(state)).setShowKeyboardByDefault(true);
        if (state.canPick) {
            template.setActionStrip(new ActionStrip.Builder().addAction(titled(state.providerName, actions::pickProvider)).build());
        }
        if (state.loading) return template.setLoading(true).build();
        ItemList.Builder rows = new ItemList.Builder().setNoItemsMessage(emptyText(state));
        int count = 0;
        if (state.found.fromLibrary()) {
            if (!state.found.library.isEmpty()) {
                rows.addItem(new Row.Builder().setTitle("From your library").addText(Sections.nonEmpty(state.found.note, " ")).build());
                count++;
            }
            for (int i = 0; i < state.found.library.size() && count < listLimit; i++, count++) {
                final Model.SearchResult result = state.found.library.get(i);
                Row.Builder row = new Row.Builder().setTitle(Sections.nonEmpty(result.title, "Untitled")).setBrowsable(result.browsable)
                    .setImage(env.art(result.artUrl), Row.IMAGE_TYPE_LARGE).setOnClickListener(() -> actions.open(result));
                if (!result.subtitle.isEmpty()) row.addText(result.subtitle);
                rows.addItem(row.build());
            }
            return template.setItemList(rows.build()).build();
        }
        List<Model.Track> tracks = state.found.tracks;
        for (int i = 0; i < tracks.size() && count < listLimit; i++, count++) {
            final int index = i;
            Model.Track track = tracks.get(i);
            Row.Builder row = new Row.Builder().setTitle(Sections.nonEmpty(track.title, "Unknown title"))
                .setImage(env.art(track.artUrl), Row.IMAGE_TYPE_LARGE).setOnClickListener(() -> actions.playTrack(index));
            rows.addItem(typed(row, track.artist, "Track").build());
        }
        count = tileRows(env, rows, state.albums, state.found.albums, "Album", count, listLimit, actions);
        count = tileRows(env, rows, state.artists, state.found.artists, "Artist", count, listLimit, actions);
        tileRows(env, rows, state.playlists, state.found.playlists, "Playlist", count, listLimit, actions);
        return template.setItemList(rows.build()).build();
    }

    private static int tileRows(Env env, ItemList.Builder rows, List<Model.Tile> tiles, List<Model.SearchHit> hits, String type,
                                int count, int limit, final SearchActions actions) {
        for (int i = 0; i < tiles.size() && i < hits.size() && count < limit; i++, count++) {
            final Model.Tile tile = tiles.get(i);
            Row.Builder row = new Row.Builder().setTitle(Sections.nonEmpty(tile.title, "Untitled")).setBrowsable(true)
                .setImage(env.art(tile.artUrl), Row.IMAGE_TYPE_LARGE).setOnClickListener(() -> actions.openTile(tile));
            rows.addItem(typed(row, tile.subtitle, type).build());
        }
        return count;
    }

    static Template search9(Env env, SearchState state, final SearchActions actions) {
        SectionedItemTemplate.Builder template = new SectionedItemTemplate.Builder().setSearchHeader(searchHeader9(state, actions));
        addPlaybackAction(env, template);
        if (state.loading) return template.setLoading(true).build();
        addAnswer(env, template, state, actions);
        return template.build();
    }

    /** The sectioned view of an answer on API 8 (the page a submitted query opens), with the type filter on top. */
    public static Template searchResults(Env env, SearchState state, SearchActions actions) {
        Header header = new Header.Builder().setTitle(Sections.nonEmpty(state.query, "Results")).setStartHeaderAction(Action.BACK).build();
        SectionedItemTemplate.Builder template = new SectionedItemTemplate.Builder().setHeader(header);
        addPlaybackAction(env, template);
        if (state.loading) return template.setLoading(true).build();
        addAnswer(env, template, state, actions);
        return template.build();
    }

    /** The type filter and the sections of an answer, or the library fallback, or the reason there is nothing. */
    private static void addAnswer(Env env, SectionedItemTemplate.Builder template, SearchState state, SearchActions actions) {
        if (state.found.fromLibrary()) {
            addLibraryAnswer(env, template, state, actions);
            return;
        }
        if (state.found.isEmpty()) {
            template.addSection(Sections.messageRow(emptyText(state), null, null));
            return;
        }
        template.addSection(Sections.searchFilter(env, state.filter, actions::filter));
        boolean all = state.filter == ProviderSearch.Filter.ALL;
        int cap = all ? Presentation.SEARCH_PER_TYPE : Presentation.SEARCH_FILTERED;
        if ((all || state.filter == ProviderSearch.Filter.TRACKS) && !state.found.tracks.isEmpty()) {
            template.addSection(Sections.trackRows(env, "Tracks", state.found.tracks, cap, false, actions::playTrack, null));
        }
        if ((all || state.filter == ProviderSearch.Filter.ALBUMS) && !state.albums.isEmpty()) {
            template.addSection(Sections.tiles(env, "Albums", state.albums, Presentation.search(Presentation.Format.GRID_LARGE, cap),
                actions::openTile, null));
        }
        if ((all || state.filter == ProviderSearch.Filter.ARTISTS) && !state.artists.isEmpty()) {
            template.addSection(Sections.tiles(env, "Artists", state.artists, Presentation.search(Presentation.Format.GRID_CIRCLE, cap),
                actions::openTile, null));
        }
        if ((all || state.filter == ProviderSearch.Filter.PLAYLISTS) && !state.playlists.isEmpty()) {
            template.addSection(Sections.tiles(env, "Playlists", state.playlists, Presentation.search(Presentation.Format.GRID_LARGE, cap),
                actions::openTile, null));
        }
    }

    private static void addLibraryAnswer(Env env, SectionedItemTemplate.Builder template, SearchState state, SearchActions actions) {
        if (state.found.library.isEmpty()) {
            template.addSection(Sections.messageRow(emptyText(state), null, null));
            return;
        }
        template.addSection(Sections.messageRow("From your library", state.found.note, null));
        List<Model.SearchResult> songs = new ArrayList<>();
        List<Model.SearchResult> playlists = new ArrayList<>();
        for (Model.SearchResult result : state.found.library) (result.browsable ? playlists : songs).add(result);
        if (!songs.isEmpty()) {
            RowSection.Builder section = new RowSection.Builder().setTitle("Songs");
            for (final Model.SearchResult result : songs) {
                Row.Builder row = new Row.Builder().setTitle(Sections.nonEmpty(result.title, "Untitled"))
                    .setImage(env.art(result.artUrl), Row.IMAGE_TYPE_LARGE).setOnClickListener(() -> actions.open(result));
                if (!result.subtitle.isEmpty()) row.addText(result.subtitle);
                section.addItem(row.build());
            }
            template.addSection(section.build());
        }
        if (!playlists.isEmpty()) {
            GridSection.Builder section = new GridSection.Builder().setTitle("Playlists").setItemSize(GridSection.ITEM_SIZE_LARGE);
            if (env.api9()) section.setIncompleteLastRowStrategy(GridSection.INCOMPLETE_LAST_ROW_AS_IS);
            for (final Model.SearchResult result : playlists) {
                GridItem.Builder item = new GridItem.Builder().setTitle(Sections.nonEmpty(result.title, "Untitled"))
                    .setImage(env.art(result.artUrl), GridItem.IMAGE_TYPE_LARGE).setOnClickListener(() -> actions.open(result));
                if (!result.subtitle.isEmpty()) item.setText(result.subtitle);
                section.addItem(item.build());
            }
            template.addSection(section.build());
        }
    }

    private static SearchHeader searchHeader9(SearchState state, final SearchActions actions) {
        SearchHeader.Builder header = new SearchHeader.Builder(new androidx.car.app.model.SearchCallback() {
            @Override public void onSearchTextChanged(String text) { actions.textChanged(text); }
            @Override public void onSearchSubmitted(String text) { actions.submitted(text); }
        }).setInitialSearchText(state.query).setSearchHint(hint(state)).setShowKeyboardByDefault(true)
            .setStartHeaderAction(Action.BACK);
        if (state.canPick) header.setEndHeaderActions(java.util.Collections.singletonList(titled(state.providerName, actions::pickProvider)));
        return header.build();
    }

    // ---- provider choice -----------------------------------------------------------------------

    /** The list of providers to pick from: the selected one says so, a tap picks it. */
    public static Template providers(Env env, List<Model.SearchProvider> providers, String activeId, final java.util.function.Consumer<Model.SearchProvider> onPick) {
        RowSection.Builder section = new RowSection.Builder();
        for (final Model.SearchProvider provider : providers) {
            Row.Builder row = new Row.Builder().setTitle(Sections.nonEmpty(provider.name, "Provider"))
                .setOnClickListener(() -> onPick.accept(provider));
            if (provider.id.equals(activeId)) row.addText("Selected");
            section.addItem(row.build());
        }
        SectionedItemTemplate.Builder template = new SectionedItemTemplate.Builder()
            .setHeader(new Header.Builder().setTitle("Search provider").setStartHeaderAction(Action.BACK).build());
        addPlaybackAction(env, template);
        return template.addSection(section.build()).build();
    }

    // ---- player --------------------------------------------------------------------------------

    /**
     * The now-playing template, or a loading or failure message until a token is registered: the
     * player is never sent before the host has the session.
     */
    public static Template player(Env env, boolean ready, String error, Runnable upNext, Runnable reconnect) {
        if (!ready) return pending(error, reconnect);
        Header header = new Header.Builder().setTitle("Eclipse").setStartHeaderAction(Action.BACK)
            .addEndHeaderAction(titled("Up next", upNext)).build();
        MediaPlaybackTemplate.Builder template = new MediaPlaybackTemplate.Builder().setHeader(header);
        if (env.api9()) template.setStyle(playbackStyle9());
        return template.build();
    }

    private static MediaPlaybackStyle playbackStyle9() {
        return new MediaPlaybackStyle.Builder().setMediaAccentColor(Sections.ACCENT)
            .setProgressBarStrokeCap(StrokeCap.ROUND).build();
    }

    /** The connecting message, or the failure with a Reconnect action. */
    public static Template pending(String error, Runnable reconnect) {
        MessageTemplate.Builder message = new MessageTemplate.Builder(error == null ? "Connecting to Eclipse…" : error)
            .setTitle("Eclipse").setHeaderAction(Action.APP_ICON);
        if (error == null) message.setLoading(true);
        else message.addAction(titled("Reconnect", reconnect));
        return message.build();
    }

    private Pages() { }
}
