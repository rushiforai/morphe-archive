package nl.johninnl.eclipse.auto.tree;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Locale;
import nl.johninnl.eclipse.auto.data.AppPort;
import nl.johninnl.eclipse.auto.data.Catalog;
import nl.johninnl.eclipse.auto.data.HomeBuilder;
import nl.johninnl.eclipse.auto.data.HomeView;
import nl.johninnl.eclipse.auto.data.Model;
import nl.johninnl.eclipse.auto.data.Playback;
import nl.johninnl.eclipse.auto.data.QueueView;

/**
 * The classic browse tree (design section 3.4) as plain data, built on the same {@link Catalog},
 * {@link HomeBuilder} and {@link Playback} the templated screens use, so the two surfaces never
 * disagree. Everything here runs on the main thread and never throws into the host: an id this
 * model does not know is an empty list.
 *
 * <p>Some levels wait for the network: Home, Discover and a collection that has to be fetched answer
 * through a {@link Sink} that may be called later. Home gives up waiting after {@link #FEED_WAIT_MS}
 * and answers from the library; the feed's arrival is then announced as children-changed.
 */
public final class TreeModel {
    /** How long a Home or Discover request waits for the feed before it answers without it. */
    public static final long FEED_WAIT_MS = 6000;

    /** Runs a task later on the main thread. */
    public interface Scheduler {
        void postDelayed(Runnable task, long delayMs);
    }

    /** Tells subscribed controllers that the children of {@code parentId} changed. */
    public interface Notifier {
        void childrenChanged(String parentId, int itemCount);
    }

    /** The full child list of a parent, and where "More…" must point back to. */
    public static final class Listing {
        public final List<Node> nodes;
        public final String parent;
        public final int offset;

        Listing(List<Node> nodes, String parent, int offset) {
            this.nodes = nodes;
            this.parent = parent;
            this.offset = offset;
        }
    }

    /** Receives a parent's children once, now or later (always on the main thread). */
    public interface Sink {
        void deliver(Listing listing);
    }

    private interface ViewSink {
        void view(HomeView view);
    }

    private interface CollectionSink {
        void collection(Model.Collection collection);
    }

    private interface TracksSink {
        void tracks(List<Model.Track> tracks, Object origin);
    }

    private final class Waiter {
        final boolean discover;
        final ViewSink sink;
        boolean done;

        Waiter(boolean discover, ViewSink sink) {
            this.discover = discover;
            this.sink = sink;
        }
    }

    private final AppPort app;
    private final Catalog catalog;
    private final HomeBuilder builder;
    private final Scheduler scheduler;
    private final Notifier notifier;
    private final List<Waiter> waiters = new ArrayList<>();
    /**
     * What each fed level looked like the last time it was served (null: never served). A level is only
     * announced as changed when what it would show now differs from this, so a refetch that brings
     * nothing new cannot make a host that asks again after every announcement loop forever.
     */
    private String homeSignature;
    private String discoverSignature;
    private String radioSignature;
    private boolean lastUpcoming;

    public TreeModel(AppPort app, Catalog catalog, HomeBuilder builder, Scheduler scheduler, Notifier notifier) {
        this.app = app;
        this.catalog = catalog;
        this.builder = builder;
        this.scheduler = scheduler;
        this.notifier = notifier;
    }

    // ---- children ------------------------------------------------------------------------------

    /** The children of {@code parentId}, delivered to {@code sink}. Never throws; an unknown id is an empty list. */
    public void children(final String parentId, final Sink sink) {
        final MediaIds.Parsed id = MediaIds.parse(parentId);
        switch (id.kind) {
            case ROOT: sink.deliver(listing(parentId, rootNodes())); return;
            case LIBRARY:
                lastUpcoming = app.hasUpcoming();
                sink.deliver(listing(parentId, libraryNodes()));
                return;
            case RADIO: {
                catalog.requestRadio();
                List<Node> nodes = radioNodes();
                radioSignature = signature(nodes);
                sink.deliver(listing(parentId, nodes));
                return;
            }
            case QUEUE: sink.deliver(listing(parentId, queueNodes())); return;
            case HOME:
                catalog.requestRadio();
                withView(false, new ViewSink() {
                    @Override public void view(HomeView view) {
                        List<Node> nodes = homeNodes(view);
                        homeSignature = signature(nodes);
                        sink.deliver(listing(parentId, nodes));
                    }
                });
                return;
            case DISCOVER:
                withView(true, new ViewSink() {
                    @Override public void view(HomeView view) {
                        List<Node> nodes = discoverNodes(view);
                        discoverSignature = signature(nodes);
                        sink.deliver(listing(parentId, nodes));
                    }
                });
                return;
            case COLLECTION:
                resolve(id.a, id.b, new CollectionSink() {
                    @Override public void collection(Model.Collection collection) {
                        sink.deliver(listing(parentId, collection == null ? Collections.<Node>emptyList() : collectionNodes(parentId, collection)));
                    }
                });
                return;
            case MORE:
                children(id.a, new Sink() {
                    @Override public void deliver(Listing parent) {
                        int from = Math.max(0, Math.min(id.index, parent.nodes.size()));
                        sink.deliver(new Listing(new ArrayList<>(parent.nodes.subList(from, parent.nodes.size())), id.a, id.index));
                    }
                });
                return;
            case RETRY:
                if ("discover".equals(id.a)) catalog.requestDiscover(true);
                else catalog.requestHome(true);
                sink.deliver(listing(parentId, Collections.<Node>emptyList()));
                return;
            default:
                // Notices, songs, stations, anything malformed: nothing underneath.
                sink.deliver(listing(parentId, Collections.<Node>emptyList()));
        }
    }

    private static Listing listing(String parent, List<Node> nodes) { return new Listing(nodes, parent, 0); }

    // ---- feeds ---------------------------------------------------------------------------------

    private HomeView viewNow(boolean discover) {
        return discover ? builder.discover(catalog.discover())
            : builder.home(catalog.home(), catalog.layout(), catalog.liveStations());
    }

    private void withView(final boolean discover, ViewSink sink) {
        if (discover) catalog.requestDiscover(false);
        else catalog.requestHome(false);
        HomeView view = viewNow(discover);
        if (!view.loading) {
            sink.view(view);
            return;
        }
        final Waiter waiter = new Waiter(discover, sink);
        waiters.add(waiter);
        scheduler.postDelayed(new Runnable() {
            @Override public void run() {
                if (waiter.done) return;
                waiter.done = true;
                waiters.remove(waiter);
                // The feed is slow or gone: answer from the library now. What was served is remembered,
                // so the feed's arrival (a different list) is announced as children-changed.
                waiter.sink.view(discover ? builder.offlineDiscover() : builder.libraryBackedHome(catalog.liveStations()));
            }
        }, FEED_WAIT_MS);
    }

    /** A cheap fingerprint of what a level shows: ids, titles, subtitles and groups, in order. */
    private static String signature(List<Node> nodes) {
        StringBuilder text = new StringBuilder();
        for (Node node : nodes) {
            text.append(node.id).append('|').append(node.title).append('|').append(node.subtitle).append('|').append(node.group).append('\n');
        }
        return text.toString();
    }

    /**
     * The catalogue's callback: answer anyone waiting for a feed, then announce each level that was
     * served earlier and now shows something different.
     */
    public void catalogChanged() {
        for (Waiter waiter : new ArrayList<>(waiters)) {
            HomeView view = viewNow(waiter.discover);
            if (view.loading || waiter.done) continue;
            waiter.done = true;
            waiters.remove(waiter);
            waiter.sink.view(view);
        }
        if (homeSignature != null) {
            HomeView view = viewNow(false);
            if (!view.loading) {
                List<Node> nodes = homeNodes(view);
                String now = signature(nodes);
                if (!now.equals(homeSignature)) {
                    homeSignature = now;
                    notifier.childrenChanged(MediaIds.HOME, nodes.size());
                }
            }
        }
        if (discoverSignature != null) {
            HomeView view = viewNow(true);
            if (!view.loading) {
                List<Node> nodes = discoverNodes(view);
                String now = signature(nodes);
                if (!now.equals(discoverSignature)) {
                    discoverSignature = now;
                    notifier.childrenChanged(MediaIds.DISCOVER, nodes.size());
                }
            }
        }
        if (radioSignature != null) {
            List<Node> nodes = radioNodes();
            String now = signature(nodes);
            if (!now.equals(radioSignature)) {
                radioSignature = now;
                notifier.childrenChanged(MediaIds.RADIO, nodes.size());
            }
        }
    }

    /** The app's queue changed: refresh the queue node, and the nodes that list it only when something is queued. */
    public void queueChanged() {
        notifier.childrenChanged(MediaIds.QUEUE, queueNodes().size());
        boolean upcoming = app.hasUpcoming();
        if (upcoming != lastUpcoming) {
            lastUpcoming = upcoming;
            notifier.childrenChanged(MediaIds.LIBRARY, libraryNodes().size());
            if (homeSignature != null) {
                HomeView view = viewNow(false);
                if (!view.loading) {
                    List<Node> nodes = homeNodes(view);
                    homeSignature = signature(nodes);
                    notifier.childrenChanged(MediaIds.HOME, nodes.size());
                }
            }
        }
    }

    // ---- collections ---------------------------------------------------------------------------

    /** Finds the tile with this identity in a feed view (sections, spotlights and heroes included). */
    static Model.Tile findTile(HomeView view, String type, String key) {
        for (Model.Section section : view.sections) {
            for (Model.Tile tile : section.tiles) if (matches(tile, type, key)) return tile;
            if (section.feature != null && matches(section.feature, type, key)) return section.feature;
        }
        return null;
    }

    private static boolean matches(Model.Tile tile, String type, String key) {
        return type.equals(tile.type) && key.equals(tile.key);
    }

    private void resolve(final String type, final String key, final CollectionSink sink) {
        if ("mix".equals(type) || "card".equals(type)) {
            final boolean discover = "card".equals(type);
            withView(discover, new ViewSink() {
                @Override public void view(HomeView view) {
                    Model.Tile tile = findTile(view, type, key);
                    fetch(tile == null ? null : tile.opener.open(), sink);
                }
            });
            return;
        }
        fetch(builder.collectionFor(type, key), sink);
    }

    /** Runs a deferred collection's loader; a failure is an empty list. */
    private void fetch(Model.Collection collection, final CollectionSink sink) {
        if (collection == null) {
            sink.collection(null);
            return;
        }
        if (collection.loader == null) {
            sink.collection(collection);
            return;
        }
        collection.loader.load(new Model.LoadCallback() {
            @Override public void loaded(Model.Collection loaded) { sink.collection(loaded); }

            @Override public void failed() { sink.collection(null); }
        });
    }

    // ---- nodes ---------------------------------------------------------------------------------

    private static String emptyToNull(String text) { return text == null || text.isEmpty() ? null : text; }

    private static int mediaTypeOf(String type) {
        switch (type) {
            case "album": return Node.TYPE_ALBUM;
            case "artist": return Node.TYPE_ARTIST;
            case "facet": return Node.TYPE_FOLDER;
            default: return Node.TYPE_PLAYLIST;
        }
    }

    private static Node tileNode(Model.Tile tile, String group) {
        // A tile with no identity, or one that cannot be opened (a replay still being built), has no node.
        if (tile.type == null || tile.key == null || !tile.enabled()) return null;
        return Node.folder(MediaIds.collection(tile.type, tile.key), mediaTypeOf(tile.type), tile.title,
            emptyToNull(tile.subtitle), tile.artUrl).inGroup(group);
    }

    private static Node stationNode(Model.LiveStation station, String group) {
        return Node.station(MediaIds.live(station.id), station.name, station.nowPlaying(), station.coverUrl).inGroup(group);
    }

    List<Node> rootNodes() {
        return new ArrayList<>(java.util.Arrays.asList(
            Node.folder(MediaIds.HOME, Node.TYPE_FOLDER, "Home", null, null),
            Node.folder(MediaIds.DISCOVER, Node.TYPE_FOLDER, "Discover", null, null),
            Node.folder(MediaIds.LIBRARY, Node.TYPE_FOLDER, "Library", null, null),
            Node.folder(MediaIds.RADIO, Node.TYPE_FOLDER, "Radio", null, null)));
    }

    /**
     * Up Next first when something is queued, then the shipped library nodes. The old root and Home
     * nodes that led to Favorites, Playlists, Downloaded and Cloud are gone from the new root, so
     * Library is where they live now; their ids are the app's own and keep working unchanged.
     */
    List<Node> libraryNodes() {
        List<Node> nodes = new ArrayList<>();
        if (app.hasUpcoming()) nodes.add(Node.folder(MediaIds.QUEUE, Node.TYPE_PLAYLIST, "Up Next", null, null));
        nodes.add(Node.folder("[lib_songs]", Node.TYPE_FOLDER, "Songs", null, null));
        nodes.add(Node.folder("[lib_artists]", Node.TYPE_FOLDER, "Artists", null, null));
        nodes.add(Node.folder("[lib_albums]", Node.TYPE_FOLDER_ALBUMS, "Albums", null, null));
        nodes.add(Node.folder("[playlists]", Node.TYPE_FOLDER_PLAYLISTS, "Playlists", null, null));
        nodes.add(Node.folder("[favorites]", Node.TYPE_PLAYLIST, "Favorites", null, null));
        nodes.add(Node.folder("[recently_played]", Node.TYPE_FOLDER, "Recently Played", null, null));
        if (app.downloadsCount() > 0) nodes.add(Node.folder("[downloaded]", Node.TYPE_FOLDER, "Downloaded", null, null));
        nodes.add(Node.folder("[cloud]", Node.TYPE_FOLDER, "Cloud", null, null));
        return nodes;
    }

    /** Live stations as a first group, then the app's own category folders (the ones that hold stations). */
    List<Node> radioNodes() {
        List<Node> nodes = new ArrayList<>();
        List<Model.LiveStation> live = catalog.liveStations();
        for (Model.LiveStation station : live) nodes.add(stationNode(station, "Live stations"));
        for (Model.Category category : app.radioCategories()) {
            if (app.radioStations(category.key).isEmpty()) continue;
            // The app's own folder id is the enum constant's name, which is the key in upper case.
            Node folder = Node.folder("radiocat::" + category.key.toUpperCase(Locale.ROOT), Node.TYPE_FOLDER, category.name, null, null);
            nodes.add(live.isEmpty() ? folder : folder.inGroup("Categories"));
        }
        return nodes;
    }

    /** Up Next, then the rest of the context queue: "Next from you" and "Next from &lt;origin&gt;". */
    List<Node> queueNodes() {
        QueueView view = QueueView.of(app.queue());
        List<Node> nodes = new ArrayList<>();
        for (QueueView.Row row : view.upNext) nodes.add(Node.song(MediaIds.upNext(row.index), row.track).inGroup("Next from you"));
        for (QueueView.Row row : view.context) {
            // A song that cannot be found in the app's queue cannot be jumped to, so it is not offered.
            if (row.index >= 0) nodes.add(Node.song(MediaIds.context(row.index), row.track).inGroup(view.contextTitle()));
        }
        return nodes;
    }

    private Node noticeNode(HomeView.Notice notice, String feed) {
        switch (notice) {
            case SIGNED_OUT: return Node.folder(MediaIds.notice("signed-out"), Node.TYPE_FOLDER, "Sign in to Eclipse on your phone", null, null).inGroup("Status");
            case REFRESH_FAILED: return Node.folder(MediaIds.retry(feed), Node.TYPE_FOLDER, "Couldn't refresh · Retry", null, null).inGroup("Status");
            case OFFLINE: return Node.folder(MediaIds.retry(feed), Node.TYPE_FOLDER, "Offline · Retry", "Showing what is on this phone", null).inGroup("Status");
            case UNAVAILABLE: return Node.folder(MediaIds.notice("unavailable"), Node.TYPE_FOLDER, "Not available right now", null, null).inGroup("Status");
            default: return null;
        }
    }

    List<Node> homeNodes(HomeView view) {
        List<Node> nodes = new ArrayList<>();
        if (app.hasUpcoming()) nodes.add(Node.folder(MediaIds.QUEUE, Node.TYPE_PLAYLIST, "Up Next", null, null).inGroup("Up next"));
        Node notice = noticeNode(view.notice, "home");
        if (notice != null) nodes.add(notice);
        for (Model.Section section : view.sections) addSection(nodes, section, false);
        return nodes;
    }

    List<Node> discoverNodes(HomeView view) {
        List<Node> nodes = new ArrayList<>();
        Node notice = noticeNode(view.notice, "discover");
        if (notice != null) nodes.add(notice);
        for (Model.Section section : view.sections) addSection(nodes, section, true);
        return nodes;
    }

    /** Every item of a block (the builder already applied the one silent safety cap), under the block's group title. */
    private void addSection(List<Node> out, Model.Section section, boolean discover) {
        out.addAll(sectionNodes(section, discover ? MediaIds.section(section.key) : MediaIds.row(section.key)));
    }

    /** The items of one block in the block's own group; a songs block's ids name the row they play from. */
    private List<Node> sectionNodes(Model.Section section, String rowId) {
        List<Node> items = new ArrayList<>();
        String group = section.label();
        switch (section.type) {
            case TRACKS:
            case HERO:
                for (int i = 0; i < section.tracks.size(); i++) {
                    items.add(Node.song(MediaIds.track(rowId, i), section.tracks.get(i)).inGroup(group));
                }
                break;
            case STATIONS:
                for (Model.LiveStation station : section.stations) items.add(stationNode(station, group));
                break;
            case DJ:
                items.add(Node.station(MediaIds.DJ, section.title.isEmpty() ? "Umbra" : section.title,
                    section.active ? "Playing" : "Start the DJ", null).inGroup(group));
                break;
            case SPOTLIGHT: {
                Node feature = tileNode(section.feature, group);
                if (feature != null) items.add(feature);
                break;
            }
            default:
                for (Model.Tile tile : section.tiles) {
                    Node node = tileNode(tile, group);
                    if (node != null) items.add(node);
                }
        }
        return items;
    }

    /** A collection's songs, then its tiles (an artist's albums and singles) in titled groups. */
    List<Node> collectionNodes(String parentId, Model.Collection collection) {
        List<Node> nodes = new ArrayList<>();
        boolean grouped = !collection.tiles.isEmpty() || !collection.moreGroups.isEmpty();
        for (int i = 0; i < collection.tracks.size(); i++) {
            Node song = Node.song(MediaIds.track(parentId, i), collection.tracks.get(i));
            nodes.add(grouped ? song.inGroup("Songs") : song);
        }
        addTiles(nodes, collection.tiles, collection.tilesTitle);
        for (Model.TileGroup group : collection.moreGroups) addTiles(nodes, group.tiles, group.title);
        return nodes;
    }

    private static void addTiles(List<Node> nodes, List<Model.Tile> tiles, String group) {
        for (Model.Tile tile : tiles) {
            Node node = tileNode(tile, group);
            if (node != null) nodes.add(node);
        }
    }

    // ---- playing -------------------------------------------------------------------------------

    /**
     * Plays a media id this model issued: a song from the list it sits in (under that list's own queue
     * origin), an Up Next jump, a context jump or a live station. Anything else is ignored.
     */
    public void play(String mediaId) {
        final MediaIds.Parsed id = MediaIds.parse(mediaId);
        switch (id.kind) {
            case TRACK:
                tracksOf(id.a, new TracksSink() {
                    @Override public void tracks(List<Model.Track> tracks, Object origin) {
                        if (id.index < tracks.size()) Playback.tap(app, tracks, id.index, origin, null);
                    }
                });
                return;
            case UP_NEXT:
                Playback.jumpToUpNext(app, id.index);
                return;
            case CONTEXT: {
                Model.QueueSnapshot queue = app.queue();
                if (id.index >= 0 && id.index < queue.contextSongs.size()) {
                    Playback.jumpToContext(app, new Model.Track(queue.contextSongs.get(id.index), "", "", "", null), id.index);
                }
                return;
            }
            case LIVE:
                app.tuneLiveStation(id.a);
                return;
            case DJ:
                // Same as the Umbra card: nothing to do while the DJ already plays.
                if (!app.djLive()) app.startDj();
                return;
            default:
        }
    }

    /** The songs (and queue origin) under a parent id: a Home row, a Discover section or a collection. */
    private void tracksOf(String parentId, final TracksSink sink) {
        final MediaIds.Parsed parent = MediaIds.parse(parentId);
        switch (parent.kind) {
            case ROW:
            case SECTION: {
                final boolean discover = parent.kind == MediaIds.Kind.SECTION;
                withView(discover, new ViewSink() {
                    @Override public void view(HomeView view) {
                        for (Model.Section section : view.sections) {
                            if (section.key.equals(parent.a)) {
                                sink.tracks(section.tracks, section.origin);
                                return;
                            }
                        }
                    }
                });
                return;
            }
            case COLLECTION:
                resolve(parent.a, parent.b, new CollectionSink() {
                    @Override public void collection(Model.Collection collection) {
                        if (collection != null) sink.tracks(collection.tracks, collection.origin);
                    }
                });
                return;
            default:
        }
    }
}
