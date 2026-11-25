package nl.johninnl.trouw;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;
import static org.junit.Assert.fail;

import java.lang.reflect.Field;
import java.time.ZonedDateTime;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.concurrent.TimeUnit;
import nl.dpgmedia.mcdpg.amalia.audio.data.network.dto.AudioItemContentResponse;
import nl.dpgmedia.mcdpg.amalia.car.data.model.CarAudioQueue;
import nl.dpgmedia.mcdpg.amalia.car.data.model.dto.CarTabSdUiResponse;
import nl.dpgmedia.mcdpg.amalia.car.ui.mediaitem.CarLaneItemQueue;
import nl.dpgmedia.mcdpg.amalia.util.kotlin.result.AmaliaResult;
import org.junit.Test;

/** Feed walk, DTO synthesis and result rewriting on JVM doubles of the app classes. */
public class CarNieuwsTest {
    private static final ZonedDateTime MORNING = ZonedDateTime.parse("2026-11-05T07:15+01:00[Europe/Amsterdam]");
    private static final ZonedDateTime EVENING = ZonedDateTime.parse("2026-11-05T18:40+01:00[Europe/Amsterdam]");

    @Test
    public void walkCollectsSpokenArticlesInFeedOrderWithPublicationTimes() {
        Object page = FeedFakes.page(
            FeedFakes.group(
                FeedFakes.block(
                    FeedFakes.article("urn:1", "Kabinet valt over begroting", "https://img/1.jpg", false, 240_000L, MORNING),
                    FeedFakes.articleWithoutTts(MORNING)),
                FeedFakes.block(
                    FeedFakes.article("urn:2", "Oranje wint", null, true, null, EVENING))),
            FeedFakes.group(
                FeedFakes.block(
                    FeedFakes.article("urn:1", "Kabinet valt over begroting", "https://img/1.jpg", false, 240_000L, MORNING))));

        List<CarNieuws.Item> items = CarNieuws.overviewItems(page);

        assertEquals(2, items.size());
        assertEquals("urn:1", items.get(0).urn);
        assertEquals("Kabinet valt over begroting", items.get(0).title);
        assertEquals("https://img/1.jpg", items.get(0).imageUrl);
        assertEquals(240_000L, items.get(0).durationMs);
        assertEquals(MORNING.toInstant().toEpochMilli(), items.get(0).publishedAtMs);
        assertTrue(!items.get(0).premium);
        assertEquals("urn:2", items.get(1).urn);
        assertTrue(items.get(1).premium);
        assertEquals(0L, items.get(1).durationMs);
        assertNull(items.get(1).imageUrl);
    }

    @Test
    public void fromTtsRejectsRowsWithoutUrnOrTitle() {
        assertNull(CarNieuws.fromTts(new FeedFakes.Tts(null, "title", null, false, null), 0L));
        assertNull(CarNieuws.fromTts(new FeedFakes.Tts("", "title", null, false, null), 0L));
        assertNull(CarNieuws.fromTts(new FeedFakes.Tts("urn", "", null, false, null), 0L));
        assertNull(CarNieuws.fromTts(null, 0L));
    }

    @Test
    public void slimQueuesDeliversAll68RowsAndRestoresTheirFullNativeQueue() {
        List<CarAudioQueue.Item> articles = new ArrayList<CarAudioQueue.Item>();
        for (int i = 0; i < 68; i++) {
            articles.add(new CarAudioQueue.Item(CarAudioQueue.Item.Type.Article, "full-feed-" + i));
        }
        CarAudioQueue full = new CarAudioQueue(articles);
        List<Object> lane = new ArrayList<Object>();
        for (int i = 0; i < 68; i++) lane.add(CarLaneItemQueue.of(full, "full-feed-" + i));

        List<?> slimmed = (List<?>) CarNieuws.slimQueues(lane);

        assertEquals(68, slimmed.size());
        for (int i = 0; i < 68; i++) {
            CarLaneItemQueue row = (CarLaneItemQueue) slimmed.get(i);
            assertEquals("full-feed-" + i, row.m6831getQueueUidEU6Fzmo());
            assertEquals(1, row.getQueue().getItems().size());
            assertSame(articles.get(i), row.getQueue().getItems().get(0));
            assertSame(full, CarNieuws.restoreQueue(row.getQueue()));
        }
        assertEquals(68, full.getItems().size());
    }

    @Test
    public void restoreQueueKeepsAcceptedFeedAcrossBrowseRefreshesUntilANewFeedIsAccepted() {
        List<CarAudioQueue.Item> previousItems = new ArrayList<CarAudioQueue.Item>();
        previousItems.add(new CarAudioQueue.Item(CarAudioQueue.Item.Type.Article, "previous-0"));
        previousItems.add(new CarAudioQueue.Item(CarAudioQueue.Item.Type.Article, "previous-1"));
        previousItems.add(new CarAudioQueue.Item(CarAudioQueue.Item.Type.Article, "previous-2"));
        CarAudioQueue previousFull = new CarAudioQueue(previousItems);
        List<Object> previousLane = new ArrayList<Object>();
        previousLane.add(CarLaneItemQueue.of(previousFull, "previous-0"));
        previousLane.add(CarLaneItemQueue.of(previousFull, "previous-1"));
        previousLane.add(CarLaneItemQueue.of(previousFull, "previous-2"));
        List<?> previousRows = (List<?>) CarNieuws.slimQueues(previousLane);
        CarAudioQueue selectedRow = ((CarLaneItemQueue) previousRows.get(1)).getQueue();

        assertSame(previousFull, CarNieuws.restoreQueue(selectedRow));
        assertTrue("resolving a selection must wait for the native queue commit",
            !CarNieuws.isNewsUid("previous-1"));
        CarNieuws.acceptNewsQueue("previous-1", Arrays.asList("previous-0", "previous-1", "previous-2"));
        assertTrue(CarNieuws.isNewsUid("previous-0"));
        assertTrue(CarNieuws.isNewsUid("previous-1"));
        assertTrue(CarNieuws.isNewsUid("previous-2"));

        CarAudioQueue refreshedFull = null;
        List<?> refreshedRows = null;
        for (int generation = 0; generation < 6; generation++) {
            String prefix = "refreshed-" + generation + "-";
            List<CarAudioQueue.Item> refreshedItems = new ArrayList<CarAudioQueue.Item>();
            refreshedItems.add(new CarAudioQueue.Item(CarAudioQueue.Item.Type.Article, prefix + "0"));
            refreshedItems.add(new CarAudioQueue.Item(CarAudioQueue.Item.Type.Article, prefix + "1"));
            refreshedFull = new CarAudioQueue(refreshedItems);
            List<Object> refreshedLane = new ArrayList<Object>();
            refreshedLane.add(CarLaneItemQueue.of(refreshedFull, prefix + "0"));
            refreshedLane.add(CarLaneItemQueue.of(refreshedFull, prefix + "1"));
            refreshedRows = (List<?>) CarNieuws.slimQueues(refreshedLane);
            assertTrue("browsing must not replace the selected feed", CarNieuws.isNewsUid("previous-1"));
            assertTrue("unselected browse rows must not become active", !CarNieuws.isNewsUid(prefix + "0"));
        }

        assertSame("the selected feed must outlive the recent browse-generation cache",
            previousFull, CarNieuws.restoreQueue(selectedRow));
        assertEquals("previous-0", previousFull.getItems().get(0).m6831getQueueUidEU6Fzmo());
        assertEquals("previous-2", previousFull.getItems().get(2).m6831getQueueUidEU6Fzmo());
        assertSame(refreshedFull, CarNieuws.restoreQueue(((CarLaneItemQueue) refreshedRows.get(0)).getQueue()));
        assertTrue("a pending or rejected selection must preserve the accepted feed",
            CarNieuws.isNewsUid("previous-1"));
        assertTrue("a selection is not active before the native queue accepts it",
            !CarNieuws.isNewsUid("refreshed-5-0"));
        CarNieuws.acceptNewsQueue("refreshed-5-0", Arrays.asList("refreshed-5-0", "refreshed-5-1"));
        assertTrue(CarNieuws.isNewsUid("refreshed-5-0"));
        assertTrue(CarNieuws.isNewsUid("refreshed-5-1"));
        assertTrue("accepting a fresh feed replaces the previous context", !CarNieuws.isNewsUid("previous-1"));
    }

    @Test
    public void snapshotKeepsRepeatedStoriesAsDistinctOpaqueQueueOccurrences() {
        Object canonicalStory = "urn:story:42";
        NewsQueueBridge.Entry first = new NewsQueueBridge.Entry(
            "opaque:first-occurrence", "The same headline", "https://img/story.jpg", 120_000L, canonicalStory);
        NewsQueueBridge.Entry repeated = new NewsQueueBridge.Entry(
            "opaque:second-occurrence", "The same headline", "https://img/story.jpg", 120_000L, canonicalStory);
        List<NewsQueueBridge.Entry> entries = new ArrayList<NewsQueueBridge.Entry>();
        entries.add(first);
        entries.add(repeated);

        NewsQueueBridge.Snapshot snapshot = new NewsQueueBridge.Snapshot(entries, repeated.uid);

        assertEquals(2, snapshot.entries.size());
        assertSame(first, snapshot.entries.get(0));
        assertSame(repeated, snapshot.entries.get(1));
        assertEquals(0, snapshot.indexOf(first.uid));
        assertEquals(1, snapshot.indexOf(repeated.uid));
        assertEquals(1, snapshot.currentIndex);
        assertEquals(repeated.uid, snapshot.currentUid);
        assertEquals("canonical article IDs must not substitute for occurrence UIDs",
            -1, snapshot.indexOf((String) canonicalStory));
    }

    @Test
    public void snapshotStartsAtFirstMiddleOrLastWithoutDroppingEarlierArticles() {
        List<NewsQueueBridge.Entry> entries = new ArrayList<NewsQueueBridge.Entry>();
        entries.add(new NewsQueueBridge.Entry("opaque:first", "First", null, 60_000L, null));
        entries.add(new NewsQueueBridge.Entry("opaque:middle", "Middle", null, 90_000L, null));
        entries.add(new NewsQueueBridge.Entry("opaque:last", "Last", null, 120_000L, null));

        NewsQueueBridge.Snapshot first = new NewsQueueBridge.Snapshot(entries, "opaque:first");
        NewsQueueBridge.Snapshot middle = new NewsQueueBridge.Snapshot(entries, "opaque:middle");
        NewsQueueBridge.Snapshot last = new NewsQueueBridge.Snapshot(entries, "opaque:last");

        assertEquals(0, first.currentIndex);
        assertEquals(1, middle.currentIndex);
        assertEquals(2, last.currentIndex);
        assertEquals(entries, first.entries);
        assertEquals(entries, middle.entries);
        assertEquals(entries, last.entries);
        assertEquals("Previous must retain the first occurrence when starting in the middle",
            0, middle.indexOf("opaque:first"));
        assertEquals(-1, middle.indexOf("missing"));
        assertEquals(-1, middle.indexOf(null));
        assertEquals(-1, new NewsQueueBridge.Snapshot(entries, "missing").currentIndex);
    }

    @Test
    public void snapshotPreservesItsOrderAndCurrentOccurrenceWhenTheSourceListChanges() {
        List<NewsQueueBridge.Entry> entries = new ArrayList<NewsQueueBridge.Entry>();
        NewsQueueBridge.Entry first = new NewsQueueBridge.Entry("immutable:first", "First", null, 0L, null);
        NewsQueueBridge.Entry current = new NewsQueueBridge.Entry("immutable:current", "Current", null, 0L, null);
        entries.add(first);
        entries.add(current);
        NewsQueueBridge.Snapshot snapshot = new NewsQueueBridge.Snapshot(entries, current.uid);

        entries.clear();
        entries.add(new NewsQueueBridge.Entry("replacement", "New headline", null, 0L, null));

        assertEquals(2, snapshot.entries.size());
        assertSame(first, snapshot.entries.get(0));
        assertSame(current, snapshot.entries.get(1));
        assertEquals(1, snapshot.currentIndex);
        assertEquals(-1, snapshot.indexOf("replacement"));
        try {
            snapshot.entries.clear();
            fail("The accepted feed snapshot must be immutable");
        } catch (UnsupportedOperationException expected) {
            // A controller must not be able to mutate the native feed ordering.
        }
    }

    @Test(expected = IllegalArgumentException.class)
    public void snapshotRejectsDuplicateOccurrenceUids() {
        List<NewsQueueBridge.Entry> entries = new ArrayList<NewsQueueBridge.Entry>();
        entries.add(new NewsQueueBridge.Entry("duplicate", "First", null, 0L, null));
        entries.add(new NewsQueueBridge.Entry("duplicate", "Different story", null, 0L, null));
        new NewsQueueBridge.Snapshot(entries, "duplicate");
    }

    @Test(expected = IllegalArgumentException.class)
    public void snapshotRejectsMissingOccurrenceUids() {
        List<NewsQueueBridge.Entry> entries = new ArrayList<NewsQueueBridge.Entry>();
        entries.add(new NewsQueueBridge.Entry(null, "Headline", null, 0L, null));
        new NewsQueueBridge.Snapshot(entries, null);
    }

    @Test(expected = IllegalArgumentException.class)
    public void snapshotRejectsEmptyOccurrenceUids() {
        List<NewsQueueBridge.Entry> entries = new ArrayList<NewsQueueBridge.Entry>();
        entries.add(new NewsQueueBridge.Entry("", "Headline", null, 0L, null));
        new NewsQueueBridge.Snapshot(entries, "");
    }

    @Test
    public void restoreQueueLeavesUnknownAndMissingQueuesAlone() {
        List<CarAudioQueue.Item> items = new ArrayList<CarAudioQueue.Item>();
        items.add(new CarAudioQueue.Item(CarAudioQueue.Item.Type.Article, "unknown-article"));
        CarAudioQueue unknown = new CarAudioQueue(items);
        assertSame(unknown, CarNieuws.restoreQueue(unknown));
        assertNull(CarNieuws.restoreQueue(null));
    }

    @Test
    public void slimQueuesLeavesPodcastLanesAlone() {
        List<CarAudioQueue.Item> episodes = new ArrayList<CarAudioQueue.Item>();
        for (int i = 0; i < 30; i++) {
            episodes.add(new CarAudioQueue.Item(CarAudioQueue.Item.Type.Podcast, "p" + i));
        }
        CarAudioQueue full = new CarAudioQueue(episodes);
        List<Object> podcastLane = new ArrayList<Object>();
        podcastLane.add(CarLaneItemQueue.of(full, "p0"));
        assertSame(podcastLane, CarNieuws.slimQueues(podcastLane));
        assertSame(full, CarNieuws.restoreQueue(full));
    }

    @Test
    public void componentIncludesFeedsLargerThanTheFormer200RowLimit() {
        List<CarNieuws.Item> items = new ArrayList<CarNieuws.Item>();
        for (int i = 0; i < 250; i++) {
            items.add(new CarNieuws.Item("urn:" + i, "t", null, false, 0L, 0L));
        }
        CarTabSdUiResponse.Component component = (CarTabSdUiResponse.Component) CarNieuws.buildComponent(items);
        assertEquals(250, component.getContent().size());
        assertEquals("urn:249", ((AudioItemContentResponse) component.getContent().get(249)).getUrn());
    }

    @Test
    public void componentCarriesSpokenArticleRowsForEveryHeadline() throws Exception {
        List<CarNieuws.Item> items = new ArrayList<CarNieuws.Item>();
        items.add(new CarNieuws.Item("urn:1", "Kabinet valt over begroting", "https://img/1.jpg", false, 240_000L, MORNING.toInstant().toEpochMilli()));
        items.add(new CarNieuws.Item("urn:2", "Oranje wint", null, true, 0L, EVENING.toInstant().toEpochMilli()));

        Object component = CarNieuws.buildComponent(items);

        CarTabSdUiResponse.Component carComponent = (CarTabSdUiResponse.Component) component;
        assertEquals("Playlist", carComponent.getComponentName());
        assertEquals("Nieuws", carComponent.getTitle());
        assertNull(carComponent.getId());
        assertEquals(2, carComponent.getContent().size());
        AudioItemContentResponse first = (AudioItemContentResponse) carComponent.getContent().get(0);
        assertEquals("spoken_article", first.getType());
        assertEquals("urn:1", first.getUrn());
        assertEquals("Kabinet valt over begroting", first.getTitle());
        assertEquals(240_000L, first.getDurationMs());
        assertEquals(MORNING.toInstant().toEpochMilli(), first.getPublicationTimeStampMs());
        assertEquals("FREE", first.getContentAccessCategoryString());
        assertEquals("https://img/1.jpg", first.getImage().getBaseUrl());
        AudioItemContentResponse second = (AudioItemContentResponse) carComponent.getContent().get(1);
        assertEquals("PAYWALL", second.getContentAccessCategoryString());
        assertNull(second.getImage());
    }

    @Test
    public void withNieuwsReplacesServerLanesWithOnlyTheNieuwsFeed() throws Exception {
        CarTabSdUiResponse.Component serverLane = new CarTabSdUiResponse.Component(
            "ContinueListening", new ArrayList<Object>(), 3, "Verder luisteren");
        List<CarTabSdUiResponse.Component> serverComponents = new ArrayList<CarTabSdUiResponse.Component>();
        serverComponents.add(serverLane);
        CarTabSdUiResponse dto = new CarTabSdUiResponse(serverComponents);
        Object original = new AmaliaResult.Success(dto);

        seedCache(new CarNieuws.Item("urn:1", "Kabinet valt over begroting", null, false, 60_000L, 0L));
        Object rewritten = CarNieuws.withNieuws(original);

        AmaliaResult.Success success = (AmaliaResult.Success) rewritten;
        CarTabSdUiResponse response = (CarTabSdUiResponse) success.getValue();
        assertEquals(1, response.getComponents().size());
        assertEquals("Nieuws", response.getComponents().get(0).getTitle());
        clearCache();
    }

    @Test
    public void withNieuwsRendersAnEmptyTabWhenTheFeedIsUnavailable() throws Exception {
        List<CarTabSdUiResponse.Component> serverComponents = new ArrayList<CarTabSdUiResponse.Component>();
        serverComponents.add(new CarTabSdUiResponse.Component("ContinueListening", new ArrayList<Object>(), 3, "Verder luisteren"));
        Object original = new AmaliaResult.Success(new CarTabSdUiResponse(serverComponents));
        seedCache();
        Object rewritten = CarNieuws.withNieuws(original);
        AmaliaResult.Success success = (AmaliaResult.Success) rewritten;
        CarTabSdUiResponse response = (CarTabSdUiResponse) success.getValue();
        assertTrue("feed failure must empty the tab, never show server content",
            response.getComponents().isEmpty());
        clearCache();
    }

    @Test
    public void withNieuwsPassesThroughNonSuccessResults() throws Exception {
        assertSame("failure", CarNieuws.withNieuws("failure"));
    }

    @Test
    public void invokeSuspendReadsDirectlyCompletedValues() throws Exception {
        // The JVM test classpath has no Kotlin continuation interface, so only the
        // direct-completion path of the suspend bridge is exercised here.
        Object value = CarNieuws.invokeSuspend(
            DirectRepo.class.getMethod("getOverviewPage", String.class, Object.class, Object.class),
            new DirectRepo(), new Object[]{"/", null, null}, 1000L);
        assertEquals("page", value);
    }

    public static final class DirectRepo {
        public Object getOverviewPage(String path, Object topComponent, Object continuation) {
            return "page";
        }
    }

    @Test
    public void currentItemsAttemptsFetchOnFreshStateInsteadOfOverflowingIntoBackoff() throws Exception {
        clearCache();
        Field failedAt = CarNieuws.class.getDeclaredField("failedAt");
        failedAt.setAccessible(true);
        failedAt.set(null, 0L);
        CarNieuws.currentItems();
        long attemptedAt = failedAt.getLong(null);
        assertTrue("fresh state must attempt a fetch (overflow regression)", attemptedAt != 0L);
    }

    @Test
    public void currentItemsKeepsAOneSecondOldCacheWithoutRefetching() throws Exception {
        seedCache(new CarNieuws.Item("urn:cached", "Cached headline", null, false, 0L, 0L));
        Field cacheAt = CarNieuws.class.getDeclaredField("cacheAt");
        cacheAt.setAccessible(true);
        cacheAt.setLong(null, System.nanoTime() - TimeUnit.SECONDS.toNanos(1));
        Field failedAt = CarNieuws.class.getDeclaredField("failedAt");
        failedAt.setAccessible(true);
        failedAt.setLong(null, 0L);
        try {
            assertEquals("urn:cached", CarNieuws.currentItems().get(0).urn);
            assertEquals("a valid cache must prevent a fetch attempt", 0L, failedAt.getLong(null));
        } finally {
            clearCache();
        }
    }

    @Test
    public void currentItemsBacksOffForSecondsAfterAFailedFetch() throws Exception {
        clearCache();
        Field failedAt = CarNieuws.class.getDeclaredField("failedAt");
        failedAt.setAccessible(true);
        long previousFailure = System.nanoTime() - TimeUnit.SECONDS.toNanos(1);
        failedAt.setLong(null, previousFailure);
        try {
            assertTrue(CarNieuws.currentItems().isEmpty());
            assertEquals("backoff must prevent another fetch attempt", previousFailure, failedAt.getLong(null));
        } finally {
            failedAt.setLong(null, 0L);
        }
    }

    private static void seedCache(CarNieuws.Item... items) throws Exception {
        List<CarNieuws.Item> cache = new ArrayList<CarNieuws.Item>();
        for (CarNieuws.Item item : items) cache.add(item);
        Field field = CarNieuws.class.getDeclaredField("cache");
        field.setAccessible(true);
        field.set(null, cache);
        Field stamp = CarNieuws.class.getDeclaredField("cacheAt");
        stamp.setAccessible(true);
        stamp.set(null, System.nanoTime());
    }

    private static void clearCache() throws Exception {
        Field field = CarNieuws.class.getDeclaredField("cache");
        field.setAccessible(true);
        field.set(null, new ArrayList<CarNieuws.Item>());
    }
}
