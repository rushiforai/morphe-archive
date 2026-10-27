package dev.twitchpatches.extension.ui;

import dev.twitchpatches.extension.settings.ToggleSetting;
import dev.twitchpatches.extension.settings.SettingEntry;
import dev.twitchpatches.extension.settings.SettingGroup;
import dev.twitchpatches.extension.settings.SettingSection;
import java.util.List;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.atomic.AtomicInteger;
import org.junit.Test;
import static org.junit.Assert.*;

public class UiFeatureRegistryTest {
    private final Map<String, Boolean> saved = new HashMap<>();
    private UiFeatureRegistry registry() {
        return new UiFeatureRegistry(new UiFeatureRegistry.Preferences() {
            @Override public boolean read(String key) { return saved.getOrDefault(key, false); }
            @Override public void write(String key, boolean value) { saved.put(key, value); }
        });
    }

    @Test public void optionsAreOffUntilEnabledAndRemainIndependent() {
        UiFeatureRegistry registry = registry();
        ToggleSetting first = registry.register("hide_clip", "Hide Clip", "Hide the Clip control.");
        registry.register("hide_share", "Hide Share", "Hide the Share control.");
        assertFalse(first.isEnabled());
        assertFalse(registry.enabled("missing"));
        first.setEnabled(true);
        assertTrue(registry.enabled("hide_clip"));
        assertFalse(registry.enabled("hide_share"));
        assertTrue(registry().register("hide_clip", "Hide Clip", "").isEnabled());
        first.setEnabled(false);
        assertFalse(registry().register("hide_clip", "Hide Clip", "").isEnabled());
    }

    @Test public void removedOptionsCannotActivateAndSnapshotsAreDetached() {
        saved.put("removed_option", true);
        UiFeatureRegistry registry = registry();
        assertFalse(registry.enabled("removed_option"));
        assertTrue(registry.options().isEmpty());
        registry.register("hide_clip", "Hide Clip", "");
        registry.snapshot().put("hide_clip", true);
        registry.options().clear();
        assertEquals(1, registry.options().size());
        assertFalse(registry.enabled("hide_clip"));
        assertFalse(registry.snapshot().containsKey("removed_option"));
    }

    @Test public void changesNotifyOnceAndClosedSubscriptionsStop() throws Exception {
        UiFeatureRegistry registry = registry();
        ToggleSetting option = registry.register("hide_clip", "Hide Clip", "");
        AtomicInteger changes = new AtomicInteger();
        AutoCloseable subscription = registry.observe(changes::incrementAndGet);
        option.setEnabled(true);
        option.setEnabled(true);
        option.setEnabled(false);
        assertEquals(2, changes.get());
        subscription.close();
        option.setEnabled(true);
        assertEquals(2, changes.get());
    }

    @Test public void rejectsDuplicateAndInvalidKeys() {
        UiFeatureRegistry registry = registry();
        registry.register("hide_clip", "Hide Clip", "");
        assertThrows(IllegalStateException.class, () -> registry.register("hide_clip", "Other", ""));
        for (String key : new String[] {"", "Hide Clip", "1hide", "bad-key"})
            assertThrows(IllegalArgumentException.class, () -> registry.register(key, "Title", ""));
        assertThrows(IllegalArgumentException.class,
                () -> registry.register("missing_section", "Title", "", null, "ic_settings"));
        assertThrows(IllegalArgumentException.class,
                () -> registry.register("bad_icon", "Title", "", SettingSection.INTERFACE, "bad-icon"));
    }

    @Test public void subscriptionsWithTheSameListenerHaveIndependentLifetimes() throws Exception {
        UiFeatureRegistry registry = registry();
        ToggleSetting option = registry.register("hide_clip", "Hide Clip", "");
        AtomicInteger changes = new AtomicInteger();
        Runnable listener = changes::incrementAndGet;
        AutoCloseable first = registry.observe(listener);
        AutoCloseable second = registry.observe(listener);
        first.close();
        option.setEnabled(true);
        assertEquals(1, changes.get());
        second.close();
        option.setEnabled(false);
        assertEquals(1, changes.get());
    }

    @Test public void masterReflectsMixedStateAndPublishesOneCompleteUpdate() {
        UiFeatureRegistry registry = registry();
        ToggleSetting subscribe = registry.register("subscribe", "Subscribe", "");
        ToggleSetting bits = registry.register("bits", "Bits", "");
        ToggleSetting master = registry.master("all", java.util.List.of(subscribe, bits));
        AtomicInteger updates = new AtomicInteger();
        registry.observe(() -> {
            assertEquals(subscribe.isEnabled(), bits.isEnabled());
            updates.incrementAndGet();
        });
        master.setEnabled(true);
        assertTrue(master.isEnabled());
        assertEquals(1, updates.get());
        master.setEnabled(true);
        assertEquals(1, updates.get());
        master.setEnabled(false);
        assertFalse(master.isEnabled());
        assertEquals(2, updates.get());
        assertFalse(saved.containsKey("all"));
        assertFalse(registry.snapshot().containsKey("all"));
    }

    @Test public void catalogueGroupsControlsByPurposeAndEveryOptionIsOff() {
        UiFeatureRegistry registry = registry();
        var categories = UiOptions.create(registry, true);
        assertEquals(java.util.List.of(SettingSection.PLAYER_CONTROLS, SettingSection.CHANNEL_ACTIONS, SettingSection.CHAT_OVERLAYS, SettingSection.DISPLAY),
                categories.stream().map(option -> option.section()).distinct().collect(java.util.stream.Collectors.toList()));
        assertTrue(categories.stream().allMatch(option -> !option.title().isEmpty() && !option.icon().isEmpty()));
        assertTrue(categories.stream().noneMatch(option -> option.title().contains("Classic") || option.title().contains("Vertical")));
        assertEquals("ic_clip", group(categories, "ui_clip").icon());
        assertEquals("ic_subscribe", group(categories, "ui_subscribe").icon());
        assertTrue(registry.snapshot().keySet().containsAll(List.of("hide_hype_trains", "hide_leaderboards")));
        assertFalse(registry.snapshot().containsKey("classic_support_hide_row"));
        assertFalse(registry.snapshot().containsKey("vertical_support_hide_row"));
        assertTrue(registry.options().stream().noneMatch(ToggleSetting::isEnabled));
        ToggleSetting classic = registry.options().stream().filter(option -> option.key().equals("classic_support_hide_bits")).findFirst().orElseThrow();
        classic.setEnabled(true);
        assertTrue(registry.enabled("classic_support_hide_bits"));
        assertFalse(registry.enabled("vertical_support_hide_bits"));
    }

    @Test public void reorganizedCatalogueRetainsSavedPreferencesAndContextualMasters() {
        saved.put("classic_support_hide_bits", true);
        saved.put("fullscreen_hide_status_bar", true);
        UiFeatureRegistry registry = registry();
        var categories = UiOptions.create(registry, true);
        assertTrue(registry.enabled("classic_support_hide_bits"));
        assertFalse(registry.enabled("vertical_support_hide_bits"));
        assertTrue(registry.enabled("fullscreen_hide_status_bar"));
        ToggleSetting bars = master(categories, "ui_system_bars");
        assertEquals("Hide both bars", bars.title());
        assertEquals("1 of 2 hidden.", bars.summary());
        assertFalse(bars.isEnabled());
        bars.setEnabled(true);
        assertTrue(registry.enabled("fullscreen_hide_navigation_bar"));
        bars.setEnabled(false);
        assertFalse(registry.enabled("fullscreen_hide_status_bar"));
        assertTrue(registry.enabled("classic_support_hide_bits"));
    }

    @Test public void featureMasterCombinesAllLocationsAndKeepsOtherControlsIndependent() {
        UiFeatureRegistry registry = registry();
        var groups = UiOptions.create(registry, true);
        ToggleSetting all = master(groups, "ui_gift");
        assertEquals("All visible.", group(groups, "ui_gift").summary());
        assertEquals("Hide everywhere", all.title());
        assertFalse(all.isEnabled());
        registry.options().stream().filter(option -> option.key().equals("vertical_header_hide_gift"))
                .findFirst().orElseThrow().setEnabled(true);
        assertFalse(registry.enabled("vertical_header_hide_leaderboard"));
        assertFalse(registry.enabled("vertical_support_hide_gift"));
        assertEquals("1 of 3 hidden.", all.summary());
        assertEquals(all.summary(), group(groups, "ui_gift").summary());
        AtomicInteger changes = new AtomicInteger();
        registry.observe(() -> {
            assertEquals(registry.enabled("classic_support_hide_gift"), registry.enabled("vertical_support_hide_gift"));
            assertEquals(registry.enabled("classic_support_hide_gift"), registry.enabled("vertical_header_hide_gift"));
            changes.incrementAndGet();
        });
        all.setEnabled(true);
        assertEquals("All hidden.", group(groups, "ui_gift").summary());
        assertTrue(registry.enabled("vertical_header_hide_gift"));
        assertTrue(registry.enabled("vertical_support_hide_gift"));
        assertTrue(registry.enabled("classic_support_hide_gift"));
        assertFalse(registry.enabled("vertical_header_hide_leaderboard"));
        assertFalse(registry.enabled("classic_support_hide_subscribe"));
        assertEquals(1, changes.get());
        all.setEnabled(false);
        assertFalse(registry.enabled("vertical_header_hide_gift"));
        assertFalse(registry.enabled("vertical_header_hide_leaderboard"));
        assertEquals(2, changes.get());
        assertFalse(saved.containsKey("ui_gift_all"));
    }

    @Test public void unavailableLeaderboardIsExcludedAndLocationPreferencesRemainIndependent() {
        UiFeatureRegistry previous = registry();
        var groups = UiOptions.create(previous, false);
        assertFalse(previous.snapshot().containsKey("vertical_header_hide_leaderboard"));
        SettingGroup subscribe = group(groups, "ui_subscribe");
        assertEquals(4, subscribe.children().size());
        ((ToggleSetting) subscribe.children().get(3)).setEnabled(true);
        assertFalse(master(groups, "ui_subscribe").isEnabled());
        assertFalse(previous.enabled("vertical_support_hide_subscribe"));
        assertFalse(previous.enabled("classic_support_hide_subscribe"));
        assertTrue(previous.enabled("vertical_header_hide_subscribe"));
        master(groups, "ui_subscribe").setEnabled(false);
        assertFalse(previous.enabled("vertical_header_hide_subscribe"));
    }

    @Test public void leaderboardsMasterIncludesRankingsAndPlayerButton() {
        UiFeatureRegistry registry = registry();
        var groups = UiOptions.create(registry, true);
        ToggleSetting all = master(groups, "ui_leaderboards");
        all.setEnabled(true);
        assertTrue(registry.enabled("hide_leaderboards"));
        assertTrue(registry.enabled("vertical_header_hide_leaderboard"));
        assertFalse(registry.enabled("hide_hype_trains"));
        all.setEnabled(false);
        assertFalse(registry.enabled("hide_leaderboards"));
        assertFalse(registry.enabled("vertical_header_hide_leaderboard"));
    }

    @Test public void playerFeatureMasterRetainsSavedStateAndOnlyChangesItsLocations() {
        saved.put("classic_controls_hide_clip", true);
        UiFeatureRegistry registry = registry();
        var groups = UiOptions.create(registry, true);
        assertEquals("1 of 2 hidden.", master(groups, "ui_clip").summary());
        master(groups, "ui_clip").setEnabled(true);
        assertTrue(registry.enabled("classic_controls_hide_clip"));
        assertTrue(registry.enabled("vertical_controls_hide_clip"));
        assertFalse(registry.enabled("classic_controls_hide_cast"));
        master(groups, "ui_clip").setEnabled(false);
        assertFalse(registry.enabled("classic_controls_hide_clip"));
        assertFalse(registry.enabled("vertical_controls_hide_clip"));
    }

    private static SettingGroup group(List<SettingEntry> groups, String key) {
        return (SettingGroup) groups.stream().filter(entry -> entry.key().equals(key)).findFirst().orElseThrow();
    }

    private static ToggleSetting master(List<SettingEntry> groups, String key) {
        return (ToggleSetting) group(groups, key).children().get(0);
    }
}
