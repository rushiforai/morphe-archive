package app.southstar21.extension.instagram.settings;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.concurrent.Callable;

/**
 * One patch's page in the menu: an on/off switch plus its settings.
 * <p>
 * The extension contains every patch's code, so {@link #included} tells whether this patch
 * was actually selected in Morphe Manager. Patches that weren't are hidden from the menu.
 */
public final class PatchSettings {
    public final String title;
    public final String description;
    public final BooleanSetting enabled;
    /** Every setting, in page order. */
    public final List<Setting> settings;
    /** The settings as shown on the patch's page. */
    public final List<SettingsGroup> groups;
    private final Callable<Boolean> included;

    /** Shown in the menu list and on the patch's page. */
    public Icons.Glyph glyph = Icons.Glyph.PATCH;
    public int color = 0xFF0095F6;

    /**
     * @param key      prefix for the stored values, e.g. "liquid_glass"
     * @param included usually the patch's {@code isIncluded()}, which the patch makes return true
     */
    public PatchSettings(String key, String title, String description, Callable<Boolean> included,
                         SettingsGroup... groups) {
        this.title = title;
        this.description = description;
        this.included = included;
        this.enabled = new BooleanSetting(key + "_enabled", "Enabled", null, true, true);
        List<Setting> all = new ArrayList<>();
        List<SettingsGroup> list = new ArrayList<>();
        for (SettingsGroup group : groups) {
            if (group.settings.isEmpty()) continue;
            list.add(group);
            all.addAll(group.settings);
        }
        this.groups = Collections.unmodifiableList(list);
        this.settings = Collections.unmodifiableList(all);
    }

    /** All settings in one untitled group. */
    public PatchSettings(String key, String title, String description, Callable<Boolean> included,
                         Setting... settings) {
        this(key, title, description, included, new SettingsGroup(null, settings));
    }

    /** Sets the icon shown for this patch. */
    public PatchSettings icon(Icons.Glyph glyph, int color) {
        this.glyph = glyph;
        this.color = color;
        return this;
    }

    public boolean isIncluded() {
        try {
            return included.call();
        } catch (Exception e) {
            return false;
        }
    }

    /** Included in the patched app and switched on in the menu. */
    public boolean isActive() {
        return isIncluded() && enabled.get();
    }

    /** Forgets every stored value of this patch, including the on/off switch. */
    public void reset() {
        enabled.reset();
        for (Setting s : settings) s.reset();
    }
}
