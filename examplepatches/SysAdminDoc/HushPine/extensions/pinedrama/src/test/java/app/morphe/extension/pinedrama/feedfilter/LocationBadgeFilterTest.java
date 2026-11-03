package app.morphe.extension.pinedrama.feedfilter;

import static org.junit.Assert.*;

import app.morphe.extension.pinedrama.SettingsContextRule;
import app.morphe.extension.pinedrama.settings.Settings;
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
    private boolean filter;
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
        filter = Settings.FILTER_LOCATION_VIDEOS.get();
        Settings.FILTER_LOCATION_VIDEOS.save(false);
        FeedItemsFilter.resetDiagnosticsForTests();
    }
    @After public void restoreSettings() {
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

    @Test public void filteringReadsOnlyThePlaceComponent() {
        Settings.FILTER_LOCATION_VIDEOS.save(true);
        LocationBadgeFilter rule = new LocationBadgeFilter();
        assertTrue(rule.getEnabled());
        assertTrue(rule.getFiltered(new Video(List.of(new Anchor("anchor_poi")))));
        assertFalse(rule.getFiltered(new Video(List.of(new Anchor("anchor_effect")))));
    }
}
