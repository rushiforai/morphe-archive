/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 *
 * Built on SysAdminDoc/hushfeed (GPL-3.0).
 */
package app.morphe.extension.facebook.settings;

import static java.lang.Boolean.FALSE;
import static java.lang.Boolean.TRUE;

import app.morphe.extension.facebook.comments.CommentOrder;
import app.morphe.extension.facebook.download.DownloadQuality;
import app.morphe.extension.facebook.download.FileNameTemplate;
import app.morphe.extension.facebook.download.SaveFolder;
import app.morphe.extension.facebook.download.SaveTo;
import app.morphe.extension.facebook.download.SendLink;
import app.morphe.extension.facebook.media.PlaybackQuality;
import app.morphe.extension.facebook.navigation.StartTab;
import app.morphe.extension.shared.settings.BaseSettings;
import app.morphe.extension.shared.settings.BooleanSetting;
import app.morphe.extension.shared.settings.EnumSetting;
import app.morphe.extension.shared.settings.StringSetting;

/**
 * The switches behind the hooks that ask before they act.
 *
 * <p>A switch's default is the second argument of its {@link BooleanSetting}. Picking a patch in
 * Morphe Manager is the choice to use it, and the switch is the way to turn it off again without
 * patching a second time. While Hushfacebook is paused, safe mode included
 * ({@link app.morphe.extension.shared.settings.HushfacebookPause}), a switch answers off unless
 * {@link app.morphe.extension.shared.settings.Setting#keepWhenPaused} marks it, and the hook behind
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

    /**
     * The "People you may know" row in the feed, found by its GraphQL type name, the carousel on
     * your own profile, found by the name its section gives itself, and, when Hide suggested
     * stories is in too, the People you may know cards in the Stories tray, found by their bucket
     * type (PYMK_STORY or PYMK_PROFILE_FORWARD_STORY).
     */
    public static final BooleanSetting HIDE_PEOPLE_YOU_MAY_KNOW =
            new BooleanSetting("hushfacebook_hide_people_you_may_know", TRUE);

    /**
     * The row of groups to join that Facebook puts between posts, found by its GraphQL type name.
     * Posts from groups you're in are stories of their own and stay.
     */
    public static final BooleanSetting HIDE_SUGGESTED_GROUPS =
            new BooleanSetting("hushfacebook_hide_suggested_groups", TRUE);

    /**
     * The row of Stories from people you aren't connected to that Facebook puts between posts,
     * "Stories you might like", found by the flag Facebook's own Discover unit reads for it. A row
     * of your friends' Stories and the Stories tray stay.
     */
    public static final BooleanSetting HIDE_STORIES_YOU_MIGHT_LIKE =
            new BooleanSetting("hushfacebook_hide_stories_you_might_like", TRUE);

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

    /** With the switch above, keep the feed however long Facebook stayed in the background (#23). */
    public static final BooleanSetting RETURN_REFRESH_NO_LIMIT =
            new BooleanSetting("hushfacebook_return_refresh_no_limit", FALSE);

    /**
     * Feed posts Facebook's own detection marked as made with AI. Off until one AI-labeled and one
     * ordinary post have been recorded on a signed-in feed and the rule told them apart.
     */
    public static final BooleanSetting HIDE_AI_DETECTED_POSTS =
            new BooleanSetting("hushfacebook_hide_ai_detected_posts", FALSE);

    /**
     * Feed posts carrying Facebook's AI label for any reason: the ones its creator labelled as AI,
     * which {@link #HIDE_AI_DETECTED_POSTS} keeps, and the detected ones too. Off, like the switch
     * above, until a labelled post has been seen going on a signed-in feed.
     */
    public static final BooleanSetting HIDE_AI_LABELLED_POSTS =
            new BooleanSetting("hushfacebook_hide_ai_labelled_posts", FALSE);

    /**
     * Reels and Watch videos Facebook's own detection marked as made with AI, read off the
     * attribution the Reels viewer draws its AI label from. Off until it has been checked on a
     * signed-in Reels feed, like the feed switch above.
     */
    public static final BooleanSetting HIDE_AI_DETECTED_REELS =
            new BooleanSetting("hushfacebook_hide_ai_detected_reels", FALSE);

    /**
     * Feed posts whose own words hold a phrase from {@link #HIDDEN_WORDS} and none from
     * {@link #KEPT_WORDS} ({@link app.morphe.extension.facebook.feed.PostWords}). Off by default,
     * and with the hide list empty it reads nothing of any post.
     */
    public static final BooleanSetting HIDE_POSTS_WITH_WORDS =
            new BooleanSetting("hushfacebook_hide_posts_with_words", FALSE);

    /**
     * The words and phrases that hide a post while {@link #HIDE_POSTS_WITH_WORDS} is on, one per
     * line, bounded wherever it's read. It isn't a switch, and a paused Facebook reads it as empty.
     */
    public static final StringSetting HIDDEN_WORDS =
            new StringSetting("hushfacebook_hidden_words", "");

    /**
     * The words and phrases that keep a post whatever else it says, one per line, bounded the same
     * way. It isn't a switch either.
     */
    public static final StringSetting KEPT_WORDS =
            new StringSetting("hushfacebook_kept_words", "");

    /** The four story bucket sources that splice ad cards into the story viewer. */
    public static final BooleanSetting HIDE_SPONSORED_STORIES =
            new BooleanSetting("hushfacebook_hide_sponsored_stories", TRUE);

    /**
     * The buckets of the Stories tray that Facebook suggests from people and Pages you don't
     * follow: a bucket whose is_story_bucket_suggested flag is true or whose first label is
     * SUGGESTED, the two things the tray's card reads before it says "Suggested". Friends' stories,
     * Pages you follow and your own story stay.
     */
    public static final BooleanSetting HIDE_SUGGESTED_STORIES =
            new BooleanSetting("hushfacebook_hide_suggested_stories", TRUE);

    /**
     * The "Find friends from contacts" card in the Stories tray, which asks to upload the phone's
     * contacts: a bucket whose type is CONTACT_IMPORTER_STORY, the type the tray's card dispatcher
     * draws that card for. Stories and the other cards stay.
     */
    public static final BooleanSetting HIDE_CONTACT_IMPORT_CARD =
            new BooleanSetting("hushfacebook_hide_contact_import_card", TRUE);

    /** Keep a finished Story visible until the user navigates. */
    public static final BooleanSetting BLOCK_STORY_AUTO_ADVANCE =
            new BooleanSetting("hushfacebook_block_story_auto_advance", TRUE);

    /**
     * The batches of viewed story cards the story viewer sends as DirectSeenMutation, which put you
     * on each story's viewer list. Held back, replies and reactions still show you, and stories you
     * viewed keep their unwatched ring.
     */
    public static final BooleanSetting VIEW_STORIES_ANONYMOUSLY =
            new BooleanSetting("hushfacebook_view_stories_anonymously", TRUE);

    /** The two page filters that take server-inlined ads out of Reels and Watch. */
    public static final BooleanSetting HIDE_SPONSORED_REELS =
            new BooleanSetting("hushfacebook_hide_sponsored_reels", TRUE);

    /** The modules of a page of search results that Facebook's search result role marks as ads. */
    public static final BooleanSetting HIDE_SPONSORED_SEARCH_RESULTS =
            new BooleanSetting("hushfacebook_hide_sponsored_search_results", TRUE);

    /** The posts on a profile or Page timeline that carry Facebook's sponsored data. */
    public static final BooleanSetting HIDE_SPONSORED_PROFILE_POSTS =
            new BooleanSetting("hushfacebook_hide_sponsored_profile_posts", TRUE);

    /**
     * The ads and boosted listings of Marketplace's feed: its query asks the server to skip them,
     * and its ads-only queries aren't sent.
     */
    public static final BooleanSetting HIDE_SPONSORED_MARKETPLACE_LISTINGS =
            new BooleanSetting("hushfacebook_hide_sponsored_marketplace_listings", TRUE);

    /**
     * The product cards of the shop links a creator attaches to a post go: on a reel, under a feed
     * post and floating over the comment box ({@link app.morphe.extension.facebook.ads.AffiliateLinks}).
     * The "Commission eligible" label stays. A change shows on the reels, posts and comment sheets
     * built after it.
     */
    public static final BooleanSetting HIDE_AFFILIATE_LINKS =
            new BooleanSetting("hushfacebook_hide_affiliate_links", TRUE);

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
     * A double tap on a reel or a video left without Facebook's like: no heart, no like sent. A
     * single tap and the Like button do what they always did. On once the patch is picked, since
     * picking it is the choice.
     */
    public static final BooleanSetting TURN_OFF_DOUBLE_TAP_LIKE =
            new BooleanSetting("hushfacebook_turn_off_double_tap_like", TRUE);

    /**
     * A speed picked in a reel's menu stays for the next reels where it was picked, ads and live
     * videos aside, until another is picked or Facebook restarts
     * ({@link app.morphe.extension.facebook.media.ReelSpeed}). Nothing is
     * stored. Off or paused, each reel starts at the speed Facebook starts it at.
     */
    public static final BooleanSetting KEEP_REEL_SPEED =
            new BooleanSetting("hushfacebook_keep_reel_speed", TRUE);

    /**
     * A reel you hold plays at double speed until you let go, through the speed-up Facebook's Reels
     * controls already have, in place of Facebook's long-press menu
     * ({@link app.morphe.extension.facebook.reels.ReelHold}). On once the patch is picked, since
     * picking it is the choice. Off or paused, a long press opens Facebook's menu.
     */
    public static final BooleanSetting HOLD_REEL_FOR_2X =
            new BooleanSetting("hushfacebook_hold_reel_for_2x", TRUE);

    /**
     * Comment sheets ask for the order in {@link #COMMENT_ORDER} where Facebook's servers would
     * choose one, and an order picked in a post's comments stays for that post until Facebook
     * restarts ({@link app.morphe.extension.facebook.comments.DefaultCommentOrder}). A request that
     * names its own order, and a link to one comment, keep Facebook's. With the order left as
     * Facebook's, the switch changes nothing.
     */
    public static final BooleanSetting DEFAULT_COMMENT_ORDER =
            new BooleanSetting("hushfacebook_default_comment_order", TRUE);

    /**
     * Facebook's text boxes (posts, comments, captions, a story's text) look people up to tag only
     * for a word that starts with @. Off, they also look them up for a plain word Facebook takes for
     * a name, what its code calls an implicit mention
     * ({@link app.morphe.extension.facebook.composer.TagSuggestions}). Words with @ or #, photo tags
     * and the text itself are never touched.
     */
    public static final BooleanSetting TAG_SUGGESTIONS_ONLY_AFTER_AT =
            new BooleanSetting("hushfacebook_tag_suggestions_only_after_at", TRUE);

    /**
     * Videos, reels, stories and songs start only after a tap: a player's start goes ahead when a
     * tap has just ended, and Facebook's own Autoplay setting reads Off
     * ({@link app.morphe.extension.facebook.media.TapToPlay}). The stored Autoplay setting is never
     * written, so off or paused, Facebook plays as you set it.
     */
    public static final BooleanSetting TAP_TO_PLAY =
            new BooleanSetting("hushfacebook_tap_to_play", TRUE);

    /**
     * A video longer than two minutes that was left partway picks up where it was left, once, the
     * next time a player starts it ({@link app.morphe.extension.facebook.media.ResumePlayback}).
     * Starts off. Off or paused, nothing is saved or looked up and videos start as Facebook starts
     * them; the points already saved stay until they're 30 days old, and Facebook's start drops
     * them after that either way.
     */
    public static final BooleanSetting RESUME_LONG_VIDEOS =
            new BooleanSetting("hushfacebook_resume_long_videos", FALSE);

    /**
     * Videos, reels and video stories start at the quality in {@link #PLAYBACK_QUALITY}, through
     * the same per-video choice Facebook's own quality menu makes
     * ({@link app.morphe.extension.facebook.media.QualityChoice}). A pick in that menu still wins
     * for its video. With the quality left as Facebook's, the switch changes nothing, and off or
     * paused, Facebook picks the quality as it plays.
     */
    public static final BooleanSetting DEFAULT_PLAYBACK_QUALITY =
            new BooleanSetting("hushfacebook_default_playback_quality", TRUE);

    /**
     * Facebook's own text, React Native screens' included, drawn in the font {@link #FONT_SOURCE}
     * names instead of Meta's Optimistic, at the same weight and slant. A typeface already on
     * screen keeps its font until Facebook restarts.
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
     * The "Get the Messenger app" card at the top of Facebook's own Chats, while Messenger is
     * installed. Facebook drops it by itself only for a Messenger signed with its own key, which a
     * re-signed Facebook never matches. Without Messenger the card stays, and so does its way to
     * install it.
     */
    public static final BooleanSetting HIDE_GET_MESSENGER_CARD =
            new BooleanSetting("hushfacebook_hide_get_messenger_card", TRUE);

    /**
     * A tap on the Messenger icon at the top of Facebook opens the Messenger app, while it's
     * installed, instead of Facebook's own Chats. Starts off. Without Messenger, Chats opens as it
     * always did.
     */
    public static final BooleanSetting OPEN_MESSENGER_APP =
            new BooleanSetting("hushfacebook_open_messenger_app", FALSE);

    /**
     * The Upgrades section of Facebook's Menu, the group Facebook types UPSELL, with its offers.
     * Only that group goes: Settings, Help and support and the rest of the Menu stay.
     */
    public static final BooleanSetting HIDE_MENU_UPGRADES =
            new BooleanSetting("hushfacebook_hide_menu_upgrades", TRUE);

    /**
     * The Also from Meta section of Facebook's Menu, the group Facebook types
     * PRODUCTS_FROM_FACEBOOK: its links to Meta's other apps and its cards for Meta's devices.
     */
    public static final BooleanSetting HIDE_MENU_ALSO_FROM_META =
            new BooleanSetting("hushfacebook_hide_menu_also_from_meta", TRUE);

    /**
     * Meta AI in Facebook's search: the answer a results page adds on top, the Meta AI modules and
     * "Ask Meta AI" prompts among the results, and the suggestions Facebook's server sets to open in
     * Meta AI. People, groups, pages and posts stay, and so do the Meta AI button and the results
     * page's own Meta AI tab.
     */
    public static final BooleanSetting HIDE_META_AI_IN_SEARCH =
            new BooleanSetting("hushfacebook_hide_meta_ai_in_search", TRUE);

    /**
     * Push notifications Facebook types TOP_TRENDING_VIDEO or PERSONALIZED_REELS: trending videos
     * and reels it picked for you. Off by default, like every notification switch: each one drops a
     * whole kind of notification, so it's yours to turn on.
     */
    public static final BooleanSetting BLOCK_TRENDING_VIDEO_NOTIFICATIONS =
            new BooleanSetting("hushfacebook_block_trending_video_notifications", FALSE);

    /** Push notifications Facebook types ONTHISDAY: its "On this day" memories. */
    public static final BooleanSetting BLOCK_MEMORY_NOTIFICATIONS =
            new BooleanSetting("hushfacebook_block_memory_notifications", FALSE);

    /** Push notifications Facebook types BIRTHDAY_REMINDER: a friend's birthday is today. */
    public static final BooleanSetting BLOCK_BIRTHDAY_NOTIFICATIONS =
            new BooleanSetting("hushfacebook_block_birthday_notifications", FALSE);

    /**
     * Push notifications Facebook types GROUP_HIGHLIGHTS, GROUP_NF_HIGHLIGHTS, PAGE_HIGHLIGHTS or
     * CREATOR_HIGHLIGHTS: digests of what happened in groups, pages and creators you follow.
     * Comments, replies and mentions in groups are other kinds and still come through.
     */
    public static final BooleanSetting BLOCK_HIGHLIGHT_NOTIFICATIONS =
            new BooleanSetting("hushfacebook_block_highlight_notifications", FALSE);

    /** Push notifications Facebook types PYMK_EMAIL: friend suggestions. Friend requests still come through. */
    public static final BooleanSetting BLOCK_PEOPLE_YOU_MAY_KNOW_NOTIFICATIONS =
            new BooleanSetting("hushfacebook_block_people_you_may_know_notifications", FALSE);

    /** Push notifications Facebook types PLACE_FEED_NEARBY, NEAR_SAVED_PLACE or WEATHER_NOWCAST. */
    public static final BooleanSetting BLOCK_NEARBY_NOTIFICATIONS =
            new BooleanSetting("hushfacebook_block_nearby_notifications", FALSE);

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
            new BooleanSetting("hushfacebook_open_on_chosen_tab", FALSE);

    /**
     * The tab bar keeps Marketplace, Notifications and the profile or Menu tab, and a start from
     * the launcher icon opens Marketplace whatever {@link #START_TAB} says. Home with the news feed,
     * Video, Friends, Feeds, Groups, Gaming and Events go. Facebook builds the bar once, so a change
     * shows when it restarts.
     */
    public static final BooleanSetting MARKETPLACE_ONLY =
            new BooleanSetting("hushfacebook_marketplace_only", FALSE, true);

    /** Silences only recognized social promotions while Marketplace mode is selected. */
    public static final BooleanSetting MARKETPLACE_QUIET_NOTIFICATIONS =
            new BooleanSetting("hushfacebook_marketplace_quiet_notifications", FALSE);

    /** Skip only confirmed feed warm-ups once the tab bar has applied Marketplace mode. */
    public static final BooleanSetting MARKETPLACE_SKIP_FEED_PREFETCH =
            new BooleanSetting("hushfacebook_marketplace_skip_feed_prefetch", FALSE);

    /**
     * The Reels tab, which some accounts call Video, stays off the tab bar, and a start sent to
     * it by {@link #START_TAB} opens Home. Facebook builds the bar once, so a change shows when it
     * restarts. A Reels tab Facebook's own tab bar settings hide stays hidden either way.
     */
    public static final BooleanSetting HIDE_REELS_TAB =
            new BooleanSetting("hushfacebook_hide_reels_tab", TRUE, true);

    /**
     * The Reels tab, which some accounts call Video, shows no new-item dot or count
     * ({@link app.morphe.extension.facebook.navigation.ReelsTabDot}). Off or paused, Facebook's
     * count comes back when the tab bar next asks for it.
     */
    public static final BooleanSetting HIDE_REELS_TAB_DOT =
            new BooleanSetting("hushfacebook_hide_reels_tab_dot", TRUE);

    /**
     * The tab bar goes to the bottom of the screen on accounts Facebook gives it at the top
     * ({@link app.morphe.extension.facebook.navigation.BottomTabBar}). Facebook places the bar as
     * its main screen starts, so a change waits for a restart.
     */
    public static final BooleanSetting BOTTOM_TAB_BAR =
            new BooleanSetting("hushfacebook_bottom_tab_bar", FALSE, true);

    /**
     * The strip some posts carry ("Are you interested in this post?", "Show less", who recently
     * commented, follow and chat suggestions) goes, and so does the room kept for it
     * ({@link app.morphe.extension.facebook.feed.PostPrompts}). A change shows on the posts drawn
     * after it.
     */
    public static final BooleanSetting HIDE_POST_PROMPTS =
            new BooleanSetting("hushfacebook_hide_post_prompts", TRUE);

    /**
     * Posts come without the row of Meta AI questions Facebook adds under some of them
     * ({@link app.morphe.extension.facebook.feed.MetaAiQuestions}). A change shows on the posts
     * drawn after it.
     */
    public static final BooleanSetting HIDE_META_AI_QUESTIONS =
            new BooleanSetting("hushfacebook_hide_meta_ai_questions", TRUE);

    /**
     * Post headers keep the one line with the date instead of Facebook's rotating subtitle
     * ({@link app.morphe.extension.facebook.feed.PostDates}). A change shows on the headers drawn
     * after it.
     */
    public static final BooleanSetting KEEP_POST_DATES =
            new BooleanSetting("hushfacebook_keep_post_dates", TRUE);

    /**
     * The Feeds tab opens on its posts, without the title row or the filters under it
     * ({@link app.morphe.extension.facebook.feed.FeedsHeader}). Facebook settles both as the tab is
     * built, so a change waits for a restart.
     */
    public static final BooleanSetting HIDE_FEEDS_HEADER =
            new BooleanSetting("hushfacebook_hide_feeds_header", FALSE, true);

    /**
     * Reels come without the "Are you interested in this reel?" prompt
     * ({@link app.morphe.extension.facebook.reels.ReelPrompts}). A change shows on the reels built
     * after it.
     */
    public static final BooleanSetting HIDE_REEL_PROMPTS =
            new BooleanSetting("hushfacebook_hide_reel_prompts", TRUE);

    /**
     * The top folder saves go to: Movies for a video and Pictures for a photo, the default and
     * where Facebook's own saves go, or DCIM or Download for both (#42). The {@link #SAVE_FOLDER}
     * goes under it. Saves made before a change stay where they are. Like the folder, it isn't a
     * switch.
     */
    public static final EnumSetting<SaveTo> SAVE_TO =
            new EnumSetting<>("hushfacebook_save_to", SaveTo.MOVIES_AND_PICTURES);

    /**
     * The folder every save goes to, under the top folder {@link #SAVE_TO} names. The
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
     * Video saves keep to what other apps open: H.264 video with AAC-LC or HE-AAC sound, within
     * {@link #DOWNLOAD_QUALITY}, or Facebook's single MP4 file when the manifest has no such pair.
     * The sharpest version Facebook streams is often AV1 with xHE-AAC sound, which Gallery and VLC
     * play and WhatsApp turns down (issue #11). Off by default, so a save keeps the sharpest. Every
     * download patch reads it ({@link PatchFamily#DOWNLOAD_SWITCHES}), and a paused Facebook makes
     * no Hushfacebook saves for it to steer.
     */
    public static final BooleanSetting DOWNLOAD_COMPATIBLE =
            new BooleanSetting("hushfacebook_download_compatible", FALSE);

    /**
     * The name a saved video gets: {date}, {video_id}, {owner}, {owner_id} and {posted} fill in per
     * save, the last four only when the save knows them, and the default is Facebook's own FB_VID_
     * name, so nothing changes for anyone who leaves it. Photos keep their FB_IMG_ names. Cleaned
     * like the folder wherever it's read ({@link FileNameTemplate#sanitize}), and like the folder,
     * it isn't a switch.
     */
    public static final StringSetting FILENAME_TEMPLATE =
            new StringSetting("hushfacebook_filename_template", FileNameTemplate.DEFAULT);

    /**
     * What a tap on Download does for a reel or a feed or Watch video: save it here, the default,
     * or send its link to another app ({@link SendLink}, #41). Stories always save. Like the
     * quality, it isn't a switch.
     */
    public static final EnumSetting<SendLink.Action> DOWNLOAD_ACTION =
            new EnumSetting<>("hushfacebook_download_action", SendLink.Action.SAVE);

    /**
     * The app {@link #DOWNLOAD_ACTION} sends links to, by package name. Blank, or anything that
     * isn't a package name, leaves the choice to Android's chooser each time.
     */
    public static final StringSetting SEND_TO_APP =
            new StringSetting("hushfacebook_send_to_app", "");

    /**
     * The tab a start from the launcher icon opens on while {@link #OPEN_ON_CHOSEN_TAB} is on:
     * Marketplace, the one people asked for, unless it's changed. A tab this account's tab bar
     * hasn't got opens Home, which is what Facebook does with a notification about such a tab. It
     * isn't a switch, and a paused Facebook opens where it chooses.
     */
    public static final EnumSetting<StartTab> START_TAB =
            new EnumSetting<>("hushfacebook_start_tab", StartTab.MARKETPLACE);

    /**
     * The order comment sheets ask for while {@link #DEFAULT_COMMENT_ORDER} is on: Facebook's own
     * choice until someone picks Most relevant, Newest or All comments, so picking the patch changes
     * nothing on its own. It isn't a switch, and a paused Facebook takes the order its servers
     * choose.
     */
    public static final EnumSetting<CommentOrder> COMMENT_ORDER =
            new EnumSetting<>("hushfacebook_comment_order", CommentOrder.FACEBOOK);

    /**
     * The quality videos start at while {@link #DEFAULT_PLAYBACK_QUALITY} is on: Facebook's own
     * choice until someone picks another, so picking the patch changes nothing on its own. It isn't
     * a switch, and a paused Facebook picks the quality itself.
     */
    public static final EnumSetting<PlaybackQuality> PLAYBACK_QUALITY =
            new EnumSetting<>("hushfacebook_playback_quality", PlaybackQuality.AUTO);

    /**
     * Where {@link #USE_SYSTEM_FONT} takes its font from: empty for the phone's own, or the name of
     * the font file picked in the settings, whose copy sits in Facebook's files
     * ({@link app.morphe.extension.facebook.font.FontFile}). Only the settings screen writes it,
     * after the copy has passed its checks. It isn't a switch, and a settings file leaves it out:
     * the font can't travel in one, and the name alone would point at nothing on another phone.
     */
    public static final StringSetting FONT_SOURCE =
            new StringSetting("hushfacebook_font_source", "");
}
