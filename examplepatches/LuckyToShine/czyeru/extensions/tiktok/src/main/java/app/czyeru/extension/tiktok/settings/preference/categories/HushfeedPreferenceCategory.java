package app.czyeru.extension.tiktok.settings.preference.categories;

import android.content.Context;
import android.preference.PreferenceScreen;

import app.czyeru.extension.shared.settings.BooleanSetting;
import app.czyeru.extension.tiktok.settings.Settings;
import app.czyeru.extension.tiktok.settings.SettingsStatus;
import app.czyeru.extension.tiktok.settings.preference.ChoicePreference;
import app.czyeru.extension.tiktok.settings.preference.InputTextPreference;
import app.czyeru.extension.tiktok.settings.preference.TogglePreference;

/** Settings of the patches ported from Hushfeed (https://github.com/SysAdminDoc/hushfeed). */
@SuppressWarnings("deprecation")
public final class HushfeedPreferenceCategory extends ConditionalPreferenceCategory {
    public HushfeedPreferenceCategory(Context context, PreferenceScreen screen) {
        super(context, screen);
        setTitle("Hushfeed features");
    }

    /** Whether any ported patch is in this build. */
    public static boolean anyIncluded() {
        return SettingsStatus.keepFavoritesTabEnabled
                || SettingsStatus.exactCountsEnabled
                || SettingsStatus.expandActivityListEnabled
                || SettingsStatus.copyIdsEnabled
                || SettingsStatus.blockAuthorEnabled
                || SettingsStatus.commentToolsEnabled
                || SettingsStatus.doubleTapEnabled;
    }

    /** How many of the ported switches are on, for the menu row. */
    public static int countOn() {
        int on = 0;
        if (SettingsStatus.keepFavoritesTabEnabled && Settings.KEEP_FAVORITES_TAB.get()) on++;
        if (SettingsStatus.keepFavoritesTabEnabled && Settings.DARK_QUICK_FAVORITES.get()) on++;
        if (SettingsStatus.exactCountsEnabled && Settings.SHOW_EXACT_COUNTS.get()) on++;
        if (SettingsStatus.expandActivityListEnabled && Settings.EXPAND_ACTIVITY_LIST.get()) on++;
        if (SettingsStatus.copyIdsEnabled && Settings.COPY_IDS.get()) on++;
        if (SettingsStatus.blockAuthorEnabled) {
            for (BooleanSetting setting : new BooleanSetting[]{Settings.BLOCK_AUTHOR_BUTTON,
                    Settings.NO_RESUME_ON_FOREGROUND, Settings.PAUSE_FIRST_VIDEO, Settings.KEEP_PAUSED_ON_RETURN}) {
                if (setting.get()) on++;
            }
        }
        if (SettingsStatus.notInterestedEnabled && Settings.NOT_INTERESTED_BUTTON.get()) on++;
        if (SettingsStatus.commentToolsEnabled) {
            for (BooleanSetting setting : new BooleanSetting[]{Settings.PAUSE_ON_COMMENTS, Settings.COMMENT_KEYWORD_FILTER, Settings.HIDE_COMMENT_MEDIA, Settings.HIDE_SPAM_COMMENTS, Settings.HIDE_COMMENT_POLLS, Settings.SHOW_POLL_RESULTS, Settings.HIDE_COMMENT_REPLY_PREVIEWS, Settings.HIDE_COMMENT_SURVEYS, Settings.HIDE_COMMENT_BOX_BUTTONS, Settings.HIDE_COMMENT_LIKE_COUNT, Settings.HIDE_COMMENT_DISLIKE, Settings.LARGER_COMMENT_LIKE_TARGET, Settings.BLOCK_FROM_COMMENT, Settings.BLOCK_FROM_COMMENT_MENU, Settings.COMMENT_SEARCH, Settings.COMMENT_SEARCH_FOLDED, Settings.COMMENT_LINKS, Settings.CAPTION_OPENS_COMMENTS, Settings.CAPTION_ABOVE_COMMENTS, Settings.HIDE_COMMENT_SEARCH_SUGGESTIONS, Settings.COMPACT_COMMENT_HEADER}) {
                if (setting.get()) on++;
            }
        }
        if (SettingsStatus.doubleTapEnabled && Settings.DOUBLE_TAP_SPLIT_ZONES.get()) on++;
        return on;
    }

    @Override
    public boolean getSettingsStatus() {
        return anyIncluded();
    }

    @Override
    public void addPreferences(Context context) {
        if (SettingsStatus.keepFavoritesTabEnabled) {
            addPreference(group(context, "Favorites"));
            addPreference(new TogglePreference(
                    context,
                    "Keep the Favorites tab",
                    "Keep the Favorites tab and your saved videos on your profile when TikTok tries "
                            + "out a version of the app that hides them. Requires restart.",
                    Settings.KEEP_FAVORITES_TAB
            ));
            addPreference(new TogglePreference(
                    context,
                    "Dark collections popup",
                    "Draw the collections popup you get by holding the Favorites button dark when "
                            + "TikTok is in dark mode.",
                    Settings.DARK_QUICK_FAVORITES
            ));
        }
        if (SettingsStatus.exactCountsEnabled || SettingsStatus.copyIdsEnabled) {
            addPreference(group(context, "Feed and profiles"));
        }
        if (SettingsStatus.exactCountsEnabled) {
            addPreference(new TogglePreference(
                    context,
                    "Show exact counts",
                    "Show likes, comments and other counts as full numbers, like 1,234,567 instead of 1.2M.",
                    Settings.SHOW_EXACT_COUNTS
            ));
        }
        if (SettingsStatus.copyIdsEnabled) {
            addPreference(new TogglePreference(
                    context,
                    "Copy bio and IDs",
                    "Long-press a bio to copy it, and get share sheet buttons that copy a display name, username, user ID or video ID.",
                    Settings.COPY_IDS
            ));
        }
        if (SettingsStatus.blockAuthorEnabled || SettingsStatus.notInterestedEnabled) {
            addPreference(group(context, "Buttons on videos"));
        }
        if (SettingsStatus.blockAuthorEnabled) {
            addPreference(new TogglePreference(
                    context,
                    "Show the block button on videos",
                    "Block the creator in one tap. Once TikTok confirms, skip to the next video. "
                            + "A small Unblock button appears at the top left for two seconds. "
                            + "You can also unblock later in TikTok's Privacy > Blocked accounts. "
                            + "Long-press a button to move it.",
                    Settings.BLOCK_AUTHOR_BUTTON
            ));
        }
        if (SettingsStatus.notInterestedEnabled) {
            addPreference(new TogglePreference(
                    context,
                    "Show the Not interested button",
                    "Add a button beside the block control that tells TikTok you're not interested "
                            + "in the current video.",
                    Settings.NOT_INTERESTED_BUTTON
            ));
        }
        if (SettingsStatus.doubleTapEnabled) {
            addPreference(group(context, "Double tap"));
            String[] labels = {"TikTok default (like)", "Do nothing", "Like or unlike the video", "Open comments",
                    "Copy the video link", "Copy the sound link", "Find the sound on YouTube Music",
                    "Open the search page"};
            String[] values = {"default", "nothing", "like_toggle", "comments",
                    "copy_link", "copy_sound_link", "youtube_music", "open_search"};
            addPreference(new ChoicePreference(context, "Double tap", Settings.DOUBLE_TAP_ACTION, labels, values));
            addPreference(new TogglePreference(
                    context,
                    "Double tap by corner",
                    "Give each quarter of the video its own double tap choice. The Double tap row above "
                            + "is used while this is off.",
                    Settings.DOUBLE_TAP_SPLIT_ZONES
            ));
            addPreference(new ChoicePreference(context, "Top left double tap",
                    Settings.DOUBLE_TAP_TOP_LEFT_ACTION, labels, values));
            addPreference(new ChoicePreference(context, "Top right double tap",
                    Settings.DOUBLE_TAP_TOP_RIGHT_ACTION, labels, values));
            addPreference(new ChoicePreference(context, "Bottom left double tap",
                    Settings.DOUBLE_TAP_BOTTOM_LEFT_ACTION, labels, values));
            addPreference(new ChoicePreference(context, "Bottom right double tap",
                    Settings.DOUBLE_TAP_BOTTOM_RIGHT_ACTION, labels, values));
        }
        if (SettingsStatus.blockAuthorEnabled || SettingsStatus.commentToolsEnabled) {
            addPreference(group(context, "Pausing"));
        }
        if (SettingsStatus.commentToolsEnabled) {
            addPreference(new TogglePreference(
                    context,
                    "Pause the video while comments are open",
                    "Pauses the video behind the comment sheet while you read. "
                            + "It plays on from the same spot when the sheet closes.",
                    Settings.PAUSE_ON_COMMENTS
            ));
        }
        if (SettingsStatus.blockAuthorEnabled) {
            addPreference(new TogglePreference(
                    context,
                    "Don't start the feed on returning",
                    "The feed waits for one tap before it starts playing again when you come back "
                            + "to the app. Messages, profiles and search are still one tap away.",
                    Settings.NO_RESUME_ON_FOREGROUND
            ));
            addPreference(new TogglePreference(
                    context,
                    "Don't start the first video",
                    "When you open TikTok from its icon, the first video in the feed waits for one tap "
                            + "before it plays. A link, a notification or a shortcut opens as usual.",
                    Settings.PAUSE_FIRST_VIDEO
            ));
            addPreference(new TogglePreference(
                    context,
                    "Keep a paused video paused",
                    "A video you paused stays paused when you come back to the app instead of "
                            + "starting again. One you left playing starts as usual. "
                            + "It works on Android 10 and newer.",
                    Settings.KEEP_PAUSED_ON_RETURN
            ));
        }
        if (SettingsStatus.commentToolsEnabled) {
            addPreference(group(context, "Comments"));
            addPreference(new TogglePreference(context, "Filter comments by keyword",
                    "Hide comments that contain any of the words below, or that come from the accounts below.",
                    Settings.COMMENT_KEYWORD_FILTER));
            addPreference(new InputTextPreference(context, "Blocked comment words",
                    "Separate words with commas. A comment is hidden if it contains any of them. Capital letters don't matter. Write \"a\" & \"b\" to need both phrases, or \"a\" !& \"b\" to need the first without the second.",
                    Settings.COMMENT_BLOCKED_KEYWORDS));
            addPreference(new InputTextPreference(context, "Hidden commenters",
                    "Separate usernames or display names with commas. Their comments are hidden.",
                    Settings.COMMENT_BLOCKED_USERS));
            addPreference(new TogglePreference(context, "Hide picture comments",
                    "Hide comments made of an image or a sticker instead of words.",
                    Settings.HIDE_COMMENT_MEDIA));
            addPreference(new TogglePreference(context, "Hide spam comments",
                    "Hide comments that send you to a profile, a bio link, a website or a messenger, or offer free followers. Your own comments stay, and so do the creator's and the ones they pinned or liked.",
                    Settings.HIDE_SPAM_COMMENTS));
            addPreference(new TogglePreference(context, "Hide comment polls",
                    "Hide voting cards and poll results above the comments, including polls that have ended.",
                    Settings.HIDE_COMMENT_POLLS));
            addPreference(new TogglePreference(context, "Show poll results before voting",
                    "A comment poll shows how many picked each answer before you vote. Tapping an answer still votes.",
                    Settings.SHOW_POLL_RESULTS));
            addPreference(new TogglePreference(context, "Hide reply previews",
                    "Don't open a reply under each comment. View replies still shows all of them.",
                    Settings.HIDE_COMMENT_REPLY_PREVIEWS));
            addPreference(new TogglePreference(context, "Hide comment surveys",
                    "Hide the question cards TikTok sometimes puts in a comment list to ask what you think.",
                    Settings.HIDE_COMMENT_SURVEYS));
            addPreference(new TogglePreference(context, "Hide comment box buttons",
                    "Hide the photo, @ and gift buttons in the box where you write a comment. Emoji and sending work as before.",
                    Settings.HIDE_COMMENT_BOX_BUTTONS));
            addPreference(new TogglePreference(context, "Hide like counts on comments",
                    "Hide the number beside the heart on each comment. The heart still works. Requires restart.",
                    Settings.HIDE_COMMENT_LIKE_COUNT));
            addPreference(new TogglePreference(context, "Hide the thumbs down on comments",
                    "Hide the thumbs down beside the heart on each comment. It stays while Thumbs down blocks the commenter is on. Requires restart.",
                    Settings.HIDE_COMMENT_DISLIKE));
            addPreference(new TogglePreference(context, "Easier comment likes",
                    "Makes the heart easier to tap by using the empty space around it. Requires restart.",
                    Settings.LARGER_COMMENT_LIKE_TARGET));
            addPreference(new TogglePreference(context, "Thumbs down blocks the commenter",
                    "The thumbs down on each comment blocks the commenter instead of disliking. Their comments leave the list right away and an undo banner follows.",
                    Settings.BLOCK_FROM_COMMENT));
            addPreference(new TogglePreference(context, "Block from a comment's menu",
                    "Press and hold a comment to find Block this commenter in its menu. Their comments leave the list right away and an undo banner follows.",
                    Settings.BLOCK_FROM_COMMENT_MENU));
            addPreference(new TogglePreference(context, "Search within comments",
                    "Adds a search box that finds comments already loaded on this video, by words or username. It doesn't search all of TikTok.",
                    Settings.COMMENT_SEARCH));
            addPreference(new TogglePreference(context, "Fold the search into a button",
                    "Shows a search button at the top left of the comments instead of the box. Tap it to search, and again to put the box away. Search within comments must be on.",
                    Settings.COMMENT_SEARCH_FOLDED));
            addPreference(new TogglePreference(context, "Links in comments open",
                    "A web address someone left in a comment can be tapped instead of copied out by hand.",
                    Settings.COMMENT_LINKS));
            addPreference(new TogglePreference(context, "More opens the comments",
                    "Tapping more under a video opens its comments with the whole caption at the top. Photo posts keep TikTok's own page for this.",
                    Settings.CAPTION_OPENS_COMMENTS));
            addPreference(new TogglePreference(context, "Caption above comments",
                    "The comment button also opens a video's comments with its caption at the top.",
                    Settings.CAPTION_ABOVE_COMMENTS));
            addPreference(new TogglePreference(context, "Hide search suggestions above comments",
                    "Hide TikTok's \"Search: ...\" banner above the comment count. Requires restart.",
                    Settings.HIDE_COMMENT_SEARCH_SUGGESTIONS));
            addPreference(new TogglePreference(context, "Compact comment header",
                    "Hides the comment count, the sort and close buttons and the suggestions above them. Use Back or swipe down to close comments. Requires restart.",
                    Settings.COMPACT_COMMENT_HEADER));
        }
        if (SettingsStatus.expandActivityListEnabled) {
            addPreference(group(context, "Inbox"));
            addPreference(new TogglePreference(
                    context,
                    "Expand activity list",
                    "Show the whole Activity and New followers lists in the Inbox, without tapping View all.",
                    Settings.EXPAND_ACTIVITY_LIST
            ));
        }
    }
}
