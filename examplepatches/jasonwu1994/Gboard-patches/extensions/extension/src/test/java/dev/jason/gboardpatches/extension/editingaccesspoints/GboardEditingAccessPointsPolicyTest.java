package dev.jason.gboardpatches.extension.editingaccesspoints;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import org.junit.Test;
import static org.junit.Assert.*;

public class GboardEditingAccessPointsPolicyTest {
    @Test public void appendPreservesOrderAndDeduplicates() {
        List<String> stock = Arrays.asList("emoji", "web_search", "text_edit_copy", "emoji");
        List<String> actual = GboardEditingAccessPoints1803Contribution.extend(stock, action -> true);
        assertEquals(Arrays.asList("emoji", "web_search", "text_edit_copy",
                "text_edit_select_all", "text_edit_cut", "text_edit_paste"), actual);
        assertEquals(actual, GboardEditingAccessPoints1803Contribution.extend(actual, action -> true));
    }

    @Test public void individualAdmissionDoesNotEnableOtherActions() {
        assertEquals(Collections.singletonList("text_edit_paste"),
                GboardEditingAccessPoints1803Contribution.extend(Collections.emptyList(),
                        action -> action == EditorAction.PASTE));
        assertTrue(GboardEditingAccessPoints1803Contribution.extend(Collections.emptyList(),
                action -> false).isEmpty());
    }

    @Test public void settingsDefaultOnButUnavailableAndMalformedFailClosed() {
        String key = GboardEditingAccessPointsSettings.ENABLED;
        assertTrue(GboardEditingAccessPointsSettings.read(Collections.emptyMap(), key));
        assertFalse(GboardEditingAccessPointsSettings.read((Map<String, ?>) null, key));
        for (Object value : Arrays.asList(false, "false", 1, "TRUE", "")) {
            assertFalse(GboardEditingAccessPointsSettings.read(Collections.singletonMap(key, value), key));
        }
        assertTrue(GboardEditingAccessPointsSettings.read(Collections.singletonMap(key, "true"), key));
        assertTrue(GboardEditingAccessPointsSettings.read(Collections.singletonMap(key, true), key));
        assertEquals("pref_editing_access_points_text_edit_cut",
                GboardEditingAccessPointsSettings.key(EditorAction.CUT));
    }

    @Test public void menuLabelsAreFixedEnglish() {
        assertEquals("Select All", GboardEditingAccessPoints1803Contribution.label(EditorAction.SELECT_ALL));
        assertEquals("Copy", GboardEditingAccessPoints1803Contribution.label(EditorAction.COPY));
        assertEquals("Cut", GboardEditingAccessPoints1803Contribution.label(EditorAction.CUT));
        assertEquals("Paste", GboardEditingAccessPoints1803Contribution.label(EditorAction.PASTE));
    }
}
