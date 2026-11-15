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

    /** Shown behind the "What is this?" link on the patch's page: what it does, and what it's for. */
    public String aboutWhat, aboutWhy;

    /** Builds a live preview pinned above the settings of the customization page. */
    public interface PreviewFactory {
        /** @param refresh rebuilds the page, e.g. after the preview applied a preset */
        android.view.View create(android.app.Activity activity, Runnable refresh);
    }

    /** Builds a short looping demo of one setting, shown behind its "?" button. */
    public interface DemoFactory {
        android.view.View create(android.app.Activity activity, Setting setting);
    }

    /** Demos for the "?" buttons, or null to explain in words only. */
    public DemoFactory demo;

    /** An extra page of settings with a live preview, opened from the patch's page; null if none. */
    public String customizeTitle, customizeSummary;
    public PreviewFactory preview;
    public List<SettingsGroup> customizeGroups = Collections.emptyList();
    /** The settings of the customization page, for resetting. */
    public List<Setting> customizeSettings = Collections.emptyList();

    /**
     * @param key      prefix for the stored values, e.g. "liquid_glass"
     * @param included usually the patch's {@code isIncluded()}, which the patch makes return true
     */
    public PatchSettings(String key, String title, String description, Callable<Boolean> included,
                         SettingsGroup... groups) {
        this(key, title, description, included, true, groups);
    }

    /**
     * @param enabledByDefault whether the patch is switched on until the user changes it; off
     *                         for patches that change how the app is used, which the user
     *                         should choose to turn on
     */
    public PatchSettings(String key, String title, String description, Callable<Boolean> included,
                         boolean enabledByDefault, SettingsGroup... groups) {
        this.title = title;
        this.description = description;
        this.included = included;
        this.enabled = new BooleanSetting(key + "_enabled", "Enabled", null, true, enabledByDefault);
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

    /** Sets the explanation behind the "What is this?" link on the patch's page. */
    public PatchSettings about(String what, String why) {
        this.aboutWhat = what;
        this.aboutWhy = why;
        return this;
    }

    /**
     * Adds a customization page: a live preview pinned at the top, with {@code groups} under
     * it. It's opened from a row on the patch's page.
     */
    public PatchSettings customize(String title, String summary, PreviewFactory preview, SettingsGroup... groups) {
        this.customizeTitle = title;
        this.customizeSummary = summary;
        this.preview = preview;
        List<SettingsGroup> list = new ArrayList<>();
        List<Setting> all = new ArrayList<>();
        for (SettingsGroup group : groups) {
            if (group.settings.isEmpty()) continue;
            list.add(group);
            all.addAll(group.settings);
        }
        this.customizeGroups = Collections.unmodifiableList(list);
        this.customizeSettings = Collections.unmodifiableList(all);
        return this;
    }

    /** Sets the demos shown behind the settings' "?" buttons. */
    public PatchSettings demos(DemoFactory demo) {
        this.demo = demo;
        return this;
    }

    /** Forgets every stored value of the customization page. */
    public void resetCustomization() {
        for (Setting s : customizeSettings) s.reset();
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
        resetCustomization();
    }
}
