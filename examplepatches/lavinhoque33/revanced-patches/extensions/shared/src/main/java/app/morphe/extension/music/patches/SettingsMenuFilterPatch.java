/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches/pull/2029
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 * Modified by lavinhoque33, 2026-11-20.
 */

package app.morphe.extension.music.patches;

import android.content.Context;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.content.res.XmlResourceParser;

import androidx.annotation.Nullable;

import org.xmlpull.v1.XmlPullParser;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.WeakHashMap;

import app.morphe.extension.music.patches.SettingsMenuFilterSelections.Saved;
import app.morphe.extension.music.settings.Settings;
import app.morphe.extension.shared.patches.BaseSettingsMenuFilter;
import app.morphe.extension.shared.utils.Logger;

@SuppressWarnings("unused")
public final class SettingsMenuFilterPatch extends BaseSettingsMenuFilter {

    private static final String ANDROID_NS = "http://schemas.android.com/apk/res/android";
    private static final String RVX_SETTINGS = "revanced_settings";

    // These are literal android:key values in the stock settings_headers resource.
    private static final Set<String> STOCK_KEYS = Set.of(
            "pref_key_parent_tools",
            "settings_header_general",
            "settings_header_playback",
            "settings_header_data_saving",
            "settings_header_downloads_and_storage",
            "settings_header_notifications",
            "settings_header_privacy_and_location",
            "settings_header_recommendations",
            "settings_header_paid_memberships",
            "settings_header_dogfood_settings",
            "settings_header_developer_settings",
            "settings_header_about_youtube_music");

    private static final SettingsMenuFilterPatch INSTANCE = new SettingsMenuFilterPatch();

    private final Map<Object, Header> mounted = Collections.synchronizedMap(new WeakHashMap<>());
    private final List<Header> headers = new ArrayList<>();
    @Nullable private Object applyingVisibility;
    @Nullable private SettingsMenuFilterSelections selections;
    @Nullable private Map<String, String> stockAliases;

    private SettingsMenuFilterPatch() {
        super(Settings.SETTINGS_MENU_FILTER_STRINGS,
                Settings.SETTINGS_MENU_FILTER_DISCOVERED);
    }

    public static void filterHeaders(Object screen, @Nullable Context context) {
        INSTANCE.mount(screen, context);
    }

    private void mount(Object screen, @Nullable Context context) {
        mounted.clear();
        headers.clear();

        List<Object> preferences = new ArrayList<>();
        collectHeaders(screen, null, preferences);
        List<DiscoveredNode> discovered = discoveredHeaders();

        if (context != null && !Settings.SETTINGS_MENU_FILTER_STRINGS.get().isBlank()) {
            if (stockAliases == null) stockAliases = readStockAliases(context);
            save(selections().migrate(stockAliases, discovered));
        }

        for (int index = 0; index < preferences.size(); index++) {
            applyVisibility(preferences.get(index), headers.get(index));
        }
        saveDiscoveredTree(discovered);
    }

    private void collectHeaders(Object group, @Nullable Header parent, List<Object> preferences) {
        List<?> children = nativeChildren(group);
        if (children == null) return;

        for (Object preference : children) {
            String nativeKey = nativeKey(preference);
            if (RVX_SETTINGS.equals(nativeKey)) continue;

            String key = nativeKey != null && STOCK_KEYS.contains(nativeKey) ? nativeKey : null;
            Header header = new Header(parent, key, cleanTitle(nativeTitle(preference)), nativeVisible(preference));
            mounted.put(preference, header);
            headers.add(header);
            preferences.add(preference);

            collectHeaders(preference, header, preferences);
        }
    }

    private List<DiscoveredNode> discoveredHeaders() {
        List<DiscoveredNode> discovered = new ArrayList<>(headers.size());
        for (Header header : headers) {
            if (header.title == null) continue;

            Header parent = header.parent;
            if (parent != null && parent.title == null) parent = null;
            discovered.add(new DiscoveredNode(
                    parent == null ? null : parent.title, header.title,
                    parent == null ? null : parent.key, header.key));
        }
        return discovered;
    }

    @Nullable
    private static String cleanTitle(@Nullable CharSequence title) {
        if (title == null) return null;
        String text = title.toString().trim();
        return text.isEmpty() ? null : text;
    }

    public static void onTitleChanged(Object preference, @Nullable CharSequence title) {
        Header header = INSTANCE.mounted.get(preference);
        if (header == null) return;

        String next = cleanTitle(title);
        if (java.util.Objects.equals(header.title, next)) return;

        header.title = next;
        INSTANCE.applyVisibility(preference, header);
        INSTANCE.saveDiscoveredTree(INSTANCE.discoveredHeaders());
    }

    public static boolean onVisibilityChanged(Object preference, boolean visible) {
        if (preference == INSTANCE.applyingVisibility) return visible;
        Header header = INSTANCE.mounted.get(preference);
        if (header == null) return visible;

        header.stockVisible = visible;
        return visible && !INSTANCE.selections().isHidden(header.key, header.title);
    }

    private void applyVisibility(Object preference, Header header) {
        boolean show = header.stockVisible && !selections().isHidden(header.key, header.title);
        if (nativeVisible(preference) == show) return;

        Object previous = applyingVisibility;
        applyingVisibility = preference;
        try {
            nativeSetVisible(preference, show);
            if (!show && header.title != null) logHidden(header.title);
        } finally {
            applyingVisibility = previous;
        }
    }

    private static Map<String, String> readStockAliases(Context context) {
        Resources resources = context.getResources();
        int xml = resources.getIdentifier("settings_headers", "xml", context.getPackageName());
        Map<String, String> aliases = new HashMap<>();
        if (xml == 0) return aliases;

        Map<Integer, String> titleResources = new HashMap<>();
        try (XmlResourceParser parser = resources.getXml(xml)) {
            while (parser.next() != XmlPullParser.END_DOCUMENT) {
                if (parser.getEventType() != XmlPullParser.START_TAG) continue;

                String key = parser.getAttributeValue(ANDROID_NS, "key");
                if (key == null || !STOCK_KEYS.contains(key)) continue;
                int title = parser.getAttributeResourceValue(ANDROID_NS, "title", 0);
                if (title != 0) {
                    titleResources.merge(title, key, (previous, next) -> previous.equals(next) ? previous : "");
                }
            }

            addStockAliases(resources, titleResources, aliases);
            Set<Locale> seen = new HashSet<>();
            Configuration configuration = new Configuration();
            for (String tag : resources.getAssets().getLocales()) {
                Locale locale = Locale.forLanguageTag(tag);
                if (locale.getLanguage().isEmpty() || !seen.add(locale)) continue;
                configuration.setLocale(locale);
                addStockAliases(context.createConfigurationContext(configuration).getResources(),
                        titleResources, aliases);
            }
        } catch (Exception e) {
            // A partial locale catalog could turn a common title into an incorrect migration.
            Logger.printException(() -> "SettingsMenuFilter could not read stock labels", e);
            return Collections.emptyMap();
        }
        return aliases;
    }

    private static void addStockAliases(Resources resources, Map<Integer, String> titleResources,
                                        Map<String, String> aliases) {
        titleResources.forEach((title, key) ->
                SettingsMenuFilterSelections.addAlias(aliases, resources.getString(title), key));
    }

    private SettingsMenuFilterSelections selections() {
        String titles = Settings.SETTINGS_MENU_FILTER_STRINGS.get();
        String keys = Settings.SETTINGS_MENU_FILTER_KEYS.get();
        if (selections == null || !selections.isCurrent(titles, keys)) {
            selections = new SettingsMenuFilterSelections(new Saved(titles, keys));
        }
        return selections;
    }

    private static void save(Saved saved) {
        if (!saved.keys().equals(Settings.SETTINGS_MENU_FILTER_KEYS.get())) {
            Settings.SETTINGS_MENU_FILTER_KEYS.save(saved.keys());
        }
        if (!saved.titles().equals(Settings.SETTINGS_MENU_FILTER_STRINGS.get())) {
            Settings.SETTINGS_MENU_FILTER_STRINGS.save(saved.titles());
        }
    }

    @Override
    protected java.util.function.Predicate<DiscoveredNode> selectedRows() {
        SettingsMenuFilterSelections snapshot = selections();
        return row -> snapshot.isHidden(row.key(), row.title());
    }

    @Override
    protected void toggleRow(DiscoveredNode node) {
        save(selections().toggle(node));
    }

    @Override
    protected boolean hasFilterEntries() {
        return selections().hasSelections();
    }

    @Override
    protected void clearFilterEntries() {
        save(new Saved("", ""));
    }

    private static final class Header {
        @Nullable final Header parent;
        @Nullable final String key;
        @Nullable String title;
        boolean stockVisible;

        Header(@Nullable Header parent, @Nullable String key, @Nullable String title, boolean stockVisible) {
            this.parent = parent;
            this.key = key;
            this.title = title;
            this.stockVisible = stockVisible;
        }
    }

    // The patch implements these bridges using the resolved native AndroidX members.
    @Nullable
    private static List<?> nativeChildren(Object group) {
        throw new UnsupportedOperationException();
    }

    @Nullable
    private static String nativeKey(Object preference) {
        throw new UnsupportedOperationException();
    }

    @Nullable
    private static CharSequence nativeTitle(Object preference) {
        throw new UnsupportedOperationException();
    }

    private static boolean nativeVisible(Object preference) {
        throw new UnsupportedOperationException();
    }

    private static void nativeSetVisible(Object preference, boolean visible) {
        throw new UnsupportedOperationException();
    }
}
