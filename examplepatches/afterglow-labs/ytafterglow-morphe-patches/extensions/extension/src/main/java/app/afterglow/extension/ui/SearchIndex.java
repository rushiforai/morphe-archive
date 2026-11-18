package app.afterglow.extension.ui;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Locale;

import app.afterglow.extension.settings.AfterglowPrefs;
import app.afterglow.extension.settings.Descriptor;
import app.afterglow.extension.ui.SettingsModel.SearchEntry;
import app.afterglow.extension.ui.SettingsModel.SearchKind;

/**
 * The settings search index (iOS Settings.x:2111-2300 builds it, 1053-1082
 * filters it). Entries come from {@link SettingsSpec#search()} in iOS order;
 * their texts are resolved in the device language when the search screen opens.
 */
final class SearchIndex {
    /** One resolved entry as the search screen shows it. */
    static final class Item {
        final SearchEntry entry;
        final String title;
        final String subtitle;
        final String searchText;

        Item(SearchEntry entry, String title, String subtitle, String searchText) {
            this.entry = entry;
            this.title = title;
            this.subtitle = subtitle;
            this.searchText = searchText;
        }
    }

    private SearchIndex() {}

    /** iOS indexes advanced-only entries only while advanced mode is on. */
    static List<Item> build(boolean advanced) {
        List<Item> items = new ArrayList<>();
        for (SearchEntry entry : SettingsSpec.search()) {
            // Same rules as the rows: advanced mode, installed tweaks, non-empty pages.
            if (!SettingsBehavior.searchEntryShown(entry, advanced)) continue;
            items.add(resolve(entry));
        }
        return items;
    }

    private static Item resolve(SearchEntry entry) {
        Descriptor descriptor = entry.registryKey != null ? AfterglowPrefs.descriptor(entry.registryKey) : null;
        String title = descriptor != null ? descriptor.title() : entry.title.get();
        String description = entry.description != null ? entry.description.get() : null;
        if (descriptor != null) description = descriptor.description();

        // Breadcrumb: path titles joined with " > "; page entries drop their own title;
        // an empty breadcrumb shows "Afterglow" (ytag_searchEntryWithTitle, Settings.x:2112-2132).
        List<String> crumbs = new ArrayList<>();
        int count = entry.path.length - (entry.kind == SearchKind.PAGE && entry.path.length > 0 ? 1 : 0);
        for (int i = 0; i < count; i++) crumbs.add(entry.path[i].get());
        String breadcrumb = crumbs.isEmpty() ? "Afterglow" : SettingsBehavior.join(" > ", crumbs);

        // Setting entries alias their title key, the descriptor's aliases and both titles in
        // lowercase (ytag_addSearchEntries:forSettingKeys:, Settings.x:2140-2156).
        List<String> aliases = new ArrayList<>();
        if (descriptor != null) {
            // YTAGPreferenceDescriptor.searchAliases: stored aliases, then the lowercased title and
            // fallback title when not already present; the title key is prepended unconditionally.
            List<String> searchAliases = new ArrayList<>();
            Collections.addAll(searchAliases, descriptor.aliases);
            addUnique(searchAliases, descriptor.title().toLowerCase(Locale.ROOT));
            addUnique(searchAliases, descriptor.fallbackTitle.toLowerCase(Locale.ROOT));
            aliases.add(entry.titleKey);
            aliases.addAll(searchAliases);
        } else {
            Collections.addAll(aliases, entry.aliases);
        }

        List<String> parts = new ArrayList<>();
        if (title != null && !title.isEmpty()) parts.add(title);
        if (description != null && !description.isEmpty()) parts.add(description);
        parts.add(breadcrumb);
        parts.addAll(aliases);
        String searchText = SettingsBehavior.join(" ", parts).toLowerCase(Locale.ROOT);

        List<String> subtitle = new ArrayList<>();
        subtitle.add(breadcrumb);
        if (description != null && !description.isEmpty()) subtitle.add(description);
        return new Item(entry, title, SettingsBehavior.join(" • ", subtitle), searchText);
    }

    private static void addUnique(List<String> list, String value) {
        if (value != null && !value.isEmpty() && !list.contains(value)) list.add(value);
    }

    /** Every whitespace-separated word of the query must appear in the entry (case-insensitive). */
    static List<Item> filter(List<Item> items, String query) {
        String trimmed = query == null ? "" : query.trim().toLowerCase(Locale.ROOT);
        if (trimmed.isEmpty()) return items;
        String[] tokens = trimmed.split("\\s+");
        List<Item> matches = new ArrayList<>();
        for (Item item : items) {
            boolean all = true;
            for (String token : tokens) {
                if (!token.isEmpty() && !item.searchText.contains(token)) {
                    all = false;
                    break;
                }
            }
            if (all) matches.add(item);
        }
        return matches;
    }

}
