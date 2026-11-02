package app.spicetify.extension.spotify.extensions;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotSame;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import android.content.Context;
import android.content.SharedPreferences;
import java.util.AbstractList;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;
import p.cpy;
import p.dpy;
import p.epy;
import p.gpy;

/**
 * The fakes copy the shapes found in Spotify 9.1.80.2221's dex: the kept protobuf field names of Home's
 * casita messages and Search's searchview messages, and the obfuscated chips' public fields. The search
 * chip types live in package {@code p} under their real names, because the filter tells {@code cpy} from
 * {@code dpy} by class.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 35, manifest = Config.NONE)
public class HidePodcastsTest {
    private static final String SHOW = "spotify:show:a";
    private static final String EPISODE = "spotify:episode:b";
    private static final String CHAPTER = "spotify:podcast-chapter:c";
    private static final String CLIP = "spotify:clip:d";
    private static final String TRACK = "spotify:track:e";
    private static final String ALBUM = "spotify:album:f";
    /** Audiobooks have show URIs too. */
    private static final String BOOK = "spotify:show:book";

    private final Context context = RuntimeEnvironment.getApplication();

    @Before
    public void setUp() {
        Extensions.setAppContext(context);
        Extensions.setOn(context, Extensions.HIDE_PODCASTS, true);
        preferences().edit().remove("hide_audiobooks").commit();
        // The status line is process-wide, so an earlier test's line can't pass for this one's.
        Extensions.status(Extensions.HIDE_PODCASTS, "set by setUp");
    }

    @After
    public void tearDown() {
        Extensions.setOn(context, Extensions.HIDE_PODCASTS, false);
        preferences().edit().remove("hide_audiobooks").commit();
    }

    @Test
    public void podcastUrisAreShowsEpisodesChaptersAndClips() {
        for (String uri : new String[] {SHOW, EPISODE, CHAPTER, CLIP}) assertTrue(uri, HidePodcasts.isPodcastUri(uri));
        for (String uri : new String[] {TRACK, ALBUM, "spotify:showcase:x", "spotify:user:show:", "", null}) {
            assertFalse(uri, HidePodcasts.isPodcastUri(uri));
        }
    }

    // ---- Home: sections (P1), shelf items (P2) and chips (P3) ----

    @Test
    public void aSectionOfOnlyPodcastItemsIsHiddenWhicheverWayItsItemsHang() {
        // A song where the walk must never look: each heading, and the section's info. Real headings hold
        // a link, not an identifier_, so this is a stricter stand in: entering either would find the song,
        // and the section would look mixed.
        Item song = new Item(TRACK);
        Object[] sections = {
            new Section(4, new WithItem(song, new Item(SHOW)), song), // Preview: item_
            new Section(37, new WithItems(song, list(new Item(SHOW), new Item(EPISODE))), song), // PreviewCarousel: items_
            new Section(3, new ImageLink(song, new ItemSource(1, new Provided(list(new Item(SHOW), new Item(CLIP))))),
                    song), // ImageLink: itemSource_, source_ (Provided), items_; its own source_ is an int
            new Section(2, new Shortcuts(song, new ItemSource(1, new Provided(list(new Item(EPISODE)))))), // Shortcuts
            new Section(11, new WithItems(song, list(new WatchFeedItem(new Item(EPISODE))))), // WatchFeed: items_, item_
            new Section(39, new WithItems(song, list(new PreviewPromotionCarouselItem(
                    new WithItem(song, new Item(SHOW)))))), // PreviewPromotionCarousel: items_, content_ (VideoPromo), item_
            new Section(31, new TopStoryCarousel(list(new TopStory(list(new Item(CHAPTER)))))), // stories_, items_
        };
        for (int i = 0; i < sections.length; i++) assertTrue("section " + i, HidePodcasts.hideHomeSection(sections[i]));
    }

    @Test
    public void aMixedSectionStaysAndItsShelfLosesOnlyThePodcastItems() {
        List<Object> items = list(new Item(TRACK), new Item(SHOW), new Item(ALBUM), new Item(EPISODE));
        Section shortcuts = new Section(2, new Shortcuts(null, new ItemSource(1, new Provided(items))));

        assertFalse(HidePodcasts.hideHomeSection(shortcuts));
        List<?> kept = HidePodcasts.filterHomeItems(items);

        assertEquals(Arrays.asList(TRACK, ALBUM), identifiers(kept));
        assertEquals(Arrays.asList(TRACK, SHOW, ALBUM, EPISODE), identifiers(items));
        assertFalse(HidePodcasts.hideHomeSection(
                new Section(37, new WithItems(null, list(new Item(SHOW), new Item(TRACK))))));
    }

    @Test
    public void aSectionWithNoItemUriStays() {
        Object[] sections = {
            new Section(10, new Shortcuts(null, new ItemSource(2, new LocalRecentlyPlayed()))), // recents, from the phone
            new Section(7, new Shortcuts(null, new ItemSource(3, new ListPlatform(SHOW)))), // a list's URI isn't an item's
            new Section(37, new WithItems(null, list())),
            new Section(9, new CallToAction()),
            new Section(0, null),
        };
        for (int i = 0; i < sections.length; i++) assertFalse("section " + i, HidePodcasts.hideHomeSection(sections[i]));
    }

    @Test
    public void theAudiobookInlineCardIsHiddenOnlyWhileAudiobooksAre() {
        Section card = new Section(34, new InlineCard());

        assertTrue(HidePodcasts.hideHomeSection(card));
        setAudiobooks(false);
        assertFalse(HidePodcasts.hideHomeSection(card));
    }

    @Test
    public void homeChipsLoseThePodcastChipsAndTheAudiobooksChipOnlyWithTheOption() {
        List<Object> chips = list(new Chip("music-chip"), new Chip("podcasts-chip"), new Chip("audiobooks-chip"),
                new Chip("podcasts-following-chip"), new Chip("default"));

        assertEquals(Arrays.asList("music-chip", "default"), chipIds(HidePodcasts.filterHomeChips(chips)));
        setAudiobooks(false);
        assertEquals(Arrays.asList("music-chip", "audiobooks-chip", "default"),
                chipIds(HidePodcasts.filterHomeChips(chips)));
    }

    // ---- Search: results (P4) and chips (P5) ----

    @Test
    public void showsEpisodesAndChaptersAreHiddenByTheirCaseWhateverTheirUri() {
        assertTrue(HidePodcasts.hideSearchEntity(new Entity(9, "", null))); // audioShow
        assertTrue(HidePodcasts.hideSearchEntity(new Entity(10, "", null))); // audioEpisode
        assertTrue(HidePodcasts.hideSearchEntity(new Entity(23, "", null))); // podcastChapter
        assertFalse(HidePodcasts.hideSearchEntity(new Entity(5, TRACK, null)));
        assertFalse(HidePodcasts.hideSearchEntity(new Entity(17, "spotify:author:g", null)));
    }

    @Test
    public void anAudiobookIsHiddenOnlyWithTheOptionThoughItsUriIsAShows() {
        Entity book = new Entity(13, BOOK, null);

        assertTrue(HidePodcasts.hideSearchEntity(book));
        setAudiobooks(false);
        assertFalse(HidePodcasts.hideSearchEntity(book));
    }

    @Test
    public void anyOtherEntityIsHiddenByItsUri() {
        assertTrue(HidePodcasts.hideSearchEntity(new Entity(2046, EPISODE, null))); // autocomplete
        assertTrue(HidePodcasts.hideSearchEntity(new Entity(7, CLIP, null)));
        assertFalse(HidePodcasts.hideSearchEntity(new Entity(2046, TRACK, null)));
    }

    @Test
    public void aSearchSectionIsHiddenWhenEveryItemInItIs() {
        Entity podcasts = section("", generic(new Entity(10, EPISODE, null)), instantMix(new Entity(9, SHOW, null)),
                generic(new Entity(13, BOOK, null)));

        assertTrue(HidePodcasts.hideSearchEntity(podcasts));
        int failures = failures(line());
        assertFalse(HidePodcasts.hideSearchEntity(section("", generic(new Entity(10, EPISODE, null)),
                generic(new Entity(5, TRACK, null)))));
        // A related search holds no entity: the section stays, and that's no failure.
        assertFalse(HidePodcasts.hideSearchEntity(section("", generic(new Entity(10, EPISODE, null)),
                new SectionItem(5, new RelatedSearchItem(SHOW)))));
        assertEquals(line(), failures, failures(line()));
        // A section goes by its items, never by its own URI, and an empty one stays.
        assertFalse(HidePodcasts.hideSearchEntity(section(SHOW)));
        assertFalse(HidePodcasts.hideSearchEntity(section(SHOW, generic(new Entity(5, TRACK, null)))));
        setAudiobooks(false);
        assertFalse(HidePodcasts.hideSearchEntity(podcasts));
    }

    @Test
    public void searchChipsLosePodcastsAndTheAudiobooksChipOnlyWithTheOption() {
        ArrayList<gpy> chips = new ArrayList<>(Arrays.asList(new gpy("videos", new cpy(1)), new gpy("podcasts", new cpy(2)),
                new gpy("audiobooks", new dpy(3)), new gpy("artists", new dpy(2)), new gpy("tracks", new dpy(7)),
                new gpy("new", new epy(2)), new gpy("untyped", null)));

        assertEquals(Arrays.asList("videos", "artists", "tracks", "new", "untyped"),
                filterIds(HidePodcasts.filterSearchChips(chips)));
        setAudiobooks(false);
        assertEquals(Arrays.asList("videos", "audiobooks", "artists", "tracks", "new", "untyped"),
                filterIds(HidePodcasts.filterSearchChips(chips)));
    }

    // ---- Your Library: chips (P6) ----

    @Test
    public void libraryChipsLosePodcastsAndOnlyWithTheOptionBooksAndAuthors() {
        List<Object> chips = list(new LibraryChip("playlists"), new LibraryChip("podcasts"), new LibraryChip("albums"),
                new LibraryChip("books"), new LibraryChip("authors"), new LibraryChip("all_downloaded"));

        assertEquals(Arrays.asList("playlists", "albums", "all_downloaded"),
                libraryIds(HidePodcasts.filterLibraryChips(chips)));
        setAudiobooks(false);
        assertEquals(Arrays.asList("playlists", "albums", "books", "authors", "all_downloaded"),
                libraryIds(HidePodcasts.filterLibraryChips(chips)));
    }

    // ---- Every filter ----

    @Test
    public void aFrozenListIsFilteredIntoANewListAndLeftAsItWas() {
        // list() is unmodifiable: every change throws, as it does on a protobuf list after parsing.
        List<Object> items = list(new Item(SHOW), new Item(TRACK));
        List<Object> homeChips = list(new Chip("podcasts-chip"), new Chip("music-chip"));
        List<Object> libraryChips = list(new LibraryChip("podcasts"), new LibraryChip("albums"));
        ArrayList<gpy> searchChips =
                new ArrayList<>(Arrays.asList(new gpy("podcasts", new cpy(2)), new gpy("tracks", new dpy(7))));
        List<gpy> searchBefore = new ArrayList<>(searchChips);

        List<?> keptItems = HidePodcasts.filterHomeItems(items);
        List<?> keptHomeChips = HidePodcasts.filterHomeChips(homeChips);
        List<?> keptLibraryChips = HidePodcasts.filterLibraryChips(libraryChips);
        ArrayList<?> keptSearchChips = HidePodcasts.filterSearchChips(searchChips);

        assertEquals(Collections.singletonList(TRACK), identifiers(keptItems));
        assertEquals(Collections.singletonList("music-chip"), chipIds(keptHomeChips));
        assertEquals(Collections.singletonList("albums"), libraryIds(keptLibraryChips));
        assertEquals(Collections.singletonList("tracks"), filterIds(keptSearchChips));
        assertNotSame(searchChips, keptSearchChips);
        assertEquals(searchBefore, searchChips);
        assertEquals(Arrays.asList(SHOW, TRACK), identifiers(items));
        assertEquals(Arrays.asList("podcasts-chip", "music-chip"), chipIds(homeChips));
        assertEquals(Arrays.asList("podcasts", "albums"), libraryIds(libraryChips));
    }

    @Test
    public void aFilterThatDropsNothingGivesSpotifyItsOwnList() {
        List<Object> items = list(new Item(TRACK), new Item(ALBUM));
        List<Object> homeChips = list(new Chip("music-chip"));
        ArrayList<gpy> searchChips = new ArrayList<>(Collections.singletonList(new gpy("tracks", new dpy(7))));
        List<Object> libraryChips = list(new LibraryChip("albums"));

        assertSame(items, HidePodcasts.filterHomeItems(items));
        assertSame(homeChips, HidePodcasts.filterHomeChips(homeChips));
        assertSame(searchChips, HidePodcasts.filterSearchChips(searchChips));
        assertSame(libraryChips, HidePodcasts.filterLibraryChips(libraryChips));
        assertEquals("set by setUp", line()); // nothing was counted
    }

    @Test
    public void withTheExtensionOffEveryFilterReturnsItsInput() {
        Extensions.setOn(context, Extensions.HIDE_PODCASTS, false);
        List<Object> items = list(new Item(SHOW));
        List<Object> homeChips = list(new Chip("podcasts-chip"));
        ArrayList<gpy> searchChips = new ArrayList<>(Collections.singletonList(new gpy("podcasts", new cpy(2))));
        List<Object> libraryChips = list(new LibraryChip("podcasts"));

        assertFalse(HidePodcasts.hideHomeSection(new Section(4, new WithItem(null, new Item(SHOW)))));
        assertFalse(HidePodcasts.hideHomeSection(new Section(34, new InlineCard())));
        assertSame(items, HidePodcasts.filterHomeItems(items));
        assertSame(homeChips, HidePodcasts.filterHomeChips(homeChips));
        assertFalse(HidePodcasts.hideSearchEntity(new Entity(10, EPISODE, null)));
        assertSame(searchChips, HidePodcasts.filterSearchChips(searchChips));
        assertSame(libraryChips, HidePodcasts.filterLibraryChips(libraryChips));

        Extensions.setOn(context, Extensions.HIDE_PODCASTS, true);
        assertEquals("set by setUp", line()); // nothing was counted
    }

    @Test
    public void aThrowingGetterOrAnUnexpectedShapeLeavesTheInputAsItWasAndSaysWhy() {
        List<Object> libraryChips = list(new LibraryChip("podcasts"), new ThrowingChip());
        assertSame(libraryChips, HidePodcasts.filterLibraryChips(libraryChips));
        assertTrue(line(), line().endsWith(", the last on Library chips: java.lang.IllegalStateException: no id"));
        int failures = failures(line());

        List<Object> items = list(new Item(SHOW), "not an item");
        assertSame(items, HidePodcasts.filterHomeItems(items));
        assertTrue(line(), line().endsWith(", the last on Home items: java.lang.NoSuchFieldException: identifier_"));
        List<Object> homeChips = list(new Chip("podcasts-chip"), new Object());
        assertSame(homeChips, HidePodcasts.filterHomeChips(homeChips));
        ArrayList<Object> searchChips = new ArrayList<>(Arrays.asList(new gpy("podcasts", new cpy(2)), new Object()));
        assertSame(searchChips, HidePodcasts.filterSearchChips(searchChips));
        assertFalse(HidePodcasts.hideHomeSection(new Object()));
        assertFalse(HidePodcasts.hideHomeSection(null));
        assertFalse(HidePodcasts.hideSearchEntity(new Object()));
        assertTrue(line(), line().endsWith(", the last on Search results: java.lang.NoSuchFieldException: entityCase_"));
        assertEquals(line(), failures + 6, failures(line()));
        // A result that isn't there is simply kept.
        assertFalse(HidePodcasts.hideSearchEntity(null));
        assertEquals(line(), failures + 6, failures(line()));
    }

    @Test
    public void anErrorWhileReadingSpotifysObjectsNeverReachesSpotify() {
        // A list that fails as a class Spotify changed would, with an Error rather than an Exception.
        List<Object> broken = new AbstractList<Object>() {
            @Override public Object get(int index) {
                throw new LinkageError("changed");
            }

            @Override public int size() {
                return 1;
            }
        };
        int failures = failures(line());

        assertSame(broken, HidePodcasts.filterHomeItems(broken));
        assertSame(broken, HidePodcasts.filterHomeChips(broken));
        assertSame(broken, HidePodcasts.filterLibraryChips(broken));
        ArrayList<Object> searchChips = new ArrayList<Object>() {
            @Override public Iterator<Object> iterator() {
                throw new LinkageError("changed");
            }
        };
        assertSame(searchChips, HidePodcasts.filterSearchChips(searchChips));
        assertFalse(HidePodcasts.hideHomeSection(new Section(37, new WithItems(null, broken))));
        assertFalse(HidePodcasts.hideSearchEntity(new Entity(14, "", new SearchSection(broken))));

        assertEquals(line(), failures + 6, failures(line()));
        assertTrue(line(), line().endsWith(", the last on Search results: java.lang.LinkageError: changed"));
    }

    // ---- Status ----

    @Test
    public void theTallyCountsEachSurfaceAndTheLastFailure() {
        HidePodcasts.Tally tally = new HidePodcasts.Tally();

        assertEquals("Hid 1 item (Home sections 1)", tally.hid("Home sections", 1));
        assertEquals("Hid 4 items (Home sections 1, Search results 3)", tally.hid("Search results", 3));
        assertEquals("Hid 5 items (Home sections 2, Search results 3)", tally.hid("Home sections", 1));
        assertEquals("Hid 5 items (Home sections 2, Search results 3); 1 failure, the last on Home chips: boom",
                tally.failed("Home chips: boom"));
        assertEquals("Hid 5 items (Home sections 2, Search results 3); 2 failures, the last on Search chips: bang",
                tally.failed("Search chips: bang"));
        assertEquals("Hid 0 items; 1 failure, the last on Home items: boom",
                new HidePodcasts.Tally().failed("Home items: boom"));
    }

    @Test
    public void eachFilterCountsWhatItHidUnderItsOwnSurface() {
        assertCounts("Home sections", 1, () ->
                HidePodcasts.hideHomeSection(new Section(4, new WithItem(null, new Item(SHOW)))));
        assertCounts("Home items", 2, () ->
                HidePodcasts.filterHomeItems(list(new Item(SHOW), new Item(TRACK), new Item(CLIP))));
        assertCounts("Home chips", 1, () ->
                HidePodcasts.filterHomeChips(list(new Chip("podcasts-chip"), new Chip("default"))));
        assertCounts("Search results", 1, () -> HidePodcasts.hideSearchEntity(new Entity(10, EPISODE, null)));
        assertCounts("Search chips", 2, () -> HidePodcasts.filterSearchChips(new ArrayList<>(Arrays.asList(
                new gpy("podcasts", new cpy(2)), new gpy("audiobooks", new dpy(3))))));
        assertCounts("Library chips", 3, () -> HidePodcasts.filterLibraryChips(list(new LibraryChip("podcasts"),
                new LibraryChip("books"), new LibraryChip("authors"), new LibraryChip("albums"))));
    }

    // ---- Helpers ----

    private SharedPreferences preferences() {
        return context.getSharedPreferences("spicetify_extensions", Context.MODE_PRIVATE);
    }

    private void setAudiobooks(boolean hidden) {
        preferences().edit().putBoolean("hide_audiobooks", hidden).commit();
    }

    /** An unmodifiable list: every change throws, as on a protobuf list after parsing. */
    private static List<Object> list(Object... elements) {
        return Collections.unmodifiableList(new ArrayList<>(Arrays.asList(elements)));
    }

    /** Hide podcasts' latest status. */
    private static String line() {
        return Extensions.latestStatus(Extensions.HIDE_PODCASTS);
    }

    /**
     * Runs {@code filter} twice and checks that the second run added {@code hidden} to both the total
     * and {@code surface}'s count. The first run puts {@code surface} in the line whatever came before.
     */
    private static void assertCounts(String surface, int hidden, Runnable filter) {
        filter.run();
        int[] before = counts(line(), surface);
        filter.run();
        int[] after = counts(line(), surface);
        assertEquals(surface + " total", before[0] + hidden, after[0]);
        assertEquals(surface, before[1] + hidden, after[1]);
    }

    /** {the total, {@code surface}'s count}, read from a line like "Hid 5 items (Home sections 2, Search results 3)". */
    private static int[] counts(String line, String surface) {
        Matcher total = Pattern.compile("^Hid (\\d+) items? \\(").matcher(line);
        Matcher count = Pattern.compile("(?:\\(|, )" + Pattern.quote(surface) + " (\\d+)(?:,|\\))").matcher(line);
        assertTrue(line, total.find() && count.find());
        return new int[] {Integer.parseInt(total.group(1)), Integer.parseInt(count.group(1))};
    }

    /** The failures a line counts, as in "Hid 5 items (Home sections 5); 2 failures, the last on ...", or 0. */
    private static int failures(String line) {
        Matcher failures = Pattern.compile("; (\\d+) failures?, the last on ").matcher(line);
        return failures.find() ? Integer.parseInt(failures.group(1)) : 0;
    }

    private static List<String> identifiers(List<?> items) {
        List<String> uris = new ArrayList<>();
        for (Object item : items) uris.add(((Item) item).identifier_);
        return uris;
    }

    private static List<String> chipIds(List<?> chips) {
        List<String> ids = new ArrayList<>();
        for (Object chip : chips) ids.add(((Chip) chip).a);
        return ids;
    }

    private static List<String> filterIds(List<?> chips) {
        List<String> ids = new ArrayList<>();
        for (Object chip : chips) ids.add(((gpy) chip).a);
        return ids;
    }

    private static List<String> libraryIds(List<?> chips) {
        List<String> ids = new ArrayList<>();
        for (Object chip : chips) ids.add(((LibraryChip) chip).getId());
        return ids;
    }

    private static Entity section(String uri, SectionItem... items) {
        return new Entity(14, uri, new SearchSection(list((Object[]) items)));
    }

    private static SectionItem generic(Entity entity) {
        return new SectionItem(2, new GenericItem(entity));
    }

    private static SectionItem instantMix(Entity entity) {
        return new SectionItem(4, new InstantMixItem(entity));
    }

    // ---- Home's casita messages ----

    /** casita's Item: its URI in identifier_, beside a string list. */
    @SuppressWarnings({"unused", "FieldCanBeLocal"})
    static final class Item {
        private final String identifier_;
        private final List<String> highlightedSubItems_ = Collections.emptyList();

        Item(String identifier) {
            identifier_ = identifier;
        }
    }

    /** casita's Section: the featureType_ oneof with its case, and sectionInfo_. */
    @SuppressWarnings({"unused", "FieldCanBeLocal"})
    static final class Section {
        private final int bitField0_ = 1;
        private final int featureTypeCase_;
        private final Object featureType_;
        private final Object sectionInfo_;

        Section(int featureTypeCase, Object featureType) {
            this(featureTypeCase, featureType, null);
        }

        Section(int featureTypeCase, Object featureType, Object sectionInfo) {
            featureTypeCase_ = featureTypeCase;
            featureType_ = featureType;
            sectionInfo_ = sectionInfo;
        }
    }

    /** A member with one item_, such as Preview (4), Showcase (17) or AudioPromo (33); and VideoPromo. */
    @SuppressWarnings({"unused", "FieldCanBeLocal"})
    static final class WithItem {
        private final Object heading_;
        private final Item item_;

        WithItem(Object heading, Item item) {
            heading_ = heading;
            item_ = item;
        }
    }

    /** A member with items_, such as PreviewCarousel (37), WatchFeed (11) or PreviewPromotionCarousel (39). */
    @SuppressWarnings({"unused", "FieldCanBeLocal"})
    static final class WithItems {
        private final Object heading_;
        private final List<?> items_;

        WithItems(Object heading, List<?> items) {
            heading_ = heading;
            items_ = items;
        }
    }

    /** casita's ImageLink (3): an itemSource_, and a source_ of its own that is an int. */
    @SuppressWarnings({"unused", "FieldCanBeLocal"})
    static final class ImageLink {
        private final Object heading_;
        private final ItemSource itemSource_;
        private final int source_ = 2;
        private final int density_ = 1;

        ImageLink(Object heading, ItemSource itemSource) {
            heading_ = heading;
            itemSource_ = itemSource;
        }
    }

    /** casita's Shortcuts (2), and the other members with only an itemSource_. */
    @SuppressWarnings({"unused", "FieldCanBeLocal"})
    static final class Shortcuts {
        private final int bitField0_ = 1;
        private final Object heading_;
        private final ItemSource itemSource_;

        Shortcuts(Object heading, ItemSource itemSource) {
            heading_ = heading;
            itemSource_ = itemSource;
        }
    }

    /** casita's ItemSource: the source_ oneof, 1 Provided, 2 LocalRecentlyPlayed or 3 ListPlatform. */
    @SuppressWarnings({"unused", "FieldCanBeLocal"})
    static final class ItemSource {
        private final int sourceCase_;
        private final Object source_;

        ItemSource(int sourceCase, Object source) {
            sourceCase_ = sourceCase;
            source_ = source;
        }
    }

    @SuppressWarnings({"unused", "FieldCanBeLocal"})
    static final class Provided {
        private final List<?> items_;

        Provided(List<?> items) {
            items_ = items;
        }
    }

    static final class LocalRecentlyPlayed {
    }

    @SuppressWarnings({"unused", "FieldCanBeLocal"})
    static final class ListPlatform {
        private final String listUri_;

        ListPlatform(String listUri) {
            listUri_ = listUri;
        }
    }

    @SuppressWarnings({"unused", "FieldCanBeLocal"})
    static final class WatchFeedItem {
        private final int bitField0_ = 1;
        private final Object entrypoint_ = null;
        private final Item item_;

        WatchFeedItem(Item item) {
            item_ = item;
        }
    }

    /** Its content_ oneof holds a VideoPromo (case 1). */
    @SuppressWarnings({"unused", "FieldCanBeLocal"})
    static final class PreviewPromotionCarouselItem {
        private final int contentCase_ = 1;
        private final Object content_;

        PreviewPromotionCarouselItem(Object content) {
            content_ = content;
        }
    }

    @SuppressWarnings({"unused", "FieldCanBeLocal"})
    static final class TopStoryCarousel {
        private final List<?> stories_;

        TopStoryCarousel(List<?> stories) {
            stories_ = stories;
        }
    }

    @SuppressWarnings({"unused", "FieldCanBeLocal"})
    static final class TopStory {
        private final String title_ = "Story";
        private final List<?> items_;

        TopStory(List<?> items) {
            items_ = items;
        }
    }

    /** casita's InlineCard (34): only type_, 1 being MESSAGING_AUDIOBOOK_SUBFEED. */
    @SuppressWarnings({"unused", "FieldCanBeLocal"})
    static final class InlineCard {
        private final int type_ = 1;
    }

    /** casita's CallToAction (9), which has no items. */
    @SuppressWarnings({"unused", "FieldCanBeLocal"})
    static final class CallToAction {
        private final int variantCase_ = 0;
        private final Object variant_ = null;
    }

    /** Spotify's Home chip {@code Lp/ztx;}: its id in public field a, then its name, another id and its children. */
    public static final class Chip {
        public final String a;
        public final String b = "Name";
        public final String c = "id";
        public final List<Chip> d = Collections.emptyList();

        Chip(String a) {
            this.a = a;
        }
    }

    // ---- Search's searchview messages ----

    /** searchview's Entity: the entity_ oneof with its case in entityCase_, and uri_. */
    @SuppressWarnings({"unused", "FieldCanBeLocal"})
    static final class Entity {
        private final int entityCase_;
        private final Object entity_;
        private final String uri_;
        private final String name_ = "Name";

        Entity(int entityCase, String uri, Object entity) {
            entityCase_ = entityCase;
            uri_ = uri;
            entity_ = entity;
        }
    }

    /** searchview's Section, the entity of case 14: its items_ are SectionItems. */
    @SuppressWarnings({"unused", "FieldCanBeLocal"})
    static final class SearchSection {
        private final int type_ = 0;
        private final List<?> items_;

        SearchSection(List<?> items) {
            items_ = items;
        }
    }

    /** searchview's SectionItem: the item_ oneof, 2 GenericItem and 4 InstantMixItem among others, with itemCase_. */
    @SuppressWarnings({"unused", "FieldCanBeLocal"})
    static final class SectionItem {
        private final int itemCase_;
        private final Object item_;

        SectionItem(int itemCase, Object item) {
            itemCase_ = itemCase;
            item_ = item;
        }
    }

    @SuppressWarnings({"unused", "FieldCanBeLocal"})
    static final class GenericItem {
        private final int bitField0_ = 1;
        private final Entity entity_;

        GenericItem(Entity entity) {
            entity_ = entity;
        }
    }

    @SuppressWarnings({"unused", "FieldCanBeLocal"})
    static final class InstantMixItem {
        private final Entity entity_;
        private final String sessionId_ = "session";

        InstantMixItem(Entity entity) {
            entity_ = entity;
        }
    }

    /** A section item of case 5, which holds no entity. */
    @SuppressWarnings({"unused", "FieldCanBeLocal"})
    static final class RelatedSearchItem {
        private final String uri_;

        RelatedSearchItem(String uri) {
            uri_ = uri;
        }
    }

    // ---- Your Library's chips ----

    /** A Your Library chip, a subclass of {@code Lp/j770;}, whose id comes from the kept getId(). */
    public static final class LibraryChip {
        private final String id;

        LibraryChip(String id) {
            this.id = id;
        }

        public String getId() {
            return id;
        }
    }

    public static final class ThrowingChip {
        public String getId() {
            throw new IllegalStateException("no id");
        }
    }
}
