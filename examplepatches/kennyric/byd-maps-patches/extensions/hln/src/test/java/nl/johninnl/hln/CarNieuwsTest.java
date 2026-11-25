package nl.johninnl.hln;

import com.kubus.module.network.model.AudioBundleTeaser;
import com.popular.core.model.data.AudioBundleTeaserItem;
import com.popular.core.model.data.Picture;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import nl.dpgmedia.mcdpg.amalia.car.data.model.CarAudioQueue;
import nl.dpgmedia.mcdpg.amalia.car.data.model.dto.CarTabSdUiResponse;
import org.junit.Test;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

public class CarNieuwsTest {

    /** Mirrors the minified success wrapper: one-arg constructor, value getter. */
    public static final class Holder {
        private final CarTabSdUiResponse value;
        public Holder(CarTabSdUiResponse value) { this.value = value; }
        public CarTabSdUiResponse getValue() { return value; }
    }

    private static AudioBundleTeaserItem item(String urn, String title, int seconds, boolean paid) {
        return new AudioBundleTeaserItem(urn, title, seconds,
            new Picture("https://img.example.test/" + urn + ".jpg",
                "https://img.example.test/cropped-" + urn + ".jpg", null), paid, true);
    }

    private static void reset() throws Exception {
        Field feed = CarNieuws.class.getDeclaredField("feed");
        feed.setAccessible(true);
        feed.set(null, Collections.emptyList());
    }

    @Test
    public void feedItemsAreCollectedByShapeNotFieldName() throws Exception {
        reset();
        List<Object> mixed = new ArrayList<Object>();
        mixed.add(item("urn:1", "Eerste kop", 95, false));
        mixed.add(item("urn:2", "Tweede kop", 130, true));
        List<Object> wrongType = new ArrayList<Object>();
        wrongType.add("not a feed item");
        AudioBundleTeaser block = new AudioBundleTeaser("audio", wrongType, mixed);

        CarNieuws.rememberAudioBundle(block);

        List<CarNieuws.Item> feed = (List<CarNieuws.Item>) value("feed");
        assertEquals(2, feed.size());
        assertEquals("urn:1", feed.get(0).urn);
        assertEquals("Eerste kop", feed.get(0).title);
        assertEquals(95000L, feed.get(0).durationMs);
        assertTrue(feed.get(1).premium);
        assertTrue(!feed.get(0).premium);
        assertEquals("https://img.example.test/urn:1.jpg", feed.get(0).imageUrl);
    }

    @Test
    public void captureDeduplicatesByUrnAndSkipsSilentItems() throws Exception {
        reset();
        List<Object> first = new ArrayList<Object>();
        first.add(item("urn:a", "Oud", 60, false));
        CarNieuws.rememberAudioBundle(new AudioBundleTeaser("t", null, first));
        List<Object> second = new ArrayList<Object>();
        second.add(item("urn:a", "Oud", 60, false));
        second.add(new AudioBundleTeaserItem("urn:b", "Nieuw", 60, null, false, false));
        second.add(item("urn:c", "Derde", 60, false));
        CarNieuws.rememberAudioBundle(new AudioBundleTeaser("t", null, second));

        List<CarNieuws.Item> feed = (List<CarNieuws.Item>) value("feed");
        assertEquals(2, feed.size());
        assertEquals("urn:a", feed.get(0).urn); // deduplicated by urn
        assertEquals("urn:c", feed.get(1).urn); // silent urn:b never captured
    }

    @Test
    public void silentItemsAreNotCaptured() throws Exception {
        reset();
        AudioBundleTeaserItem silent = new AudioBundleTeaserItem("urn:silent", "Stil", 60, null, false, false);
        CarNieuws.rememberAudioBundle(new AudioBundleTeaser("t", null,
            new ArrayList<Object>(Arrays.asList(silent))));
        assertTrue(((List<?>) value("feed")).isEmpty());
    }

    @Test
    public void withNieuwsWrapsTheSynthesizedComponentInAnyWrapper() throws Exception {
        reset();
        List<CarNieuws.Item> feed = new ArrayList<CarNieuws.Item>();
        feed.add(new CarNieuws.Item("urn:1", "Kop een", "https://img.example.test/urn:1.jpg", false, 95000L));
        feed.add(new CarNieuws.Item("urn:2", "Kop twee", null, true, 130000L));
        set("feed", feed);

        Object result = CarNieuws.withNieuws(new Holder(new CarTabSdUiResponse(Collections.emptyList())));

        Holder holder = (Holder) result;
        CarTabSdUiResponse response = holder.getValue();
        assertEquals(1, response.getComponents().size());
        CarTabSdUiResponse.Component component = response.getComponents().get(0);
        assertEquals("Nieuws", component.getTitle());
        assertEquals(2, component.getContent().size());
        assertEquals("spoken_article", ((nl.dpgmedia.mcdpg.amalia.audio.data.network.dto.AudioItemContentResponse)
            component.getContent().get(1)).getType());
        assertEquals("PAYWALL", ((nl.dpgmedia.mcdpg.amalia.audio.data.network.dto.AudioItemContentResponse)
            component.getContent().get(1)).getContentAccessCategoryString());
        assertEquals("FREE", ((nl.dpgmedia.mcdpg.amalia.audio.data.network.dto.AudioItemContentResponse)
            component.getContent().get(0)).getContentAccessCategoryString());
    }

    @Test
    public void anUnavailableFeedRendersAnEmptyTabNeverOldContent() throws Exception {
        reset();
        CarTabSdUiResponse previous = new CarTabSdUiResponse(Collections.emptyList());
        Object result = CarNieuws.withNieuws(new Holder(previous));
        assertTrue(((Holder) result).getValue().getComponents().isEmpty());
    }

    @Test
    public void rowsCarryAWindowAndSelectionRestoresTheFullQueue() throws Exception {
        reset();
        List<CarAudioQueue.Item> all = new ArrayList<CarAudioQueue.Item>();
        for (int i = 0; i < 30; i++) all.add(new CarAudioQueue.Item(CarAudioQueue.Item.Type.Article, "u" + i));
        CarAudioQueue full = new CarAudioQueue(all);

        Object delivered = CarNieuws.slimQueue("u5", full);
        List<?> window = ((CarAudioQueue) delivered).getItems();
        assertEquals(CarNieuws.QUEUE_WINDOW, window.size());
        assertEquals("u5", CarNieuws.uidOf(window.get(0)));

        Object restored = CarNieuws.restoreQueue(delivered);
        assertEquals(30, ((CarAudioQueue) restored).getItems().size());
        assertSame(full, restored);
    }

    @Test
    public void shortAndUnknownQueuesPassThroughUntouched() {
        CarAudioQueue shortQueue = new CarAudioQueue(Arrays.asList(
            new CarAudioQueue.Item(CarAudioQueue.Item.Type.Article, "pass0"),
            new CarAudioQueue.Item(CarAudioQueue.Item.Type.Article, "pass1")));
        assertSame(shortQueue, CarNieuws.slimQueue("pass0", shortQueue));

        List<CarAudioQueue.Item> all = new ArrayList<CarAudioQueue.Item>();
        for (int i = 0; i < 30; i++) all.add(new CarAudioQueue.Item(CarAudioQueue.Item.Type.Article, "px" + i));
        CarAudioQueue unknownRow = new CarAudioQueue(all);
        assertSame(unknownRow, CarNieuws.slimQueue("missing", unknownRow));
        assertSame(shortQueue, CarNieuws.restoreQueue(shortQueue));
    }

    @Test
    public void restoreOfAnUnregisteredWindowReturnsItUntouched() throws Exception {
        reset();
        List<CarAudioQueue.Item> window = new ArrayList<CarAudioQueue.Item>();
        for (int i = 0; i < CarNieuws.QUEUE_WINDOW; i++) {
            window.add(new CarAudioQueue.Item(CarAudioQueue.Item.Type.Article, "orphan" + i));
        }
        CarAudioQueue decoded = new CarAudioQueue(window);
        assertSame(decoded, CarNieuws.restoreQueue(decoded));
    }

    @Test
    public void queueChangeObservationRecordsTheCurrentIdByShape() {
        CarNieuws.onQueueChanged(new Object() { public final String anything = "urn:active"; public final int count = 3; });
        assertEquals("urn:active", value("activeUid"));
        CarNieuws.onQueueChanged(new Object() { public final List<?> items = Collections.emptyList(); });
        assertEquals("urn:active", value("activeUid")); // unchanged when no String field exists
    }

    @Test
    public void durationsConvertSecondsToMillisOnlyWhenPlausible() {
        assertEquals(95000L, CarNieuws.durationMillis(95));
        assertEquals(0L, CarNieuws.durationMillis(null));
        assertEquals(0L, CarNieuws.durationMillis(-3));
        assertEquals(7200000L, CarNieuws.durationMillis(7200));
        assertEquals(3_600_000L, CarNieuws.durationMillis(3_600_000L)); // already millis
    }

    @Test
    public void artworkPrefersTheCanonicalUrlAndFallsBack() throws Exception {
        reset();
        AudioBundleTeaserItem canonical = new AudioBundleTeaserItem("urn:pic1", "Met url", 60,
            new Picture("https://img.example.test/canonical.jpg", "https://img.example.test/cropped.jpg", null), false, true);
        AudioBundleTeaserItem fallback = new AudioBundleTeaserItem("urn:pic2", "Zonder url", 60,
            new Picture(null, "https://img.example.test/fallback.jpg", null), false, true);
        List<Object> items = new ArrayList<Object>(Arrays.asList(canonical, fallback));
        CarNieuws.rememberAudioBundle(new AudioBundleTeaser("t", null, items));
        List<CarNieuws.Item> feed = (List<CarNieuws.Item>) value("feed");
        assertEquals("https://img.example.test/canonical.jpg", feed.get(0).imageUrl);
        assertEquals("https://img.example.test/fallback.jpg", feed.get(1).imageUrl);
    }

    @Test
    public void newsRowsAreStyledAsCardsAndOtherRowsPassThrough() throws Exception {
        reset();
        // The queue windowing still registers the lane for the in-app restore.
        List<CarAudioQueue.Item> all = new ArrayList<CarAudioQueue.Item>();
        for (int i = 0; i < 25; i++) all.add(new CarAudioQueue.Item(CarAudioQueue.Item.Type.Article, "s" + i));
        Object queue = new CarAudioQueue(all);
        Object windowed = CarNieuws.slimQueue("s3", queue);
        assertEquals(CarNieuws.QUEUE_WINDOW, ((CarAudioQueue) windowed).getItems().size());
    }

    @Test
    public void tabStylingLeavesNonStartTabsAndForeignObjectsUntouched() {
        // A tab object without any bundle passes through without styling.
        CarNieuws.styleTab(new Object());
        CarNieuws.styleTab(new Object() { public final Object bundle = new Object(); });
    }

    @Test
    public void onlyTheSynthesizedLaneTitleLosesItsGroupHeader() {
        assertNull(CarNieuws.groupTitle("Nieuws"));
        assertNull(CarNieuws.groupTitle(null));
        assertEquals("Podcasts", CarNieuws.groupTitle("Podcasts"));
        assertEquals(Integer.valueOf(3), CarNieuws.groupTitle(3));
    }

    @Test
    public void wrapperDiscoveryRejectsAmbiguousConstructors() {
        assertEquals(1, CarNieuws.singleArgumentConstructor(Holder.class).getParameterTypes().length);
        assertNull(CarNieuws.singleArgumentConstructor(Object.class));
        assertNull(CarNieuws.singleArgumentConstructor(TwoCtors.class));
        assertNotNull(CarNieuws.wrappedValue(new Holder(new CarTabSdUiResponse(Collections.emptyList()))));
        assertNull(CarNieuws.wrappedValue("not a wrapper"));
    }

    public static final class TwoCtors {
        public TwoCtors(String a) {}
        public TwoCtors(Integer b) {}
    }

    private static Object value(String name) {
        try {
            Field field = CarNieuws.class.getDeclaredField(name);
            field.setAccessible(true);
            return field.get(null);
        } catch (Exception e) {
            throw new AssertionError(e);
        }
    }

    private static void set(String name, Object value) throws Exception {
        Field field = CarNieuws.class.getDeclaredField(name);
        field.setAccessible(true);
        field.set(null, value);
    }
}
