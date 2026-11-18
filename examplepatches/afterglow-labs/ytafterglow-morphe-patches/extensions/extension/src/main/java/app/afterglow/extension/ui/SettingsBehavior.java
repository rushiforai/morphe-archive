package app.afterglow.extension.ui;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import app.afterglow.extension.InstalledTweaks;
import app.afterglow.extension.i18n.L10n;
import app.afterglow.extension.settings.AfterglowPrefs;
import app.afterglow.extension.settings.Capabilities;
import app.afterglow.extension.settings.Descriptor;
import app.afterglow.extension.settings.LiteMode;
import app.afterglow.extension.settings.TabStore;
import app.afterglow.extension.settings.ThemeColors;
import app.afterglow.extension.settings.ThemePalette;
import app.afterglow.extension.settings.ThemeStore;
import app.afterglow.extension.settings.TweakCatalog;
import app.afterglow.extension.ui.SettingsModel.Action;
import app.afterglow.extension.ui.SettingsModel.Kind;
import app.afterglow.extension.ui.SettingsModel.PageType;
import app.afterglow.extension.ui.SettingsModel.SearchEntry;
import app.afterglow.extension.ui.SettingsModel.Target;
import app.afterglow.extension.ui.SettingsModel.Option;
import app.afterglow.extension.ui.SettingsModel.Page;
import app.afterglow.extension.ui.SettingsModel.Row;

/**
 * Runtime behaviour of the settings rows: what iOS Settings.x computes in its
 * detail/summary blocks, switch descriptions and picker select blocks. Views
 * live in {@link AfterglowActivity}; this class only reads and writes
 * preferences. Source lines refer to the iOS Settings.x.
 */
final class SettingsBehavior {
    static final String ADVANCED_MODE_KEY = "advancedMode";

    // iOS appends these English literals (Settings.x:775-795); they are not localized on iOS either.
    static final String NOTE_UNAVAILABLE = "Unavailable in this YouTube version.";
    static final String NOTE_FALLBACK = "Running in compatibility fallback.";
    static final String NOTE_LITE_ON = "Lite Mode keeps this on.";
    static final String NOTE_LITE_OFF = "Lite Mode keeps this off.";
    static final String NOTE_RESTART = "Restart YouTube to apply.";

    /** Theme color keys counted by themeAppearanceSummary (Settings.x:1936-1939). */
    private static final String[] THEME_COLOR_KEYS = {
            "theme_overlayButtons", "theme_tabBarIcons", "theme_seekBar", "theme_seekBarLive", "theme_seekBarScrubber",
            "theme_seekBarScrubberLive", "theme_background", "theme_textPrimary", "theme_textSecondary", "theme_navBar",
            "theme_accent"};
    private static final String[] SPONSOR_BLOCK_CATEGORY_KEYS = {
            "sponsorBlockCategorySponsor", "sponsorBlockCategoryInteraction", "sponsorBlockCategorySelfPromo",
            "sponsorBlockCategoryIntro", "sponsorBlockCategoryOutro", "sponsorBlockCategoryPreview",
            "sponsorBlockCategoryHook", "sponsorBlockCategoryFiller", "sponsorBlockCategoryMusicOfftopic"};

    private static Map<String, Page> pages;
    private static Map<String, Row> rows;
    private static Map<String, Page> rowPages;
    private static Map<String, Row> openers;

    private SettingsBehavior() {}

    // ---------------------------------------------------------------- spec index

    static synchronized Map<String, Page> pages() {
        if (pages == null) {
            Map<String, Page> pageMap = new HashMap<>();
            Map<String, Row> rowMap = new HashMap<>();
            Map<String, Page> rowPageMap = new HashMap<>();
            Map<String, Row> openerMap = new HashMap<>();
            for (Page page : SettingsSpec.pages()) {
                pageMap.put(page.id, page);
                for (Row row : page.rows) {
                    rowMap.put(row.id, row);
                    rowPageMap.put(row.id, page);
                    if (row.target == Target.PAGE && !openerMap.containsKey(row.targetPage)) openerMap.put(row.targetPage, row);
                    if (row.trailingRows != null) for (Row trailing : row.trailingRows) rowMap.put(trailing.id, trailing);
                }
            }
            pages = pageMap;
            rows = rowMap;
            rowPages = rowPageMap;
            openers = openerMap;
        }
        return pages;
    }

    static Page page(String id) {
        return pages().get(id);
    }

    static Row row(String id) {
        pages();
        return rows.get(id);
    }

    static String text(SettingsModel.Text text) {
        if (text == null) return null;
        String value = text.get();
        return value == null ? null : value.replace("Save to Photos", "Save to media library")
                .replace("save to Photos", "save to your media library")
                .replace("videos save to Photos", "videos save to your media library")
                .replace("save-to-Photos", "media export").replace("FFmpeg", "media assembly")
                .replace("a Afterglow preferences file", "an Afterglow preferences file");
    }

    // ---------------------------------------------------------------- visibility and switches

    static boolean advancedMode() {
        return AfterglowPrefs.getBool(ADVANCED_MODE_KEY);
    }

    static boolean isVisible(Row row) {
        switch (row.visibility) {
            case ADVANCED:
                return advancedMode();
            case STANDARD_CONTROL:
                return Capabilities.standardControlAvailable(row.visibilityParam);
            case STORED_VALUE:
                return AfterglowPrefs.contains(row.visibilityParam);
            default:
                return true;
        }
    }

    /** The value a switch shows: Lite Mode's forced value when forced (iOS ytagBool). */
    static boolean switchValue(Row row) {
        if ("seekBarGradient".equals(row.key)) return ThemeStore.seekBarRainbowEnabled();
        return LiteMode.effectiveBool(row.key);
    }

    /** iOS disables a switch when its capability is Disabled (Settings.x:1457). */
    static boolean switchEnabled(Row row) {
        Descriptor descriptor = AfterglowPrefs.descriptor(row.key);
        return row.plainDescription || descriptor == null
                || Capabilities.state(descriptor.capability) != Capabilities.State.DISABLED;
    }

    /** iOS ytag_switchDescriptionForDescriptor (Settings.x:775-795). */
    static String switchDescription(Row row) {
        String base = text(row.description);
        if ("copyVideoInfo".equals(row.key)) {
            base = "Adds Copy title and Copy description to the Description header.";
        } else if ("nativeShare".equals(row.key) && base != null) {
            base = base.replace("iOS", "Android");
        } else if ("nativeDownloadRouting".equals(row.key)) {
            base = "Opens the Afterglow download sheet from YouTube's Download button and download menu actions.";
        }
        if (row.plainDescription) return base;
        List<String> parts = new ArrayList<>();
        if (base != null && !base.isEmpty()) parts.add(base);
        Descriptor descriptor = AfterglowPrefs.descriptor(row.key);
        if (descriptor != null && descriptor.capability != null) {
            Capabilities.State state = Capabilities.state(descriptor.capability);
            if (state == Capabilities.State.DISABLED) parts.add(NOTE_UNAVAILABLE);
            else if (state == Capabilities.State.FALLBACK) parts.add(NOTE_FALLBACK);
        }
        Boolean forced = LiteMode.forcedValue(row.key);
        if (forced != null) parts.add(forced ? NOTE_LITE_ON : NOTE_LITE_OFF);
        // Fix (duplicated restart sentence): iOS appends "Restart YouTube to apply." even when the
        // description already asks for a restart; the generator marks those rows suppressRestartNote.
        // Android creates and caches the playlist bar, its event owner and animator
        // separately; they must all switch layouts in a fresh process.
        boolean restartRequired = "playlistOldMinibar".equals(row.key)
                || (descriptor != null && descriptor.isRestartRequired());
        if (restartRequired && !row.suppressRestartNote) parts.add(NOTE_RESTART);
        return parts.isEmpty() ? null : join(" ", parts);
    }

    // ---------------------------------------------------------------- installed tweaks

    /*
     * Which rows appear on Android (TweakCatalog + InstalledTweaks):
     *  - A row with a key shows only when the key is a base key, or its tweak is installed
     *    and the key's Android behavior works (TweakCatalog.SHOWN_KEYS). Actions and
     *    destinations use their registry key (action.*, destination.*), so Theme Studio, AI
     *    Home and AB Lab follow their tweaks. Keys no tweak owns (theme colors, activeTabs)
     *    stay hidden.
     *  - A row that opens a sub-page shows when that page has something to show; the Search
     *    row shows when the search index has an entry left.
     *  - A Reset to Defaults row shows when one of the keys it resets shows.
     *  - Rows without a key (headers, spacers, captions, links, Share debug log) follow their
     *    section: they show when a keyed row of the section shows. A section made only of
     *    such rows (the Credits links) is static content and stays.
     *  - Every row still obeys its iOS condition (advanced mode, capability, stored value).
     */

    /** A key shows when it is a base key, or its tweak is installed and its behavior works. */
    static boolean keyVisible(String key) {
        if (key == null) return false;
        if (TweakCatalog.isBaseKey(key)) return true;
        TweakCatalog.Tweak tweak = TweakCatalog.tweakForKey(key);
        return tweak != null && InstalledTweaks.has(tweak.id) && TweakCatalog.isShown(key);
    }

    /** Rows without a key of their own, which follow their section. */
    static boolean isFollower(Row row) {
        if (row.kind == Kind.INFO || row.kind == Kind.LINK) return true;
        return row.kind == Kind.ACTION && row.action != Action.RESET_DEFAULTS && row.key == null && row.registryKey == null;
    }

    /** Whether a row appears: its iOS condition and the installed-tweak rules above. */
    static boolean shown(Row row) {
        return isVisible(row) && tweakShown(row);
    }

    private static boolean tweakShown(Row row) {
        if (row.action == Action.RESET_DEFAULTS) {
            for (String key : resetKeys(row)) if (keyVisible(key)) return true;
            return false;
        }
        if (isFollower(row)) {
            pages();
            Page page = rowPages.get(row.id);
            return page == null || sectionShown(page, row.section);
        }
        if (row.kind == Kind.DESTINATION && row.target == Target.PAGE && row.key == null) {
            Page target = page(row.targetPage);
            if (target == null) return false;
            return target.type == PageType.SEARCH ? searchHasEntries() : pageShown(target);
        }
        return keyVisible(row.registryKey != null ? row.registryKey : row.key);
    }

    /** A section shows when one of its keyed rows shows; a section without keyed rows is static. */
    static boolean sectionShown(Page page, int section) {
        boolean keyed = false;
        for (Row row : page.rows) {
            if (row.section != section || isFollower(row)) continue;
            keyed = true;
            if (shown(row)) return true;
        }
        return !keyed;
    }

    /** A page shows when one of its keyed rows shows (the root always does; static pages stay). */
    static boolean pageShown(Page page) {
        if (page.type == PageType.ROOT) return true;
        boolean keyed = false;
        for (Row row : page.rows) {
            if (isFollower(row)) continue;
            keyed = true;
            if (shown(row)) return true;
        }
        return !keyed;
    }

    /** Rows under a picker's options (the Comments reset block) follow the group's keyed row. */
    static boolean shownInGroup(Row row, Row[] group) {
        if (!isFollower(row)) return shown(row);
        for (Row other : group) if (!isFollower(other) && shown(other)) return true;
        return false;
    }

    /** A search entry shows when every page on its way and its row show (same rules as rows). */
    static boolean searchEntryShown(SearchEntry entry, boolean advanced) {
        if (entry.advancedOnly && !advanced) return false;
        pages();
        for (int i = 1; i < entry.pageChain.length; i++) {
            Row opener = openers.get(entry.pageChain[i]);
            if (opener == null || !shown(opener)) return false;
        }
        if (entry.rowId == null) return true;
        Row target = row(entry.rowId);
        return target != null && shown(target);
    }

    static boolean searchHasEntries() {
        boolean advanced = advancedMode();
        for (SearchEntry entry : SettingsSpec.search()) if (searchEntryShown(entry, advanced)) return true;
        return false;
    }

    // ---------------------------------------------------------------- detail texts

    /** Right-side text of a row. CACHE_SIZE is supplied by the activity (computed off the main thread). */
    static String detail(Row row, String cacheSize) {
        switch (row.detail) {
            case CONSTANT:
                return text(row.detailText);
            case ENABLED_SUMMARY:
                return enabledSummary(row.detailKeys);
            case TABS_COUNT:
                return TabStore.currentActiveTabs().size() + " tabs";
            case SHOWN_COUNT:
                return TabStore.currentActiveTabs().size() + " shown";
            case THEME_APPEARANCE:
                return themeAppearanceSummary();
            case THEME_TYPOGRAPHY:
                return themeTypographySummary();
            case THEME_SEEK_BAR:
                return customizationSummary(row.detailKeys);
            case THEME_STUDIO:
                ThemePalette activeTheme = ThemeStore.snapshot().palette;
                return "system".equals(activeTheme.identifier) ? SettingsSpec.THEME_PRESET_COUNT + " presets" : activeTheme.name;
            case SPONSOR_BLOCK:
                return sponsorBlockSummary(row);
            case VERSION:
                return SettingsSpec.VERSION;
            case OPTION_LABEL:
                return row.options[clampedIndex(row)].label.get();
            case STARTUP_TAB:
                return tabName(TabStore.currentStartupTab());
            case ANCHOR:
                return anchorDetail(row);
            case SCRUBBER_SIZE: {
                int size = AfterglowPrefs.getInt(row.key);
                return size == 0 ? defaultText() : "+" + size + "%";
            }
            case GLOW_STRENGTH:
                return glowStrengthDetail(row);
            case NUMBER:
                return AfterglowPrefs.getInt(row.key) + (row.suffix == null ? "" : row.suffix);
            case COLOR: {
                String hex = colorHex(row.key);
                return hex != null ? hex : defaultText();
            }
            case CLEARS_COLOR: {
                String hex = colorHex(row.key);
                return "Clears " + (hex != null ? hex : defaultText());
            }
            case IMAGE_SET:
                return AfterglowPrefs.contains(row.key) ? text(row.detailText) : text(row.detailAltText);
            case CACHE_SIZE:
                return cacheSize;
            default:
                return null;
        }
    }

    static String defaultText() {
        return L10n.get("Default", "Default");
    }

    /**
     * iOS enabledSummaryForKeys (Settings.x:1575-1584): "Disabled", "1 on" or "n on".
     *
     * <p>Fix (fresh-install summaries): iOS counts every key whose bool reading is YES, so
     * picker integers count as "on" whenever they are non-zero (speedIndex=1,
     * autoSpeedIndex=3, downloadAudioTrackMode=1, downloadPickerFontFaceMode=1 by default),
     * giving Playback "3 on", Player "22 on" and Afterglow Vault "6 on" on a fresh install.
     * Only switch (BOOLEAN) keys are counted here.
     */
    static String enabledSummary(String[] keys) {
        int count = 0;
        if (keys != null) {
            for (String key : keys) {
                Descriptor descriptor = AfterglowPrefs.descriptor(key);
                if (descriptor == null || descriptor.type != Descriptor.Type.BOOLEAN) continue;
                // Only settings that show on this build count toward the summary.
                if (keyVisible(key) && LiteMode.effectiveBool(key)) count++;
            }
        }
        if (count == 0) return L10n.get("Disabled", "Disabled");
        if (count == 1) return "1 on";
        return count + " on";
    }

    /**
     * iOS themeSeekBarSummary (Settings.x:1909-1921): "Default", "1 custom" or "n custom".
     *
     * <p>Fix (fresh-install summaries): iOS counts keys whose objectForKey is non-nil, and
     * registered defaults are returned by objectForKey, so a fresh install shows
     * "3 custom". Here a key counts only when it is stored and differs from its default.
     */
    static String customizationSummary(String[] keys) {
        int count = 0;
        if (keys != null) for (String key : keys) if (keyVisible(key) && isCustomized(key)) count++;
        if (count == 0) return defaultText();
        if (count == 1) return "1 custom";
        return count + " custom";
    }

    static boolean isCustomized(String key) {
        if (!AfterglowPrefs.contains(key)) return false;
        Descriptor descriptor = AfterglowPrefs.descriptor(key);
        if (descriptor == null || descriptor.defaultValue == null) return true;
        Object stored = AfterglowPrefs.snapshot().get(key);
        if (stored instanceof Number && descriptor.defaultValue instanceof Number) {
            return ((Number) stored).longValue() != ((Number) descriptor.defaultValue).longValue();
        }
        return !descriptor.defaultValue.equals(stored);
    }

    /** iOS themeAppearanceSummary (Settings.x:1934-1962). */
    static String themeAppearanceSummary() {
        int colors = 0;
        for (String key : THEME_COLOR_KEYS) if (AfterglowPrefs.contains(key)) colors++;
        boolean gradient = AfterglowPrefs.contains("theme_gradientStart") || AfterglowPrefs.contains("theme_gradientEnd");
        boolean glow = InstalledTweaks.has("glow") && LiteMode.effectiveBool("theme_glowEnabled");
        boolean font = AfterglowPrefs.getInt("theme_fontMode") != 0 || AfterglowPrefs.getInt("theme_fontSizeMode") != 0
                || AfterglowPrefs.getInt("theme_fontWeightMode") != 0 || AfterglowPrefs.getInt("theme_fontStyleMode") != 0
                || AfterglowPrefs.getInt("theme_tabLabelSizeMode") != 0;
        if (colors == 0 && !gradient && !glow && !font) return defaultText();
        if (colors == 0 && !gradient && !glow) return themeTypographySummary();
        if (colors == 0 && gradient && !glow) return "Gradient " + themeGradientSummary();
        if (colors == 0) return gradient ? "Glow + gradient" : "Brand glow";
        if (!gradient && !glow) return colors == 1 ? "1 color override" : colors + " color overrides";
        if (gradient && glow) return colors + " colors + glow";
        if (gradient) return colors + " colors + gradient";
        return colors + " colors + glow";
    }

    /** iOS themeGradientSummary (Settings.x:1924-1931). */
    static String themeGradientSummary() {
        String start = colorHex("theme_gradientStart");
        String end = colorHex("theme_gradientEnd");
        if (start == null && end == null) return "Off";
        if (start == null || end == null) return "Incomplete";
        return start + " to " + end;
    }

    /** iOS themeTypographySummary (Settings.x:1891-1906), using the Typography pickers' labels. */
    static String themeTypographySummary() {
        List<String> parts = new ArrayList<>();
        addTypographyPart(parts, "typography.fontMode", "theme_fontMode", false, "");
        addTypographyPart(parts, "typography.fontSizeMode", "theme_fontSizeMode", false, "");
        addTypographyPart(parts, "typography.fontWeightMode", "theme_fontWeightMode", true, "");
        addTypographyPart(parts, "typography.fontStyleMode", "theme_fontStyleMode", true, "");
        addTypographyPart(parts, "typography.tabLabelSizeMode", "theme_tabLabelSizeMode", true, " tabs");
        return parts.isEmpty() ? defaultText() : join(", ", parts);
    }

    private static void addTypographyPart(List<String> parts, String rowId, String key, boolean lowercase, String suffix) {
        int mode = AfterglowPrefs.getInt(key);
        if (mode == 0) return;
        Row row = row(rowId);
        if (row == null || row.options == null || row.options.length == 0) return;
        String name = row.options[Math.max(0, Math.min(mode, row.options.length - 1))].label.get();
        parts.add((lowercase ? name.toLowerCase(Locale.ROOT) : name) + suffix);
    }

    /** iOS SponsorBlock page summary (Settings.x:2777-2786). */
    static String sponsorBlockSummary(Row row) {
        if (!LiteMode.effectiveBool("sponsorBlockEnabled")) return text(row.detailText);
        int count = 0;
        for (String key : SPONSOR_BLOCK_CATEGORY_KEYS) if (AfterglowPrefs.getBool(key)) count++;
        String markers = LiteMode.effectiveBool("sponsorBlockMarkersEnabled") ? "markers on" : "markers off";
        return count + " auto-skip • " + markers;
    }

    /** iOS themeGlowStrengthMode (Settings.x:1965-1969); a default of 1 is always registered. */
    static int glowStrengthMode() {
        return Math.max(0, Math.min(AfterglowPrefs.getInt("theme_glowStrengthMode"), 3));
    }

    /** iOS themeGlowStrengthDetail (Settings.x:1972-1980). */
    static String glowStrengthDetail(Row row) {
        int mode = glowStrengthMode();
        if (mode == 3) {
            int custom = Math.max(0, Math.min(AfterglowPrefs.getInt("theme_glowStrengthCustom"), 100));
            return "Custom " + custom + "/100";
        }
        return row.options[Math.min(mode, 2)].label.get();
    }

    /** Stored theme color as "#RRGGBB" (one decoder for every theme_* read: ThemeColors). */
    static String colorHex(String key) {
        return ThemeColors.hex(key);
    }

    // ---------------------------------------------------------------- pickers

    /** One checkmark choice: its label and the value written (int or tab id). */
    static final class Choice {
        final String label;
        final int value;
        final String tabId;

        Choice(String label, int value, String tabId) {
            this.label = label;
            this.value = value;
            this.tabId = tabId;
        }
    }

    static int clampedIndex(Row row) {
        int last = row.options == null ? 0 : row.options.length - 1;
        // Clamped for every index picker; iOS leaves the playback-rate and quality pickers
        // unclamped, which would crash on an out-of-range stored value.
        return Math.max(0, Math.min(AfterglowPrefs.getInt(row.key), last));
    }

    /** The choices a picker shows, in order (computed lists for the tab pickers). */
    static List<Choice> choices(Row row) {
        List<Choice> list = new ArrayList<>();
        switch (row.picker) {
            case STARTUP_TAB:
                // iOS startupTabItem (Settings.x:1759-1783): one row per active tab.
                for (String tab : TabStore.currentActiveTabs()) list.add(new Choice(tabName(tab), 0, tab));
                break;
            case ANCHOR:
                // iOS anchorTabItem (Settings.x:1801-1839): the first six or fewer active tabs.
                for (String tab : TabStore.nativeTabs()) list.add(new Choice(tabName(tab), 0, tab));
                break;
            default:
                if (row.options != null) for (Option option : row.options) list.add(new Choice(option.label.get(), option.value, null));
                break;
        }
        return list;
    }

    /** Index of the checkmarked choice. */
    static int selectedIndex(Row row, List<Choice> choices) {
        switch (row.picker) {
            case STARTUP_TAB:
                return Math.max(0, indexOfTab(choices, TabStore.currentStartupTab()));
            case ANCHOR: {
                int index = indexOfTab(choices, AfterglowPrefs.getString(row.key));
                if (index < 0) index = indexOfTab(choices, row.defaultChoice);
                return Math.max(0, index);
            }
            case VALUE: {
                int value = AfterglowPrefs.getInt(row.key);
                for (int i = 0; i < choices.size(); i++) if (choices.get(i).value == value) return i;
                return 0;
            }
            case GLOW_STRENGTH:
                return glowStrengthMode();
            default:
                return clampedIndex(row);
        }
    }

    /**
     * Writes a picker choice (iOS checkmark select blocks). Glow strength's "Custom..."
     * choice is handled by the activity's number dialog instead.
     */
    static void select(Row row, Choice choice, int index) {
        switch (row.picker) {
            case STARTUP_TAB:
                AfterglowPrefs.setString(TabStore.STARTUP_TAB_KEY, choice.tabId);
                break;
            case ANCHOR:
                selectAnchor(row, choice.tabId);
                break;
            case VALUE:
                AfterglowPrefs.setInt(row.key, choice.value);
                break;
            case GLOW_STRENGTH:
                AfterglowPrefs.setInt("theme_glowStrengthMode", index);
                AfterglowPrefs.setInt("theme_glowStrength", index);
                break;
            default:
                AfterglowPrefs.setInt(row.key, index);
                break;
        }
    }

    /** Glow strength "Custom..." save (Settings.x:2690-2703). */
    static void saveCustomGlowStrength(int value) {
        int clamped = Math.max(0, Math.min(value, 100));
        AfterglowPrefs.setInt("theme_glowStrengthCustom", clamped);
        AfterglowPrefs.setInt("theme_glowStrengthMode", 3);
        AfterglowPrefs.setInt("theme_glowStrength", clamped);
    }

    /** iOS anchor select block (Settings.x:1816-1832): taking the other side's tab swaps them. */
    static void selectAnchor(Row row, String choice) {
        List<String> choices = TabStore.nativeTabs();
        String other = AfterglowPrefs.getString(row.otherKey);
        if (other == null) other = row.otherDefault;
        if (other.equals(choice)) {
            String previous = AfterglowPrefs.getString(row.key);
            if (previous == null) previous = row.defaultChoice;
            String replacement = !previous.equals(choice) ? previous : null;
            if (replacement == null || !choices.contains(replacement)) {
                replacement = null;
                for (String candidate : choices) {
                    if (!candidate.equals(choice)) {
                        replacement = candidate;
                        break;
                    }
                }
            }
            if (replacement != null) AfterglowPrefs.setString(row.otherKey, replacement);
        }
        AfterglowPrefs.setString(row.key, choice);
    }

    /** iOS anchor detail text (Settings.x:1794-1800). */
    static String anchorDetail(Row row) {
        String choice = AfterglowPrefs.getString(row.key);
        if (choice == null) choice = row.defaultChoice;
        List<String> nativeTabs = TabStore.nativeTabs();
        if (!nativeTabs.contains(choice)) {
            choice = nativeTabs.contains(row.defaultChoice) ? row.defaultChoice : (nativeTabs.isEmpty() ? null : nativeTabs.get(0));
        }
        return choice == null ? "None" : tabName(choice);
    }

    private static int indexOfTab(List<Choice> choices, String tab) {
        if (tab == null) return -1;
        for (int i = 0; i < choices.size(); i++) if (tab.equals(choices.get(i).tabId)) return i;
        return -1;
    }

    /** iOS ytag_tabNames (Settings.x:1850-1864), falling back to the id. */
    static String tabName(String tabId) {
        if (tabId == null) return "";
        for (int i = 0; i < SettingsSpec.TAB_IDS.length; i++) {
            if (SettingsSpec.TAB_IDS[i].equals(tabId)) return SettingsSpec.TAB_NAMES[i].get();
        }
        return tabId;
    }

    static String tabSymbol(String tabId) {
        for (int i = 0; i < SettingsSpec.TAB_IDS.length; i++) {
            if (SettingsSpec.TAB_IDS[i].equals(tabId)) return SettingsSpec.TAB_SYMBOLS[i];
        }
        return null;
    }

    // ---------------------------------------------------------------- reset keys

    /** Keys a Reset to Defaults row removes now (advanced-only keys follow advanced mode, as on iOS). */
    static List<String> resetKeys(Row row) {
        List<String> keys = new ArrayList<>();
        if (row.actionKeys != null) Collections.addAll(keys, row.actionKeys);
        if (row.advancedActionKeys != null && advancedMode()) Collections.addAll(keys, row.advancedActionKeys);
        return keys;
    }

    static String join(String separator, List<String> parts) {
        StringBuilder out = new StringBuilder();
        for (String part : parts) {
            if (out.length() > 0) out.append(separator);
            out.append(part);
        }
        return out.toString();
    }
}
