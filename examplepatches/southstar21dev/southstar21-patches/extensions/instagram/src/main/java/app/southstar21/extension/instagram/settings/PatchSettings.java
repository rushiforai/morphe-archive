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

    /** An extra page of settings with a live preview, opened from a row on the patch's page. */
    public static final class CustomizePage {
        public final String title, summary;
        public final PreviewFactory preview;
        public final List<SettingsGroup> groups;
        /** The page's settings, for resetting it. */
        public final List<Setting> settings;

        CustomizePage(String title, String summary, PreviewFactory preview, List<SettingsGroup> groups,
                      List<Setting> settings) {
            this.title = title;
            this.summary = summary;
            this.preview = preview;
            this.groups = groups;
            this.settings = settings;
        }
    }

    /** The customization pages, in the order added; only one at a time has a row on the patch's page. */
    public List<CustomizePage> customizePages = new ArrayList<>();
    /** Which page the row opens, by index; null for the first. */
    private Callable<Integer> customizeChooser;
    /** Every customization page's settings together, each once, for resetting. */
    public List<Setting> customizeSettings = new ArrayList<>();

    /** Built under the patch's on/off switch, e.g. a choice of styles; null for nothing. */
    public PreviewFactory header;
    /** Stored settings without a row of their own (chosen in the {@link #header}), reset with the patch. */
    private final List<Setting> unlisted = new ArrayList<>();

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
        List<SettingsGroup> list = new ArrayList<>();
        List<Setting> all = new ArrayList<>();
        for (SettingsGroup group : groups) {
            if (group.settings.isEmpty()) continue;
            list.add(group);
            for (Setting setting : group.settings) {
                if (!all.contains(setting)) all.add(setting);
                if (!customizeSettings.contains(setting)) customizeSettings.add(setting);
            }
        }
        customizePages.add(new CustomizePage(title, summary, preview, Collections.unmodifiableList(list),
                Collections.unmodifiableList(all)));
        return this;
    }

    /** With several customization pages: which one the patch's page links to, by index. */
    public PatchSettings chooseCustomize(Callable<Integer> chooser) {
        this.customizeChooser = chooser;
        return this;
    }

    /** The customization page the patch's page links to now, or null if there is none. */
    public CustomizePage activeCustomizePage() {
        if (customizePages.isEmpty()) return null;
        int index = 0;
        try {
            if (customizeChooser != null) index = customizeChooser.call();
        } catch (Exception ignored) {
            // The first page.
        }
        return customizePages.get(Math.max(0, Math.min(customizePages.size() - 1, index)));
    }

    /** Adds a block under the patch's on/off switch. */
    public PatchSettings header(PreviewFactory header) {
        this.header = header;
        return this;
    }

    /** Settings stored without a row of their own (the {@link #header} sets them), reset with the patch. */
    public PatchSettings unlisted(Setting... settings) {
        Collections.addAll(unlisted, settings);
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
        for (Setting s : unlisted) s.reset();
        resetCustomization();
    }
}
