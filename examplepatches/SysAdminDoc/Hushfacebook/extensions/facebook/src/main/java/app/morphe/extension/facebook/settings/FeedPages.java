/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 *
 * Built on SysAdminDoc/hushfeed (GPL-3.0).
 */
package app.morphe.extension.facebook.settings;

import static app.morphe.extension.facebook.settings.HushfacebookPreferenceFragment.category;
import static app.morphe.extension.facebook.settings.HushfacebookPreferenceFragment.commentOrderRow;
import static app.morphe.extension.facebook.settings.HushfacebookPreferenceFragment.startTabRow;
import static app.morphe.extension.facebook.settings.HushfacebookPreferenceFragment.toggle;

import android.content.Context;
import android.preference.PreferenceCategory;
import android.preference.PreferenceScreen;

import java.util.Set;

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

    /** Opening Facebook: Marketplace only, and the tab Facebook opens on. */
    static void opening(HushfacebookPreferenceFragment page, PreferenceScreen screen, Context context,
            Set<PatchFamily> build) {
        if (build.contains(PatchFamily.START_TAB) || build.contains(PatchFamily.MARKETPLACE_ONLY)) {
            // First: it's what happens before anything the other rows change comes on screen.
            PreferenceCategory opening = category(screen, L10n.t("Opening Facebook"));
            if (build.contains(PatchFamily.MARKETPLACE_ONLY)) {
                // Facebook builds the tab bar once, and the hook is asked then and not again.
                opening.addPreference(toggle(context, Settings.MARKETPLACE_ONLY, L10n.t("Marketplace only"), ""));
                opening.addPreference(toggle(context, Settings.MARKETPLACE_QUIET_NOTIFICATIONS,
                        L10n.t("Quiet social notifications"),
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
                        L10n.t("Skip feed preloading"),
                        L10n.t("Reduce background feed loading while Marketplace mode is active. Some loading can still happen during startup.")));
            }
            if (build.contains(PatchFamily.START_TAB)) {
                opening.addPreference(toggle(context, Settings.OPEN_ON_CHOSEN_TAB, L10n.t("Open on a chosen tab"),
                        L10n.t("Choose where Facebook opens from its icon. Notifications and links still open their destination.")));
                opening.addPreference(startTabRow(context));
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
                || build.contains(PatchFamily.META_AI_QUESTIONS)
                || build.contains(PatchFamily.POST_DATES)
                || build.contains(PatchFamily.FEEDS_HEADER)) {
            PreferenceCategory feed = category(screen, L10n.t("News feed"));
            if (build.contains(PatchFamily.SPONSORED_POSTS)) {
                feed.addPreference(toggle(context, Settings.HIDE_SPONSORED_POSTS, L10n.t("Hide sponsored posts"),
                        L10n.t("Paid ads in the feed. They're dropped before Facebook adds them, so no gap is left.")));
                feed.addPreference(toggle(context, Settings.HIDE_PROMOTED_POSTS, L10n.t("Hide promoted posts"),
                        L10n.t("Posts Facebook files as promotions rather than as ads.")));
            }
            // Profiles have no section of their own; their ads sit with the feed's.
            if (build.contains(PatchFamily.SPONSORED_PROFILE_POSTS)) {
                feed.addPreference(toggle(context, Settings.HIDE_SPONSORED_PROFILE_POSTS,
                        L10n.t("Hide sponsored profile posts"),
                        L10n.t("Ads between the posts on someone's profile or a Page. Their own posts stay.")));
            }
            // One switch covers the cards on reels and in the comment sheet too.
            if (build.contains(PatchFamily.AFFILIATE_LINKS)) {
                feed.addPreference(toggle(context, Settings.HIDE_AFFILIATE_LINKS,
                        L10n.t("Hide affiliate product links"),
                        L10n.t("The product cards of shop links creators add to posts, on reels, under feed posts and "
                                + "in the comments. The \"Commission eligible\" label stays.")));
            }
            if (build.contains(PatchFamily.SUGGESTED_POSTS)) {
                feed.addPreference(toggle(context, Settings.HIDE_SUGGESTED_POSTS,
                        L10n.t("Hide page suggestions and Facebook's own promos"),
                        L10n.t("\"Pages you may like\" cards and the cards Facebook uses to push its own features. "
                                + "In-feed surveys go too.")));
                feed.addPreference(toggle(context, Settings.HIDE_SUGGESTED_FOR_YOU,
                        L10n.t("Hide \"Suggested for you\" posts"),
                        L10n.t("Posts Facebook slips into your feed from people and pages you don't follow and groups you haven't joined.")));
                // The Stories tray's cards are filtered by Hide suggested stories' hook, so the
                // switch reaches them only when that patch is in too.
                feed.addPreference(toggle(context, Settings.HIDE_PEOPLE_YOU_MAY_KNOW,
                        L10n.t("Hide \"People you may know\""),
                        build.contains(PatchFamily.SUGGESTED_STORIES)
                                ? L10n.t("The row of friend suggestions between posts, the one on your own profile, "
                                        + "and the cards with an Add button in the Stories tray.")
                                : L10n.t("The row of friend suggestions between posts, and the one on your own profile.")));
                feed.addPreference(toggle(context, Settings.HIDE_SUGGESTED_GROUPS,
                        L10n.t("Hide suggested groups"),
                        L10n.t("The row of groups to join between posts, with its Discover more groups button. "
                                + "Posts from groups you're in stay.")));
                feed.addPreference(toggle(context, Settings.HIDE_STORIES_YOU_MIGHT_LIKE,
                        L10n.t("Hide \"Stories you might like\""),
                        L10n.t("The row of Stories from people you aren't connected to that Facebook puts between "
                                + "posts. Your friends' Stories and the Stories tray stay.")));
            }
            if (build.contains(PatchFamily.STORIES_TRAY)) {
                // Facebook builds the feed's adapters once, when the feed is set up, and the tray is
                // one of them. The hook is asked then and not again, so a change waits for a restart.
                feed.addPreference(toggle(context, Settings.HIDE_STORIES_TRAY, L10n.t("Hide the Stories tray"),
                        L10n.t("The row of stories at the top of the feed, Create story included, and the rows of "
                                + "stories between posts.") + " "
                                + L10n.t("The switch takes effect when Facebook restarts.")));
            }
            if (build.contains(PatchFamily.FEED_REELS)) {
                feed.addPreference(toggle(context, Settings.HIDE_FEED_REELS, L10n.t("Hide Reels in the feed"),
                        L10n.t("The rows of reels between posts, and the reels Facebook adds where your feed ends.")));
            }
            if (build.contains(PatchFamily.POST_PROMPTS)) {
                feed.addPreference(toggle(context, Settings.HIDE_POST_PROMPTS, L10n.t("Hide post prompts"),
                        L10n.t("The strip on some posts, like \"Are you interested in this post?\", \"Show less\" "
                                + "or who recently commented, and the follow and chat suggestions in the same place. "
                                + "The post stays.")));
            }
            if (build.contains(PatchFamily.META_AI_QUESTIONS)) {
                feed.addPreference(toggle(context, Settings.HIDE_META_AI_QUESTIONS,
                        L10n.t("Hide Meta AI questions under posts"),
                        L10n.t("The row of Meta AI questions under some posts. The post, its link card and its "
                                + "buttons stay.")));
            }
            if (build.contains(PatchFamily.POST_DATES)) {
                feed.addPreference(toggle(context, Settings.KEEP_POST_DATES, L10n.t("Keep post dates"),
                        L10n.t("The line under the poster's name keeps the post's date instead of Facebook's "
                                + "rotating details, which go blank on some phones.")));
            }
            if (build.contains(PatchFamily.FEEDS_HEADER)) {
                // Facebook settles the Feeds tab's header as the tab is built, so a change waits for a restart.
                feed.addPreference(toggle(context, Settings.HIDE_FEEDS_HEADER, L10n.t("Hide the Feeds header"),
                        L10n.t("Open the Feeds tab on its posts, without the title row or the filters under it. "
                                + "Restart Facebook after changing it.")));
            }
            if (build.contains(PatchFamily.RETURN_REFRESH)) {
                feed.addPreference(toggle(context, Settings.BLOCK_RETURN_REFRESH,
                        L10n.t("Keep feed position on return"),
                        L10n.t("Returning to Facebook within ten minutes keeps your place. Pull to refresh still works.")));
                feed.addPreference(toggle(context, Settings.RETURN_REFRESH_NO_LIMIT,
                        L10n.t("No time limit"),
                        L10n.t("With the switch above on, your place stays however long you're away. Pull to refresh and a fresh start still load new posts.")));
            }
            if (build.contains(PatchFamily.AI_DETECTED_POSTS)) {
                feed.addPreference(toggle(context, Settings.HIDE_AI_DETECTED_POSTS, L10n.t("Hide AI-detected posts"),
                        L10n.t("Posts that Facebook's own detection marks as made with AI. A post that only its "
                                + "creator labelled as AI stays. It's off by default because it hasn't been tested "
                                + "on a real feed yet.")));
                feed.addPreference(toggle(context, Settings.HIDE_AI_LABELLED_POSTS,
                        L10n.t("Also hide posts labelled as AI"),
                        L10n.t("Posts whose creator marked them as made with AI. Facebook puts its AI label next to "
                                + "the name on these as well as on the posts its detection found, and with this on, "
                                + "both kinds go. It's off by default because it hasn't been tested on a real feed "
                                + "yet.")));
            }
            if (build.contains(PatchFamily.POST_WORDS)) {
                feed.addPreference(toggle(context, Settings.HIDE_POSTS_WITH_WORDS,
                        L10n.t("Hide posts with words you choose"),
                        L10n.t("Posts whose text has a word or phrase from your list below. A post with a word from "
                                + "your keep list stays, and so does a post with no text. Your words only leave the "
                                + "phone in a settings file you export.")));
                feed.addPreference(page.wordsRow(context, Settings.HIDDEN_WORDS, true));
                feed.addPreference(page.wordsRow(context, Settings.KEPT_WORDS, false));
            }
        }
    }

    /** Stories. */
    static void stories(HushfacebookPreferenceFragment page, PreferenceScreen screen, Context context,
            Set<PatchFamily> build) {
        if (build.contains(PatchFamily.SPONSORED_STORIES) || build.contains(PatchFamily.SUGGESTED_STORIES)
                || build.contains(PatchFamily.STORY_AUTO_ADVANCE) || build.contains(PatchFamily.STORY_SEEN)
                || build.contains(PatchFamily.STORY_DOWNLOAD)) {
            PreferenceCategory stories = category(screen, L10n.t("Stories"));
            if (build.contains(PatchFamily.SPONSORED_STORIES)) {
                stories.addPreference(toggle(context, Settings.HIDE_SPONSORED_STORIES, L10n.t("Hide sponsored stories"),
                        L10n.t("Ad cards between the stories people posted.")));
            }
            if (build.contains(PatchFamily.SUGGESTED_STORIES)) {
                // The tray's buckets are filtered as each answer of its fetch comes in, so a change
                // shows when Facebook next loads the tray, not on the tray already drawn.
                stories.addPreference(toggle(context, Settings.HIDE_SUGGESTED_STORIES,
                        L10n.t("Hide suggested stories"),
                        L10n.t("Keep friends and followed Pages in the Stories tray. Applies when Facebook next loads the tray.")));
                stories.addPreference(toggle(context, Settings.HIDE_CONTACT_IMPORT_CARD,
                        L10n.t("Hide \"Find friends from contacts\""),
                        L10n.t("The Stories tray card asking to upload your contacts. Applies when Facebook next loads the tray.")));
            }
            if (build.contains(PatchFamily.STORY_AUTO_ADVANCE)) {
                stories.addPreference(toggle(context, Settings.BLOCK_STORY_AUTO_ADVANCE,
                        L10n.t("Stop Story auto-advance"),
                        L10n.t("A finished story stays on screen until you tap or swipe. Turn this off for Facebook's timing.")));
            }
            if (build.contains(PatchFamily.STORY_SEEN)) {
                stories.addPreference(toggle(context, Settings.VIEW_STORIES_ANONYMOUSLY,
                        L10n.t("View stories anonymously"),
                        L10n.t("Facebook isn't told which stories you watch, so you stay off their viewer lists. "
                                + "Replying or reacting still shows you, and stories you've watched keep their "
                                + "unwatched ring.")));
            }
            if (build.contains(PatchFamily.STORY_DOWNLOAD)) {
                stories.addPreference(toggle(context, Settings.DOWNLOAD_STORIES, L10n.t("Save any story"),
                        L10n.t("Add Save to every story menu, using your download quality. Off or paused, Facebook only saves your own stories.")));
            }
        }
    }

    /** Comments: the order they open in. */
    static void comments(HushfacebookPreferenceFragment page, PreferenceScreen screen, Context context,
            Set<PatchFamily> build) {
        if (build.contains(PatchFamily.DEFAULT_COMMENT_ORDER)) {
            PreferenceCategory comments = category(screen, L10n.t("Comments"));
            comments.addPreference(toggle(context, Settings.DEFAULT_COMMENT_ORDER, L10n.t("Default comment order"),
                    L10n.t("Use the order below. A choice made on a post lasts until restart. Links to comments keep Facebook's order.")));
            comments.addPreference(commentOrderRow(context));
        }
    }

    /** Writing: when Facebook suggests someone to tag. */
    static void writing(HushfacebookPreferenceFragment page, PreferenceScreen screen, Context context,
            Set<PatchFamily> build) {
        if (build.contains(PatchFamily.TAG_SUGGESTIONS)) {
            PreferenceCategory writing = category(screen, L10n.t("Writing"));
            writing.addPreference(toggle(context, Settings.TAG_SUGGESTIONS_ONLY_AFTER_AT,
                    L10n.t("Tag suggestions only after @"),
                    L10n.t("Type @ before Facebook suggests someone to tag in posts or comments. Your text stays unchanged.")));
        }
    }
}
