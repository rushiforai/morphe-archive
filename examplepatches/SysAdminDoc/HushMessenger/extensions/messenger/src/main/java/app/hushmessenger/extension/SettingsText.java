package app.hushmessenger.extension;

import android.app.LocaleManager;
import android.content.Context;
import android.os.Build;
import android.os.LocaleList;
import android.text.TextUtils;
import java.util.IllegalFormatException;
import java.util.LinkedHashMap;
import java.util.Locale;
import java.util.Map;

/** Text owned by the extension; no IDs from Messenger's resource table are used. */
final class SettingsText {
    private final boolean expanded, rtl;
    private final Locale locale;
    private final Map<String, String> translated;

    SettingsText(Context context) { this(requestedLocale(context)); }

    private static Locale requestedLocale(Context context) {
        // Resource resolution can move English ahead of a requested Java-only locale.
        if (Build.VERSION.SDK_INT >= 33) {
            LocaleManager manager = context.getSystemService(LocaleManager.class);
            LocaleList requested = manager == null ? LocaleList.getEmptyLocaleList() : manager.getApplicationLocales();
            if (!requested.isEmpty()) return requested.get(0);
        }
        return context.getResources().getConfiguration().getLocales().get(0);
    }

    SettingsText(Locale locale) {
        this.locale = locale;
        expanded = "en-XA".equalsIgnoreCase(locale.toLanguageTag());
        rtl = "ar-XB".equalsIgnoreCase(locale.toLanguageTag());
        translated = SettingsTranslations.forLocale(locale);
    }

    boolean isPseudo() { return expanded || rtl; }

    int layoutDirection() { return TextUtils.getLayoutDirectionFromLocale(locale); }

    String get(String id, Object... arguments) { return display(format(id, arguments)); }

    /** The id's text with its arguments, without the pseudo-locale markers, for text placed inside other text. */
    String format(String id, Object... arguments) {
        try {
            return String.format(locale, base(id), arguments);
        } catch (IllegalFormatException brokenTranslation) {
            // A translated placeholder that doesn't format mustn't take the screen down; the English one does.
            return String.format(locale, english(id), arguments);
        }
    }

    String count(String id, int count) { return get(id + (count == 1 ? "_one" : "_many"), count); }

    String number(int count) { return String.format(locale, "%d", count); }

    String display(String english) {
        if (english.isEmpty()) return english;
        if (rtl) return "\u202e" + english.replaceAll("\\p{N}+(?:[.,\u066b\u066c]\\p{N}+)*", "\u2066$0\u2069") + "\u202c";
        if (!expanded) return english;
        String plain = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
        String accented = "áḃçďéḟģĥíĵķĺḿńóṕqŕśţúṽẃẋýź";
        accented += accented.toUpperCase(Locale.ROOT);
        StringBuilder result = new StringBuilder("[");
        for (int i = 0; i < english.length(); i++) {
            int index = plain.indexOf(english.charAt(i));
            result.append(index < 0 ? english.charAt(i) : accented.charAt(index));
        }
        int padding = Math.max(1, (english.length() + 11) / 12);
        for (int i = 0; i < padding; i++) result.append(" one");
        return result.append(']').toString();
    }

    /** Every text id and its English, which a locale without a translation falls back to. */
    static final Map<String, String> ENGLISH = new LinkedHashMap<>();
    static {
        ENGLISH.put("controls", "Controls");
        ENGLISH.put("app", "App");
        ENGLISH.put("all", "All");
        ENGLISH.put("inbox", "Inbox");
        ENGLISH.put("chats", "Chats");
        ENGLISH.put("more", "More");
        ENGLISH.put("navigation", "Navigation");
        ENGLISH.put("stickers", "Stickers");
        ENGLISH.put("conversations", "Conversations");
        ENGLISH.put("links_bubbles", "Links and bubbles");
        ENGLISH.put("privacy", "Privacy");
        ENGLISH.put("theme", "Theme");
        ENGLISH.put("settings", "HushMessenger settings");
        ENGLISH.put("preview_title", "HushMessenger UI preview");
        ENGLISH.put("preview_notice", "UI preview. These switches don't change Messenger.");
        ENGLISH.put("tagline", "Make Messenger yours.");
        ENGLISH.put("open", "Open");
        ENGLISH.put("open_messenger", "Open Messenger");
        ENGLISH.put("reopen", "Apply inbox changes with App > Restart Messenger.");
        ENGLISH.put("quick_access", "QUICK ACCESS");
        ENGLISH.put("access_help", "Long-press Messenger's icon for Patch controls or Restart Messenger. You can also open HushMessenger settings from your app drawer.");
        ENGLISH.put("hide_drawer_icon", "Hide app drawer icon");
        ENGLISH.put("hide_drawer_icon_help", "Removes HushMessenger settings from your app list. Open it from Messenger's Menu tab, or long-press Messenger's icon and tap Patch controls.");
        ENGLISH.put("access_help_hosted", "Long-press Messenger's icon for Patch controls or Restart Messenger. A Root Mount install has no separate settings icon in your app drawer.");
        ENGLISH.put("access_help_hosted_menu", "Long-press Messenger's icon for Patch controls or Restart Messenger, or open HushMessenger settings from its row in Messenger's Menu tab. A Root Mount install has no separate settings icon in your app drawer.");
        ENGLISH.put("access_help_menu", "Long-press Messenger's icon for Patch controls or Restart Messenger. You can also open HushMessenger settings from its row in Messenger's Menu tab or from your app drawer.");
        ENGLISH.put("restart", "Restart Messenger");
        ENGLISH.put("restarting", "Restarting Messenger...");
        ENGLISH.put("restart_unavailable", "Couldn't restart. Close Messenger, then open it from your app drawer.");
        ENGLISH.put("restart_save_failed", "Couldn't save your choices. Messenger wasn't restarted. Try again.");
        ENGLISH.put("setup", "YOUR SETUP");
        ENGLISH.put("paused", "Pause all changes");
        ENGLISH.put("search", "Find a control");
        ENGLISH.put("empty_title", "Find the controls you need");
        ENGLISH.put("empty_help", "Try a different search or category. Only patches included in this installation appear here.");
        ENGLISH.put("clear", "Clear filters");
        ENGLISH.put("unavailable", "Unavailable on this Android version. Your choice is kept.");
        ENGLISH.put("experimental", "Experimental");
        ENGLISH.put("choice_on", "%s on");
        ENGLISH.put("choice_off", "%s off");
        ENGLISH.put("appearance", "APPEARANCE");
        ENGLISH.put("light", "Light theme");
        ENGLISH.put("light_help", "Use a light background in settings.");
        ENGLISH.put("theme_help", "Dark by default. Your choice stays saved.");
        ENGLISH.put("about", "ABOUT HUSHMESSENGER");
        ENGLISH.put("version", "Version");
        ENGLISH.put("installed", "Installed controls");
        ENGLISH.put("copy", "Copy setup");
        ENGLISH.put("copy_help", "Copies app versions and control choices. No account or chat details. Nothing is sent.");
        ENGLISH.put("usage", "USING YOUR CONTROLS");
        ENGLISH.put("save_help", "Changes save as you go. Use Restart Messenger after changing inbox controls. Your account stays signed in.");
        ENGLISH.put("pause_help", "Pause keeps your choices and temporarily restores stock behavior.");
        ENGLISH.put("account_help", "Your choices apply to every Messenger account in this installation.");
        ENGLISH.put("missing", "Missing a control?");
        ENGLISH.put("missing_help", "Select it in Morphe, then rebuild Messenger. Updating the source alone doesn't install new controls.");
        ENGLISH.put("source", "Source and licenses");
        ENGLISH.put("no_browser", "No browser is available");
        ENGLISH.put("credits", "GPL-3.0. Includes work from De-Vanced, ReVanced, Doom and Messenger Cleaner.");
        ENGLISH.put("independent", "Independent of Meta and Morphe.");
        ENGLISH.put("clipboard", "HushMessenger setup");
        ENGLISH.put("copied", "Setup copied");
        ENGLISH.put("copy_failed", "Couldn't copy setup. Try again.");
        ENGLISH.put("export", "Export choices");
        ENGLISH.put("export_help", "Copies your control choices to the clipboard. Paste them into another installation's Import to restore.");
        ENGLISH.put("exported", "Choices exported");
        ENGLISH.put("export_failed", "Couldn't export. Try again.");
        ENGLISH.put("import_choices", "Import choices");
        ENGLISH.put("import_help", "Reads choices from the clipboard. Copy an export first.");
        ENGLISH.put("imported_one", "Restored %d choice");
        ENGLISH.put("imported_many", "Restored %d choices");
        ENGLISH.put("import_empty", "Nothing to import. Export choices first, then paste them here.");
        ENGLISH.put("import_invalid", "Not a valid HushMessenger export. Copy your export to the clipboard and try again.");
        ENGLISH.put("check_updates", "Check for updates");
        ENGLISH.put("check_updates_help", "Compares your version with the latest release when you open settings. Off by default. No data is sent.");
        ENGLISH.put("update_available", "Version %s is available");
        ENGLISH.put("update_action", "View release");
        ENGLISH.put("up_to_date", "You have the latest version.");
        ENGLISH.put("update_error", "Couldn't check for updates.");
        ENGLISH.put("active_now", "Used just now");
        ENGLISH.put("active_ago", "Used %s ago");
        ENGLISH.put("seconds_short", "%ds");
        ENGLISH.put("minutes_short", "%dm");
        ENGLISH.put("hours_short", "%dh");
        ENGLISH.put("not_active", "Nothing to change yet since restart");
        ENGLISH.put("error_now", "Stopped with an error just now");
        ENGLISH.put("error_ago", "Stopped with an error %s ago");
        ENGLISH.put("changes_paused", "Changes paused");
        ENGLISH.put("changes_resumed", "Changes resumed");
        ENGLISH.put("safe_mode", "Safe mode");
        ENGLISH.put("safe_mode_help", "Messenger crashed several times in a row, so all controls were turned off. Your choices are still saved. Tap Resume to turn them back on.");
        ENGLISH.put("enabled_one", "%d control enabled");
        ENGLISH.put("enabled_many", "%d controls enabled");
        ENGLISH.put("saved_one", "%d saved choice. Turn pause off to resume.");
        ENGLISH.put("saved_many", "%d saved choices. Turn pause off to resume.");
        ENGLISH.put("saved", "Your choices are saved automatically.");
        ENGLISH.put("none_installed", "No optional controls installed. Select patches in Morphe and rebuild Messenger.");
        ENGLISH.put("no_matches", "No matching controls. Try another search.");
        ENGLISH.put("results_one", "%d of %d installed control");
        ENGLISH.put("results_many", "%d of %d installed controls");
        ENGLISH.put("open_help", "Open Messenger from your app drawer");
    }

    static String english(String id) {
        String english = ENGLISH.get(id);
        if (english == null) throw new IllegalArgumentException("Unknown settings text: " + id);
        return english;
    }

    /** The id's text in this locale's table, or its English. */
    String base(String id) {
        String english = english(id);
        String local = translated.get(id);
        return local != null ? local : english;
    }

    /** A CONTROLS row's title (field 1) or description (field 2), translated when the locale's table has it. */
    String control(String[] spec, int field) {
        String local = translated.get(spec[0] + (field == 1 ? ".title" : ".description"));
        return local != null ? local : spec[field];
    }
}
