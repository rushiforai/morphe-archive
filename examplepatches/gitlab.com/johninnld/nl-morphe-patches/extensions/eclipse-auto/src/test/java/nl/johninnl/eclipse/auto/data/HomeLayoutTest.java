package nl.johninnl.eclipse.auto.data;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 33, manifest = Config.NONE)
public class HomeLayoutTest {
    private static List<ComposeFeed.Row> rows(String... keys) {
        List<ComposeFeed.Row> result = new ArrayList<>();
        for (String key : keys) result.add(new ComposeFeed.Row(key, "tracks", "Server " + key, "taste", Collections.<ComposeFeed.Item>emptyList()));
        return result;
    }

    private static List<String> keys(List<ComposeFeed.Row> rows) {
        List<String> result = new ArrayList<>();
        for (ComposeFeed.Row row : rows) result.add(row.key);
        return result;
    }

    @Test public void withNoPreferencesTheDefaultOrderApplies() {
        List<ComposeFeed.Row> arranged = HomeLayout.defaults().apply(rows("top_songs", "recently_played", "daily_mixes"));
        assertEquals(Arrays.asList("recently_played", "daily_mixes", "top_songs"), keys(arranged));
    }

    @Test public void theUsersOrderComesFirstThenTheDefaultsAndUnknownKeysKeepTheirServerSlot() {
        HomeLayout layout = HomeLayout.parse("{\"order\":[\"top_songs\",\"your_playlists\"],\"hidden\":[],\"titles\":{}}");
        // Slots 0, 2 and 3 are phone-known rows; slot 1 (ytmusic_mixes) is unknown and must not move.
        List<ComposeFeed.Row> arranged = layout.apply(rows("recently_played", "ytmusic_mixes", "your_playlists", "top_songs"));
        assertEquals(Arrays.asList("top_songs", "ytmusic_mixes", "your_playlists", "recently_played"), keys(arranged));
    }

    @Test public void hiddenRowsAreDroppedAndRenamedRowsWearTheUsersTitle() {
        HomeLayout layout = HomeLayout.parse("{\"order\":[],\"hidden\":[\"daily_mixes\"],\"titles\":{\"top_songs\":\"My hits\",\"empty\":\"\"}}");
        List<ComposeFeed.Row> arranged = layout.apply(rows("recently_played", "daily_mixes", "top_songs"));
        assertEquals(Arrays.asList("recently_played", "top_songs"), keys(arranged));
        assertEquals("My hits", arranged.get(1).title);
        assertEquals("Server recently_played", arranged.get(0).title);
        assertTrue(layout.hasTitle("top_songs"));
        assertFalse(layout.hasTitle("recently_played"));
        assertFalse("an empty rename is no rename", layout.hasTitle("empty"));
    }

    @Test public void rowsWithTheSameKeyKeepTheServersOrderAmongThemselves() {
        List<ComposeFeed.Row> input = new ArrayList<>(rows("top_songs", "top_songs"));
        input.set(1, new ComposeFeed.Row("top_songs", "tracks", "second", "taste", Collections.<ComposeFeed.Item>emptyList()));
        List<ComposeFeed.Row> arranged = HomeLayout.defaults().apply(input);
        assertEquals("Server top_songs", arranged.get(0).title);
        assertEquals("second", arranged.get(1).title);
    }

    @Test public void unreadablePreferencesMeanTheDefaultsAsOnThePhone() {
        for (String broken : new String[] {null, "", "not json", "[1]", "{\"order\":7}"}) {
            assertEquals(broken, Arrays.asList("recently_played", "top_songs"),
                keys(HomeLayout.parse(broken).apply(rows("top_songs", "recently_played"))));
        }
    }
}
