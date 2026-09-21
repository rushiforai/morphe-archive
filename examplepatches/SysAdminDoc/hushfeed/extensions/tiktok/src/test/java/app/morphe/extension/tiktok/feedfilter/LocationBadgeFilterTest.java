package app.morphe.extension.tiktok.feedfilter;

import static org.junit.Assert.*;

import app.morphe.extension.tiktok.SettingsContextRule;
import app.morphe.extension.tiktok.settings.Settings;
import com.ss.android.ugc.aweme.feed.model.Aweme;
import java.util.Arrays;
import java.util.List;
import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = {23, 35})
public class LocationBadgeFilterTest {
    @Rule public final SettingsContextRule context = new SettingsContextRule();
    private boolean hide, filter;
    public static class Anchor {
        String key;
        public String getComponentKey() { return key; }
        Anchor(String key) { this.key = key; }
    }
    public static class Video extends Aweme {
        List<?> anchors;
        public List<?> getAnchors() { return anchors; }
        @Override public String getAid() { return "location-contract"; }
        Video(List<?> anchors) { this.anchors = anchors; }
    }
    @Before public void saveSettings() {
        hide = Settings.HIDE_LOCATION_LABELS.get();
        filter = Settings.FILTER_LOCATION_VIDEOS.get();
        Settings.HIDE_LOCATION_LABELS.save(false);
        Settings.FILTER_LOCATION_VIDEOS.save(false);
        FeedItemsFilter.resetDiagnosticsForTests();
    }
    @After public void restoreSettings() {
        Settings.HIDE_LOCATION_LABELS.save(hide);
        Settings.FILTER_LOCATION_VIDEOS.save(filter);
        FeedItemsFilter.resetDiagnosticsForTests();
    }

    @Test public void onlyTheExactNativePlaceComponentIsEvidence() {
        for (String key : Arrays.asList(null, "", "poi", "poi_anchor", "anchor_shop", "ANCHOR_POI", "anchor_poi_extra"))
            assertFalse(LocationBadgeFilter.hasBadge(new Video(List.of(new Anchor(key)))));
        assertFalse(LocationBadgeFilter.hasBadge(null));
        assertFalse(LocationBadgeFilter.hasBadge(new Video(null)));
        assertFalse(LocationBadgeFilter.hasBadge(new Video(Arrays.asList(null, new Object()))));
        assertTrue(LocationBadgeFilter.hasBadge(new Video(List.of(new Anchor("anchor_poi")))));
    }

    @Test public void hideOnlyRemovesSingleAndMultiplePlacesWithoutChangingTheVideoModel() {
        Settings.HIDE_LOCATION_LABELS.save(true);
        List<?> anchors = List.of(new Anchor("anchor_poi"), new Anchor("anchor_poi"));
        Video video = new Video(anchors);
        assertTrue(LocationBadgeFilter.visibleAnchors(anchors).isEmpty());
        assertSame(anchors, video.anchors);
        assertEquals(2, video.anchors.size());
        assertTrue(LocationBadgeFilter.hasBadge(video));
        assertFalse(new LocationBadgeFilter().getEnabled());
    }

    @Test public void mixedBadgesKeepOtherTypesAndTheirOrder() {
        Settings.HIDE_LOCATION_LABELS.save(true);
        Anchor effect = new Anchor("anchor_effect"), link = new Anchor("anchor_3rdparty");
        List<?> anchors = Arrays.asList(effect, new Anchor("anchor_poi"), null, link, new Anchor("anchor_poi"));
        List<?> visible = LocationBadgeFilter.visibleAnchors(anchors);
        assertEquals(Arrays.asList(effect, null, link), visible);
        assertEquals(5, anchors.size());
        assertSame(effect, visible.get(0));
        assertSame(link, visible.get(2));
    }

    @Test public void offAndUnknownDataKeepTheirOriginalList() {
        List<?> places = List.of(new Anchor("anchor_poi"));
        assertSame(places, LocationBadgeFilter.visibleAnchors(places));
        Settings.HIDE_LOCATION_LABELS.save(true);
        List<?> unknown = List.of(new Object(), new Anchor(null));
        assertSame(unknown, LocationBadgeFilter.visibleAnchors(unknown));
        assertNull(LocationBadgeFilter.visibleAnchors(null));
        assertTrue(LocationBadgeFilter.visibleAnchors(List.of()).isEmpty());
    }

    @Test public void filteringDoesNotDependOnHidingOrAdRemoval() {
        Settings.FILTER_LOCATION_VIDEOS.save(true);
        assertFalse(Settings.HIDE_LOCATION_LABELS.get());
        LocationBadgeFilter rule = new LocationBadgeFilter();
        assertTrue(rule.getEnabled());
        assertTrue(rule.getFiltered(new Video(List.of(new Anchor("anchor_poi")))));
        assertFalse(rule.getFiltered(new Video(List.of(new Anchor("anchor_effect")))));
    }
}
