package app.hushmessenger.extension;

import android.content.SharedPreferences;
import java.util.Arrays;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.function.Predicate;

/**
 * Quick setups: a set of controls switched in one tap, with each choice's controls listed here and nowhere else.
 *
 * <p>Quiet and Privacy only turn controls on, and only ones whose effect is plain from their name and takes away nothing
 * someone would miss. Left out on purpose: stories, the inbox tabs, Meta AI and the other features people use, friend
 * requests, and anything that changes what other people see of you, such as typing, read receipts and anonymous
 * stories. iPhone look turns on the home header, the kept search bar and, from Android 12, the blur behind menus, and
 * SettingsActivity gives an empty header the words "Chats". Back to defaults turns every control off. Pause, the theme, update checks and the Menu row and
 * app drawer choices aren't controls, so they stay as they are.
 */
final class QuickSetups {
    /** Fewer ads, promotions, suggestions and nags. */
    static final List<String> QUIET = Collections.unmodifiableList(Arrays.asList(
        "people", "growth", "inbox_promotions", "chat_promotions", "ad_context_banner", "suggested_replies",
        "business_suggestions", "event_prompts", "reels_badge"));
    /** Less sent to Meta: usage statistics, the advertising ID, ad and inbox logging, and MQTT health reports. */
    static final List<String> PRIVACY = Collections.unmodifiableList(Arrays.asList(
        "analytics_uploads", "attribution_uploads", "ad_events", "mqtt_telemetry"));
    /** Messenger as an iPhone shows it: a "Chats" title in place of the wordmark, the search bar kept, menus over a blur. */
    static final List<String> IPHONE = Collections.unmodifiableList(Arrays.asList("home_header", "inbox_search_bar", MenuBlur.KEY));
    /** The choices in the order the settings show them. Each has a SettingsText title "quick_" + name and its "_help". */
    static final List<String> CHOICES = Collections.unmodifiableList(Arrays.asList(
        "quiet", "privacy", "iphone", "defaults"));

    private QuickSetups() { }

    /** What choice [name] puts on each control it touches. */
    static Map<String, Boolean> values(String name) {
        Map<String, Boolean> values = new LinkedHashMap<>();
        if ("quiet".equals(name)) for (String key : QUIET) values.put(key, true);
        else if ("privacy".equals(name)) for (String key : PRIVACY) values.put(key, true);
        else if ("iphone".equals(name)) for (String key : IPHONE) values.put(key, true);
        else if ("defaults".equals(name)) for (String[] spec : SettingsActivity.CONTROLS) values.put(spec[0], false);
        else throw new IllegalArgumentException("Unknown quick setup: " + name);
        return values;
    }

    /**
     * Whether [settable] allows any control [values] touches. Nothing changing then means it was already set; otherwise
     * none of the choice's switches are in this bundle.
     */
    static boolean anySettable(Map<String, Boolean> values, Predicate<String> settable) {
        for (String key : values.keySet()) if (settable.test(key)) return true;
        return false;
    }

    /**
     * The controls among [values] that would change: ones [settable] allows and that are saved as something else. The
     * settings leave a control whose patch isn't in this bundle alone, and only turn on one this phone can run.
     */
    static Map<String, Boolean> changes(Map<String, Boolean> values, SharedPreferences prefs, Predicate<String> settable) {
        Map<String, Boolean> changes = new LinkedHashMap<>();
        for (Map.Entry<String, Boolean> value : values.entrySet()) {
            String key = value.getKey();
            if (settable.test(key) && prefs.getBoolean(key, false) != value.getValue()) changes.put(key, value.getValue());
        }
        return changes;
    }
}
