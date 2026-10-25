package app.hushmessenger.extension;

import android.app.LocaleManager;
import android.content.Context;
import android.os.Build;
import android.os.LocaleList;
import android.text.TextUtils;
import android.view.View;
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

    /**
     * Right to left only when the words shown are: the mirrored pseudo-locale, or a translation into a right-to-left
     * language. English on an Arabic or Hebrew phone stays left to right, since English sentences forced right to left
     * put their periods and counts on the wrong side.
     */
    int layoutDirection() {
        return rtl || !translated.isEmpty() && TextUtils.getLayoutDirectionFromLocale(locale) == View.LAYOUT_DIRECTION_RTL
            ? View.LAYOUT_DIRECTION_RTL : View.LAYOUT_DIRECTION_LTR;
    }

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
        ENGLISH.put("photos_videos", "Photos and videos");
        ENGLISH.put("links_bubbles", "Links and bubbles");
        ENGLISH.put("privacy", "Privacy");
        ENGLISH.put("theme", "Theme");
        ENGLISH.put("settings", "HushMessenger settings");
        ENGLISH.put("preview_title", "HushMessenger UI preview");
        ENGLISH.put("preview_notice", "UI preview. These controls don't change Messenger.");
        ENGLISH.put("tagline", "Make Messenger yours.");
        ENGLISH.put("open", "Open");
        ENGLISH.put("open_messenger", "Open Messenger");
        ENGLISH.put("reopen", "Some changes apply after App > Restart Messenger.");
        ENGLISH.put("quick_access", "Quick access");
        ENGLISH.put("access_help", "Long-press Messenger's home screen icon for Patch controls or Restart Messenger. You can also open HushMessenger settings from your app drawer.");
        ENGLISH.put("hide_drawer_icon", "Hide app drawer icon");
        ENGLISH.put("hide_drawer_icon_help", "Keep access through Messenger's Menu or its home screen icon shortcut.");
        ENGLISH.put("hide_menu_row", "Hide the Menu row");
        ENGLISH.put("hide_menu_row_help", "Takes the HushMessenger row out of Messenger's Menu tab and side menu. Long-press the Messenger logo at the top of Chats to get back here, or long-press Messenger's home screen icon and tap Patch controls. If neither one is left, the row comes back.");
        ENGLISH.put("menu_row_needs_shortcut", "Open these settings once from the long-press shortcut first (long-press Messenger's home screen icon, then Patch controls), so you have a way back without the row.");
        ENGLISH.put("shared_install_help", "Uninstalling this entry also removes Messenger and its local data. Use Hide app drawer icon instead.");
        ENGLISH.put("access_help_hosted", "Long-press Messenger's home screen icon for Patch controls or Restart Messenger. A Root Mount install has no separate settings icon in your app drawer.");
        ENGLISH.put("access_help_hosted_menu", "Open HushMessenger settings from its row in Messenger's Menu tab or side menu, or long-press the Messenger logo at the top of Chats. Long-press Messenger's home screen icon for Patch controls or Restart Messenger. A Root Mount install has no separate settings icon in your app drawer.");
        ENGLISH.put("access_help_menu", "Open settings from Messenger's Menu or your app drawer, or long-press the Messenger logo at the top of Chats. A long-press on Messenger's home screen icon works too.");
        ENGLISH.put("access_help_missing", "Long-press Messenger's home screen icon for Patch controls or Restart Messenger. This bundle has no settings icon in the app drawer.");
        ENGLISH.put("access_help_missing_menu", "Open HushMessenger from Messenger's Menu tab or side menu, or long-press the Messenger logo at the top of Chats. Long-press Messenger's home screen icon for Patch controls or Restart Messenger. This bundle has no settings icon in the app drawer.");
        // The Menu row patch also brings the logo's long press, which still works while the row is hidden.
        ENGLISH.put("access_help_logo", "Long-press the Messenger logo at the top of Chats, or long-press Messenger's home screen icon for Patch controls or Restart Messenger. You can also open HushMessenger settings from your app drawer.");
        ENGLISH.put("access_help_hosted_logo", "Long-press the Messenger logo at the top of Chats, or long-press Messenger's home screen icon for Patch controls or Restart Messenger. A Root Mount install has no separate settings icon in your app drawer.");
        ENGLISH.put("access_help_missing_logo", "Long-press the Messenger logo at the top of Chats, or long-press Messenger's home screen icon for Patch controls or Restart Messenger. This bundle has no settings icon in the app drawer.");
        // A build where the logo's handler wasn't found gets the Menu row without the logo.
        ENGLISH.put("access_help_menu_without_logo", "Open settings from Messenger's Menu or your app drawer. A long-press on Messenger's home screen icon works too.");
        ENGLISH.put("access_help_hosted_menu_without_logo", "Open HushMessenger settings from its row in Messenger's Menu tab or side menu. Long-press Messenger's home screen icon for Patch controls or Restart Messenger. A Root Mount install has no separate settings icon in your app drawer.");
        ENGLISH.put("access_help_missing_menu_without_logo", "Open HushMessenger from Messenger's Menu tab or side menu. Long-press Messenger's home screen icon for Patch controls or Restart Messenger. This bundle has no settings icon in the app drawer.");
        ENGLISH.put("hide_menu_row_help_without_logo", "Takes the HushMessenger row out of Messenger's Menu tab and side menu. Long-press Messenger's home screen icon and tap Patch controls to get back here. If the Patch controls shortcut goes missing, the row comes back.");
        // HushFacebook#146: each way back in has its own switch, and the last one that's on stays on.
        ENGLISH.put("hide_icon_shortcuts", "Hide the icon shortcuts");
        // What Android shows on a copy pinned to the home screen while the icon shortcuts are hidden.
        ENGLISH.put("shortcut_turned_off", "Turned off in HushMessenger settings");
        ENGLISH.put("hide_icon_shortcuts_help","Takes Patch controls and Restart Messenger out of the menu you get by long-pressing Messenger's home screen icon. A copy pinned to your home screen turns gray until you turn this off.");
        ENGLISH.put("hide_logo_press", "Ignore the logo long press");
        ENGLISH.put("hide_logo_press_help", "A long press on the Messenger logo at the top of Chats, or on the Menu tab's title, stops opening these settings.");
        ENGLISH.put("last_way_in", "This is the last way into these settings that's still on. Turn another one on first.");
        ENGLISH.put("menu_row_needs_logo", "Open these settings once with a long press on the Messenger logo at the top of Chats, so you have a way back without the row.");
        ENGLISH.put("menu_row_needs_way", "Turn the icon shortcuts or the logo long press back on first, so you have a way back without the row.");
        ENGLISH.put("hide_menu_row_help_without_shortcut", "Takes the HushMessenger row out of Messenger's Menu tab and side menu. Long-press the Messenger logo at the top of Chats to get back here. Turn the logo long press off and the row comes back.");
        ENGLISH.put("hide_menu_row_help_plain", "Takes the HushMessenger row out of Messenger's Menu tab and side menu.");
        // With the icon shortcuts hidden, the App tab lists what's left, one sentence each.
        ENGLISH.put("way_menu", "Open HushMessenger settings from its row in Messenger's Menu tab or side menu.");
        ENGLISH.put("way_logo", "Long-press the Messenger logo at the top of Chats to open these settings.");
        ENGLISH.put("way_drawer", "Open HushMessenger settings from your app drawer.");
        ENGLISH.put("way_shortcuts_hidden", "Patch controls and Restart Messenger are hidden from Messenger's home screen icon.");
        ENGLISH.put("drawer_search", "App drawer icon settings");
        ENGLISH.put("drawer_root", "Hide app drawer icon isn't needed on Root Mount. There is no separate settings icon to hide.");
        ENGLISH.put("drawer_missing", "Hide app drawer icon isn't available. This patch bundle has no settings icon to hide.");
        ENGLISH.put("drawer_requires_menu", "To hide the app drawer icon, patch in Open settings from menu first, so you can still find these settings. Without it, the icon stays.");
        ENGLISH.put("restart", "Restart Messenger");
        ENGLISH.put("restarting", "Restarting Messenger...");
        ENGLISH.put("restart_saving", "Saving your choices before reopening Messenger.");
        ENGLISH.put("restart_account", "Your account stays signed in.");
        ENGLISH.put("choices", "Your choices");
        ENGLISH.put("restart_unavailable", "Couldn't restart. Close and reopen Messenger.");
        ENGLISH.put("settings_open_failed", "Couldn't open HushMessenger settings.");
        ENGLISH.put("settings_open_instead", "Patch controls: long-press Messenger's home screen icon");
        ENGLISH.put("restart_save_failed", "Couldn't save, so Messenger wasn't restarted. Try again.");
        ENGLISH.put("setup", "Your setup");
        ENGLISH.put("paused", "Pause all changes");
        ENGLISH.put("search", "Find a control");
        ENGLISH.put("empty_title", "No controls match");
        ENGLISH.put("empty_help", "Try a different word, or clear the filter. Only the controls in this patch bundle are listed.");
        ENGLISH.put("clear", "Clear filters");
        ENGLISH.put("unavailable", "Not available on this version of Android. Your choice is saved.");
        ENGLISH.put("camera_unsupported", "This install has no screen for opening the phone's camera app, so the chat camera stays Messenger's own. Root Mount installs can't add one. Your choice is saved.");
        ENGLISH.put("gallery_unsupported", "No app on this phone can pick a photo for Messenger, so the chat gallery stays Messenger's own. Your choice is saved.");
        ENGLISH.put("text_style_unsupported", "This install has no Bold and Italic entries for the text menu. Root Mount installs can't add them. Your choice is saved.");
        ENGLISH.put("text_style_read_only", "Bold and Italic only work on text you're typing.");
        ENGLISH.put("text_style_bold_none", "Bold works only on A to Z, accented letters and digits.");
        ENGLISH.put("text_style_italic_none", "Italic works only on A to Z and accented letters.");
        ENGLISH.put("bubble_stock", "Stock");
        ENGLISH.put("bubble_chat_heads", "Chat heads");
        ENGLISH.put("bubble_native", "Android bubbles");
        ENGLISH.put("bubble_changed", "%s selected. Restart Messenger to apply.");
        ENGLISH.put("bubble_help", "Stock lets Messenger decide. Chat heads also needs Messenger's own Chat heads switch and permission to draw over other apps. For Android bubbles, allow Messenger's bubbles in the Android settings below. Accounts that don't support bubbles keep Messenger's normal behavior. Pause all changes puts everything back to Messenger's own choice.");
        ENGLISH.put("bubble_unsupported", "Android bubbles aren't available in this patch bundle, so Messenger works as usual. Your choice is saved.");
        ENGLISH.put("bubble_permissions", "Android bubble settings");
        ENGLISH.put("bubble_notifications", "Messenger notification settings");
        ENGLISH.put("bubble_conversations", "Android conversation settings");
        ENGLISH.put("bubble_settings_missing", "Screen not found. Open app info, then Notifications.");
        ENGLISH.put("facebook_keep_profile", "Keep the Profile button");
        ENGLISH.put("facebook_keep_profile_help", "Leaves the Profile button on a chat's details page, so you can still open the person's Facebook profile. The other Facebook shortcuts stay hidden.");
        ENGLISH.put("tab_badges_keep_chats", "Keep the Chats badge");
        ENGLISH.put("tab_badges_keep_people", "Keep the People badge");
        ENGLISH.put("tab_badges_keep_notifications", "Keep the Notifications badge");
        ENGLISH.put("tab_badges_keep_menu", "Keep the Menu badge");
        ENGLISH.put("tab_badges_keep_facebook", "Keep the Facebook button's badge");
        ENGLISH.put("experimental", "Experimental");
        ENGLISH.put("choice_on", "%s is on");
        ENGLISH.put("choice_off", "%s is off");
        ENGLISH.put("appearance", "Appearance");
        ENGLISH.put("material_you_black", "Pure black dark mode");
        ENGLISH.put("material_you_black_help", "Uses pure black with Material You in Messenger. Light mode stays unchanged.");
        ENGLISH.put("light", "Light theme");
        ENGLISH.put("light_help", "Makes these settings light. Messenger itself stays unchanged.");
        ENGLISH.put("theme_help", "Dark by default. Your choice stays saved.");
        ENGLISH.put("about", "About HushMessenger");
        ENGLISH.put("version", "Version");
        ENGLISH.put("installed", "Installed controls");
        ENGLISH.put("copy", "Copy setup");
        ENGLISH.put("copy_help", "Copies app versions and control choices. No account or chat details. Nothing is sent.");
        ENGLISH.put("setup_activity_help", "Activity notes only show that a control ran. They don't prove it had a visible effect or protected your privacy.");
        ENGLISH.put("usage", "Using your controls");
        ENGLISH.put("save_help", "Changes save as you go. Inbox options show up with the next chat list Messenger builds, and Restart Messenger applies everything at once. Your account stays signed in.");
        ENGLISH.put("pause_help", "Pause all changes turns every control off for now. Your choices are kept.");
        ENGLISH.put("account_help", "Your choices apply to every Messenger account in this installation.");
        ENGLISH.put("missing", "Missing a control?");
        ENGLISH.put("missing_help", "Pick it in Morphe Manager and patch Messenger again. Updating the patch source alone doesn't add new controls.");
        ENGLISH.put("source", "Source and licenses");
        ENGLISH.put("no_browser", "No web browser found on this phone");
        ENGLISH.put("page_blocked", "Your phone didn't allow opening that page");
        ENGLISH.put("support", "Support HushMessenger");
        ENGLISH.put("report", "Report a problem");
        ENGLISH.put("report_help", "Opens a public GitHub report with your versions and the controls you have on filled in. Look it over and add what happened.");
        ENGLISH.put("restart_waiting_one", "%d change waits for a restart");
        ENGLISH.put("restart_waiting_many", "%d changes wait for a restart");
        ENGLISH.put("quick_setups", "Quick setups");
        ENGLISH.put("quick_setups_help", "Switches a set of controls in one tap. You can still change each one afterward. Press and hold to hide this section.");
        ENGLISH.put("quick_setups_hidden", "Hidden. Tap %s under %s.");
        ENGLISH.put("quick_setups_home", "Quick setups section");
        ENGLISH.put("quick_setups_home_shown", "Shown. Tap to hide it.");
        ENGLISH.put("quick_setups_home_hidden", "Hidden. Tap to show it again.");
        ENGLISH.put("quick_quiet", "Quiet");
        ENGLISH.put("quick_quiet_help", "Hides ads, promotions, suggested people and growth prompts.");
        ENGLISH.put("quick_privacy", "Privacy");
        ENGLISH.put("quick_privacy_help", "Stops the uploads that tell Meta how you use Messenger, your advertising ID included.");
        ENGLISH.put("quick_defaults", "Back to defaults");
        ENGLISH.put("quick_defaults_help", "Turns every control off. Pause and the theme stay as they are.");
        ENGLISH.put("quick_changed_one", "Changed %d control");
        ENGLISH.put("quick_changed_many", "Changed %d controls");
        ENGLISH.put("quick_unchanged", "Nothing to change. Those controls were already set.");
        ENGLISH.put("quick_missing", "Those controls aren't installed. Nothing changed.");
        ENGLISH.put("quick_undone_one", "Put back %d control");
        ENGLISH.put("quick_undone_many", "Put back %d controls");
        ENGLISH.put("undo", "Undo");
        ENGLISH.put("undo_action", "Undo %s");
        ENGLISH.put("credits", "GPL-3.0. Includes work from De-Vanced, ReVanced, Doom and Messenger Cleaner.");
        ENGLISH.put("independent", "Independent of Meta and Morphe.");
        ENGLISH.put("clipboard", "HushMessenger setup");
        ENGLISH.put("copied", "Setup copied");
        ENGLISH.put("copy_failed", "Couldn't copy setup. Try again.");
        ENGLISH.put("export", "Copy choices");
        ENGLISH.put("export_help", "Copies your choices as text. To bring them back on another install, copy that text there, then tap Paste choices.");
        ENGLISH.put("exported", "Choices copied");
        ENGLISH.put("export_failed", "Couldn't back up your choices. Try again.");
        ENGLISH.put("import_choices", "Paste choices");
        ENGLISH.put("import_help", "Restores choices from text you copied with Copy choices. Copy it first, then tap here.");
        ENGLISH.put("imported_one", "Restored %d choice.");
        ENGLISH.put("imported_many", "Restored %d choices.");
        // Only some of the backup's choices differed from this phone's; always two or more in all, so plural.
        ENGLISH.put("imported_partial", "Changed %1$d of %2$d choices.");
        ENGLISH.put("import_same", "Your choices already match that backup.");
        // Nothing changed, but the backup had more in it than this phone took, so it doesn't match.
        ENGLISH.put("import_none_changed", "None of your choices changed.");
        ENGLISH.put("import_auto_reply_off", "Auto reply stays off. Backups don't carry replies.");
        ENGLISH.put("import_empty", "Nothing to paste. Copy your choices first.");
        ENGLISH.put("import_invalid", "Not a choices backup. Nothing changed.");
        ENGLISH.put("restore_failed", "Couldn't read that file. Try again, or pick another file.");
        ENGLISH.put("choices_file_no_picker", "Couldn't open a file picker on this phone.");
        ENGLISH.put("import_unknown_one", "Skipped %d choice this version doesn't know.");
        ENGLISH.put("import_unknown_many", "Skipped %d choices this version doesn't know.");
        ENGLISH.put("import_unavailable_one", "Skipped %d choice whose patch isn't installed.");
        ENGLISH.put("import_unavailable_many", "Skipped %d choices whose patches aren't installed.");
        ENGLISH.put("import_no_choices", "Nothing to restore. None of those match your patches.");
        ENGLISH.put("save_choices_file", "Save choices to a file");
        ENGLISH.put("read_choices_file", "Restore choices from a file");
        ENGLISH.put("choices_file_help", "Saves only your choices, up to 16 KB. No chats or accounts are included. Choices missing from the file stay as they are. If settings close while you pick a file, pick it again.");
        ENGLISH.put("choices_file_saved", "Choices file saved");
        ENGLISH.put("choices_file_saving", "Saving choices file...");
        ENGLISH.put("choices_file_reading", "Reading choices file...");
        ENGLISH.put("cancel_choices_file", "Cancel file operation");
        ENGLISH.put("choices_file_canceled", "Canceled. A save may leave an incomplete file.");
        ENGLISH.put("choices_file_canceled_read", "Canceled. Your choices didn't change.");
        ENGLISH.put("choices_file_timeout", "Took too long. A saved file may be cut off. Try again.");
        ENGLISH.put("choices_file_timeout_read", "Took too long. Your choices didn't change. Try again.");
        ENGLISH.put("choices_file_busy", "Earlier file saves or restores are still finishing. Try again in a moment.");
        ENGLISH.put("choices_file_changed", "Your choices changed during the restore. Try again.");
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
        ENGLISH.put("days_short", "%dd");
        ENGLISH.put("not_active", "On. Waiting for Messenger to use it");
        ENGLISH.put("unsent_not_active", "On. No unsent message received yet");
        ENGLISH.put("restart_pending_on", "Takes effect after Messenger restarts");
        ENGLISH.put("restart_pending_off", "Stays in effect until Messenger restarts");
        ENGLISH.put("meta_ai_tab_pending_on", "The Meta AI tab is hidden after Messenger restarts");
        ENGLISH.put("meta_ai_tab_pending_off", "The Meta AI tab comes back after Messenger restarts");
        ENGLISH.put("tab_people_pending_on", "The People tab is hidden after Messenger restarts");
        ENGLISH.put("tab_people_pending_off", "The People tab comes back after Messenger restarts");
        ENGLISH.put("tab_notifications_pending_on", "The Notifications tab is hidden after Messenger restarts");
        ENGLISH.put("tab_notifications_pending_off", "The Notifications tab comes back after Messenger restarts");
        ENGLISH.put("error_now", "Stopped with an error just now. Copy setup on the App tab has details.");
        ENGLISH.put("error_ago", "Stopped with an error %s ago. Copy setup on the App tab has details.");
        ENGLISH.put("changes_paused", "Changes paused");
        ENGLISH.put("changes_resumed", "Changes resumed");
        ENGLISH.put("safe_mode", "Safe mode");
        ENGLISH.put("safe_mode_help", "Messenger crashed several times in a row, so all controls were turned off. Your choices are still saved. Tap Resume to turn them back on.");
        ENGLISH.put("safe_mode_help_paused", "Messenger crashed several times in a row. Your choices are still saved. Clear safe mode first. Pause all changes will stay on until you turn it off.");
        ENGLISH.put("resume", "Resume");
        ENGLISH.put("clear_safe_mode", "Clear safe mode");
        ENGLISH.put("safe_mode_cleared", "Safe mode cleared. Changes remain paused.");
        ENGLISH.put("safe_mode_save_failed", "Couldn't leave safe mode. Changes stay paused.");
        ENGLISH.put("enabled_one", "%d control enabled");
        ENGLISH.put("enabled_many", "%d controls enabled");
        ENGLISH.put("saved_one", "%d choice saved. Turn off Pause all changes to use it.");
        ENGLISH.put("saved_many", "%d choices saved. Turn off Pause all changes to use them.");
        ENGLISH.put("saved", "Your choices are saved automatically.");
        ENGLISH.put("none_installed", "No controls are installed. Pick patches in Morphe Manager and patch Messenger again.");
        ENGLISH.put("no_matches", "No matching controls.");
        ENGLISH.put("results_one", "%d of %d installed control");
        ENGLISH.put("results_many", "%d of %d installed controls");
        ENGLISH.put("group_count_one", "%d control");
        ENGLISH.put("group_count_many", "%d controls");
        ENGLISH.put("open_help", "Open Messenger from your app drawer");
        ENGLISH.put("message_log_view", "View log");
        ENGLISH.put("search_clear", "Clear");
        ENGLISH.put("search_clear_description", "Clear search");
        ENGLISH.put("camera_missing", "No camera app found that can take photos.");
        ENGLISH.put("camera_failed", "Can't open your camera app. Try again.");
        ENGLISH.put("camera_permission", "Allow the camera permission in Messenger's app info.");
        ENGLISH.put("gallery_missing", "No gallery app found that can pick photos.");
        ENGLISH.put("gallery_failed", "Your gallery couldn't finish the selection. Try again.");
        ENGLISH.put("message_log_clear", "Clear log");
        ENGLISH.put("message_log_close", "Close");
        ENGLISH.put("message_log_title", "Message log");
        ENGLISH.put("message_log_hint", "Saved on this phone for up to 30 days. Newest first.");
        ENGLISH.put("message_log_retention", "Turning the log off stops new entries. Saved messages stay until you clear them or they're 30 days old.");
        ENGLISH.put("message_log_loading", "Loading...");
        ENGLISH.put("message_log_empty", "No messages kept yet.");
        ENGLISH.put("message_log_empty_on", "New messages with notification text will appear here. Messages already in your chats aren't added.");
        ENGLISH.put("message_log_empty_off", "Turn on Keep a message log in Controls to save new messages with notification text. Messages already in your chats aren't added.");
        ENGLISH.put("message_log_load_failed", "Couldn't open the message log");
        ENGLISH.put("message_log_load_help", "Try again. If it keeps failing, Clear log deletes the saved log and its key so new messages can be saved.");
        ENGLISH.put("message_log_set_aside", "An older log couldn't be read");
        ENGLISH.put("message_log_set_aside_help", "It was set aside so new messages keep saving. Nothing can open it now, and removing it doesn't touch newer messages.");
        ENGLISH.put("message_log_set_aside_remove", "Remove old log");
        ENGLISH.put("message_log_set_aside_failed", "Couldn't remove the old log. Try again.");
        ENGLISH.put("message_log_clear_failed", "Couldn't clear the whole log");
        ENGLISH.put("message_log_clear_help", "Some saved data or its key couldn't be removed. Try Clear log again.");
        ENGLISH.put("retry", "Try again");
        ENGLISH.put("message_log_unknown_thread", "Unknown chat");
        ENGLISH.put("message_log_in_group", "%s in %s");
        ENGLISH.put("message_log_no_text", "(no text)");
        ENGLISH.put("message_log_cleared", "Message log cleared");
        ENGLISH.put("message_log_restored", "Message log put back");
        ENGLISH.put("message_log_restore_failed", "Couldn't put the log back");
        ENGLISH.put("message_log_now", "Just now");
        ENGLISH.put("message_log_ago", "%s ago");
        ENGLISH.put("auto_reply_edit", "Edit replies");
        ENGLISH.put("auto_reply_title", "Auto replies");
        ENGLISH.put("auto_reply_hint", "Replies are tried from top to bottom. The first matching reply is sent.");
        ENGLISH.put("auto_reply_when", "Trigger words (optional)");
        ENGLISH.put("auto_reply_when_hint", "hello, opening hours");
        ENGLISH.put("auto_reply_reply", "Send this reply");
        ENGLISH.put("auto_reply_reply_hint", "Type your reply");
        ENGLISH.put("auto_reply_any", "Separate words or phrases with commas. Leave blank to answer any message.");
        ENGLISH.put("auto_reply_off", "Auto reply is off. Save your replies here, then turn it on in Controls.");
        ENGLISH.put("auto_reply_count", "%1$s of %2$s replies");
        ENGLISH.put("auto_reply_number", "Reply %s");
        ENGLISH.put("auto_reply_remove_number", "Remove reply %s");
        ENGLISH.put("auto_reply_required", "Write a reply, or remove this rule before saving.");
        ENGLISH.put("auto_reply_cancel", "Cancel");
        ENGLISH.put("auto_reply_remove", "Remove");
        ENGLISH.put("auto_reply_add", "Add a reply");
        ENGLISH.put("auto_reply_save", "Save");
        ENGLISH.put("auto_reply_groups", "Answer in group chats too");
        ENGLISH.put("auto_reply_full", "That's the most replies it keeps (%s)");
        ENGLISH.put("auto_reply_saved", "Replies saved: %s");
        ENGLISH.put("auto_reply_saved_none", "No replies saved, so nothing gets answered");
        ENGLISH.put("auto_reply_picture", "Picture (optional)");
        ENGLISH.put("auto_reply_picture_none", "No picture. Add one to send it right after the reply.");
        ENGLISH.put("auto_reply_picture_set", "Sent right after the reply");
        ENGLISH.put("auto_reply_picture_missing", "The picture is gone. Pick it again or remove it.");
        ENGLISH.put("auto_reply_picture_pick", "Add a picture");
        ENGLISH.put("auto_reply_picture_change", "Change picture");
        ENGLISH.put("auto_reply_picture_clear", "Remove picture");
        ENGLISH.put("auto_reply_picture_thumb", "The picture sent with this reply");
        ENGLISH.put("auto_reply_picture_copying", "Copying the picture...");
        ENGLISH.put("auto_reply_picture_failed", "Couldn't use that picture. Try another one.");
        ENGLISH.put("auto_reply_picture_no_picker", "No app here can pick a picture");
        ENGLISH.put("font_file_choose", "Choose a font file");
        ENGLISH.put("font_phone", "Use your phone's font");
        ENGLISH.put("font_file_help", "With a file picked, a few of Messenger's screens still use your phone's font.");
        ENGLISH.put("font_file_none", "None chosen, so your phone's font is used. Choose a .ttf or .otf font file of up to %1$d MB.");
        ENGLISH.put("font_file_none_off", "None chosen. Turn the switch on to use your phone's font, or choose a .ttf or .otf font file of up to %1$d MB.");
        ENGLISH.put("font_file_using", "Using %1$s. Choose another file to replace it.");
        ENGLISH.put("font_file_picked_off", "%1$s is picked. Turn the switch on to use it.");
        ENGLISH.put("font_file_missing", "HushMessenger's copy of %1$s is gone, so your phone's font is used. Choose the file again.");
        ENGLISH.put("font_file_copying", "Copying the font file...");
        ENGLISH.put("font_file_set", "Font picked. Restart Messenger to use it.");
        ENGLISH.put("font_file_set_off", "Font picked. Turn the switch on to use it.");
        ENGLISH.put("font_file_not_font", "Not a .ttf or .otf font. Your font didn't change.");
        ENGLISH.put("font_file_too_large", "That font file is over %1$d MB. Your font didn't change.");
        ENGLISH.put("font_file_wont_load", "Android can't use that font. Your font didn't change.");
        ENGLISH.put("font_file_not_saved", "Couldn't save the font. Check free space and retry.");
        ENGLISH.put("font_file_unreadable", "Couldn't open that file. Your font didn't change.");
        ENGLISH.put("font_file_no_picker", "This phone has no file picker.");
        ENGLISH.put("font_file_picker_failed", "Couldn't open the file picker. Try again.");
        ENGLISH.put("font_file_busy", "Couldn't start that. Try again in a moment.");
        ENGLISH.put("font_file_stop", "Stop copying");
        ENGLISH.put("font_file_stopped", "Stopped copying. Your font didn't change.");
        ENGLISH.put("font_file_timeout", "Copying took too long. Your font didn't change.");
        ENGLISH.put("font_file_finishing", "Already saving the font. It'll finish in a moment.");
        ENGLISH.put("font_file_stuck", "Earlier copies are still waiting on their files. You can choose another one once they give up.");
        ENGLISH.put("font_phone_set", "Back to your phone's font. Restart Messenger to see it.");
        ENGLISH.put("font_phone_failed", "Couldn't go back to your phone's font. Try again.");
        ENGLISH.put("font_size", "Text size %1$d%%");
        ENGLISH.put("font_size_smaller", "Smaller");
        ENGLISH.put("font_size_larger", "Larger");
        ENGLISH.put("font_shift_none", "Text sits where the font puts it");
        ENGLISH.put("font_shift_down", "Text moved down %1$d%%");
        ENGLISH.put("font_shift_up", "Text moved up %1$d%%");
        ENGLISH.put("font_shift_up_button", "Move up");
        ENGLISH.put("font_shift_down_button", "Move down");
        ENGLISH.put("font_adjust_help", "If your font looks too small or sits too high or low in a message bubble, size it or move it here. Each move is 2%% of the text size. Restart Messenger to see a change.");
        ENGLISH.put("font_adjust_saved", "%1$s. Restart Messenger to see it.");
        ENGLISH.put("font_adjust_failed", "Couldn't save that. Your font didn't change.");
        ENGLISH.put("mark_read", "Mark as read");
        ENGLISH.put("mark_read_done", "Marked as read");
        ENGLISH.put("mark_read_nothing", "Nothing new to mark as read");
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
