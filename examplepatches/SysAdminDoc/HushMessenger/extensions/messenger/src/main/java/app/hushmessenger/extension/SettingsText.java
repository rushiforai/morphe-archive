package app.hushmessenger.extension;

import android.app.LocaleManager;
import android.content.Context;
import android.os.Build;
import android.os.LocaleList;
import android.text.TextUtils;
import java.util.Locale;

/** Text owned by the extension; no IDs from Messenger's resource table are used. */
final class SettingsText {
    private final boolean expanded, rtl;
    private final Locale locale;

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
    }

    boolean isPseudo() { return expanded || rtl; }

    int layoutDirection() { return TextUtils.getLayoutDirectionFromLocale(locale); }

    String get(String id, Object... arguments) {
        return display(String.format(locale, base(id), arguments));
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

    String base(String id) {
        switch (id) {
            case "controls": return "Controls";
            case "app": return "App";
            case "all": return "All";
            case "inbox": return "Inbox";
            case "chats": return "Chats";
            case "more": return "More";
            case "navigation": return "Navigation";
            case "stickers": return "Stickers";
            case "conversations": return "Conversations";
            case "links_bubbles": return "Links and bubbles";
            case "privacy": return "Privacy";
            case "settings": return "HushMessenger settings";
            case "preview_title": return "HushMessenger UI preview";
            case "preview_notice": return "UI preview. These switches don't change Messenger.";
            case "tagline": return "Make Messenger yours.";
            case "open": return "Open";
            case "open_messenger": return "Open Messenger";
            case "reopen": return "Apply inbox changes with App > Restart Messenger.";
            case "quick_access": return "QUICK ACCESS";
            case "access_help": return "Long-press Messenger's icon for Patch controls or Restart Messenger. You can also open HushMessenger settings from your app drawer.";
            case "hide_drawer_icon": return "Hide app drawer icon";
            case "hide_drawer_icon_help": return "Removes HushMessenger settings from your app list. Open it from Messenger's Menu tab, or long-press Messenger's icon and tap Patch controls.";
            case "access_help_menu": return "Long-press Messenger's icon for Patch controls or Restart Messenger. You can also open HushMessenger settings from its row in Messenger's Menu tab or from your app drawer.";
            case "restart": return "Restart Messenger";
            case "restarting": return "Restarting Messenger...";
            case "restart_unavailable": return "Couldn't restart. Close Messenger, then open it from your app drawer.";
            case "restart_save_failed": return "Couldn't save your choices. Messenger wasn't restarted. Try again.";
            case "setup": return "YOUR SETUP";
            case "paused": return "Pause all changes";
            case "search": return "Find a control";
            case "empty_title": return "Find the controls you need";
            case "empty_help": return "Try a different search or category. Only patches included in this installation appear here.";
            case "clear": return "Clear filters";
            case "unavailable": return "Unavailable on this Android version. Your choice is kept.";
            case "experimental": return "Experimental";
            case "choice_on": return "%s on";
            case "choice_off": return "%s off";
            case "appearance": return "APPEARANCE";
            case "light": return "Light theme";
            case "light_help": return "Use a light background in settings.";
            case "theme_help": return "Dark by default. Your choice stays saved.";
            case "about": return "ABOUT HUSHMESSENGER";
            case "version": return "Version";
            case "installed": return "Installed controls";
            case "copy": return "Copy setup";
            case "copy_help": return "Copies app versions and control choices. No account or chat details. Nothing is sent.";
            case "usage": return "USING YOUR CONTROLS";
            case "save_help": return "Changes save as you go. Use Restart Messenger after changing inbox controls. Your account stays signed in.";
            case "pause_help": return "Pause keeps your choices and temporarily restores stock behavior.";
            case "account_help": return "Your choices apply to every Messenger account in this installation.";
            case "missing": return "Missing a control?";
            case "missing_help": return "Select it in Morphe, then rebuild Messenger. Updating the source alone doesn't install new controls.";
            case "source": return "Source and licenses";
            case "no_browser": return "No browser is available";
            case "credits": return "GPL-3.0. Includes work from De-Vanced, ReVanced, Doom and Messenger Cleaner.";
            case "independent": return "Independent of Meta and Morphe.";
            case "clipboard": return "HushMessenger setup";
            case "copied": return "Setup copied";
            case "copy_failed": return "Couldn't copy setup. Try again.";
            case "export": return "Export choices";
            case "export_help": return "Copies your control choices to the clipboard. Paste them into another installation's Import to restore.";
            case "exported": return "Choices exported";
            case "export_failed": return "Couldn't export. Try again.";
            case "import_choices": return "Import choices";
            case "import_help": return "Reads choices from the clipboard. Copy an export first.";
            case "imported_one": return "Restored %d choice";
            case "imported_many": return "Restored %d choices";
            case "import_empty": return "Nothing to import. Export choices first, then paste them here.";
            case "import_invalid": return "Not a valid HushMessenger export. Copy your export to the clipboard and try again.";
            case "check_updates": return "Check for updates";
            case "check_updates_help": return "Compares your version with the latest release when you open settings. Off by default. No data is sent.";
            case "update_available": return "Version %s is available";
            case "update_action": return "View release";
            case "up_to_date": return "You have the latest version.";
            case "update_error": return "Couldn't check for updates.";
            case "active_now": return "Used just now";
            case "active_ago": return "Used %s ago";
            case "not_active": return "Nothing to change yet since restart";
            case "changes_paused": return "Changes paused";
            case "changes_resumed": return "Changes resumed";
            case "safe_mode": return "Safe mode";
            case "safe_mode_help": return "Messenger crashed several times in a row, so all controls were turned off. Your choices are still saved. Tap Resume to turn them back on.";
            case "enabled_one": return "%d control enabled";
            case "enabled_many": return "%d controls enabled";
            case "saved_one": return "%d saved choice. Turn pause off to resume.";
            case "saved_many": return "%d saved choices. Turn pause off to resume.";
            case "saved": return "Your choices are saved automatically.";
            case "none_installed": return "No optional controls installed. Select patches in Morphe and rebuild Messenger.";
            case "no_matches": return "No matching controls. Try another search.";
            case "results_one": return "%d of %d installed control";
            case "results_many": return "%d of %d installed controls";
            case "open_help": return "Open Messenger from your app drawer";
            default: throw new IllegalArgumentException("Unknown settings text: " + id);
        }
    }
}
