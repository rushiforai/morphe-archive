package app.afterglow.extension.ui;

import app.afterglow.extension.i18n.L10n;

/**
 * Data model for the Afterglow settings screens. {@link SettingsSpec} (generated
 * from tools/ios-settings-ui.json, the transcription of the iOS Settings.x)
 * builds every page and row with these types; {@link AfterglowActivity}
 * renders them. Behaviour that iOS computes at runtime (summaries, computed
 * picker lists, actions) is selected by the enums below and implemented in
 * {@link SettingsBehavior}.
 */
final class SettingsModel {
    private SettingsModel() {}

    /** Row kinds, the same set as the JSON spec. */
    enum Kind { SWITCH, PICKER, TEXT, ACTION, DESTINATION, LINK, INFO, CUSTOM }

    /** INFO rows: blank spacer, disabled title+description header, or description-only caption. */
    enum Role { ROW, SPACER, HEADER, CAPTION }

    enum PageType { ROOT, LIST, SEARCH, TAB_EDITOR }

    /** When a row is shown. iOS evaluates these when the page is built. */
    enum Visibility { ALWAYS, ADVANCED, STANDARD_CONTROL, STORED_VALUE }

    /** Right-side detail text (iOS detailTextBlock / page-row summary). */
    enum Detail {
        NONE, CONSTANT, ENABLED_SUMMARY, TABS_COUNT, SHOWN_COUNT, THEME_APPEARANCE, THEME_TYPOGRAPHY,
        THEME_SEEK_BAR, THEME_STUDIO, SPONSOR_BLOCK, VERSION, OPTION_LABEL, STARTUP_TAB, ANCHOR,
        SCRUBBER_SIZE, GLOW_STRENGTH, NUMBER, COLOR, CLEARS_COLOR, IMAGE_SET, CACHE_SIZE
    }

    /** How a picker row builds its checkmark list and stores the choice. */
    enum Picker { NONE, INDEX, VALUE, STARTUP_TAB, ANCHOR, GLOW_STRENGTH }

    enum Action {
        NONE, RESET_DEFAULTS, RESET_ALL_COLORS, CLEAR_CACHE, EXPORT_PREFERENCES, IMPORT_PREFERENCES,
        RESET_SETTINGS, SHARE_DEBUG_LOG, CLEAR_DEBUG_LOG, USE_DEFAULT_COLOR, REMOVE_IMAGE
    }

    enum Target { NONE, PAGE, EXTERNAL }

    /** Rows that present a system picker on iOS (not ported: they open a placeholder page). */
    enum Custom { NONE, COLOR_PICKER, IMAGE_PICKER }

    enum SearchKind { PAGE, TARGET, SETTING, LITERAL }

    /** A displayed string: iOS localization key (null for hardcoded English) plus its English text. */
    static final class Text {
        final String key;
        final String en;

        Text(String key, String en) {
            this.key = key;
            this.en = en;
        }

        /** iOS LOC(): the device language, then English; a missing key shows the English/echoed key. */
        String get() {
            return L10n.get(key, en);
        }
    }

    /** One checkmark option: label plus the exact value iOS stores. */
    static final class Option {
        final Text label;
        final int value;

        Option(Text label, int value) {
            this.label = label;
            this.value = value;
        }
    }

    /** One row. Built fluently by the generated spec. */
    static final class Row {
        final String id;
        final Kind kind;
        Role role = Role.ROW;
        String key;
        Text title;
        /** Literal English prefix composed in front of the title ("Use Default %@" rows). */
        String titlePrefix;
        Text description;
        boolean enabled = true;
        /** Switch built without descriptor notes (iOS Debug HUD switch). */
        boolean plainDescription;
        /** Base description already carries a restart sentence (quirk fix, see SettingsBehavior). */
        boolean suppressRestartNote;
        Visibility visibility = Visibility.ALWAYS;
        String visibilityParam;
        Detail detail = Detail.NONE;
        Text detailText;
        Text detailAltText;
        String[] detailKeys;
        Picker picker = Picker.NONE;
        Text pickerTitle;
        Option[] options;
        Row[] trailingRows;
        boolean popsAfterSelect;
        Action action = Action.NONE;
        String[] actionKeys;
        /** Keys reset only while advanced mode is on (iOS builds those reset lists from visible rows). */
        String[] advancedActionKeys;
        Target target = Target.NONE;
        String targetPage;
        String registryKey;
        Custom custom = Custom.NONE;
        int min;
        int max;
        int fallback;
        String suffix;
        Text dialogTitle;
        Text dialogMessage;
        String url;
        String otherKey;
        String defaultChoice;
        String otherDefault;
        /** Visual section index on the page (-1 for picker trailing rows). */
        int section = -1;
        String source;

        Row(String id, Kind kind) {
            this.id = id;
            this.kind = kind;
        }

        Row key(String value) { key = value; return this; }
        Row role(Role value) { role = value; return this; }
        Row title(Text value) { title = value; return this; }
        Row titlePrefix(String value) { titlePrefix = value; return this; }
        Row desc(Text value) { description = value; return this; }
        Row disabled() { enabled = false; return this; }
        Row plainDescription() { plainDescription = true; return this; }
        Row suppressRestartNote() { suppressRestartNote = true; return this; }
        Row visible(Visibility value, String param) { visibility = value; visibilityParam = param; return this; }
        Row detail(Detail value) { detail = value; return this; }
        Row detailText(Text value) { detailText = value; return this; }
        Row detailAltText(Text value) { detailAltText = value; return this; }
        Row detailKeys(String... value) { detailKeys = value; return this; }
        Row picker(Picker kind, Text navTitle, Option... values) { picker = kind; pickerTitle = navTitle; options = values; return this; }
        Row trailing(Row... rows) { trailingRows = rows; return this; }
        Row pops() { popsAfterSelect = true; return this; }
        Row action(Action value, String... keys) { action = value; actionKeys = keys; return this; }
        Row advancedKeys(String... keys) { advancedActionKeys = keys; return this; }
        Row page(String pageId) { target = Target.PAGE; targetPage = pageId; return this; }
        Row external(String registry) { target = Target.EXTERNAL; registryKey = registry; return this; }
        Row registry(String value) { registryKey = value; return this; }
        Row custom(Custom value) { custom = value; return this; }
        Row number(int minimum, int maximum, int fallbackValue, String unit) { min = minimum; max = maximum; fallback = fallbackValue; suffix = unit; return this; }
        Row dialog(Text titleText, Text messageText) { dialogTitle = titleText; dialogMessage = messageText; return this; }
        Row url(String value) { url = value; return this; }
        Row anchor(String other, String choice, String otherChoice) { otherKey = other; defaultChoice = choice; otherDefault = otherChoice; return this; }
        Row sec(int value) { section = value; return this; }
        Row src(String value) { source = value; return this; }

        /** Title as displayed, including a composed prefix. */
        String displayTitle() {
            String text = title == null ? "" : title.get();
            return titlePrefix == null ? text : titlePrefix + text;
        }
    }

    static final class Page {
        final String id;
        final PageType type;
        final Text navTitle;
        /** Real table-section title (root "Afterglow", Credits "Credits"); null for most pages. */
        final Text sectionTitle;
        final String source;
        final Row[] rows;

        Page(String id, PageType type, Text navTitle, Text sectionTitle, String source, Row[] rows) {
            this.id = id;
            this.type = type;
            this.navTitle = navTitle;
            this.sectionTitle = sectionTitle;
            this.source = source;
            this.rows = rows;
        }
    }

    /**
     * One search index entry (iOS ytag_settingsSearchEntriesForAdvancedMode). Texts
     * are resolved when the search screen opens so they follow the device language.
     */
    static final class SearchEntry {
        final SearchKind kind;
        final Text title;
        final Text description;
        final Text[] path;
        final String titleKey;
        final String registryKey;
        final String[] aliases;
        final boolean advancedOnly;
        /** Pages to open, root first (resolved by the generator; see generate_settings_ui.py). */
        final String[] pageChain;
        /** Row to scroll to and flash on the last page, or null to just open the page. */
        final String rowId;
        final String source;

        SearchEntry(SearchKind kind, Text title, Text description, Text[] path, String titleKey, String registryKey,
                    String[] aliases, boolean advancedOnly, String[] pageChain, String rowId, String source) {
            this.kind = kind;
            this.title = title;
            this.description = description;
            this.path = path;
            this.titleKey = titleKey;
            this.registryKey = registryKey;
            this.aliases = aliases;
            this.advancedOnly = advancedOnly;
            this.pageChain = pageChain;
            this.rowId = rowId;
            this.source = source;
        }
    }
}
