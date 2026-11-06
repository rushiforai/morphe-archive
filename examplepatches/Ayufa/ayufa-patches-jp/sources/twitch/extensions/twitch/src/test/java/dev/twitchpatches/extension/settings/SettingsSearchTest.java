package dev.twitchpatches.extension.settings;

import java.util.ArrayList;
import java.util.List;
import org.junit.Test;
import static org.junit.Assert.*;

public class SettingsSearchTest {
    @Test public void matchesWordsAcrossLabelsAndLayoutPaths() {
        ToggleSetting classic = toggle("classic_bits", "Hide in Classic Split", "Includes fullscreen playback.");
        ToggleSetting vertical = toggle("vertical_bits", "Hide in Vertical View", "");
        List<SettingEntry> catalog = List.of(group("bits", "Bits button", List.of(classic, vertical)));
        List<SettingsSearch.Result> results = SettingsSearch.find(catalog, "  VERTICAL   bits ", "");
        assertEquals(1, results.size());
        assertSame(vertical, results.get(0).entry);
        assertEquals("インターフェース / Bits button", results.get(0).context);
        ((ToggleSetting) results.get(0).entry).setEnabled(true);
        assertTrue(vertical.isEnabled());
        assertFalse(classic.isEnabled());
        assertSame(classic, SettingsSearch.find(catalog, "bits fullscreen", "").get(0).entry);
    }

    @Test public void prioritizesExactLabelsAndRetainsStableOrder() {
        ToggleSetting summary = toggle("summary", "Playback", "Reload an active stream.");
        ToggleSetting partial = toggle("partial", "Reload stream automatically", "");
        ToggleSetting exact = toggle("exact", "Reload stream", "");
        ToggleSetting secondPartial = toggle("partial_two", "Reload stream button", "");
        List<SettingsSearch.Result> results = SettingsSearch.find(List.of(summary, partial, exact, secondPartial), "reload stream", "");
        assertEquals(List.of(exact, partial, secondPartial, summary),
                results.stream().map(result -> result.entry).collect(java.util.stream.Collectors.toList()));
    }

    @Test public void findsNestedSettingsInLargeCatalogs() {
        List<SettingEntry> entries = new ArrayList<>();
        for (int index = 0; index < 100; index++)
            entries.add(toggle("option_" + index, "Option " + index, ""));
        List<SettingEntry> catalog = List.of(group("ui", "UI settings", List.of(group("layout", "Vertical View", entries))));
        List<SettingsSearch.Result> results = SettingsSearch.find(catalog, "vertical option 99", "");
        assertEquals(1, results.size());
        assertSame(entries.get(99), results.get(0).entry);
        assertEquals("インターフェース / UI settings / Vertical View", results.get(0).context);
        assertTrue(SettingsSearch.find(catalog, "missing", "").isEmpty());
        assertTrue(SettingsSearch.find(catalog, "   ", "").isEmpty());
    }

    @Test public void summariesReflectCurrentToggleState() {
        ToggleSetting toggle = new ToggleSetting() {
            private boolean enabled;
            @Override public String key() { return "master"; }
            @Override public String title() { return "Hide both system bars"; }
            @Override public String summary() { return enabled ? "All hidden." : "All visible."; }
            @Override public SettingSection section() { return SettingSection.DISPLAY; }
            @Override public boolean isEnabled() { return enabled; }
            @Override public void setEnabled(boolean value) { enabled = value; }
        };
        SettingsSearch.Result result = SettingsSearch.find(List.of(toggle), "system bars", "").get(0);
        assertEquals("表示\nAll visible.", result.summary());
        toggle.setEnabled(true);
        assertEquals("表示\nAll hidden.", result.summary());
    }

    @Test public void excludesFeaturesOutsideTheProvidedCatalog() {
        ToggleSetting selected = toggle("selected", "Hide Share button", "");
        assertTrue(SettingsSearch.find(List.of(selected), "subscribe", "").isEmpty());
        assertEquals(1, SettingsSearch.find(List.of(selected), "share", "").size());
    }

    @Test public void groupAndMasterCanShareAnExistingPreferenceKey() {
        ToggleSetting master = toggle("emotes", "Enable all providers", "");
        SettingGroup emotes = group("emotes", "Emotes", List.of(master));
        List<SettingsSearch.Result> results = SettingsSearch.find(List.of(emotes), "emotes", "");
        assertEquals(2, results.size());
        assertSame(emotes, results.get(0).entry);
        assertSame(master, results.get(1).entry);
    }

    @Test public void rejectsDuplicateKeysAndCyclicGroups() {
        ToggleSetting entry = toggle("same", "Hide Share button", "");
        assertThrows(IllegalStateException.class, () -> SettingsSearch.find(List.of(entry, entry), "hide", ""));
        List<SettingEntry> children = new ArrayList<>();
        SettingGroup loop = group("loop", "Loop", children);
        children.add(loop);
        assertThrows(IllegalStateException.class, () -> SettingsSearch.find(List.of(loop), "loop", ""));
    }

    private static ToggleSetting toggle(String key, String title, String summary) {
        return new ToggleSetting() {
            private boolean enabled;
            @Override public String key() { return key; }
            @Override public String title() { return title; }
            @Override public String summary() { return summary; }
            @Override public SettingSection section() { return SettingSection.INTERFACE; }
            @Override public boolean isEnabled() { return enabled; }
            @Override public void setEnabled(boolean value) { enabled = value; }
        };
    }

    private static SettingGroup group(String key, String title, List<? extends SettingEntry> children) {
        return new SettingGroup() {
            @Override public String key() { return key; }
            @Override public String title() { return title; }
            @Override public String summary() { return ""; }
            @Override public SettingSection section() { return SettingSection.INTERFACE; }
            @Override public List<? extends SettingEntry> children() { return children; }
        };
    }
}
