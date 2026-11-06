package dev.twitchpatches.extension.settings;

import org.junit.Test;
import java.util.List;
import static org.junit.Assert.*;

public final class SettingRegistryTest {
    @Test public void groupsResolveOnlyWhenTheirPatchRegistersThem() {
        SettingRegistry registry = new SettingRegistry();
        assertNull(registry.group("emotes"));
        ToggleSetting child = setting("provider", SettingSection.CHAT);
        SettingGroup group = new SettingGroup() {
            @Override public String key() { return "emotes"; }
            @Override public String title() { return "Emotes"; }
            @Override public String summary() { return "Providers"; }
            @Override public SettingSection section() { return SettingSection.CHAT; }
            @Override public List<ToggleSetting> children() { return List.of(child); }
        };
        registry.register(group);
        assertSame(group, registry.group("emotes"));
        assertEquals(List.of(group), registry.snapshot());
        assertEquals(List.of(child), group.children());
        assertNull(registry.group("provider"));
    }

    @Test public void omittedPatchesProduceNoOptions() {
        SettingRegistry registry = new SettingRegistry();
        assertTrue(registry.snapshot().isEmpty());
        ToggleSetting selected = setting("selected", SettingSection.PROMOTIONS);
        registry.register(selected);
        assertEquals(List.of(selected), registry.snapshot());
    }

    @Test public void registrationOrderDoesNotScatterSections() {
        SettingRegistry registry = new SettingRegistry();
        ToggleSetting promotion = setting("promotion", SettingSection.PROMOTIONS);
        ToggleSetting ad = setting("ad", SettingSection.ADS);
        ToggleSetting points = setting("points", SettingSection.CHANNEL_POINTS);
        registry.register(promotion);
        registry.register(ad);
        registry.register(points);
        assertEquals(List.of(points, ad, promotion), registry.snapshot());
    }

    @Test public void snapshotsCannotRemoveRegisteredOptions() {
        SettingRegistry registry = new SettingRegistry();
        ToggleSetting selected = setting("selected", SettingSection.ADS);
        registry.register(selected);
        registry.snapshot().clear();
        assertEquals(List.of(selected), registry.snapshot());
    }

    @Test public void duplicateRegistrationPreservesExistingOption() {
        SettingRegistry registry = new SettingRegistry();
        ToggleSetting original = setting("shared", SettingSection.ADS);
        registry.register(original);
        assertThrows(IllegalStateException.class, () -> registry.register(setting("shared", SettingSection.PROMOTIONS)));
        assertEquals(List.of(original), registry.snapshot());
    }

    private static ToggleSetting setting(String key, SettingSection section) {
        return new ToggleSetting() {
            private boolean enabled;
            @Override public String key() { return key; }
            @Override public String title() { return key; }
            @Override public String summary() { return ""; }
            @Override public SettingSection section() { return section; }
            @Override public boolean isEnabled() { return enabled; }
            @Override public void setEnabled(boolean value) { enabled = value; }
        };
    }

    @Test public void nestedGroupsResolveWithoutFlatteningTheirToggles() {
        SettingRegistry registry = new SettingRegistry();
        SettingGroup nested = group("ui_classic", List.of(setting("clip", SettingSection.INTERFACE)));
        SettingGroup root = group("ui_settings", List.of(nested));
        registry.register(root);
        assertSame(nested, registry.group("ui_classic"));
        assertEquals(List.of(root), registry.snapshot());
        assertNull(registry.group("clip"));
    }

    private static SettingGroup group(String key, List<? extends SettingEntry> entries) {
        return new SettingGroup() {
            @Override public String key() { return key; }
            @Override public String title() { return key; }
            @Override public String summary() { return ""; }
            @Override public SettingSection section() { return SettingSection.INTERFACE; }
            @Override public List<? extends SettingEntry> children() { return entries; }
        };
    }
}
