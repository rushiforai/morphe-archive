package app.morphe.extension.swiftkey;

import org.junit.Test;
import java.util.Arrays;
import java.util.LinkedHashMap;
import java.util.List;
import static org.junit.Assert.*;

public class ToolbarSelectionTest {
    private LinkedHashMap<Integer, String> available() {
        LinkedHashMap<Integer, String> result = new LinkedHashMap<>();
        result.put(4, "GIF"); result.put(2, "Clipboard"); result.put(0, "Settings"); result.put(16, "More");
        return result;
    }
    @Test public void respectsOrderAndRemovesDuplicates() {
        assertEquals(Arrays.asList("Clipboard", "GIF", "More"),
            ToolbarSelection.choose(available(), Arrays.asList(2, 2, 4), 7));
    }
    @Test public void keepsOnlySelectedItemsWithoutEmptySlots() {
        assertEquals(Arrays.asList("Clipboard", "More"), ToolbarSelection.choose(available(), List.of(2), 7));
    }
    @Test public void preservesMoreAndLimitsToAvailableWidth() {
        assertEquals(Arrays.asList("Clipboard", "GIF", "More"),
            ToolbarSelection.choose(available(), Arrays.asList(2, 4, 0, 16), 3));
    }
    @Test public void unavailableSelectionFallsBackToSettings() {
        assertEquals(Arrays.asList("Settings", "More"), ToolbarSelection.choose(available(), List.of(999), 7));
    }
    @Test public void unavailableSettingsFallsBackToExistingFeature() {
        LinkedHashMap<Integer, String> items = available(); items.remove(0);
        assertEquals(Arrays.asList("GIF", "More"), ToolbarSelection.choose(items, List.of(), 1));
    }
    @Test public void parsesDamagedPreferencesWithoutDuplicatesOrMore() {
        assertEquals(Arrays.asList(2, 4), ToolbarSelection.parse("2,garbage,4,2,16,-3,"));
        assertEquals("2,4", ToolbarSelection.encode(Arrays.asList(2, 4, 2, 16, -1)));
    }
}
