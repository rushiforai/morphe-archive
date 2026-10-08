/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 *
 * Built on SysAdminDoc/hushfeed (GPL-3.0).
 */
package app.morphe.extension.facebook.settings;

import static app.morphe.extension.facebook.settings.HushfacebookPreferenceFragment.category;
import static app.morphe.extension.facebook.settings.HushfacebookPreferenceFragment.commentOrderRow;
import static app.morphe.extension.facebook.settings.HushfacebookPreferenceFragment.feedsSubtabRow;
import static app.morphe.extension.facebook.settings.HushfacebookPreferenceFragment.mark;
import static app.morphe.extension.facebook.settings.HushfacebookPreferenceFragment.reactionCeilingRow;
import static app.morphe.extension.facebook.settings.HushfacebookPreferenceFragment.seenKeepRow;
import static app.morphe.extension.facebook.settings.HushfacebookPreferenceFragment.startTabRow;
import static app.morphe.extension.facebook.settings.HushfacebookPreferenceFragment.toggle;

import android.content.Context;
import android.preference.Preference;
import android.preference.PreferenceCategory;
import android.preference.PreferenceScreen;
import android.preference.SwitchPreference;

import java.util.Set;

import app.morphe.extension.facebook.comments.CommentSheetOptions;
import app.morphe.extension.facebook.feed.SeenPosts;
import app.morphe.extension.facebook.navigation.MarketplaceOnly;
import app.morphe.extension.facebook.settings.SettingsRows.Row;
import app.morphe.extension.shared.L10n;
import app.morphe.extension.shared.Utils;

/**
 * The category pages for the feed: Opening Facebook, News feed, Stories, Comments and Writing. Each method adds its section to the page
 * {@link HushfacebookPreferenceFragment#initialize} builds, and leaves it out when the build has none of
 * its patches, but for the sections every build has.
 */
@SuppressWarnings("deprecation")
final class FeedPages {
    private FeedPages() {
    }

    /** Opening Facebook: Marketplace only, the tab Facebook opens on, and the feed Home loads. */
    static void opening(HushfacebookPreferenceFragment page, PreferenceScreen screen, Context context,
            Set<PatchFamily> build) {
        if (build.contains(PatchFamily.START_TAB) || build.contains(PatchFamily.MARKETPLACE_ONLY)
                || build.contains(PatchFamily.FOLLOWING_HOME)) {
            // First: it's what happens before anything the other rows change comes on screen.
            PreferenceCategory opening = category(screen, L10n.t("Opening Facebook"));
            if (build.contains(PatchFamily.MARKETPLACE_ONLY)) {
                // Facebook builds the tab bar once, and the hook is asked then and not again.
                opening.addPreference(toggle(context, Settings.MARKETPLACE_ONLY, ""));
                opening.addPreference(toggle(context, Settings.MARKETPLACE_QUIET_NOTIFICATIONS,
                        L10n.t("Silence video suggestions, memories, birthdays and friend suggestions while this mode is on. Messages and trading updates stay. Your other notification choices stay saved.")));
                Row regular = new Row(context);
                regular.actsAtOnce = true;
                regular.setKey("action_regular_facebook");
                regular.setTitle(L10n.t("Return to regular Facebook"));
                regular.setSummary(L10n.t("Restore the normal tabs at the next restart. Your other settings stay saved."));
                regular.setOnPreferenceClickListener(ignored -> {
                    if (Settings.MARKETPLACE_ONLY.save(false)) {
                        page.refreshSwitches();
                        Utils.showToastLong(MarketplaceOnly.state() == MarketplaceOnly.State.RESTART_NEEDED
                                ? L10n.t("Marketplace mode is off. Restart Facebook to restore its normal tabs.")
                                : L10n.t("Marketplace mode is off."));
                    } else {
                        Utils.showToastLong(L10n.t("Couldn't save the change. Try again."));
                    }
                    return true;
                });
                opening.addPreference(regular);
                opening.addPreference(toggle(context, Settings.MARKETPLACE_SKIP_FEED_PREFETCH,
                        L10n.t("Reduce background feed loading while Marketplace mode is active. Some loading can still happen during startup.")));
            }
            if (build.contains(PatchFamily.START_TAB)) {
                opening.addPreference(toggle(context, Settings.OPEN_ON_CHOSEN_TAB,
                        L10n.t("Choose where Facebook opens from its icon. Notifications and links still open their destination.")));
                opening.addPreference(startTabRow(context));
                opening.addPreference(feedsSubtabRow(context));
            }
            if (build.contains(PatchFamily.FOLLOWING_HOME)) {
                // Home asks for its feed each time it loads one, so no restart is needed.
                opening.addPreference(toggle(context, Settings.FOLLOWING_FEED_HOME,
                        L10n.t("Home loads Facebook's Following feed instead of the ranked one. The Feeds tab's filters stay as they are.")));
            }
        }
    }

    /** News feed: the ads, suggestions, prompts and words the feed can leave out. */
    static void newsFeed(HushfacebookPreferenceFragment page, PreferenceScreen screen, Context context,
            Set<PatchFamily> build) {
        if (build.contains(PatchFamily.SPONSORED_POSTS) || build.contains(PatchFamily.SUGGESTED_POSTS)
                || build.contains(PatchFamily.STORIES_TRAY) || build.contains(PatchFamily.FEED_REELS)
                || build.contains(PatchFamily.RETURN_REFRESH)
                || build.contains(PatchFamily.AI_DETECTED_POSTS)
                || build.contains(PatchFamily.SPONSORED_PROFILE_POSTS)
                || build.contains(PatchFamily.AFFILIATE_LINKS)
                || build.contains(PatchFamily.POST_WORDS)
                || build.contains(PatchFamily.POST_PROMPTS)
                || build.contains(PatchFamily.SEEN_POSTS)
                || build.contains(PatchFamily.META_AI_QUESTIONS)
                || build.contains(PatchFamily.POST_DATES)
                || build.contains(PatchFamily.AUTO_TRANSLATION)
                || build.contains(PatchFamily.FEEDS_HEADER)) {
            PreferenceCategory feed = category(screen, L10n.t("News feed"));
            if (build.contains(PatchFamily.SPONSORED_POSTS)) {
                feed.addPreference(toggle(context, Settings.HIDE_SPONSORED_POSTS,
                        L10n.t("Paid ads in the feed. They're dropped before Facebook adds them, so no gap is left.")));
                feed.addPreference(toggle(context, Settings.HIDE_PROMOTED_POSTS,
                        L10n.t("Posts Facebook files as promotions rather than as ads.")));
            }
            // Profiles have no section of their own; their ads sit with the feed's.
            if (build.contains(PatchFamily.SPONSORED_PROFILE_POSTS)) {
                feed.addPreference(toggle(context, Settings.HIDE_SPONSORED_PROFILE_POSTS,
                        L10n.t("Ads between the posts on someone's profile or a Page. Their own posts stay.")));
            }
            // One switch covers the cards on reels and in the comment sheet too.
            if (build.contains(PatchFamily.AFFILIATE_LINKS)) {
                feed.addPreference(toggle(context, Settings.HIDE_AFFILIATE_LINKS,
                        L10n.t("The product cards of shop links creators add to posts, on reels, under feed posts and "
                                + "in the comments. The \"Commission eligible\" label stays.")));
            }
            if (build.contains(PatchFamily.SUGGESTED_POSTS)) {
                feed.addPreference(toggle(context, Settings.HIDE_SUGGESTED_POSTS,
                        L10n.t("\"Pages you may like\" cards and the cards Facebook uses to push its own features. "
                                + "In-feed surveys go too.")));
                feed.addPreference(toggle(context, Settings.HIDE_SUGGESTED_FOR_YOU,
                        L10n.t("Posts Facebook slips into your feed from people and pages you don't follow and groups you haven't joined.")));
                // The Stories tray's cards are filtered by Hide suggested stories' hook, so the
                // switch reaches them only when that patch is in too.
                feed.addPreference(toggle(context, Settings.HIDE_PEOPLE_YOU_MAY_KNOW,
                        build.contains(PatchFamily.SUGGESTED_STORIES)
                                ? L10n.t("The row of friend suggestions between posts, the one on your own profile, "
                                        + "and the cards with an Add button in the Stories tray.")
                                : L10n.t("The row of friend suggestions between posts, and the one on your own profile.")));
                feed.addPreference(toggle(context, Settings.HIDE_SUGGESTED_GROUPS,
                        L10n.t("The row of groups to join between posts, with its Discover more groups button. "
                                + "Posts from groups you're in stay.")));
                feed.addPreference(toggle(context, Settings.HIDE_STORIES_YOU_MIGHT_LIKE,
                        L10n.t("The row of Stories from people you aren't connected to that Facebook puts between "
                                + "posts. Your friends' Stories and the Stories tray stay.")));
                feed.addPreference(toggle(context, Settings.HIDE_FEED_MEMORIES,
                        L10n.t("Memories between posts, like \"On this day\" and friendship anniversaries. "
                                + "Your Memories page stays.")));
                feed.addPreference(toggle(context, Settings.HIDE_FEED_FRIEND_REQUESTS,
                        L10n.t("The row of friend requests between posts. Your requests stay under Friends.")));
                feed.addPreference(toggle(context, Settings.HIDE_FRIENDS_LOCATIONS,
                        L10n.t("The card showing where your friends are, between posts.")));
            }
            if (build.contains(PatchFamily.STORIES_TRAY)) {
                // Facebook builds the feed's adapters once, when the feed is set up, and the tray is
                // one of them. The hook is asked then and not again, so a change waits for a restart.
                feed.addPreference(toggle(context, Settings.HIDE_TOP_STORIES_TRAY,
                        L10n.t("The row of stories at the top of the feed, Create story included.") + " "
                                + L10n.t("A change shows the next time you pull down to refresh.")));
                feed.addPreference(toggle(context, Settings.HIDE_STORIES_BETWEEN_POSTS,
                        L10n.t("Rows, large tiles and viewers of Stories between posts, starting with the next "
                                + "feed Facebook loads. The top Stories tray has its own switch.")));
                feed.addPreference(toggle(context, Settings.HIDE_HOME_COMPOSER,
                        L10n.t("The \"What's on your mind?\" row at the top of Home. The create button in the "
                                + "top bar still starts a post.") + " "
                                + L10n.t("A change shows the next time you pull down to refresh.")));
            }
            if (build.contains(PatchFamily.FEED_REELS)) {
                feed.addPreference(toggle(context, Settings.HIDE_FEED_REELS,
                        L10n.t("The rows of reels between posts, and the reels Facebook adds where your feed ends.")));
            }
            if (build.contains(PatchFamily.POST_PROMPTS)) {
                feed.addPreference(toggle(context, Settings.HIDE_POST_PROMPTS,
                        L10n.t("The strip on some posts, like \"Are you interested in this post?\", \"Show less\" "
                                + "or who recently commented, and the follow and chat suggestions in the same place. "
                                + "The post stays.")));
            }
            if (build.contains(PatchFamily.SEEN_POSTS)) {
                seenPosts(feed, context);
            }
            if (build.contains(PatchFamily.META_AI_QUESTIONS)) {
                feed.addPreference(toggle(context, Settings.HIDE_META_AI_QUESTIONS,
                        L10n.t("The row of Meta AI questions under some posts. The post, its link card and its "
                                + "buttons stay.")));
            }
            if (build.contains(PatchFamily.POST_DATES)) {
                feed.addPreference(toggle(context, Settings.KEEP_POST_DATES,
                        L10n.t("The line under the poster's name keeps the post's date instead of Facebook's "
                                + "rotating details, which go blank on some phones.")));
            }
            if (build.contains(PatchFamily.AUTO_TRANSLATION)) {
                // Each post and reel reads the answer as it's drawn, so a change shows on the next ones.
                feed.addPreference(toggle(context, Settings.TURN_OFF_AUTO_TRANSLATION,
                        L10n.t("Posts and reel captions stay in the language they were written in. Facebook's "
                                + "See translation link stays under them.")));
            }
            if (build.contains(PatchFamily.FEEDS_HEADER)) {
                // Facebook settles the Feeds tab's header as the tab is built, so a change waits for a restart.
                feed.addPreference(toggle(context, Settings.HIDE_FEEDS_HEADER,
                        L10n.t("Open the Feeds tab on its posts, without the title row or the filters under it. "
                                + "Restart Facebook after changing it.")));
            }
            if (build.contains(PatchFamily.RETURN_REFRESH)) {
                feed.addPreference(toggle(context, Settings.BLOCK_RETURN_REFRESH,
                        L10n.t("Returning to Facebook within ten minutes, or switching back to Home, keeps your place. "
                                + "Pull to refresh still works.")));
                feed.addPreference(toggle(context, Settings.RETURN_REFRESH_NO_LIMIT,
                        L10n.t("With the switch above on, your place stays however long you're away. Pull to refresh and a fresh start still load new posts.")));
            }
            if (build.contains(PatchFamily.AI_DETECTED_POSTS)) {
                feed.addPreference(toggle(context, Settings.HIDE_AI_DETECTED_POSTS,
                        L10n.t("Posts that Facebook's own detection marks as made with AI. A post that only its "
                                + "creator labelled as AI stays. It's off by default because it hasn't been tested "
                                + "on a real feed yet.")));
                feed.addPreference(toggle(context, Settings.HIDE_AI_LABELLED_POSTS,
                        L10n.t("Posts whose creator marked them as made with AI. Facebook puts its AI label next to "
                                + "the name on these as well as on the posts its detection found, and with this on, "
                                + "both kinds go. It's off by default because it hasn't been tested on a real feed "
                                + "yet.")));
                feed.addPreference(toggle(context, Settings.HIDE_META_AI_FEED_UNITS,
                        L10n.t("The Meta AI cards Facebook adds to the feed between posts, and its cards promoting "
                                + "the Vibes app. People's posts stay, whatever they say about AI.")));
                feed.addPreference(toggle(context, Settings.HIDE_AI_CHARACTER_POSTS,
                        L10n.t("Posts featuring one of Meta's AI characters, the chatbots people and creators make "
                                + "with Meta AI Studio. It's off by default because it hasn't been tested on a real "
                                + "feed yet.")));
            }
            if (build.contains(PatchFamily.POST_WORDS)) {
                feed.addPreference(toggle(context, Settings.HIDE_POSTS_WITH_WORDS,
                        L10n.t("Posts whose text has a word or phrase from your list below. A post with a word from "
                                + "your keep list stays, and so does a post with no text. Your words only leave the "
                                + "phone in a settings file you export.")));
                feed.addPreference(page.wordsRow(context, Settings.HIDDEN_WORDS, true));
                feed.addPreference(page.wordsRow(context, Settings.KEPT_WORDS, false));
                feed.addPreference(toggle(context, Settings.POST_WORDS_WHOLE_WORDS,
                        L10n.t("Apply whole-word matching to both lists. For example, hat matches hat! but not what or hats.")));
                feed.addPreference(toggle(context, Settings.HIDE_POSTS_FROM_SOURCES,
                        L10n.t("Posts by a person or Page on your list below, or linking to a site on it, and shares "
                                + "of them. Your list only leaves the phone in a settings file you export.")));
                feed.addPreference(page.sourcesRow(context));
                feed.addPreference(toggle(context, Settings.HIDE_PHOTO_POSTS,
                        L10n.t("Posts that show a photo or an album, and shares of them.")));
                feed.addPreference(toggle(context, Settings.HIDE_VIDEO_POSTS,
                        L10n.t("Posts that show a video, and shares of them. Reels in the feed have a switch of their "
                                + "own.")));
                feed.addPreference(toggle(context, Settings.HIDE_LINK_POSTS,
                        L10n.t("Posts that share a link to a website, with its preview card.")));
                feed.addPreference(toggle(context, Settings.HIDE_BACKGROUND_POSTS,
                        L10n.t("Short posts Facebook shows as big text on a colored background.")));
                feed.addPreference(reactionCeilingRow(context));
            }
        }
    }

    /**
     * Hide posts you've already seen, with how long they stay hidden and a row that forgets them.
     * The keep time is greyed out while the switch is off, Forget seen posts never is, and turning
     * the switch off forgets the list.
     */
    private static void seenPosts(PreferenceCategory feed, Context context) {
        SwitchPreference seen = toggle(context, Settings.HIDE_SEEN_POSTS,
                L10n.t("Posts you've scrolled past stay out of the feed when it loads again. Facebook decides what "
                        + "counts as seen. The list stays on this phone, and a change shows on the next load. "
                        + "Turning this off empties the list."));
        Preference keep = seenKeepRow(context);
        Row forget = new Row(context);
        forget.setTitle(L10n.t("Forget seen posts"));
        forget.setSummary(L10n.t("Empties the list of posts you've seen, so they can show up again."));
        forget.setPersistent(false);
        forget.actsAtOnce = true;
        forget.setOnPreferenceClickListener(p -> {
            SeenPosts.clear();
            Utils.showToastShort(SeenPosts.clearedMessage());
            return true;
        });
        mark(forget, SettingsIcons.DELETE);
        // The keep time follows the switch and is greyed out until it's on. Forget seen posts
        // works either way, so a list is never out of reach.
        keep.setEnabled(Settings.HIDE_SEEN_POSTS.savedValue());
        seen.setOnPreferenceChangeListener((preference, value) -> {
            boolean now = Boolean.TRUE.equals(value);
            keep.setEnabled(now);
            // Off forgets the list. The file goes on a background thread.
            if (!now) SeenPosts.clear();
            return true;
        });
        feed.addPreference(seen);
        feed.addPreference(keep);
        feed.addPreference(forget);
    }

    /** Stories. */
    static void stories(HushfacebookPreferenceFragment page, PreferenceScreen screen, Context context,
            Set<PatchFamily> build) {
        if (build.contains(PatchFamily.SPONSORED_STORIES) || build.contains(PatchFamily.SUGGESTED_STORIES)
                || build.contains(PatchFamily.STORY_AUTO_ADVANCE) || build.contains(PatchFamily.STORY_SEEN)
                || build.contains(PatchFamily.STORY_DOWNLOAD)) {
            PreferenceCategory stories = category(screen, L10n.t("Stories"));
            if (build.contains(PatchFamily.SPONSORED_STORIES)) {
                stories.addPreference(toggle(context, Settings.HIDE_SPONSORED_STORIES,
                        L10n.t("Ad cards between the stories people posted.")));
            }
            if (build.contains(PatchFamily.SUGGESTED_STORIES)) {
                // The tray's buckets are filtered as each answer of its fetch comes in, so a change
                // shows when Facebook next loads the tray, not on the tray already drawn.
                stories.addPreference(toggle(context, Settings.HIDE_SUGGESTED_STORIES,
                        L10n.t("Keep friends and followed Pages in the Stories tray. Applies when Facebook next loads the tray.")));
                stories.addPreference(toggle(context, Settings.HIDE_CONTACT_IMPORT_CARD,
                        L10n.t("The Stories tray card asking to upload your contacts. Applies when Facebook next loads the tray.")));
                stories.addPreference(toggle(context, Settings.HIDE_STORY_PROMPTS,
                        L10n.t("The cards beside Create story that suggest a story to make, like Share music you love. "
                                + "Applies when Facebook next loads the tray.")));
            }
            if (build.contains(PatchFamily.STORY_AUTO_ADVANCE)) {
                stories.addPreference(toggle(context, Settings.BLOCK_STORY_AUTO_ADVANCE,
                        L10n.t("A finished story stays on screen until you tap or swipe. Turn this off for Facebook's timing.")));
                stories.addPreference(toggle(context, Settings.LOOP_STORIES,
                        L10n.t("With Stop Story auto-advance on, a finished story plays again from the start "
                                + "instead of waiting on its last frame. Tap or swipe to move on.")));
            }
            if (build.contains(PatchFamily.STORY_SEEN)) {
                stories.addPreference(toggle(context, Settings.VIEW_STORIES_ANONYMOUSLY,
                        L10n.t("Facebook isn't told which stories you watch, so you stay off their viewer lists. "
                                + "Replying or reacting still shows you, and stories you've watched keep their "
                                + "unwatched ring.")));
                stories.addPreference(toggle(context, Settings.MARK_STORIES_SEEN,
                        L10n.t("Adds an eye button to the top of each story while you view anonymously. Tap it to "
                                + "show up on that story's viewer list. The other stories stay hidden.")));
            }
            if (build.contains(PatchFamily.STORY_DOWNLOAD)) {
                stories.addPreference(toggle(context, Settings.DOWNLOAD_STORIES,
                        L10n.t("Add Save to every story menu, using your download quality. Off or paused, Facebook only saves your own stories.")));
            }
        }
    }

    /**
     * Comments: the order they open in, Meta AI's summaries of them, and what the comment box and
     * the Like button offer.
     */
    static void comments(HushfacebookPreferenceFragment page, PreferenceScreen screen, Context context,
            Set<PatchFamily> build) {
        boolean order = build.contains(PatchFamily.DEFAULT_COMMENT_ORDER);
        boolean summaries = build.contains(PatchFamily.META_AI_SUMMARIES);
        boolean options = build.contains(PatchFamily.COMMENT_SHEET_OPTIONS);
        if (!order && !summaries && !options) return;
        PreferenceCategory comments = category(screen, L10n.t("Comments"));
        if (order) {
            comments.addPreference(toggle(context, Settings.DEFAULT_COMMENT_ORDER,
                    L10n.t("Use the order below. A choice made on a post lasts until restart. Links to comments keep Facebook's order.")));
            comments.addPreference(commentOrderRow(context));
        }
        if (summaries) {
            comments.addPreference(toggle(context, Settings.HIDE_META_AI_SUMMARIES,
                    L10n.t("Comments open without Meta AI's summary at the top, and posts lose the summary of their comments "
                            + "under the buttons. The comments themselves stay.")));
        }
        if (options) {
            comments.addPreference(toggle(context, Settings.LIKE_ONLY,
                    L10n.t("A long press on Like doesn't open the reactions. A tap still likes.")));
            comments.addPreference(toggle(context, Settings.HIDE_COMMENT_GIF_STICKER_BUTTONS,
                    L10n.t("The comment box loses its GIF and sticker buttons. Typing, photos and posting work as before.")));
            comments.addPreference(toggle(context, Settings.OPEN_REPLY_THREADS,
                    L10n.t("Comments show their replies right away, so there's no View replies to tap.")));
            comments.addPreference(reactionCountsRow(context));
        }
    }

    /**
     * Opens Facebook's own settings, where Preferences has Reaction preferences and its switches
     * for hiding reaction counts. Facebook keeps those on its servers, so Hushfacebook doesn't
     * rebuild them.
     */
    static Preference reactionCountsRow(Context context) {
        Preference row = new Row(context);
        row.setTitle(L10n.t("Hide reaction counts"));
        row.setSummary(L10n.t("Facebook has its own setting for this. Open Facebook's settings, then Preferences "
                + "and Reaction preferences."));
        row.setPersistent(false);
        row.setOnPreferenceClickListener(p -> {
            if (!CommentSheetOptions.openReactionSettings(p.getContext())) {
                Utils.showToastLong(L10n.t("Facebook's settings didn't open. You'll find Reaction preferences in its Settings, "
                        + "under Preferences."));
            }
            return true;
        });
        return mark(row, SettingsIcons.OPENING);
    }

    /** Writing: when Facebook suggests someone to tag. */
    static void writing(HushfacebookPreferenceFragment page, PreferenceScreen screen, Context context,
            Set<PatchFamily> build) {
        if (build.contains(PatchFamily.TAG_SUGGESTIONS)) {
            PreferenceCategory writing = category(screen, L10n.t("Writing"));
            writing.addPreference(toggle(context, Settings.TAG_SUGGESTIONS_ONLY_AFTER_AT,
                    L10n.t("Type @ before Facebook suggests someone to tag in posts or comments. Your text stays unchanged.")));
        }
    }
}
