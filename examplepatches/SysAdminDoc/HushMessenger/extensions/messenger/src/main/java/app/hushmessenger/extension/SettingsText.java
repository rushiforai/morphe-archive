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
        ENGLISH.put("reopen", "Restart Messenger to see inbox changes. Tap App, then Restart Messenger.");
        ENGLISH.put("quick_access", "QUICK ACCESS");
        ENGLISH.put("access_help", "Long-press Messenger's home screen icon for Patch controls or Restart Messenger. You can also open HushMessenger settings from your app drawer.");
        ENGLISH.put("hide_drawer_icon", "Hide app drawer icon");
        ENGLISH.put("hide_drawer_icon_help", "Removes HushMessenger settings from your app list. Open it from Messenger's Menu tab or side menu, or long-press Messenger's home screen icon and tap Patch controls.");
        ENGLISH.put("shared_install_help", "HushMessenger settings is part of the Messenger app. If you uninstall it, Messenger is removed and its data on your phone is erased. To hide only this icon, use Hide app drawer icon.");
        ENGLISH.put("access_help_hosted", "Long-press Messenger's home screen icon for Patch controls or Restart Messenger. A Root Mount install has no separate settings icon in your app drawer.");
        ENGLISH.put("access_help_hosted_menu", "Long-press Messenger's home screen icon for Patch controls or Restart Messenger, or open HushMessenger settings from its row in Messenger's Menu tab or side menu. A Root Mount install has no separate settings icon in your app drawer.");
        ENGLISH.put("access_help_menu", "Long-press Messenger's home screen icon for Patch controls or Restart Messenger. You can also open HushMessenger settings from its row in Messenger's Menu tab or side menu, or from your app drawer.");
        ENGLISH.put("access_help_missing", "Long-press Messenger's home screen icon for Patch controls or Restart Messenger. This bundle has no settings icon in the app drawer.");
        ENGLISH.put("access_help_missing_menu", "Open HushMessenger from Messenger's Menu tab or side menu, or long-press Messenger's home screen icon for Patch controls or Restart Messenger. This bundle has no settings icon in the app drawer.");
        ENGLISH.put("drawer_search", "App drawer icon settings");
        ENGLISH.put("drawer_root", "Hide app drawer icon isn't needed on Root Mount. There is no separate settings icon to hide.");
        ENGLISH.put("drawer_missing", "Hide app drawer icon isn't available. This patch bundle has no settings icon to hide.");
        ENGLISH.put("drawer_requires_menu", "To hide the app drawer icon, patch in Open settings from menu first, so you can still find these settings. Without it, the icon stays.");
        ENGLISH.put("restart", "Restart Messenger");
        ENGLISH.put("restarting", "Restarting Messenger...");
        ENGLISH.put("restart_unavailable", "Couldn't restart. Close Messenger, then open it from your app drawer.");
        ENGLISH.put("settings_open_failed", "Couldn't open HushMessenger settings. Long-press Messenger's home screen icon and try Patch controls.");
        ENGLISH.put("restart_save_failed", "Couldn't save your choices. Messenger wasn't restarted. Try again.");
        ENGLISH.put("setup", "YOUR SETUP");
        ENGLISH.put("paused", "Pause all changes");
        ENGLISH.put("search", "Find a control");
        ENGLISH.put("empty_title", "Find the controls you need");
        ENGLISH.put("empty_help", "Try a different search or filter. Only the patches you installed show up here.");
        ENGLISH.put("clear", "Clear filters");
        ENGLISH.put("unavailable", "Not available on this version of Android. Your choice is saved.");
        ENGLISH.put("bubble_stock", "Stock");
        ENGLISH.put("bubble_chat_heads", "Chat Heads");
        ENGLISH.put("bubble_native", "Native Bubbles");
        ENGLISH.put("bubble_changed", "%s selected. Restart Messenger to apply.");
        ENGLISH.put("bubble_help", "Stock lets Messenger decide. Chat Heads also needs Messenger's own Chat heads switch and permission to draw over other apps. For Native Bubbles, allow Messenger's bubbles in the Android settings below. Accounts that don't support bubbles keep Messenger's normal behavior. Pause all changes puts everything back to Messenger's own choice.");
        ENGLISH.put("bubble_unsupported", "Native Bubbles isn't available in this patch bundle, so Messenger works as usual. Your choice is saved.");
        ENGLISH.put("bubble_permissions", "Android bubble settings");
        ENGLISH.put("bubble_notifications", "Messenger notification settings");
        ENGLISH.put("bubble_conversations", "Android conversation settings");
        ENGLISH.put("bubble_settings_missing", "This phone has no matching settings screen. Open Messenger's app info, then Notifications.");
        ENGLISH.put("experimental", "Experimental");
        ENGLISH.put("choice_on", "%s on");
        ENGLISH.put("choice_off", "%s off");
        ENGLISH.put("appearance", "APPEARANCE");
        ENGLISH.put("material_you_black", "Pure black dark mode");
        ENGLISH.put("material_you_black_help", "With Material You theme on, Messenger's darkest backgrounds become pure black. Light mode doesn't change.");
        ENGLISH.put("light", "Light theme");
        ENGLISH.put("light_help", "Makes this HushMessenger settings screen light. Messenger itself isn't changed.");
        ENGLISH.put("theme_help", "Dark by default. Your choice stays saved.");
        ENGLISH.put("about", "ABOUT HUSHMESSENGER");
        ENGLISH.put("version", "Version");
        ENGLISH.put("installed", "Installed controls");
        ENGLISH.put("copy", "Copy setup");
        ENGLISH.put("copy_help", "Copies app versions and control choices. No account or chat details. Nothing is sent.");
        ENGLISH.put("setup_activity_help", "Activity notes only show that a control ran. They don't prove it had a visible effect or protected your privacy.");
        ENGLISH.put("usage", "USING YOUR CONTROLS");
        ENGLISH.put("save_help", "Changes save as you go. Use Restart Messenger after changing inbox controls. Your account stays signed in.");
        ENGLISH.put("pause_help", "Pause all changes turns every control off for now. Your choices are kept.");
        ENGLISH.put("account_help", "Your choices apply to every Messenger account in this installation.");
        ENGLISH.put("missing", "Missing a control?");
        ENGLISH.put("missing_help", "Pick it in Morphe Manager and patch Messenger again. Updating the patch source alone doesn't add new controls.");
        ENGLISH.put("source", "Source and licenses");
        ENGLISH.put("no_browser", "No web browser found on this phone");
        ENGLISH.put("credits", "GPL-3.0. Includes work from De-Vanced, ReVanced, Doom and Messenger Cleaner.");
        ENGLISH.put("independent", "Independent of Meta and Morphe.");
        ENGLISH.put("clipboard", "HushMessenger setup");
        ENGLISH.put("copied", "Setup copied");
        ENGLISH.put("copy_failed", "Couldn't copy setup. Try again.");
        ENGLISH.put("export", "Export choices");
        ENGLISH.put("export_help", "Copies your choices. Paste them into Import choices on another install to bring them back.");
        ENGLISH.put("exported", "Choices exported");
        ENGLISH.put("export_failed", "Couldn't export. Try again.");
        ENGLISH.put("import_choices", "Import choices");
        ENGLISH.put("import_help", "Restores choices you copied with Export choices. Copy them first, then tap here.");
        ENGLISH.put("imported_one", "Restored %d choice");
        ENGLISH.put("imported_many", "Restored %d choices");
        ENGLISH.put("import_empty", "Nothing to import. Copy your exported choices first, then tap Import choices.");
        ENGLISH.put("import_invalid", "Not a valid HushMessenger backup. Copy an export you haven't edited, 16 KB or smaller.");
        ENGLISH.put("import_unknown_one", "Skipped %d choice this version doesn't know.");
        ENGLISH.put("import_unknown_many", "Skipped %d choices this version doesn't know.");
        ENGLISH.put("import_unavailable_one", "Skipped %d choice whose patch isn't installed.");
        ENGLISH.put("import_unavailable_many", "Skipped %d choices whose patches aren't installed.");
        ENGLISH.put("import_no_choices", "Nothing to restore. None of those choices match the patches you installed.");
        ENGLISH.put("save_choices_file", "Save choices to a file");
        ENGLISH.put("read_choices_file", "Restore choices from a file");
        ENGLISH.put("choices_file_help", "Saves only your settings, up to 16 KB. No chats or accounts are included. Choices missing from the file stay as they are. If settings close while you pick a file, pick it again.");
        ENGLISH.put("choices_file_saved", "Choices file saved");
        ENGLISH.put("choices_file_saving", "Saving choices file...");
        ENGLISH.put("choices_file_reading", "Reading choices file...");
        ENGLISH.put("cancel_choices_file", "Cancel file operation");
        ENGLISH.put("choices_file_canceled", "Canceled. A save may leave an incomplete file.");
        ENGLISH.put("choices_file_timeout", "The file save or restore took too long. Try again. A save may leave an incomplete file.");
        ENGLISH.put("choices_file_busy", "Earlier file saves or restores are still finishing. Try again in a moment.");
        ENGLISH.put("choices_file_changed", "Your choices changed while the file was loading. Restore from the file again to replace them.");
        ENGLISH.put("check_updates", "Check for updates");
        ENGLISH.put("check_updates_help", "Looks on GitHub for a newer version when you turn this on and when settings opens. It reuses its last answer for an hour. Off by default. GitHub can see your IP address. No account or chat information is sent.");
        ENGLISH.put("check_now", "Check now");
        ENGLISH.put("update_loading", "Checking for updates...");
        ENGLISH.put("update_available", "Version %s is available");
        ENGLISH.put("update_action", "View release");
        ENGLISH.put("up_to_date", "You have the latest version.");
        ENGLISH.put("update_ahead", "Installed %s. Latest published version is %s.");
        ENGLISH.put("update_retry", "GitHub couldn't answer yet. Try Check now after %s.");
        ENGLISH.put("update_error", "Couldn't check for updates. Check your connection and try again.");
        ENGLISH.put("active_now", "Used just now");
        ENGLISH.put("active_ago", "Used %s ago");
        ENGLISH.put("seconds_short", "%ds");
        ENGLISH.put("minutes_short", "%dm");
        ENGLISH.put("hours_short", "%dh");
        ENGLISH.put("not_active", "Not used yet since Messenger started");
        ENGLISH.put("unsent_not_active", "No unsent message seen since Messenger started");
        ENGLISH.put("error_now", "Stopped with an error just now");
        ENGLISH.put("error_ago", "Stopped with an error %s ago");
        ENGLISH.put("changes_paused", "Changes paused");
        ENGLISH.put("changes_resumed", "Changes resumed");
        ENGLISH.put("safe_mode", "Safe mode");
        ENGLISH.put("safe_mode_help", "Messenger crashed several times in a row, so all controls were turned off. Your choices are still saved. Tap Resume to turn them back on.");
        ENGLISH.put("safe_mode_help_paused", "Messenger crashed several times in a row. Your choices are still saved. Clear safe mode first. Pause all changes will stay on until you turn it off.");
        ENGLISH.put("resume", "Resume");
        ENGLISH.put("clear_safe_mode", "Clear safe mode");
        ENGLISH.put("safe_mode_cleared", "Safe mode cleared. Changes remain paused.");
        ENGLISH.put("safe_mode_save_failed", "Couldn't save safe mode. Changes stay paused. Try again.");
        ENGLISH.put("enabled_one", "%d control enabled");
        ENGLISH.put("enabled_many", "%d controls enabled");
        ENGLISH.put("saved_one", "%d choice saved. Turn off Pause all changes to use it.");
        ENGLISH.put("saved_many", "%d choices saved. Turn off Pause all changes to use them.");
        ENGLISH.put("saved", "Your choices are saved automatically.");
        ENGLISH.put("none_installed", "No controls are installed. Pick patches in Morphe Manager and patch Messenger again.");
        ENGLISH.put("no_matches", "No matching controls. Try another search.");
        ENGLISH.put("results_one", "%d of %d installed control");
        ENGLISH.put("results_many", "%d of %d installed controls");
        ENGLISH.put("open_help", "Open Messenger from your app drawer");
        ENGLISH.put("message_log_view", "View log");
        ENGLISH.put("message_log_clear", "Clear log");
        ENGLISH.put("message_log_close", "Close");
        ENGLISH.put("message_log_title", "Message log");
        ENGLISH.put("message_log_hint", "Newest first, kept for 30 days. This stays on your phone. Turning the switch off stops saving new messages but keeps these until you clear the log or they're 30 days old.");
        ENGLISH.put("message_log_loading", "Loading...");
        ENGLISH.put("message_log_empty", "No messages kept yet.");
        ENGLISH.put("message_log_unknown_thread", "Unknown chat");
        ENGLISH.put("message_log_no_text", "(no text)");
        ENGLISH.put("message_log_cleared", "Message log cleared");
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
