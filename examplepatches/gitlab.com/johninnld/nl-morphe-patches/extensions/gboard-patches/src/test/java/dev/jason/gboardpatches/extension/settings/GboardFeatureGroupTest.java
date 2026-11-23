package dev.jason.gboardpatches.extension.settings;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import android.content.Context;

import java.util.List;

import org.junit.Test;

public class GboardFeatureGroupTest {
    private static final GboardPatchesSettingsContract.FeatureHost HOST =
            new GboardPatchesSettingsContract.FeatureHost() {
                @Override public Context getContext() { return null; }
                @Override public void submit(GboardPatchesSettingsContract.Intent intent) { }
            };

    @Test
    public void mixedGroupShowsOnlyTheInstalledPatch() {
        GboardFeatureGroup group = group(
                new Entry("Absent patch", false), new Entry("Installed patch", true));
        assertTrue(group.isAvailable(null));
        List<GboardPatchesSettingsContract.Row> rows = group.buildScreen(HOST).getRows();
        assertEquals(1, rows.size());
        assertEquals("Installed patch", rows.get(0).getTitle());
        assertTrue(rows.get(0).isEnabled());
    }

    @Test
    public void groupWithNoInstalledPatchesHasNoNavigationRows() {
        GboardFeatureGroup group = group(new Entry("Absent patch", false));
        assertFalse(group.isAvailable(null));
        assertTrue(group.buildScreen(HOST).getRows().isEmpty());
    }

    private static GboardFeatureGroup group(Entry... children) {
        return new GboardFeatureGroup("Group", "Summary", null, null,
                "Empty", "No patches applied", List.of(children));
    }

    private record Entry(String title, boolean installed)
            implements GboardPatchesSettingsContract.Feature {
        @Override public String getEntryTitle() { return title; }
        @Override public String getEntrySummary() { return ""; }
        @Override public boolean isAvailable(Context context) { return installed; }
        @Override public GboardPatchesSettingsContract.Screen buildScreen(
                GboardPatchesSettingsContract.FeatureHost host) {
            assertTrue("Unavailable settings must not be built", installed);
            return null;
        }
    }
}
