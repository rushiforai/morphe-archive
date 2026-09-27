/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 *
 * Built on SysAdminDoc/hushfeed (GPL-3.0).
 */
package app.morphe.extension.facebook.settings;

import static java.lang.Boolean.FALSE;
import static java.lang.Boolean.TRUE;

import app.morphe.extension.facebook.download.DownloadQuality;
import app.morphe.extension.facebook.download.FileNameTemplate;
import app.morphe.extension.facebook.download.SaveFolder;
import app.morphe.extension.facebook.navigation.StartTab;
import app.morphe.extension.shared.settings.BaseSettings;
import app.morphe.extension.shared.settings.BooleanSetting;
import app.morphe.extension.shared.settings.EnumSetting;
import app.morphe.extension.shared.settings.StringSetting;

/**
 * The switches behind the hooks that ask before they act.
 *
 * <p>All but three of them are on by default. Picking a patch in Morphe Manager is the choice to use
 * it, and the switch is the way to turn it off again without patching a second time. The two GenAI
 * switches start off until each rule has been checked on a signed-in feed, and the release check
 * starts off because it's the only request Hushfacebook makes for itself. While Hushfacebook is
 * paused, or in safe mode after three crashed starts, each switch answers off and the hook behind
 * it takes Facebook's own path.
 */
@SuppressWarnings("unused")
public class Settings extends BaseSettings {
    /** Feed edges Facebook files under the SPONSORED story category. */
    public static final BooleanSetting HIDE_SPONSORED_POSTS =
            new BooleanSetting("hushfacebook_hide_sponsored_posts", TRUE);

    /** Feed edges filed under PROMOTION, which FroggoMorphePatches also drops. */
    public static final BooleanSetting HIDE_PROMOTED_POSTS =
            new BooleanSetting("hushfacebook_hide_promoted_posts", TRUE);

    /** "Pages you may like", Facebook's own upsell units and the in-feed surveys. */
    public static final BooleanSetting HIDE_SUGGESTED_POSTS =
            new BooleanSetting("hushfacebook_hide_suggested_posts", TRUE);

    /**
     * Posts Facebook recommends from people, pages and groups you don't follow, which its own
     * recommendation flag marks: the one Facebook's "hide suggested posts" filter reads.
     */
    public static final BooleanSetting HIDE_SUGGESTED_FOR_YOU =
            new BooleanSetting("hushfacebook_hide_suggested_for_you", TRUE);

    /** The "People you may know" row, found by its GraphQL type name. */
    public static final BooleanSetting HIDE_PEOPLE_YOU_MAY_KNOW =
            new BooleanSetting("hushfacebook_hide_people_you_may_know", TRUE);

    /**
     * The row of stories at the top of the feed. The feed's adapter list builds it as an adapter of
     * its own, and the patch has both tray adapters return nothing while this is on.
     */
    public static final BooleanSetting HIDE_STORIES_TRAY =
            new BooleanSetting("hushfacebook_hide_stories_tray", TRUE);

    /**
     * The feed's rows of reels: the "Reels" carousels between posts and the reels Facebook adds where
     * the feed you follow ends. Each is an edge of its own, filed under a reels story category.
     */
    public static final BooleanSetting HIDE_FEED_REELS =
            new BooleanSetting("hushfacebook_hide_feed_reels", TRUE);

    /** Keep the current feed when returning to Facebook within ten minutes. */
    public static final BooleanSetting BLOCK_RETURN_REFRESH =
            new BooleanSetting("hushfacebook_block_return_refresh", TRUE);

    /**
     * Feed posts Facebook's own detection marked as made with AI. Off until one AI-labeled and one
     * ordinary post have been recorded on a signed-in feed and the rule told them apart.
     */
    public static final BooleanSetting HIDE_AI_DETECTED_POSTS =
            new BooleanSetting("hushfacebook_hide_ai_detected_posts", FALSE);

    /**
     * Reels and Watch videos Facebook's own detection marked as made with AI, read off the
     * attribution the Reels viewer draws its AI label from. Off until it has been checked on a
     * signed-in Reels feed, like the feed switch above.
     */
    public static final BooleanSetting HIDE_AI_DETECTED_REELS =
            new BooleanSetting("hushfacebook_hide_ai_detected_reels", FALSE);

    /** The four story bucket sources that splice ad cards into the story viewer. */
    public static final BooleanSetting HIDE_SPONSORED_STORIES =
            new BooleanSetting("hushfacebook_hide_sponsored_stories", TRUE);

    /** Keep a finished Story visible until the user navigates. */
    public static final BooleanSetting BLOCK_STORY_AUTO_ADVANCE =
            new BooleanSetting("hushfacebook_block_story_auto_advance", TRUE);

    /** The two page filters that take server-inlined ads out of Reels and Watch. */
    public static final BooleanSetting HIDE_SPONSORED_REELS =
            new BooleanSetting("hushfacebook_hide_sponsored_reels", TRUE);

    /**
     * The chips under a reel that prompt you to make something (Remix, Use template, Add yours,
     * Edits) or promote something (Stars, games, a partner app, a link out of Facebook). A chip of
     * any other type stays.
     */
    public static final BooleanSetting HIDE_REEL_CHIPS =
            new BooleanSetting("hushfacebook_hide_reel_chips", TRUE);

    /**
     * The Follow button in a reel's author row, through Facebook's own check for offering it, and
     * the Following button an author you already follow gets there, through its config for
     * removing that one.
     */
    public static final BooleanSetting HIDE_REEL_FOLLOW_BUTTON =
            new BooleanSetting("hushfacebook_hide_reel_follow_button", TRUE);

    /**
     * The comment Facebook previews under a reel and the bubbles of friends who reacted. Both
     * queries are skipped, so neither is drawn.
     */
    public static final BooleanSetting HIDE_REEL_SOCIAL_FOOTER =
            new BooleanSetting("hushfacebook_hide_reel_social_footer", TRUE);

    /**
     * The batches of watched reels the Reels viewer sends as FbShortsSeenStateMutation: only their
     * ids, the record Facebook ranks the Reels feed with, which nobody else sees. Held back, reels
     * already watched may come back in the feed.
     */
    public static final BooleanSetting DONT_SEND_REEL_WATCH_HISTORY =
            new BooleanSetting("hushfacebook_dont_send_reel_watch_history", TRUE);

    /**
     * Facebook's own text drawn in the phone's font instead of Meta's Optimistic, at the same
     * weight and slant. A typeface already on screen keeps its font until Facebook restarts.
     */
    public static final BooleanSetting USE_SYSTEM_FONT =
            new BooleanSetting("hushfacebook_use_system_font", TRUE);

    /**
     * Emoji drawn with the phone's own emoji font instead of the one Meta downloads. An emoji
     * already laid out keeps its look until its text is drawn again, and the quick emoji picker
     * until Facebook restarts. Reactions and stickers are pictures, not text, and don't change.
     */
    public static final BooleanSetting USE_SYSTEM_EMOJI =
            new BooleanSetting("hushfacebook_use_system_emoji", TRUE);

    /** Web links leave Facebook's in-app browser for the default browser. */
    public static final BooleanSetting OPEN_LINKS_EXTERNALLY =
            new BooleanSetting("hushfacebook_open_links_externally", TRUE);

    /** The tracking keys come off the links Facebook hands out when someone shares. */
    public static final BooleanSetting SANITIZE_SHARING_LINKS =
            new BooleanSetting("hushfacebook_sanitize_sharing_links", TRUE);

    /**
     * Facebook's own update prompts, which a build signed with the patcher's key can't act on:
     * the Meta App Manager promotions, the push that has the manager look for an update, and the
     * chat promotions aimed at versions below a ceiling.
     */
    public static final BooleanSetting STOP_UPDATE_PROMPTS =
            new BooleanSetting("hushfacebook_stop_update_prompts", TRUE);

    /**
     * Once a day, when Facebook starts, ask api.github.com whether a newer Hushfacebook release is
     * out, and say so on the settings screen ({@link ReleaseCheck}). It's the settings entry's own
     * switch rather than a patch's, so every build has it ({@link PatchFamily#ENTRY_SWITCHES}). Off
     * by default, and a settings file never carries it: a file shouldn't be able to put a phone
     * online.
     */
    public static final BooleanSetting CHECK_FOR_RELEASES =
            new BooleanSetting("hushfacebook_check_releases", FALSE);

    /**
     * The story viewer's menu offers Save on anyone's story, and Save runs Hushfacebook's own
     * download. Off, only your own stories offer it, and it's Facebook's own save.
     */
    public static final BooleanSetting DOWNLOAD_STORIES =
            new BooleanSetting("hushfacebook_download_stories", TRUE);

    /** The Download button the reel patch adds to every reel's sidebar. */
    public static final BooleanSetting DOWNLOAD_REELS =
            new BooleanSetting("hushfacebook_download_reels", TRUE);

    /**
     * The Download to phone item the video patch adds to the menu of a feed or Watch video. Off,
     * the menu is Facebook's own.
     */
    public static final BooleanSetting DOWNLOAD_VIDEOS =
            new BooleanSetting("hushfacebook_download_videos", TRUE);

    /**
     * A start from Facebook's launcher icon opens the tab in {@link #START_TAB} instead of the one
     * Facebook would choose. Notifications, links and shortcuts keep their own destination.
     */
    public static final BooleanSetting OPEN_ON_CHOSEN_TAB =
            new BooleanSetting("hushfacebook_open_on_chosen_tab", TRUE);

    /**
     * The folder every save goes to, under Movies for a video and Pictures for a photo. The
     * settings row and an import keep it clean, and {@link SaveFolder#sanitize} cleans it again
     * wherever it's read, so whatever wrote the store, a save lands in one folder under each.
     * It isn't a switch, and a paused Facebook makes no Hushfacebook saves for it to steer.
     */
    public static final StringSetting SAVE_FOLDER =
            new StringSetting("hushfacebook_save_folder", SaveFolder.DEFAULT);

    /**
     * The quality a video save asks for: the best the player streams, a ceiling, or the smallest
     * file. Every save of a story, a reel or a feed video reads it when it starts, and one that
     * finds nothing at or under a ceiling takes the nearest above it. Photos always save whole.
     * Like the folder, it isn't a switch.
     */
    public static final EnumSetting<DownloadQuality> DOWNLOAD_QUALITY =
            new EnumSetting<>("hushfacebook_download_quality", DownloadQuality.BEST);

    /**
     * The name a saved video gets: {date}, {video_id}, {owner} and {posted} fill in per save, the
     * last three only when the save knows them, and the default is Facebook's own FB_VID_ name, so
     * nothing changes for anyone who leaves it. Photos keep their FB_IMG_ names. Cleaned like the
     * folder wherever it's read ({@link FileNameTemplate#sanitize}), and like the folder, it isn't
     * a switch.
     */
    public static final StringSetting FILENAME_TEMPLATE =
            new StringSetting("hushfacebook_filename_template", FileNameTemplate.DEFAULT);

    /**
     * The tab a start from the launcher icon opens on while {@link #OPEN_ON_CHOSEN_TAB} is on:
     * Marketplace, the one people asked for, unless it's changed. A tab this account's tab bar
     * hasn't got opens Home, which is what Facebook does with a notification about such a tab. It
     * isn't a switch, and a paused Facebook opens where it chooses.
     */
    public static final EnumSetting<StartTab> START_TAB =
            new EnumSetting<>("hushfacebook_start_tab", StartTab.MARKETPLACE);
}
