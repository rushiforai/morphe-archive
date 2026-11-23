package nl.johninnl.eclipse.auto.ui;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

import android.content.Context;
import androidx.car.app.OnDoneCallback;
import androidx.car.app.model.Action;
import androidx.car.app.model.CarIcon;
import androidx.car.app.model.Banner;
import androidx.car.app.model.CarText;
import androidx.car.app.model.GridItem;
import androidx.car.app.model.Item;
import androidx.car.app.model.MessageTemplate;
import androidx.car.app.model.OnClickDelegate;
import androidx.car.app.model.Row;
import androidx.car.app.model.SectionHeader;
import androidx.car.app.model.Section;
import androidx.car.app.model.SectionedItemTemplate;
import androidx.car.app.model.Template;
import androidx.core.graphics.drawable.IconCompat;
import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.IdentityHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeSet;
import nl.johninnl.eclipse.auto.data.Catalog;
import nl.johninnl.eclipse.auto.data.FakeApp;
import nl.johninnl.eclipse.auto.data.HomeView;
import nl.johninnl.eclipse.auto.data.LibraryStore;
import nl.johninnl.eclipse.auto.data.Model;
import nl.johninnl.eclipse.auto.data.ProviderSearch;
import nl.johninnl.eclipse.auto.data.QueueView;
import nl.johninnl.eclipse.auto.data.RadioStore;
import nl.johninnl.eclipse.auto.data.Views;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;

/**
 * Builds every page's template at API 8 and API 9 with fake data. At level 8 no API 9 class may
 * appear anywhere in the template; at level 9 the library's own builder constraints must hold
 * (building throws otherwise) and the one ChipSection must be the first section.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 33, manifest = Config.NONE)
public class PagesTest {
    /** The design's list of API 9 classes (plus the style types that only exist on API 9). */
    private static final Set<String> API9_TYPES = new TreeSet<>(Arrays.asList(
        "Chip", "ChipSection", "ChipStyle", "CondensedItem", "CondensedItemStyle", "CondensedSection", "SpotlightSection",
        "Banner", "BannerSection", "BannerStyle", "SectionHeader", "SearchHeader", "CarProgressBar", "MediaPlaybackStyle",
        "Shape", "Background"));

    private static final class FakeEnv implements Env {
        private final boolean api9;
        private final Context context = RuntimeEnvironment.getApplication();

        FakeEnv(boolean api9) { this.api9 = api9; }

        @Override public boolean api9() { return api9; }

        @Override public CarIcon icon(String name) {
            return CarIcon.createTintedIcon(IconCompat.createWithResource(context, android.R.drawable.ic_menu_info_details));
        }

        @Override public CarIcon accentIcon(String name) { return icon(name); }

        @Override public CarIcon art(String url) {
            return new CarIcon.Builder(IconCompat.createWithContentUri("content://test.artwork/" + (url == null ? "none" : url.hashCode()))).build();
        }
    }

    /** What the root page's actions were asked to do, in order. */
    private final List<String> rootCalls = new ArrayList<>();
    private boolean djLive;

    private final Pages.RootActions rootActions = new Pages.RootActions() {
        @Override public void select(Destination destination) { }
        @Override public void search() { }
        @Override public void upNext() { }
        @Override public void open(Model.Tile tile) { rootCalls.add("open " + tile.title); }
        @Override public void playTracks(List<Model.Track> tracks, int index, Object origin) { rootCalls.add("playTracks " + index); }
        @Override public void shuffleTracks(List<Model.Track> tracks, Object origin) { }
        @Override public void tuneStation(Model.LiveStation station) { rootCalls.add("tune " + station.id); }
        @Override public void playTile(Model.Tile tile) { }
        @Override public void startDj() { rootCalls.add("startDj"); }
        @Override public void stopDj() { rootCalls.add("stopDj"); }
        @Override public void showPlayer() { rootCalls.add("showPlayer"); }
        @Override public void retry() { }
    };

    private final Pages.CollectionActions collectionActions = new Pages.CollectionActions() {
        @Override public void play(int index) { }
        @Override public void playAll() { }
        @Override public void shuffle() { }
        @Override public void addToUpNext() { }
        @Override public void upNext() { }
        @Override public void open(Model.Tile tile) { }
        @Override public void startStation(Model.Station station) { }
        @Override public void search() { }
        @Override public void retry() { }
    };

    private final Pages.QueueActions queueActions = new Pages.QueueActions() {
        @Override public void jumpToUpNext(int index) { }
        @Override public void jumpToContext(QueueView.Row row) { }
        @Override public void clear() { }
    };

    /** Every androidx.car.app type reachable from {@code root}. */
    private static Set<String> carTypes(Object root) { return carTypesAndTexts(root, new TreeSet<String>()); }

    /** Like {@link #carTypes} and also collects the text of every CarText reached. */
    private static Set<String> carTypesAndTexts(Object root, Set<String> texts) {
        Set<String> found = new TreeSet<>();
        walk(root, found, texts, new IdentityHashMap<Object, Boolean>());
        return found;
    }

    private static void walk(Object value, Set<String> found, Set<String> texts, Map<Object, Boolean> seen) {
        if (value == null || seen.put(value, Boolean.TRUE) != null) return;
        if (value instanceof Collection) {
            for (Object item : (Collection<?>) value) walk(item, found, texts, seen);
            return;
        }
        if (value instanceof Map) {
            for (Object item : ((Map<?, ?>) value).values()) walk(item, found, texts, seen);
            return;
        }
        if (value.getClass().isArray()) {
            if (value instanceof Object[]) for (Object item : (Object[]) value) walk(item, found, texts, seen);
            return;
        }
        Class<?> type = value.getClass();
        if (!type.getName().startsWith("androidx.car.app.")) return;
        found.add(type.getSimpleName());
        if (value instanceof CarText) texts.add(((CarText) value).toCharSequence().toString());
        for (Class<?> cls = type; cls != null && cls.getName().startsWith("androidx.car.app."); cls = cls.getSuperclass()) {
            for (Field field : cls.getDeclaredFields()) {
                if (Modifier.isStatic(field.getModifiers()) || field.getType().isPrimitive()) continue;
                try {
                    field.setAccessible(true);
                    walk(field.get(value), found, texts, seen);
                } catch (ReflectiveOperationException | RuntimeException unreadable) {
                    // A field the walk cannot read cannot hide an API 9 class held by a model object.
                }
            }
        }
    }

    private static Set<String> api9In(Template template) {
        Set<String> found = carTypes(template);
        found.retainAll(API9_TYPES);
        return found;
    }

    /** Every androidx.car.app object reachable from {@code root} that is an instance of {@code type}. */
    private static <T> List<T> collect(Object root, Class<T> type) {
        List<T> found = new ArrayList<>();
        collectInto(root, type, found, new IdentityHashMap<Object, Boolean>());
        return found;
    }

    @SuppressWarnings("unchecked")
    private static <T> void collectInto(Object value, Class<T> type, List<T> found, Map<Object, Boolean> seen) {
        if (value == null || seen.put(value, Boolean.TRUE) != null) return;
        if (value instanceof Collection) {
            for (Object item : (Collection<?>) value) collectInto(item, type, found, seen);
            return;
        }
        if (value instanceof Map) {
            for (Object item : ((Map<?, ?>) value).values()) collectInto(item, type, found, seen);
            return;
        }
        if (value.getClass().isArray()) {
            if (value instanceof Object[]) for (Object item : (Object[]) value) collectInto(item, type, found, seen);
            return;
        }
        Class<?> cls = value.getClass();
        if (!cls.getName().startsWith("androidx.car.app.")) return;
        if (type.isInstance(value)) found.add((T) value);
        for (; cls != null && cls.getName().startsWith("androidx.car.app."); cls = cls.getSuperclass()) {
            for (Field field : cls.getDeclaredFields()) {
                if (Modifier.isStatic(field.getModifiers()) || field.getType().isPrimitive()) continue;
                try {
                    field.setAccessible(true);
                    collectInto(field.get(value), type, found, seen);
                } catch (ReflectiveOperationException | RuntimeException unreadable) {
                    // A field the walk cannot read holds nothing the test looks for.
                }
            }
        }
    }

    private static void click(OnClickDelegate delegate) {
        assertNotNull("a tap target", delegate);
        delegate.sendClick(new OnDoneCallback() { });
    }

    private static List<Section<?>> sections(Template template) { return ((SectionedItemTemplate) template).getSections(); }

    private static int chipSections(Template template) {
        int count = 0;
        for (Section<?> section : sections(template)) if (section.getClass().getSimpleName().equals("ChipSection")) count++;
        return count;
    }

    private static String firstSection(Template template) { return sections(template).get(0).getClass().getSimpleName(); }

    private static void assertPlaybackAction(Template template) {
        assertTrue("browsing pages carry Action.MEDIA_PLAYBACK", ((SectionedItemTemplate) template).getActions().contains(Action.MEDIA_PLAYBACK));
    }

    // ---- fixtures ------------------------------------------------------------------------------

    private FakeApp populated() {
        FakeApp app = new FakeApp();
        for (int i = 0; i < 400; i++) app.songs.add(FakeApp.track("Song " + i, "Artist " + (i % 7)));
        app.favorites = FakeApp.tracks("Fav one", "Fav two");
        app.downloadsCount = 3;
        for (int i = 0; i < 15; i++) {
            app.playlists.add(new Model.Ref(null, "p" + i, "Playlist " + i, "4 songs", "https://art/p" + i));
            app.playlistSongs.put("p" + i, FakeApp.tracks("one", "two"));
        }
        app.albums.add(new Model.Ref(null, "k1", "An Album", "Artist 1", "https://art/a"));
        app.artists.add(new Model.Ref(null, "Artist 1", "Artist 1", "9 songs", "https://art/artist"));
        app.history.add(new Model.HistoryEntry("Song 3", "Artist 3"));
        app.history.add(new Model.HistoryEntry("Song 5", "Artist 5"));
        app.categories.add(new Model.Category("genre", "Genres"));
        app.categories.add(new Model.Category("mood", "Moods"));
        app.categories.add(new Model.Category("decade", "Decades"));
        app.categories.add(new Model.Category("activity", "Activities"));
        app.stations.put("genre", Arrays.asList(new Model.Station(new Object(), "Jazz FM", "Smooth jazz", "genre"),
            new Model.Station(new Object(), "No description", "", "genre")));
        app.djLive = djLive;
        return app;
    }

    private List<Model.Collection> collections(FakeApp app) {
        LibraryStore library = new LibraryStore(app);
        List<Model.Collection> result = new ArrayList<>();
        for (LibraryStore.Facet facet : LibraryStore.Facet.values()) result.add(library.open(facet));
        result.add(library.view().playlists.get(0).opener.open());
        result.add(library.open(LibraryStore.Facet.ALBUMS).tiles.get(0).opener.open());
        result.add(library.open(LibraryStore.Facet.ARTISTS).tiles.get(0).opener.open());
        result.add(new RadioStore(app).categories().get(0).opener.open());
        result.add(new RadioStore(app).categories().get(1).opener.open());
        return result;
    }

    private QueueView queueView(boolean upNext, boolean tail) {
        List<Model.Track> all = FakeApp.tracks("c0", "c1", "c2");
        List<Object> songs = new ArrayList<>();
        for (Model.Track track : all) songs.add(track.song);
        return QueueView.of(new Model.QueueSnapshot(all.get(0), upNext ? FakeApp.tracks("u0", "u1") : new ArrayList<Model.Track>(),
            tail ? all.subList(1, 3) : new ArrayList<Model.Track>(), songs, 0, "An Album", false));
    }

    // ---- root ----------------------------------------------------------------------------------

    /** The page for a destination, with the feed state a catalogue would hold. */
    private Template rootPage(boolean api9, Destination destination, boolean upcoming, Catalog.Phase phase, boolean refreshFailed,
                              List<Model.LiveStation> live) {
        FakeApp app = populated();
        HomeView feed = destination == Destination.HOME ? Views.home(app, phase, refreshFailed, live)
            : destination == Destination.DISCOVER ? Views.discover(app, phase, refreshFailed) : null;
        LibraryStore.View library = destination == Destination.LIBRARY ? new LibraryStore(app).view() : null;
        return Pages.root(new FakeEnv(api9), new Pages.RootModel(destination, upcoming, library, feed), rootActions);
    }

    private Template rootPage(boolean api9, Destination destination, boolean upcoming) {
        return rootPage(api9, destination, upcoming, Catalog.Phase.READY, false, new ArrayList<Model.LiveStation>());
    }

    private Template statePage(boolean api9, Destination destination, Catalog.Phase phase, boolean refreshFailed) {
        return rootPage(api9, destination, false, phase, refreshFailed, new ArrayList<Model.LiveStation>());
    }

    private Set<String> textsOf(Template template) {
        Set<String> texts = new TreeSet<>();
        carTypesAndTexts(template, texts);
        return texts;
    }

    @Test public void everyRootDestinationBuildsAtBothLevelsAndApi9TypesNeverReachApi8() {
        for (boolean api9 : new boolean[] {false, true}) {
            for (Destination destination : Destination.values()) {
                for (boolean upcoming : new boolean[] {false, true}) {
                    Template template = rootPage(api9, destination, upcoming);
                    String label = destination + " api9=" + api9;
                    assertPlaybackAction(template);
                    if (api9) {
                        assertEquals(label, 1, chipSections(template));
                        assertEquals(label + ": the selector must be the first section", "ChipSection", firstSection(template));
                    } else {
                        assertEquals(label, Arrays.<String>asList(), new ArrayList<>(api9In(template)));
                        assertEquals(label, 0, chipSections(template));
                    }
                }
            }
        }
    }

    @Test public void everyFeedStateRendersAtBothLevelsWithNoApi9ClassBelowApi9() {
        for (boolean api9 : new boolean[] {false, true}) {
            for (Destination destination : new Destination[] {Destination.HOME, Destination.DISCOVER}) {
                for (Catalog.Phase phase : Catalog.Phase.values()) {
                    for (boolean refreshFailed : new boolean[] {false, true}) {
                        if (refreshFailed && phase != Catalog.Phase.READY) continue;
                        Template template = statePage(api9, destination, phase, refreshFailed);
                        String label = destination + " " + phase + " refreshFailed=" + refreshFailed + " api9=" + api9;
                        assertPlaybackAction(template);
                        if (!api9) assertEquals(label, Arrays.<String>asList(), new ArrayList<>(api9In(template)));
                    }
                }
            }
        }
    }

    @Test public void theFirstLoadIsTheTemplatesOwnLoadingState() {
        for (boolean api9 : new boolean[] {false, true}) {
            Template home = statePage(api9, Destination.HOME, Catalog.Phase.LOADING, false);
            assertTrue(((SectionedItemTemplate) home).isLoading());
            assertTrue(sections(home).isEmpty());
            assertPlaybackAction(home);
        }
    }

    @Test public void signedOutOfflineRefreshFailedAndUnavailableEachShowTheirOwnBanner() {
        for (boolean api9 : new boolean[] {false, true}) {
            Set<String> signedOut = textsOf(statePage(api9, Destination.HOME, Catalog.Phase.SIGNED_OUT, false));
            assertTrue(signedOut.toString(), signedOut.contains("Sign in to Eclipse on your phone"));
            Set<String> offline = textsOf(statePage(api9, Destination.DISCOVER, Catalog.Phase.OFFLINE, false));
            assertTrue(offline.toString(), offline.contains(api9 ? "Offline" : "Offline · Retry"));
            Set<String> failed = textsOf(statePage(api9, Destination.HOME, Catalog.Phase.READY, true));
            assertTrue(failed.toString(), failed.contains(api9 ? "Couldn't refresh" : "Couldn't refresh · Retry"));
            if (api9) assertTrue(failed.toString(), failed.contains("Retry"));
            Set<String> unavailable = textsOf(statePage(api9, Destination.DISCOVER, Catalog.Phase.DISABLED, false));
            assertTrue(unavailable.toString(), unavailable.contains("Not available right now"));
            Set<String> disabledHome = textsOf(statePage(api9, Destination.HOME, Catalog.Phase.DISABLED, false));
            assertFalse("503 on Home is a quiet Library-backed page", disabledHome.contains("Not available right now"));
            assertTrue(disabledHome.toString(), disabledHome.contains("Your library"));
        }
    }

    @Test public void api9BannersUseTheBannerSectionAndApi8UsesAMessageRow() {
        assertTrue(carTypes(statePage(true, Destination.HOME, Catalog.Phase.READY, true)).contains("BannerSection"));
        assertFalse(carTypes(statePage(false, Destination.HOME, Catalog.Phase.READY, true)).contains("BannerSection"));
        assertTrue(carTypes(statePage(true, Destination.HOME, Catalog.Phase.SIGNED_OUT, false)).contains("BannerSection"));
    }

    @Test public void homeUsesSpotlightAndCondensedAtApi9AndGridsAndRowsBelow() {
        Set<String> api9 = carTypes(rootPage(true, Destination.HOME, false));
        assertTrue(api9.toString(), api9.contains("SpotlightSection"));
        assertTrue(api9.toString(), api9.contains("CondensedSection"));
        Set<String> api8 = carTypes(rootPage(false, Destination.HOME, false));
        assertTrue(api8.toString(), api8.contains("GridSection"));
        assertTrue(api8.toString(), api8.contains("RowSection"));
        assertFalse(api8.contains("SpotlightSection"));
    }

    @Test public void discoverHasAHeroSpotlightAtApi9AndRowsBelow() {
        Template api9 = rootPage(true, Destination.DISCOVER, false);
        assertTrue(carTypes(api9).toString(), carTypes(api9).contains("SpotlightSection"));
        Set<String> texts9 = textsOf(api9);
        assertTrue(texts9.toString(), texts9.contains("Play") && texts9.contains("Shuffle"));
        Template api8 = rootPage(false, Destination.DISCOVER, false);
        assertFalse(carTypes(api8).contains("SpotlightSection"));
        assertTrue(textsOf(api8).toString(), textsOf(api8).contains("Today's Drop"));
    }

    @Test public void liveStationsSitWhereTheFeedPutsThemAsTilesAndTheRadioBlockEndsHome() {
        List<Model.LiveStation> live = Arrays.asList(new Model.LiveStation("s1", "Hits", "", "Song", "Artist", "https://art/hits"));
        for (boolean api9 : new boolean[] {false, true}) {
            Template template = rootPage(api9, Destination.HOME, false, Catalog.Phase.READY, false, live);
            Set<String> texts = textsOf(template);
            assertTrue(texts.toString(), texts.contains("Eclipse Stations"));
            assertTrue(texts.toString(), texts.contains("Hits"));
            assertTrue(texts.toString(), texts.contains("LIVE · Song – Artist"));
            List<GridItem> tiles = collect(template, GridItem.class);
            GridItem station = null;
            for (GridItem tile : tiles) if (tile.getTitle() != null && "Hits".equals(tile.getTitle().toString())) station = tile;
            assertNotNull("a station is a tile with the cover on air", station);
            rootCalls.clear();
            click(station.getOnClickDelegate());
            assertEquals(Arrays.asList("tune s1"), rootCalls);
            List<Section<?>> sections = sections(template);
            assertEquals("the Radio block is last", api9 ? "CondensedSection" : "GridSection",
                sections.get(sections.size() - 1).getClass().getSimpleName());
            assertEquals("Radio", sections.get(sections.size() - 1).getTitle().toString());
        }
    }

    @Test public void homeAndDiscoverNeverOfferSeeAllAndShowEverySongOfARowAsATile() {
        HomeView view = Views.homeWithSongRow(new FakeApp(), 12);
        for (boolean api9 : new boolean[] {false, true}) {
            Template template = Pages.root(new FakeEnv(api9), new Pages.RootModel(Destination.HOME, false, null, view), rootActions);
            Set<String> texts = textsOf(template);
            assertFalse("api9=" + api9 + " " + texts, texts.contains("See all"));
            assertTrue("all twelve songs: the old cap of five is gone", texts.contains("Song 11"));
            assertTrue(carTypes(template).contains("GridSection"));
            for (SectionHeader header : collect(template, SectionHeader.class)) {
                assertEquals("no header on Home is a tap target", null, header.getOnClickDelegate());
            }
        }
        for (boolean api9 : new boolean[] {false, true}) {
            for (Destination destination : new Destination[] {Destination.HOME, Destination.DISCOVER}) {
                Template page = rootPage(api9, destination, false);
                assertFalse(destination + " api9=" + api9, textsOf(page).contains("See all"));
                for (SectionHeader header : collect(page, SectionHeader.class)) {
                    assertEquals(destination + " api9=" + api9 + ": no header is a tap target", null, header.getOnClickDelegate());
                }
            }
        }
    }

    @Test public void songRowsAreTilesThatPlayTheRowFromThatTile() {
        HomeView view = Views.homeWithSongRow(new FakeApp(), 3);
        for (boolean api9 : new boolean[] {false, true}) {
            Template template = Pages.root(new FakeEnv(api9), new Pages.RootModel(Destination.HOME, false, null, view), rootActions);
            GridItem second = null;
            for (GridItem tile : collect(template, GridItem.class)) {
                if (tile.getTitle() != null && "Song 1".equals(tile.getTitle().toString())) second = tile;
            }
            assertNotNull(second);
            assertEquals("title and artist", "A", second.getText().toString());
            rootCalls.clear();
            click(second.getOnClickDelegate());
            assertEquals(Arrays.asList("playTracks 1"), rootCalls);
        }
    }

    @Test public void theUmbraCardIsABannerAtApi9AndARowBelowAndTapsStartTheDjAndShowThePlayer() {
        for (boolean api9 : new boolean[] {false, true}) {
            djLive = false;
            Template idle = rootPage(api9, Destination.HOME, false);
            Set<String> texts = textsOf(idle);
            assertTrue(texts.toString(), texts.contains("Umbra") && texts.contains("Start the DJ"));
            assertEquals("a banner only at API 9", api9, carTypes(idle).contains("BannerSection"));
            rootCalls.clear();
            if (api9) {
                Banner banner = null;
                for (Banner candidate : collect(idle, Banner.class)) {
                    if ("Umbra".equals(candidate.getTitle().toString())) banner = candidate;
                }
                assertNotNull(banner);
                assertEquals("DJ", banner.getTrailingElements().get(0).getAction().getTitle().toString());
                click(banner.getOnClickDelegate());
                click(banner.getTrailingElements().get(0).getAction().getOnClickDelegate());
                assertFalse("no Stop while the DJ is not live", texts.contains("Stop") || texts.contains("Stop the DJ"));
            } else {
                Row umbra = null;
                for (Row row : collect(idle, Row.class)) if ("Umbra".equals(row.getTitle().toString())) umbra = row;
                assertNotNull(umbra);
                click(umbra.getOnClickDelegate());
                assertFalse("no Stop while the DJ is not live", texts.contains("Stop the DJ"));
            }
            assertEquals(api9 ? Arrays.asList("startDj", "startDj") : Arrays.asList("startDj"), rootCalls);
            // Live: the card says so, opens the player and offers Stop.
            djLive = true;
            Template live = rootPage(api9, Destination.HOME, false);
            Set<String> liveTexts = textsOf(live);
            assertTrue(liveTexts.toString(), liveTexts.contains("Playing"));
            assertFalse(liveTexts.toString(), liveTexts.contains("Start the DJ"));
            assertTrue(liveTexts.toString(), liveTexts.contains(api9 ? "Stop" : "Stop the DJ"));
            rootCalls.clear();
            if (api9) {
                Banner banner = null;
                for (Banner candidate : collect(live, Banner.class)) {
                    if ("Umbra".equals(candidate.getTitle().toString())) banner = candidate;
                }
                click(banner.getOnClickDelegate());
                click(banner.getTrailingElements().get(0).getAction().getOnClickDelegate());
            } else {
                for (Row row : collect(live, Row.class)) {
                    if ("Umbra".equals(row.getTitle().toString()) || "Stop the DJ".equals(row.getTitle().toString())) click(row.getOnClickDelegate());
                }
            }
            assertEquals(Arrays.asList("showPlayer", "stopDj"), rootCalls);
            djLive = false;
        }
    }

    @Test public void aReplayBeingBuiltIsACardWithoutATapTargetAndAReadyOneOpens() {
        for (boolean api9 : new boolean[] {false, true}) {
            Template template = rootPage(api9, Destination.HOME, false);
            GridItem replay = null;
            GridItem top = null;
            for (GridItem tile : collect(template, GridItem.class)) {
                String title = tile.getTitle() == null ? "" : tile.getTitle().toString();
                if (title.endsWith(" Replay")) replay = tile;
                if (title.equals("All-Time Top Songs")) top = tile;
            }
            assertNotNull("api9=" + api9, replay);
            assertNotNull(top);
            assertEquals("Building your replay…", replay.getText().toString());
            assertEquals("disabled: nothing to open yet", null, replay.getOnClickDelegate());
            rootCalls.clear();
            click(top.getOnClickDelegate());
            assertEquals(Arrays.asList("open All-Time Top Songs"), rootCalls);
        }
    }

    @Test public void libraryAtApi9UsesCondensedFacetsAndSectionHeadersAtApi8TilesAndTitles() {
        Set<String> types = carTypes(rootPage(true, Destination.LIBRARY, false));
        assertTrue(types.toString(), types.contains("CondensedSection"));
        assertTrue(types.toString(), types.contains("SectionHeader"));
        Set<String> api8 = carTypes(rootPage(false, Destination.LIBRARY, false));
        assertTrue(api8.contains("GridSection"));
        assertFalse(api8.contains("CondensedSection"));
    }

    @Test public void theUpNextHeaderActionOnlyAppearsWhileSomethingIsQueued() {
        Template without = rootPage(false, Destination.HOME, false);
        Template with = rootPage(false, Destination.HOME, true);
        assertEquals(1, ((SectionedItemTemplate) without).getHeader().getEndHeaderActions().size());
        assertEquals(2, ((SectionedItemTemplate) with).getHeader().getEndHeaderActions().size());
    }

    // ---- collections ---------------------------------------------------------------------------

    @Test public void everyCollectionBuildsAtBothLevelsAndApi9TypesNeverReachApi8() {
        FakeApp app = populated();
        for (Model.Collection collection : collections(app)) {
            for (boolean api9 : new boolean[] {false, true}) {
                for (boolean upcoming : new boolean[] {false, true}) {
                    Template template = Pages.collection(new FakeEnv(api9), collection, upcoming, true, collectionActions);
                    String label = collection.title + " api9=" + api9;
                    assertPlaybackAction(template);
                    assertTrue(label, chipSections(template) <= 1);
                    if (api9) {
                        if (!collection.tracks.isEmpty()) assertEquals(label + ": actions chips come first", "ChipSection", firstSection(template));
                    } else {
                        assertEquals(label, Arrays.<String>asList(), new ArrayList<>(api9In(template)));
                    }
                }
            }
        }
    }

    @Test public void aLongSongListIsCappedForDisplayButOffersShuffleAllAndSearchToFindMore() {
        FakeApp app = populated();
        Model.Collection songs = new LibraryStore(app).open(LibraryStore.Facet.SONGS);
        for (boolean api9 : new boolean[] {false, true}) {
            Template template = Pages.collection(new FakeEnv(api9), songs, false, true, collectionActions);
            Set<String> texts = textsOf(template);
            assertTrue(texts.toString(), texts.contains("Shuffle all 400 songs"));
            assertTrue(texts.toString(), texts.contains("Search to find more"));
            assertTrue(texts.toString(), texts.contains("Showing the first 300 of 400"));
            assertTrue("alphabetical lists are indexed", ((SectionedItemTemplate) template).isAlphabeticalIndexingAllowed());
        }
        Model.Collection recent = new LibraryStore(app).open(LibraryStore.Facet.RECENT);
        assertFalse(((SectionedItemTemplate) Pages.collection(new FakeEnv(false), recent, false, true, collectionActions)).isAlphabeticalIndexingAllowed());
    }

    @Test public void addToUpNextIsHiddenWhileALiveStationIsTuned() {
        Model.Collection songs = new LibraryStore(populated()).open(LibraryStore.Facet.FAVORITES);
        for (boolean api9 : new boolean[] {false, true}) {
            assertTrue(textsOf(Pages.collection(new FakeEnv(api9), songs, false, true, collectionActions)).contains("Add to Up Next"));
            Set<String> tuned = textsOf(Pages.collection(new FakeEnv(api9), songs, false, false, collectionActions));
            assertFalse("api9=" + api9 + " " + tuned, tuned.contains("Add to Up Next"));
            assertTrue(tuned.contains("Play"));
        }
    }

    @Test public void api9CollectionsCarryASubtitleAndAStartImageInTheHeader() {
        Model.Collection album = Model.Collection.ofTracks("An Album", "An Artist · 2026", "https://art/album", FakeApp.tracks("a", "b"), null, false);
        Template api9 = Pages.collection(new FakeEnv(true), album, false, true, collectionActions);
        assertTrue(textsOf(api9).toString(), textsOf(api9).contains("An Artist · 2026"));
        Template api8 = Pages.collection(new FakeEnv(false), album, false, true, collectionActions);
        assertFalse("API 8 headers have no subtitle", textsOf(api8).contains("An Artist · 2026"));
        assertEquals(Arrays.<String>asList(), new ArrayList<>(api9In(api8)));
    }

    @Test public void aCollectionBeingFetchedShowsASpinnerAndAFailedOneOffersARetry() {
        for (boolean api9 : new boolean[] {false, true}) {
            Template loading = Pages.collectionLoading(new FakeEnv(api9), "An Album");
            assertTrue(((SectionedItemTemplate) loading).isLoading());
            assertPlaybackAction(loading);
            Template failed = Pages.collectionFailed(new FakeEnv(api9), "An Album", new Runnable() { @Override public void run() { } });
            assertPlaybackAction(failed);
            assertTrue(textsOf(failed).toString(), textsOf(failed).contains("Couldn't load · Retry"));
            if (!api9) {
                assertEquals(Arrays.<String>asList(), new ArrayList<>(api9In(loading)));
                assertEquals(Arrays.<String>asList(), new ArrayList<>(api9In(failed)));
            }
        }
    }

    @Test public void anArtistPageShowsSongsThenAlbumsThenSingles() {
        Model.Tile albumTile = new Model.Tile("An Album", "Artist", null, null, new Model.Opener() {
            @Override public Model.Collection open() { return null; }
        });
        Model.Tile singleTile = new Model.Tile("A Single", "Artist", null, null, new Model.Opener() {
            @Override public Model.Collection open() { return null; }
        });
        Model.Collection artist = Model.Collection.ofTracksAndGroups("Artist", "", null, FakeApp.tracks("top1", "top2"), "Albums",
            Arrays.asList(albumTile), Arrays.asList(new Model.TileGroup("Singles", Arrays.asList(singleTile))), null);
        for (boolean api9 : new boolean[] {false, true}) {
            Set<String> texts = textsOf(Pages.collection(new FakeEnv(api9), artist, false, true, collectionActions));
            assertTrue(texts.toString(), texts.contains("Songs") && texts.contains("Albums") && texts.contains("Singles"));
            assertTrue(texts.contains("An Album") && texts.contains("A Single"));
        }
    }

    @Test public void emptyCollectionsShowAMessageRatherThanFailing() {
        for (Model.Kind kind : Model.Kind.values()) {
            Model.Collection empty = kind == Model.Kind.TRACKS ? Model.Collection.ofTracks("Empty", "", null,
                new ArrayList<Model.Track>(), null, false) : kind == Model.Kind.STATIONS
                ? Model.Collection.ofStations("Empty", new ArrayList<Model.Station>())
                : Model.Collection.ofTiles("Empty", kind, new ArrayList<Model.Tile>());
            for (boolean api9 : new boolean[] {false, true}) {
                assertNotNull(Pages.collection(new FakeEnv(api9), empty, false, true, collectionActions));
            }
        }
    }

    // ---- search --------------------------------------------------------------------------------

    private final List<String> searchCalls = new ArrayList<>();

    private final Pages.SearchActions searchActions = new Pages.SearchActions() {
        @Override public void textChanged(String text) { searchCalls.add("text " + text); }
        @Override public void submitted(String text) { searchCalls.add("submit " + text); }
        @Override public void open(Model.SearchResult result) { searchCalls.add("library " + result.mediaId); }
        @Override public void playTrack(int index) { searchCalls.add("play " + index); }
        @Override public void openTile(Model.Tile tile) { searchCalls.add("tile " + tile.title); }
        @Override public void filter(ProviderSearch.Filter filter) { searchCalls.add("filter " + filter.label); }
        @Override public void pickProvider() { searchCalls.add("pick"); }
    };

    private static List<Model.SearchResult> results(int songs, int playlists) {
        List<Model.SearchResult> results = new ArrayList<>();
        for (int i = 0; i < songs; i++) results.add(new Model.SearchResult(new Object(), "library::" + i, "Result song " + i, "Artist", null, false));
        for (int i = 0; i < playlists; i++) results.add(new Model.SearchResult(new Object(), "playlist::" + i, "Result playlist " + i, "Playlist", null, true));
        return results;
    }

    private static Model.Tile tile(String title, String subtitle) {
        return new Model.Tile(title, subtitle, "https://art/" + title.hashCode(), null, new Model.Opener() {
            @Override public Model.Collection open() { return null; }
        });
    }

    private static List<Model.SearchHit> hits(Model.SearchHit.Kind kind, String prefix, int count) {
        List<Model.SearchHit> hits = new ArrayList<>();
        for (int i = 0; i < count; i++) hits.add(new Model.SearchHit(kind, "provider-a", prefix + i, prefix + " " + i, "", null));
        return hits;
    }

    private static List<Model.Tile> tiles(String prefix, String subtitle, int count) {
        List<Model.Tile> tiles = new ArrayList<>();
        for (int i = 0; i < count; i++) tiles.add(tile(prefix + " " + i, subtitle));
        return tiles;
    }

    /** A provider's answer with this many of each type. */
    private static Pages.SearchState answer(ProviderSearch.Filter filter, boolean canPick, int songs, int albums, int artists, int playlists) {
        List<Model.Track> tracks = new ArrayList<>();
        for (int i = 0; i < songs; i++) tracks.add(FakeApp.track("Track " + i, "Artist " + i));
        Model.Found found = Model.Found.ofProvider(tracks, hits(Model.SearchHit.Kind.ALBUM, "Album", albums),
            hits(Model.SearchHit.Kind.ARTIST, "Artist", artists), hits(Model.SearchHit.Kind.PLAYLIST, "Playlist", playlists));
        return new Pages.SearchState("sample query", false, false, found, filter, "Provider A", canPick, tiles("Album", "A Band", albums),
            tiles("Artist", "", artists), tiles("Playlist", "A Creator", playlists));
    }

    private static List<String> rowTitles(Template template) {
        List<String> titles = new ArrayList<>();
        for (Row row : collect(template, Row.class)) titles.add(row.getTitle().toString());
        return titles;
    }

    @Test public void searchAtApi8IsASearchTemplateCutToTheHostsListLimit() {
        Template template = Pages.search(new FakeEnv(false), Pages.SearchState.library("jazz", false, false, results(20, 3)), 6, searchActions);
        assertEquals("SearchTemplate", template.getClass().getSimpleName());
        assertEquals(Arrays.<String>asList(), new ArrayList<>(api9In(template)));
        Set<String> texts = textsOf(template);
        assertTrue(texts.toString(), texts.contains("From your library"));
        assertTrue(texts.toString(), texts.contains("Result song 4"));
        assertFalse("the list (with its label row) is cut at the host's limit", texts.contains("Result song 6"));
    }

    @Test public void theHintNamesTheProviderOrTheLibraryAndAProviderChoiceIsAHeaderAction() {
        for (boolean api9 : new boolean[] {false, true}) {
            Template provider = Pages.search(new FakeEnv(api9), answer(ProviderSearch.Filter.ALL, true, 1, 1, 1, 1), 6, searchActions);
            Template library = Pages.search(new FakeEnv(api9), Pages.SearchState.library("jazz", false, false, results(1, 0)), 6, searchActions);
            if (api9) {
                assertEquals("Search Provider A", ((SectionedItemTemplate) provider).getSearchHeader().getSearchHint());
                assertEquals("Search your library", ((SectionedItemTemplate) library).getSearchHeader().getSearchHint());
                List<Action> end = ((SectionedItemTemplate) provider).getSearchHeader().getEndHeaderActions();
                assertEquals(1, end.size());
                assertEquals("the provider's name is the action", "Provider A", end.get(0).getTitle().toString());
                searchCalls.clear();
                click(end.get(0).getOnClickDelegate());
                assertEquals(Arrays.asList("pick"), searchCalls);
                assertTrue(((SectionedItemTemplate) library).getSearchHeader().getEndHeaderActions().isEmpty());
            } else {
                assertEquals("Search Provider A", ((androidx.car.app.model.SearchTemplate) provider).getSearchHint());
                assertEquals("Search your library", ((androidx.car.app.model.SearchTemplate) library).getSearchHint());
                List<Action> strip = ((androidx.car.app.model.SearchTemplate) provider).getActionStrip().getActions();
                assertEquals("Provider A", strip.get(0).getTitle().toString());
                assertEquals(null, ((androidx.car.app.model.SearchTemplate) library).getActionStrip());
            }
        }
        Template single = Pages.search(new FakeEnv(true), answer(ProviderSearch.Filter.ALL, false, 1, 1, 1, 1), 6, searchActions);
        assertTrue("with one provider there is nothing to pick",
            ((SectionedItemTemplate) single).getSearchHeader().getEndHeaderActions().isEmpty());
    }

    @Test public void searchAtApi8ListsTracksAlbumsArtistsAndPlaylistsInThatOrderWithTheTypeInTheSecondLine() {
        Template template = Pages.search(new FakeEnv(false), answer(ProviderSearch.Filter.ALL, false, 3, 2, 2, 2), 6, searchActions);
        assertEquals("SearchTemplate", template.getClass().getSimpleName());
        assertEquals(Arrays.<String>asList(), new ArrayList<>(api9In(template)));
        List<Item> items = ((androidx.car.app.model.SearchTemplate) template).getItemList().getItems();
        List<String> titles = new ArrayList<>();
        for (Item item : items) titles.add(((Row) item).getTitle().toString());
        assertEquals("tracks, albums, artists, playlists, cut at the host's limit of six",
            Arrays.asList("Track 0", "Track 1", "Track 2", "Album 0", "Album 1", "Artist 0"), titles);
        assertEquals(Arrays.asList("Artist 0", "Track"), texts(items.get(0)));
        assertEquals("an album shows its artist and its type", Arrays.asList("A Band", "Album"), texts(items.get(3)));
        assertEquals("an artist has only its type", Arrays.asList("Artist"), texts(items.get(5)));
        searchCalls.clear();
        click(((Row) items.get(1)).getOnClickDelegate());
        click(((Row) items.get(3)).getOnClickDelegate());
        assertEquals("a song plays from its index in the answer, an album opens", Arrays.asList("play 1", "tile Album 0"), searchCalls);
        Template roomy = Pages.search(new FakeEnv(false), answer(ProviderSearch.Filter.ALL, false, 3, 2, 2, 2), 50, searchActions);
        assertEquals(9, ((androidx.car.app.model.SearchTemplate) roomy).getItemList().getItems().size());
        assertTrue(rowTitles(roomy).contains("Playlist 1"));
    }

    private static List<String> texts(Item item) {
        List<String> texts = new ArrayList<>();
        for (CarText text : ((Row) item).getTexts()) texts.add(text.toString());
        return texts;
    }

    @Test public void searchAtApi9IsOneSectionedPageWithTheChipsFirstThenTracksAlbumsArtistsAndPlaylists() {
        Template template = Pages.search(new FakeEnv(true), answer(ProviderSearch.Filter.ALL, true, 3, 2, 2, 2), 6, searchActions);
        assertTrue(template instanceof SectionedItemTemplate);
        assertPlaybackAction(template);
        List<Section<?>> sections = sections(template);
        assertEquals("ChipSection", sections.get(0).getClass().getSimpleName());
        assertEquals(Arrays.asList("ChipSection", "RowSection", "GridSection", "GridSection", "GridSection"), sectionTypes(sections));
        assertEquals(Arrays.asList(null, "Tracks", "Albums", "Artists", "Playlists"), sectionTitles(sections));
        Set<String> texts = textsOf(template);
        for (String label : new String[] {"All", "Tracks", "Albums", "Artists", "Playlists"}) assertTrue(label, texts.contains(label));
        assertTrue(texts.toString(), texts.contains("A Band"));
        assertTrue("one chip is selected and styled", chipSelected(template, "All"));
        assertFalse(chipSelected(template, "Albums"));
    }

    private static List<String> sectionTypes(List<Section<?>> sections) {
        List<String> types = new ArrayList<>();
        for (Section<?> section : sections) types.add(section.getClass().getSimpleName());
        return types;
    }

    private static List<String> sectionTitles(List<Section<?>> sections) {
        List<String> titles = new ArrayList<>();
        for (Section<?> section : sections) titles.add(section.getTitle() == null ? null : section.getTitle().toString());
        return titles;
    }

    private static boolean chipSelected(Template template, String label) {
        for (androidx.car.app.model.Chip chip : collect(template, androidx.car.app.model.Chip.class)) {
            if (chip.getTitle() != null && label.equals(chip.getTitle().toString())) return chip.isSelected();
        }
        throw new AssertionError("no chip " + label);
    }

    @Test public void aTypeFilterShowsOnlyThatTypeAndEveryChipReportsItsFilter() {
        ProviderSearch.Filter[] filters = ProviderSearch.Filter.values();
        String[][] expected = {
            {"Tracks", "Albums", "Artists", "Playlists"}, {"Tracks"}, {"Albums"}, {"Artists"}, {"Playlists"}};
        for (int i = 0; i < filters.length; i++) {
            Template template = Pages.search(new FakeEnv(true), answer(filters[i], true, 3, 2, 2, 2), 6, searchActions);
            List<Section<?>> sections = sections(template);
            assertEquals(filters[i].label, Arrays.asList(expected[i]), sectionTitles(sections.subList(1, sections.size())));
        }
        Template template = Pages.search(new FakeEnv(true), answer(ProviderSearch.Filter.ALL, true, 3, 2, 2, 2), 6, searchActions);
        searchCalls.clear();
        for (androidx.car.app.model.Chip chip : collect(template, androidx.car.app.model.Chip.class)) click(chip.getOnClickDelegate());
        assertEquals(Arrays.asList("filter All", "filter Tracks", "filter Albums", "filter Artists", "filter Playlists"), searchCalls);
    }

    @Test public void searchShowsTenOfEachTypeUnderAllAndMoreOfOneTypeWhenItIsFiltered() {
        Template all = Pages.search(new FakeEnv(true), answer(ProviderSearch.Filter.ALL, true, 25, 25, 25, 25), 6, searchActions);
        assertEquals("ten tracks, ten albums, ten artists, ten playlists",
            40, count(rowTitles(all), "Track ") + collect(all, GridItem.class).size());
        Template albums = Pages.search(new FakeEnv(true), answer(ProviderSearch.Filter.ALBUMS, true, 25, 25, 25, 25), 6, searchActions);
        assertEquals("one type shows all twenty-five", 25, collect(albums, GridItem.class).size());
    }

    private static int count(List<String> titles, String prefix) {
        int count = 0;
        for (String title : titles) if (title.startsWith(prefix)) count++;
        return count;
    }

    @Test public void tracksPlayFromTheTappedRowAndAlbumsAndArtistsOpenTheirTile() {
        Template template = Pages.search(new FakeEnv(true), answer(ProviderSearch.Filter.ALL, true, 3, 2, 2, 2), 6, searchActions);
        searchCalls.clear();
        for (Row row : collect(template, Row.class)) if ("Track 2".equals(row.getTitle().toString())) click(row.getOnClickDelegate());
        for (GridItem item : collect(template, GridItem.class)) {
            String title = item.getTitle().toString();
            if (title.equals("Album 1") || title.equals("Artist 0") || title.equals("Playlist 1")) click(item.getOnClickDelegate());
        }
        assertEquals(Arrays.asList("play 2", "tile Album 1", "tile Artist 0", "tile Playlist 1"), searchCalls);
    }

    @Test public void artistsAreRoundTilesAndAlbumsAndPlaylistsAreLargeTiles() {
        Template template = Pages.search(new FakeEnv(true), answer(ProviderSearch.Filter.ALL, true, 1, 2, 2, 2), 6, searchActions);
        List<Section<?>> sections = sections(template);
        androidx.car.app.model.GridSection artists = (androidx.car.app.model.GridSection) sections.get(3);
        androidx.car.app.model.GridSection albums = (androidx.car.app.model.GridSection) sections.get(2);
        assertEquals(androidx.car.app.model.GridSection.ITEM_IMAGE_SHAPE_CIRCLE, artists.getItemImageShape());
        assertEquals(androidx.car.app.model.GridSection.ITEM_SIZE_LARGE, albums.getItemSize());
    }

    @Test public void theLibraryFallbackIsLabelledAtBothLevelsAndKeepsSongsAndPlaylists() {
        Pages.SearchState state = Pages.SearchState.library("jazz", false, false, results(2, 1));
        Template api9 = Pages.search(new FakeEnv(true), state, 6, searchActions);
        Set<String> texts = textsOf(api9);
        assertTrue(texts.toString(), texts.contains("From your library"));
        assertTrue(texts.toString(), texts.contains(ProviderSearch.NO_PROVIDER));
        assertTrue(texts.contains("Songs") && texts.contains("Playlists") && texts.contains("Result song 1"));
        assertFalse("no type chips on the library answer", carTypes(api9).contains("ChipSection"));
        searchCalls.clear();
        for (Row row : collect(api9, Row.class)) if ("Result song 0".equals(row.getTitle().toString())) click(row.getOnClickDelegate());
        assertEquals(Arrays.asList("library library::0"), searchCalls);
        Template api8 = Pages.search(new FakeEnv(false), state, 10, searchActions);
        assertTrue(textsOf(api8).contains("From your library"));
    }

    @Test public void theSectionedResultsPageOfApi8HasTitledSectionsAndTheFilterRows() {
        Template template = Pages.searchResults(new FakeEnv(false), answer(ProviderSearch.Filter.ALL, true, 3, 2, 2, 2), searchActions);
        assertTrue(template instanceof SectionedItemTemplate);
        assertEquals(Arrays.<String>asList(), new ArrayList<>(api9In(template)));
        assertPlaybackAction(template);
        List<Section<?>> sections = sections(template);
        assertEquals(Arrays.asList("Show", "Tracks", "Albums", "Artists", "Playlists"), sectionTitles(sections));
        assertTrue(rowTitles(template).containsAll(Arrays.asList("All", "Tracks", "Albums", "Artists", "Playlists")));
        searchCalls.clear();
        for (Row row : collect(template, Row.class)) if ("Albums".equals(row.getTitle().toString())) click(row.getOnClickDelegate());
        assertEquals("the filter asks nothing again, it only reports the pick", Arrays.asList("filter Albums"), searchCalls);
        Template albumsOnly = Pages.searchResults(new FakeEnv(false), answer(ProviderSearch.Filter.ALBUMS, true, 3, 2, 2, 2), searchActions);
        assertEquals(Arrays.asList("Show", "Albums"), sectionTitles(sections(albumsOnly)));
        assertEquals("sample query", ((SectionedItemTemplate) template).getHeader().getTitle().toString());
        assertTrue(textsOf(Pages.searchResults(new FakeEnv(false), Pages.SearchState.library("jazz", false, false, results(1, 0)), searchActions))
            .contains("From your library"));
    }

    @Test public void theProviderListMarksTheSelectedOneAndAPickReportsIt() {
        List<Model.SearchProvider> providers = Arrays.asList(new Model.SearchProvider("provider-a", "Provider A"), new Model.SearchProvider("provider-b", "Provider B"));
        final List<String> picked = new ArrayList<>();
        for (boolean api9 : new boolean[] {false, true}) {
            Template template = Pages.providers(new FakeEnv(api9), providers, "provider-b", new java.util.function.Consumer<Model.SearchProvider>() {
                @Override public void accept(Model.SearchProvider provider) { picked.add(provider.id); }
            });
            assertPlaybackAction(template);
            if (!api9) assertEquals(Arrays.<String>asList(), new ArrayList<>(api9In(template)));
            assertEquals(Arrays.asList("Provider A", "Provider B"), rowTitles(template));
            Set<String> texts = textsOf(template);
            assertTrue(texts.toString(), texts.contains("Selected"));
            for (Row row : collect(template, Row.class)) click(row.getOnClickDelegate());
        }
        assertEquals(Arrays.asList("provider-a", "provider-b", "provider-a", "provider-b"), picked);
    }

    @Test public void everySearchStateBuildsAtBothLevelsWithNoApi9ClassBelowApi9() {
        List<Pages.SearchState> states = Arrays.asList(
            Pages.SearchState.library("", false, false, new ArrayList<Model.SearchResult>()),
            Pages.SearchState.library("jazz", true, false, new ArrayList<Model.SearchResult>()),
            Pages.SearchState.library("jazz", false, true, new ArrayList<Model.SearchResult>()),
            Pages.SearchState.library("zzz", false, false, new ArrayList<Model.SearchResult>()),
            Pages.SearchState.library("jazz", false, false, results(1, 0)),
            Pages.SearchState.library("jazz", false, false, results(0, 1)),
            new Pages.SearchState("", false, false, Model.Found.NONE, ProviderSearch.Filter.ALL, "Provider A", true,
                new ArrayList<Model.Tile>(), new ArrayList<Model.Tile>(), new ArrayList<Model.Tile>()),
            new Pages.SearchState("zzz", false, false, Model.Found.NONE, ProviderSearch.Filter.ALL, "Provider A", false,
                new ArrayList<Model.Tile>(), new ArrayList<Model.Tile>(), new ArrayList<Model.Tile>()),
            new Pages.SearchState("sample query", true, false, Model.Found.NONE, ProviderSearch.Filter.ALL, "Provider A", true,
                new ArrayList<Model.Tile>(), new ArrayList<Model.Tile>(), new ArrayList<Model.Tile>()),
            answer(ProviderSearch.Filter.ALL, true, 1, 0, 0, 0),
            answer(ProviderSearch.Filter.ARTISTS, false, 0, 0, 1, 0),
            answer(ProviderSearch.Filter.PLAYLISTS, true, 2, 2, 2, 2));
        for (boolean api9 : new boolean[] {false, true}) {
            for (Pages.SearchState state : states) {
                Template search = Pages.search(new FakeEnv(api9), state, 6, searchActions);
                Template results = Pages.searchResults(new FakeEnv(api9), state, searchActions);
                assertNotNull(search);
                assertNotNull(results);
                if (!api9) {
                    assertEquals(Arrays.<String>asList(), new ArrayList<>(api9In(search)));
                    assertEquals(Arrays.<String>asList(), new ArrayList<>(api9In(results)));
                }
            }
        }
        Set<String> failed = textsOf(Pages.search(new FakeEnv(true), states.get(2), 6, searchActions));
        assertTrue(failed.toString(), failed.contains("Eclipse could not return search results"));
        Set<String> blank = textsOf(Pages.search(new FakeEnv(true), states.get(6), 6, searchActions));
        assertTrue(blank.toString(), blank.contains("Search songs, albums, artists and playlists"));
        Set<String> none = textsOf(Pages.search(new FakeEnv(true), states.get(7), 6, searchActions));
        assertTrue(none.toString(), none.contains("No results"));
    }

    // ---- queue ---------------------------------------------------------------------------------

    @Test public void theQueueBuildsAtBothLevelsWithBoundaryHeadersOnApi9() {
        for (boolean upNext : new boolean[] {false, true}) {
            for (boolean tail : new boolean[] {false, true}) {
                QueueView view = queueView(upNext, tail);
                Template api8 = Pages.queue(new FakeEnv(false), view, queueActions);
                assertPlaybackAction(api8);
                assertEquals(Arrays.<String>asList(), new ArrayList<>(api9In(api8)));
                Template api9 = Pages.queue(new FakeEnv(true), view, queueActions);
                assertPlaybackAction(api9);
                assertTrue("Now playing, Next from you and the context tail are boundaries on API 9",
                    api9In(api9).contains("SectionHeader"));
            }
        }
    }

    @Test public void clearOnlyShowsWhenSomethingIsQueuedByTheDriver() {
        assertEquals(1, ((SectionedItemTemplate) Pages.queue(new FakeEnv(false), queueView(true, true), queueActions)).getHeader().getEndHeaderActions().size());
        assertEquals(0, ((SectionedItemTemplate) Pages.queue(new FakeEnv(false), queueView(false, true), queueActions)).getHeader().getEndHeaderActions().size());
    }

    // ---- player --------------------------------------------------------------------------------

    @Test public void thePlayerIsOnlySentOnceATokenIsRegisteredAndStylesOnlyOnApi9() {
        Runnable none = new Runnable() { @Override public void run() { } };
        Template connecting = Pages.player(new FakeEnv(true), false, null, none, none);
        assertTrue("until then a loading message is shown", connecting instanceof MessageTemplate);
        Template failed = Pages.player(new FakeEnv(false), false, "Eclipse disconnected", none, none);
        assertTrue(failed instanceof MessageTemplate);
        Template api8 = Pages.player(new FakeEnv(false), true, null, none, none);
        assertEquals("MediaPlaybackTemplate", api8.getClass().getSimpleName());
        assertFalse(carTypes(api8).contains("MediaPlaybackStyle"));
        assertTrue(carTypes(Pages.player(new FakeEnv(true), true, null, none, none)).contains("MediaPlaybackStyle"));
    }
}
