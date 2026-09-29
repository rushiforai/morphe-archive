/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 *
 * The rules follow the feed guards of https://github.com/andrewliang25/morphe-patches (GPL-3.0,
 * Andrew Liang: the SPONSORED category and the suggested unit list) and of
 * https://github.com/SapitoSucio/FroggoMorphePatches (GPL-3.0: the PROMOTION category, and the
 * AI filter the GenAI rule follows).
 */
package app.morphe.extension.facebook.feed;

import app.morphe.extension.facebook.settings.FamilyNames;
import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.facebook.settings.SettingsStatus;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.diagnostics.FeedFilterCounters;
import app.morphe.extension.shared.diagnostics.HookStatus;
import app.morphe.extension.shared.settings.BaseSettings;

import java.lang.reflect.InvocationTargetException;
import java.util.concurrent.atomic.AtomicInteger;

/**
 * What the news feed guard asks about each edge before Facebook adds it to the feed.
 *
 * <p>The guard runs at the start of {@code FeedUnitCollectionManager.addNewEdgeToCollection},
 * the one funnel every news feed edge is added through. Answering true there makes the method
 * return false, which Facebook already handles: it logs "Edge not added to FUC" and carries on,
 * so a hidden post leaves no gap and logs no impression. An edge swapped in over another one
 * never passes the funnel, so the swap asks the same rules through {@link #hideSwappedEdge}.
 *
 * <p>Every feed filter shares this one guard. Two patches each prepending their own guard to the
 * same method is how FroggoMorphePatches ended up with branch targets that pointed into the wrong
 * code, so the patches here only switch their rule on and the rules live in Java.
 */
@SuppressWarnings("unused")
public final class FeedFilter {
    private static final String SPONSORED = "SPONSORED";
    private static final String PROMOTION = "PROMOTION";

    /**
     * The GraphQL type the "People you may know" row answers {@code getTypeName()} with. Its class
     * is renamed on every release and shared with GroupsYouShouldJoinFeedUnit and
     * FriendRequestsFeedUnit, but {@code getTypeName()} answers by the model's type tag, and each
     * type name is a literal in it, in 577 and 580. So the name picks this row and leaves the others.
     */
    static final String PEOPLE_YOU_MAY_KNOW_TYPE = "PaginatedPeopleYouMayKnowFeedUnit";

    /**
     * The GraphQL type the suggested groups row answers: groups to join, under a "Suggested for
     * you" header, with a "Discover more groups" button. Its model is the People you may know one,
     * whose {@code getTypeName()} answers this name for its own type tag in 577 and 580. A post
     * from a group you're in is a Story, and friend requests answer FriendRequestsFeedUnit, so
     * neither matches.
     */
    static final String GROUPS_YOU_SHOULD_JOIN_TYPE = "GroupsYouShouldJoinFeedUnit";

    /**
     * The GraphQL type of the feed's rows of Stories between posts, a literal of the shared showcase
     * model's {@code getTypeName()} in 577 and 580. Facebook draws one with its DiscoverUnitComponent,
     * which reads {@link #UNCONNECTED_STORIES_FLAG} to tell a row of Stories from people you aren't
     * connected to, "Stories you might like", from a row of your friends' Stories.
     */
    static final String DISCOVER_UNIT_TYPE = "DiscoverFeedUnit";
    static final String UNCONNECTED_STORIES_FLAG = "is_unconnected_mbsu";
    private static final int UNCONNECTED_STORIES_KEY = UNCONNECTED_STORIES_FLAG.hashCode();
    /** What a read of that flag found, as the report counts it. Only the first hides anything. */
    static final String UNCONNECTED = "unconnected";
    static final String CONNECTED = "connected";

    /** The diagnostic counter routes. Each news feed edge counts as a list of one post. */
    static final String FEED_ROUTE = "News feed posts";
    static final String STORY_ROUTE = "Story ad sources";
    /**
     * The edges the GenAI rule read, counted only while its switch is on. Its kinds say what each
     * read found, so a report shows why the posts it kept were kept.
     */
    static final String AI_ROUTE = "GenAI flag";
    /**
     * The stories the creator's AI label rule read, counted only while its switch is on, with what
     * each read of the self-disclosed flag found as the kind.
     */
    static final String AI_LABEL_ROUTE = "Creator AI label flag";
    /**
     * The stories the "Suggested for you" rule read, counted only while its switch is on, with what
     * each read of Facebook's recommendation flag found as the kind.
     */
    static final String RECOMMENDATION_ROUTE = "Recommendation flag";
    /**
     * The rows of Stories between posts the "Stories you might like" rule read, counted only while
     * its switch is on, with what each read of the row's flag found as the kind.
     */
    static final String STORIES_YOU_MIGHT_LIKE_ROUTE = "Stories you might like";
    /**
     * The stories the word filter read, counted only while its switch is on, with which list
     * matched or why nothing was read as the kind. Never a word or a phrase.
     */
    static final String WORDS_ROUTE = "Your words";
    /** What a post the word filter hid counts under on the feed's route. */
    static final String WORDS_REASON = "word filter";
    /** The kind a post counts under while the hide list is empty, when nothing of it is read. */
    static final String NO_WORDS = "no words listed";
    /**
     * The Stories tray adapters the feed asked for, each call counted with its adapter as the kind,
     * and a skipped one as a removal. The tray is never a feed edge: the feed's adapter list adds it
     * as an adapter of its own, so it never reaches the edge guard.
     */
    static final String TRAY_ROUTE = "Stories tray adapters";

    /**
     * The story categories Facebook files the feed's rows of reels under: the "Reels" carousels
     * between posts, their fallback, and the reels it adds where the feed you follow ends. On a
     * signed-in 580 each arrived as a ShowcaseFeedUnit edge (S25, 2026-09-25). The names are the
     * enum's own, which the obfuscator keeps, and the patch holds both builds to all three.
     */
    static final String[] REELS_CATEGORIES = {"FB_SHORTS", "FB_SHORTS_FALLBACK", "END_OF_FEED_REELS"};

    /**
     * What the reels rule read beyond the category: the story type of each ShowcaseFeedUnit it
     * looked at while its switch was on, and every call of the pre-EOF injector, which builds a
     * "Reels" row of its own and adds it to the feed without passing the edge guard.
     */
    static final String REELS_ROUTE = "Reels in feed";
    /** The kind and the removal reason a pre-EOF injector call counts under. */
    static final String PRE_EOF_UNIT = "pre-EOF unit";

    /** The adapter the patch passes: the classic tray, or the unified one a server gate turns on. */
    public static final int LEGACY_TRAY = 0;
    public static final int UNIFIED_TRAY = 1;

    /**
     * Units Facebook injects into the feed that are not posts from anyone you follow. Every one
     * keeps its real name through Meta's obfuscator, so the check needs no obfuscated identifier.
     *
     * <p>Left out on purpose: {@code GraphQLFriendsLocationsFeedUnit}, a real feature. People You
     * May Know and suggested groups aren't here either: their unit class is Redex-renamed and
     * shared with other rows, so their own rules read the GraphQL type name the unit answers
     * ({@link #PEOPLE_YOU_MAY_KNOW_TYPE}, {@link #GROUPS_YOU_SHOULD_JOIN_TYPE}).
     */
    private static final String[] SUGGESTED_UNITS = {
            // "Pages you may like" and its variants.
            "com.facebook.graphql.model.GraphQLPagesYouMayLikeFeedUnit",
            "com.facebook.graphql.model.GraphQLPaginatedPagesYouMayLikeFeedUnit",
            "com.facebook.graphql.model.GraphQLCreativePagesYouMayLikeFeedUnit",
            "com.facebook.graphql.model.GraphQLPYMLWithLargeImageFeedUnit",
            "com.facebook.graphql.model.GraphQLPagesYouMayFollowFeedUnit",
            "com.facebook.graphql.model.GraphQLPagesYouMayAdvertiseFeedUnit",
            "com.facebook.graphql.model.GraphQLPymgfFeedUnit",
            // Facebook's own in-feed upsell nags.
            "com.facebook.graphql.model.GraphQLQuickPromotionFeedUnit",
            "com.facebook.graphql.model.GraphQLQuickPromotionNativeTemplateFeedUnit",
            "com.facebook.graphql.model.GraphQLEndOfFeedUpsellCustomNTFeedUnit",
            "com.facebook.graphql.model.GraphQLExploreFeedUpsellNTUnit",
            "com.facebook.graphql.model.GraphQLGreetingCardPromotionFeedUnit",
            // In-feed prompts and experiment slots.
            "com.facebook.graphql.model.GraphQLStoryGallerySurveyFeedUnit",
            "com.facebook.graphql.model.GraphQLBusinessPageReviewFeedUnit",
            "com.facebook.graphql.model.GraphQLHoldoutAdFeedUnit",
    };

    /** The unit classes this build carries, looked up once. A class Facebook dropped is skipped. */
    private static volatile Class<?>[] suggestedClasses;

    private FeedFilter() {
    }

    /**
     * Injection point, at the start of the feed funnel. Whether the edge with this story category
     * and this feed unit stays out of the news feed. Never throws: false leaves the edge to
     * Facebook.
     *
     * @param category the edge's {@code GraphQLFeedStoryCategory} constant.
     * @param feedUnit the edge's feed unit, inflated if the tree had not built it yet.
     */
    public static boolean hideEdge(Object category, Object feedUnit) {
        return withPatches(category, feedUnit);
    }

    /**
     * The guard with every patch-time flag and filled stub this build carries. The swap guard asks
     * this rather than {@link #hideEdge(Object, Object)}: the mutation contract holds a patched APK
     * to one call of that, the funnel's, and counts the extension's own calls too.
     */
    private static boolean withPatches(Object category, Object feedUnit) {
        return hideEdge(category, feedUnit, SettingsStatus.sponsoredPosts(), SettingsStatus.suggestedPosts(),
                RecommendationLabel.PATCHED, SettingsStatus.aiDetectedPosts(), GenAiLabel.PATCHED,
                SettingsStatus.feedReels(), ShowcaseType.PATCHED, SettingsStatus.postWords(), PostText.MESSAGE,
                PostText.ATTACHED, GenAiLabel.SELF_LABEL_PATCHED);
    }

    /** The guard with the sponsored and suggested patch-time flags passed in, and no GenAI rule. */
    static boolean hideEdge(Object category, Object feedUnit, boolean sponsoredPatched, boolean suggestedPatched) {
        return hideEdge(category, feedUnit, sponsoredPatched, suggestedPatched, RecommendationLabel.PATCHED, false,
                GenAiLabel.PATCHED);
    }

    /**
     * The guard, with the three patch-time flags passed in so a test can stand in for the patches,
     * and the recommendation and GenAI accessors passed in so a test can stand in for the stubs the
     * patches fill in.
     *
     * <p>Every edge is counted before any rule runs, and every hidden one records why, so a
     * diagnostic report shows the guard is alive and what it took out without anyone having to
     * turn debug logging on first. The category name is an enum constant and the reason is a
     * kept class name or a GraphQL field name; none of them is content.
     *
     * <p>The two rules built on a story flag, "Suggested for you" and GenAI, read a story only while
     * their switch is on, so with the switch off or Hushfacebook paused they read nothing of the post
     * and Facebook's own path is all that runs.
     */
    static boolean hideEdge(Object category, Object feedUnit, boolean sponsoredPatched, boolean suggestedPatched,
            StoryFlag.Accessor recommendationAccessor, boolean aiPatched, StoryFlag.Accessor aiAccessor) {
        return hideEdge(category, feedUnit, sponsoredPatched, suggestedPatched, recommendationAccessor, aiPatched,
                aiAccessor, false);
    }

    /** The guard with the reels patch's flag passed in too, and the showcase stub it fills. */
    static boolean hideEdge(Object category, Object feedUnit, boolean sponsoredPatched, boolean suggestedPatched,
            StoryFlag.Accessor recommendationAccessor, boolean aiPatched, StoryFlag.Accessor aiAccessor,
            boolean reelsPatched) {
        return hideEdge(category, feedUnit, sponsoredPatched, suggestedPatched, recommendationAccessor, aiPatched,
                aiAccessor, reelsPatched, ShowcaseType.PATCHED);
    }

    /** The guard with the showcase story type accessor passed in, so a test can stand in for it. */
    static boolean hideEdge(Object category, Object feedUnit, boolean sponsoredPatched, boolean suggestedPatched,
            StoryFlag.Accessor recommendationAccessor, boolean aiPatched, StoryFlag.Accessor aiAccessor,
            boolean reelsPatched, StoryFlag.Accessor showcaseAccessor) {
        return hideEdge(category, feedUnit, sponsoredPatched, suggestedPatched, recommendationAccessor, aiPatched,
                aiAccessor, reelsPatched, showcaseAccessor, false, PostText.MESSAGE, PostText.ATTACHED);
    }

    /**
     * The guard with the word filter's flag passed in too, and the two text accessors its patch
     * fills, so a test can stand in for them.
     *
     * <p>The word filter reads a post only while its switch is on and its hide list holds a
     * phrase. Its kinds and its reason are shapes; the words it read and the phrase that matched
     * go nowhere.
     */
    static boolean hideEdge(Object category, Object feedUnit, boolean sponsoredPatched, boolean suggestedPatched,
            StoryFlag.Accessor recommendationAccessor, boolean aiPatched, StoryFlag.Accessor aiAccessor,
            boolean reelsPatched, StoryFlag.Accessor showcaseAccessor, boolean wordsPatched,
            StoryFlag.Accessor messageAccessor, StoryFlag.Accessor attachedAccessor) {
        return hideEdge(category, feedUnit, sponsoredPatched, suggestedPatched, recommendationAccessor, aiPatched,
                aiAccessor, reelsPatched, showcaseAccessor, wordsPatched, messageAccessor, attachedAccessor,
                GenAiLabel.SELF_LABEL_PATCHED);
    }

    /**
     * The guard with the GenAI patch's second stub passed in too, the creator's AI label, so a test
     * can stand in for it.
     *
     * <p>Facebook's header label shows on either GenAI flag: the one its detection sets, and the one
     * a post's creator sets. The detection rule reads the first while either GenAI switch is on, and
     * the label rule reads the second only while its own switch is on, after the first found nothing,
     * so with that switch on every post carrying either flag goes and with it off nothing changes.
     */
    static boolean hideEdge(Object category, Object feedUnit, boolean sponsoredPatched, boolean suggestedPatched,
            StoryFlag.Accessor recommendationAccessor, boolean aiPatched, StoryFlag.Accessor aiAccessor,
            boolean reelsPatched, StoryFlag.Accessor showcaseAccessor, boolean wordsPatched,
            StoryFlag.Accessor messageAccessor, StoryFlag.Accessor attachedAccessor,
            StoryFlag.Accessor aiLabelAccessor) {
        try {
            if (sponsoredPatched) HookStatus.invoked(FamilyNames.SPONSORED_POSTS);
            if (reelsPatched) HookStatus.invoked(FamilyNames.FEED_REELS);
            if (wordsPatched) HookStatus.invoked(FamilyNames.POST_WORDS);
            if (suggestedPatched) {
                HookStatus.invoked(FamilyNames.SUGGESTED_POSTS);
                reportSuggestedClasses();
                RecommendationLabel.FLAG.report();
            }
            if (aiPatched) {
                HookStatus.invoked(FamilyNames.AI_DETECTED_POSTS);
                GenAiLabel.FLAG.report();
            }
            FeedFilterCounters.sawList(FEED_ROUTE, 1);
            String categoryName = category instanceof Enum ? ((Enum<?>) category).name() : null;
            FeedFilterCounters.sawKind(FEED_ROUTE, categoryName);
            // What kind of post this is, for a report of what reaches the feed: an enum constant, a
            // GraphQL type name and what Facebook's recommendation and GenAI flags read, never the
            // post itself. Built only when debug logging is on, and the flags and the showcase type
            // only read with the patch that fills their accessor.
            Logger.printDebug(() -> {
                String type = typeName(feedUnit);
                return "Feed edge: " + categoryName + " " + type + " ifr="
                        + (suggestedPatched ? recommendationFlag(feedUnit, recommendationAccessor) : "none")
                        + (reelsPatched ? " showcase=" + showcaseFor(type, feedUnit, showcaseAccessor) : "")
                        + (suggestedPatched && DISCOVER_UNIT_TYPE.equals(type)
                                ? " stories=" + unconnectedStories(feedUnit) : "")
                        + (aiPatched ? " genai=" + flagValue(GenAiLabel.FLAG, feedUnit, aiAccessor)
                                + " ailabel=" + flagValue(GenAiLabel.SELF_LABEL, feedUnit, aiLabelAccessor) : "");
            });
            // An edge a prefetch adds before the settings are ready stays: no switch can be read yet.
            if (!Utils.settingsReady()) return false;

            String reason = null;
            if (sponsoredPatched && hiddenCategory(category)) {
                reason = categoryName;
            }
            if (reason == null && reelsPatched && Settings.HIDE_FEED_REELS.get()) {
                reason = isReelsCategory(categoryName) ? categoryName : showcaseReason(feedUnit, showcaseAccessor);
            }
            if (reason == null && suggestedPatched) {
                if (Settings.HIDE_SUGGESTED_POSTS.get()) reason = suggestedUnitName(feedUnit);
                if (reason == null && Settings.HIDE_SUGGESTED_FOR_YOU.get()) {
                    reason = flagReason(RecommendationLabel.FLAG, RECOMMENDATION_ROUTE, feedUnit, recommendationAccessor);
                }
                boolean storiesYouMightLike = Settings.HIDE_STORIES_YOU_MIGHT_LIKE.get();
                if (reason == null && (Settings.HIDE_PEOPLE_YOU_MAY_KNOW.get() || Settings.HIDE_SUGGESTED_GROUPS.get()
                        || storiesYouMightLike)) {
                    String type = typeName(feedUnit);
                    reason = suggestedTypeReason(type);
                    if (reason == null && storiesYouMightLike && DISCOVER_UNIT_TYPE.equals(type)) {
                        reason = unconnectedStoriesReason(feedUnit);
                    }
                }
            }
            boolean aiLabelled = aiPatched && Settings.HIDE_AI_LABELLED_POSTS.get();
            if (reason == null && aiPatched && (aiLabelled || Settings.HIDE_AI_DETECTED_POSTS.get())) {
                reason = flagReason(GenAiLabel.FLAG, AI_ROUTE, feedUnit, aiAccessor);
            }
            if (reason == null && aiLabelled) {
                reason = flagReason(GenAiLabel.SELF_LABEL, AI_LABEL_ROUTE, feedUnit, aiLabelAccessor);
            }
            if (reason == null && wordsPatched && Settings.HIDE_POSTS_WITH_WORDS.get()) {
                reason = wordsReason(feedUnit, messageAccessor, attachedAccessor);
            }
            if (reason == null) return false;

            FeedFilterCounters.removed(FEED_ROUTE, 1, reason);
            final String hidden = reason;
            Logger.printDebug(() -> "Feed filter: hid a " + hidden + " post");
            return true;
        } catch (Throwable failure) {
            if (sponsoredPatched) HookStatus.threw(FamilyNames.SPONSORED_POSTS, "feed guard", failure);
            if (reelsPatched) HookStatus.threw(FamilyNames.FEED_REELS, "feed guard", failure);
            if (suggestedPatched) HookStatus.threw(FamilyNames.SUGGESTED_POSTS, "feed guard", failure);
            if (aiPatched) HookStatus.threw(FamilyNames.AI_DETECTED_POSTS, "feed guard", failure);
            if (wordsPatched) HookStatus.threw(FamilyNames.POST_WORDS, "feed guard", failure);
            Logger.printException(() -> "Feed filter: could not judge an edge", failure);
            return false;
        }
    }

    /**
     * A rule built on a story flag: the flag's name when it reads a definite true for this unit,
     * otherwise null. Every unit it reads is counted on the rule's own route under what the read
     * found, so a kept post always has a reason in the report.
     */
    private static String flagReason(StoryFlag flag, String route, Object feedUnit, StoryFlag.Accessor accessor) {
        StoryFlag.Outcome outcome = flag.read(feedUnit, accessor);
        String why = flag.reason(outcome);
        FeedFilterCounters.sawList(route, 1);
        FeedFilterCounters.sawKind(route, why);
        if (!outcome.hides) return null;
        FeedFilterCounters.removed(route, 1, why);
        return flag.flag;
    }

    /**
     * The rules built on a unit's GraphQL type name: the name, when it's People you may know or
     * suggested groups and that row's switch is on, otherwise null. A name that couldn't be read
     * is null, so the unit stays.
     */
    private static String suggestedTypeReason(String type) {
        if (PEOPLE_YOU_MAY_KNOW_TYPE.equals(type)) {
            return Settings.HIDE_PEOPLE_YOU_MAY_KNOW.get() ? PEOPLE_YOU_MAY_KNOW_TYPE : null;
        }
        if (GROUPS_YOU_SHOULD_JOIN_TYPE.equals(type)) {
            return Settings.HIDE_SUGGESTED_GROUPS.get() ? GROUPS_YOU_SHOULD_JOIN_TYPE : null;
        }
        return null;
    }

    /**
     * The "Stories you might like" rule for a unit that answers {@link #DISCOVER_UNIT_TYPE}: its
     * reason when the row's {@link #UNCONNECTED_STORIES_FLAG} reads a definite true, otherwise null,
     * so a row of your friends' Stories, and one this can't read, stays. Every row it reads is
     * counted on its own route under what the read found.
     */
    private static String unconnectedStoriesReason(Object feedUnit) {
        String kind = unconnectedStories(feedUnit);
        FeedFilterCounters.sawList(STORIES_YOU_MIGHT_LIKE_ROUTE, 1);
        FeedFilterCounters.sawKind(STORIES_YOU_MIGHT_LIKE_ROUTE, kind);
        if (!UNCONNECTED.equals(kind)) return null;
        String reason = DISCOVER_UNIT_TYPE + ":" + UNCONNECTED_STORIES_FLAG;
        FeedFilterCounters.removed(STORIES_YOU_MIGHT_LIKE_ROUTE, 1, reason);
        return reason;
    }

    /**
     * What a row of Stories' {@link #UNCONNECTED_STORIES_FLAG} reads: {@link #UNCONNECTED},
     * {@link #CONNECTED}, or why it couldn't be read. It goes through
     * {@code BaseModelWithTree.getCachedBoolean}, the reader the story flags use, which checks the
     * native tree is still there first. Never throws.
     */
    static String unconnectedStories(Object feedUnit) {
        StoryFlag.Members found = StoryFlag.members();
        if (found.treeModel == null || found.cachedBoolean == null) return "reader missing";
        if (!found.treeModel.isInstance(feedUnit)) return "not a tree model";
        try {
            Object value = found.cachedBoolean.invoke(feedUnit, UNCONNECTED_STORIES_KEY);
            if (!(value instanceof Boolean)) return "read failed";
            return (Boolean) value ? UNCONNECTED : CONNECTED;
        } catch (InvocationTargetException failure) {
            HookStatus.threw(FamilyNames.SUGGESTED_POSTS, "Stories you might like flag reader", failure.getCause());
            return "read failed";
        } catch (ReflectiveOperationException | RuntimeException failure) {
            HookStatus.threw(FamilyNames.SUGGESTED_POSTS, "Stories you might like flag reader", failure);
            return "read failed";
        }
    }

    /**
     * The word filter: {@link #WORDS_REASON} when the post's own words, or those of the post it
     * shares, hold a phrase from the hide list and none from the keep list, otherwise null. Every
     * story it's asked about is counted on its route under which list matched or why nothing was
     * read, so a kept post always has a reason in the report. With the hide list empty nothing of
     * the post is read, and a post whose words can't be read is kept.
     */
    private static String wordsReason(Object feedUnit, StoryFlag.Accessor message, StoryFlag.Accessor attached) {
        FeedFilterCounters.sawList(WORDS_ROUTE, 1);
        PostWords.Rules rules = PostWords.rules(Settings.HIDDEN_WORDS.get(), Settings.KEPT_WORDS.get());
        if (rules.hidesNothing()) {
            FeedFilterCounters.sawKind(WORDS_ROUTE, NO_WORDS);
            return null;
        }
        PostText.Read read = PostText.read(feedUnit, message, attached);
        if (read.outcome != PostText.Outcome.TEXT) {
            FeedFilterCounters.sawKind(WORDS_ROUTE, read.outcome.reason);
            return null;
        }
        PostWords.Verdict verdict = rules.judge(read.texts);
        FeedFilterCounters.sawKind(WORDS_ROUTE, verdict.reason);
        if (verdict != PostWords.Verdict.HIDE) return null;
        FeedFilterCounters.removed(WORDS_ROUTE, 1, verdict.reason);
        PostWords.HIDDEN.incrementAndGet();
        return WORDS_REASON;
    }

    /**
     * The reels rule for an edge whose category isn't one of the reels categories: a
     * ShowcaseFeedUnit whose story type is a row of reels. Its reason is the type name and the story
     * type, such as {@code ShowcaseFeedUnit:SHOWCASE_SHORT_VIDEO}; any other unit, and a showcase
     * unit of another type or one this can't read, answers null and stays. Every showcase unit it
     * reads is counted on the reels route under the type it read. Any other unit never reaches the
     * accessor: the patch fills it for the one class that answers the showcase type name.
     */
    private static String showcaseReason(Object feedUnit, StoryFlag.Accessor accessor) {
        if (!ShowcaseType.UNIT_TYPE.equals(typeName(feedUnit))) return null;
        String type = ShowcaseType.read(feedUnit, accessor);
        FeedFilterCounters.sawList(REELS_ROUTE, 1);
        FeedFilterCounters.sawKind(REELS_ROUTE, type);
        if (!ShowcaseType.isReels(type)) return null;
        String reason = ShowcaseType.UNIT_TYPE + ":" + type;
        FeedFilterCounters.removed(REELS_ROUTE, 1, reason);
        return reason;
    }

    /** A showcase unit's story type for the debug line, or none for any other unit. */
    private static String showcaseFor(String typeName, Object feedUnit, StoryFlag.Accessor accessor) {
        return ShowcaseType.UNIT_TYPE.equals(typeName) ? ShowcaseType.read(feedUnit, accessor) : "none";
    }

    /** Facebook's recommendation flag for the debug line: true, false, or none when it can't say. */
    private static String recommendationFlag(Object feedUnit, StoryFlag.Accessor accessor) {
        return flagValue(RecommendationLabel.FLAG, feedUnit, accessor);
    }

    /** What a story flag reads for the debug line: true, false, or none when there's nothing to read. */
    private static String flagValue(StoryFlag flag, Object feedUnit, StoryFlag.Accessor accessor) {
        StoryFlag.Outcome outcome = flag.read(feedUnit, accessor);
        if (outcome == StoryFlag.Outcome.FLAGGED) return "true";
        if (outcome == StoryFlag.Outcome.NOT_FLAGGED) return "false";
        return "none";
    }

    /** Which Hook status row the suggested unit classes were last reported into. */
    private static volatile long reportedGeneration = -1;

    /**
     * The suggested unit classes this build carries, reported once per Hook status row: again
     * after a diagnostic clear, which empties the row this was written into. One class missing is
     * Facebook dropping a unit; all of them missing is a moved model package, and the rule then
     * hides nothing at all.
     */
    private static void reportSuggestedClasses() {
        long generation = HookStatus.generation();
        if (reportedGeneration == generation) return;
        reportedGeneration = generation;
        Class<?>[] found = suggestedClasses();
        for (Class<?> type : found) HookStatus.bound(FamilyNames.SUGGESTED_POSTS, type.getSimpleName());
        if (found.length == 0) {
            HookStatus.missingMember(FamilyNames.SUGGESTED_POSTS, "class", "com.facebook.graphql.model",
                    "any suggested feed unit");
        }
    }

    /**
     * Whether a story category is one the switches hide. The category arrives as the enum
     * constant itself: the obfuscator renames the enum's fields on every release, but
     * {@link Enum#name()} answers the literal the constant was built with.
     */
    static boolean hiddenCategory(Object category) {
        if (!(category instanceof Enum)) return false;
        String name = ((Enum<?>) category).name();
        if (SPONSORED.equals(name)) return Settings.HIDE_SPONSORED_POSTS.get();
        if (PROMOTION.equals(name)) return Settings.HIDE_PROMOTED_POSTS.get();
        return false;
    }

    /** Whether a story category is one Facebook files the feed's rows of reels under. */
    static boolean isReelsCategory(String categoryName) {
        if (categoryName == null) return false;
        for (String reels : REELS_CATEGORIES) {
            if (reels.equals(categoryName)) return true;
        }
        return false;
    }

    /** Whether the feed unit is one of the injected suggestion or upsell units. */
    static boolean isSuggested(Object feedUnit) {
        return suggestedUnitName(feedUnit) != null;
    }

    /** The kept name of the suggestion or upsell unit this feed unit is, or null for any other. */
    static String suggestedUnitName(Object feedUnit) {
        if (feedUnit == null) return null;
        for (Class<?> type : suggestedClasses()) {
            if (type.isInstance(feedUnit)) return type.getSimpleName();
        }
        return null;
    }

    /**
     * What a feed unit class offers for reading its type name: its public {@code getTypeName()},
     * or null when it has none, and its public {@code isValidGraphServicesJNIModel()}, or null.
     */
    private static final class TypeNameReader {
        final java.lang.reflect.Method typeName;
        final java.lang.reflect.Method valid;

        TypeNameReader(java.lang.reflect.Method typeName, java.lang.reflect.Method valid) {
            this.typeName = typeName;
            this.valid = valid;
        }

        static TypeNameReader of(Class<?> type) {
            return new TypeNameReader(publicMethod(type, "getTypeName", String.class),
                    publicMethod(type, "isValidGraphServicesJNIModel", boolean.class));
        }

        private static java.lang.reflect.Method publicMethod(Class<?> type, String name, Class<?> returns) {
            try {
                java.lang.reflect.Method found = type.getMethod(name);
                return found.getReturnType() == returns ? found : null;
            } catch (NoSuchMethodException none) {
                return null;
            }
        }
    }

    private static final java.util.concurrent.ConcurrentHashMap<Class<?>, TypeNameReader> TYPE_NAME_READERS =
            new java.util.concurrent.ConcurrentHashMap<>();

    /**
     * The GraphQL type name a feed unit answers, or null when it has no {@code getTypeName()}, its
     * native tree is gone, or the call fails. Facebook's generated models all keep that method's
     * name, whatever their own class is renamed to, and it answers a literal. A unit this can't read
     * is kept: the rules built on it fail open.
     *
     * <p>A model whose tree Facebook already released answers {@code getTypeName()} from native code
     * with nothing behind it, and no try block catches what that does, so a unit that says its tree
     * isn't valid is never asked.
     *
     * <p>Public because the chips under a reel are generated models too, and the Reels clean-up
     * reads their type the same way.
     */
    public static String typeName(Object feedUnit) {
        if (feedUnit == null) return null;
        try {
            TypeNameReader reader = TYPE_NAME_READERS.computeIfAbsent(feedUnit.getClass(), TypeNameReader::of);
            if (reader.typeName == null) return null;
            if (reader.valid != null && !Boolean.TRUE.equals(reader.valid.invoke(feedUnit))) return null;
            Object name = reader.typeName.invoke(feedUnit);
            return name instanceof String ? (String) name : null;
        } catch (Throwable failure) {
            return null;
        }
    }

    private static Class<?>[] suggestedClasses() {
        Class<?>[] found = suggestedClasses;
        if (found != null) return found;
        java.util.List<Class<?>> classes = new java.util.ArrayList<>(SUGGESTED_UNITS.length);
        ClassLoader loader = FeedFilter.class.getClassLoader();
        for (String name : SUGGESTED_UNITS) {
            try {
                classes.add(Class.forName(name, false, loader));
            } catch (Throwable missing) {
                // This build has no such unit. Nothing to hide for it.
            }
        }
        found = classes.toArray(new Class<?>[0]);
        suggestedClasses = found;
        if (found.length == 0) {
            Logger.printInfo(() -> "Feed filter: none of the suggested unit classes is in this build");
        }
        return found;
    }

    /**
     * Injection point, at the start of both Stories tray adapter methods of the feed's adapter
     * configuration. True makes the method return null, which is what it returns when Facebook
     * itself turns the tray off, and its callers only look a null up in the adapter list.
     *
     * <p>Until the settings are ready, and while Hushfacebook is paused, it answers false and the
     * tray is built as Facebook builds it.
     *
     * @param adapter {@link #LEGACY_TRAY} or {@link #UNIFIED_TRAY}, the method the patch hooked.
     */
    public static boolean hideStoriesTray(int adapter) {
        try {
            HookStatus.invoked(FamilyNames.STORIES_TRAY);
            String kind = adapter == UNIFIED_TRAY ? "unified" : "legacy";
            FeedFilterCounters.sawList(TRAY_ROUTE, 1);
            FeedFilterCounters.sawKind(TRAY_ROUTE, kind);
            boolean hide = Utils.settingsReady() && Settings.HIDE_STORIES_TRAY.get();
            if (hide) FeedFilterCounters.removed(TRAY_ROUTE, 1, kind + " adapter skipped");
            logTrayOnce(adapter, kind, hide);
            return hide;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.STORIES_TRAY, "stories tray adapter", failure);
            Logger.printException(() -> "Stories tray: could not read its switch", failure);
            return false;
        }
    }

    /** One bit per adapter and decision that has had its debug line, so each is logged once. */
    static final AtomicInteger TRAY_LOGGED = new AtomicInteger();

    /**
     * A debug line the first time each adapter is skipped or kept: which tray Facebook builds on
     * this phone, and what the switch did to it. Only once the settings can be read and debug
     * logging is on, so turning logging on later still gets the line.
     */
    private static void logTrayOnce(int adapter, String kind, boolean hide) {
        if (!Utils.settingsReady() || !BaseSettings.DEBUG.get()) return;
        int bit = 1 << ((adapter == UNIFIED_TRAY ? 2 : 0) + (hide ? 1 : 0));
        if ((TRAY_LOGGED.getAndUpdate(logged -> logged | bit) & bit) != 0) return;
        Logger.printDebug(() -> "Stories tray: " + (hide ? "skipped" : "kept") + " " + kind + " adapter");
    }

    /**
     * Injection point, at the start of the pre-EOF injector: the method that builds a "Reels" row of
     * its own shortly before the feed you follow ends and adds it at the tail of the feed. It never
     * goes through {@code addNewEdgeToCollection}, so the edge guard can't see that row. True makes
     * the method return before it builds anything, which is what it does when Facebook's own gate
     * turns it away.
     *
     * <p>Every call is counted on the reels route, and a skipped one as a removal. Until the settings
     * are ready, and while Hushfacebook is paused, it answers false and Facebook builds the row.
     */
    public static boolean hidePreEofReels() {
        try {
            HookStatus.invoked(FamilyNames.FEED_REELS);
            FeedFilterCounters.sawList(REELS_ROUTE, 1);
            FeedFilterCounters.sawKind(REELS_ROUTE, PRE_EOF_UNIT);
            boolean hide = Utils.settingsReady() && Settings.HIDE_FEED_REELS.get();
            if (hide) FeedFilterCounters.removed(REELS_ROUTE, 1, PRE_EOF_UNIT);
            logPreEofOnce(hide);
            return hide;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.FEED_REELS, "pre-EOF reels injector", failure);
            Logger.printException(() -> "Reels in feed: could not read its switch", failure);
            return false;
        }
    }

    /** One bit per decision that has had its debug line, so each is logged once. */
    static final AtomicInteger PRE_EOF_LOGGED = new AtomicInteger();

    /**
     * A debug line the first time the pre-EOF row is skipped or kept, which says Facebook asks for
     * that row on this account at all. Only once the settings can be read and debug logging is on,
     * so turning logging on later still gets the line.
     */
    private static void logPreEofOnce(boolean hide) {
        if (!Utils.settingsReady() || !BaseSettings.DEBUG.get()) return;
        int bit = hide ? 2 : 1;
        if ((PRE_EOF_LOGGED.getAndUpdate(logged -> logged | bit) & bit) != 0) return;
        Logger.printDebug(() -> "Reels in feed: " + (hide ? "skipped" : "kept") + " the pre-EOF Reels unit");
    }

    /**
     * Every edge Facebook swaps into the feed in another's place, with its category as the kind and
     * each one kept out as a removal, so a report says whether swaps happen on this account at all.
     */
    static final String SWAP_ROUTE = "Feed edge swaps";
    /** What each swap counts under on the sponsored patch's Hook status line. */
    static final String SWAP_KEPT = "edge swap kept";
    static final String SWAP_SKIPPED = "edge swap skipped";

    /**
     * Injection point, in the runnable FeedUnitCollectionManager posts when a feed data loader swaps
     * one edge for another, right after it reads the incoming edge and before it touches the feed.
     * Whether that edge stays out. True makes the runnable return there, so the old edge keeps its
     * place and nothing about the swap is logged as sent.
     *
     * <p>A swap replaces an edge in the feed collection without passing
     * {@code addNewEdgeToCollection}, and the ad hot-swaps Facebook runs go this way, each asking
     * for a SPONSORED edge. So the edge gets the funnel guard's own verdict: every switch, Pause and
     * the early prefetch rule apply as they do there, and it counts as a news feed post too. Never
     * throws: false leaves the swap to Facebook.
     */
    public static boolean hideSwappedEdge(Object category, Object feedUnit) {
        return swapped(category, SettingsStatus.sponsoredPosts(), withPatches(category, feedUnit));
    }

    /** The swap guard with the sponsored and suggested patch-time flags passed in, and no GenAI rule. */
    static boolean hideSwappedEdge(Object category, Object feedUnit, boolean sponsoredPatched, boolean suggestedPatched) {
        return swapped(category, sponsoredPatched, hideEdge(category, feedUnit, sponsoredPatched, suggestedPatched));
    }

    /** Counts a swap the guard judged, on its route and on the sponsored patch's line, and answers [hide]. */
    private static boolean swapped(Object category, boolean sponsoredPatched, boolean hide) {
        try {
            String kind = category instanceof Enum ? ((Enum<?>) category).name() : null;
            FeedFilterCounters.sawList(SWAP_ROUTE, 1);
            FeedFilterCounters.sawKind(SWAP_ROUTE, kind);
            if (hide) FeedFilterCounters.removed(SWAP_ROUTE, 1, kind == null ? "swap skipped" : kind + " swap skipped");
            if (sponsoredPatched) HookStatus.counted(FamilyNames.SPONSORED_POSTS, hide ? SWAP_SKIPPED : SWAP_KEPT);
        } catch (Throwable failure) {
            Logger.printException(() -> "Feed filter: could not count an edge swap", failure);
        }
        return hide;
    }

    /** Injection point. Whether the story viewer's ad bucket sources contribute nothing. */
    public static boolean hideSponsoredStories() {
        try {
            HookStatus.invoked(FamilyNames.SPONSORED_STORIES);
            FeedFilterCounters.sawList(STORY_ROUTE, 1);
            boolean hide = Utils.settingsReady() && Settings.HIDE_SPONSORED_STORIES.get();
            if (hide) FeedFilterCounters.removed(STORY_ROUTE, 1, "ad buckets skipped");
            return hide;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.SPONSORED_STORIES, "story ad sources", failure);
            Logger.printException(() -> "Story filter: could not read its switch", failure);
            return false;
        }
    }
}
