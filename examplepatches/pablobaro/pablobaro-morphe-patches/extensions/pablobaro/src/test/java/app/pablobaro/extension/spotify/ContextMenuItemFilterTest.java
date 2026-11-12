package app.pablobaro.extension.spotify;

import org.junit.Test;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.fail;

public class ContextMenuItemFilterTest {
    private static final ContextMenuItemFilter.UpsellCheck UPSELLS_START_WITH_PREMIUM =
            item -> item.toString().startsWith("premium");

    @Test
    public void removesPremiumUpsells() throws Exception {
        List<String> items = Arrays.asList("share", "premium_download", "add_to_queue", "premium_play");

        List<String> filtered = ContextMenuItemFilter.withoutPremiumUpsells(items, UPSELLS_START_WITH_PREMIUM);

        assertEquals(Arrays.asList("share", "add_to_queue"), filtered);
    }

    @Test
    public void returnsTheSameListWhenNothingIsRemoved() throws Exception {
        List<String> items = Arrays.asList("share", "add_to_queue");

        assertSame(items, ContextMenuItemFilter.withoutPremiumUpsells(items, UPSELLS_START_WITH_PREMIUM));
    }

    @Test
    public void returnsAnEmptyListWhenEverythingIsAnUpsell() throws Exception {
        List<String> items = Collections.singletonList("premium_download");

        assertEquals(Collections.emptyList(), ContextMenuItemFilter.withoutPremiumUpsells(items, UPSELLS_START_WITH_PREMIUM));
    }

    @Test
    public void keepsNullItemsWithoutCheckingThem() throws Exception {
        List<String> items = new ArrayList<>(Arrays.asList("share", null, "premium_download"));

        List<String> filtered = ContextMenuItemFilter.withoutPremiumUpsells(items, UPSELLS_START_WITH_PREMIUM);

        assertEquals(Arrays.asList("share", null), filtered);
    }

    @Test
    public void passesNullAndEmptyListsThrough() throws Exception {
        List<String> empty = Collections.emptyList();

        assertNull(ContextMenuItemFilter.withoutPremiumUpsells(null, UPSELLS_START_WITH_PREMIUM));
        assertSame(empty, ContextMenuItemFilter.withoutPremiumUpsells(empty, UPSELLS_START_WITH_PREMIUM));
    }

    @Test
    public void propagatesCheckFailures() {
        IllegalStateException failure = new IllegalStateException("unexpected item");

        try {
            ContextMenuItemFilter.withoutPremiumUpsells(Collections.singletonList("share"), item -> {
                throw failure;
            });
            fail("Expected the check failure to propagate");
        } catch (Exception ex) {
            assertSame(failure, ex);
        }
    }
}
