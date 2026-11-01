/*
 * Copyright 2026 HushTumblr contributors
 * https://github.com/SysAdminDoc/HushTumblr
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushtumblr.extension.tumblr.timeline;

import androidx.annotation.Nullable;

import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.function.Function;

import app.hushtumblr.extension.shared.Utils;
import app.hushtumblr.extension.shared.diagnostics.HookStatus;
import app.hushtumblr.extension.shared.settings.BooleanSetting;
import app.hushtumblr.extension.tumblr.settings.FamilyNames;
import app.hushtumblr.extension.tumblr.settings.PatchFamily;
import app.hushtumblr.extension.tumblr.settings.Settings;
import app.hushtumblr.extension.tumblr.rootmute.RootPostMutes;

/**
 * The one place the timeline switches take items out of a page Tumblr loaded.
 *
 * <p>Tumblr's API client builds every page of the dashboard as a {@code Timeline}, and every page
 * of a blog's posts, likes and blog search as a {@code TimelineResponse}, each from the list of
 * {@code TimelineObject}s it parsed. The patch passes that list through {@link #filter} first thing
 * in both constructors, so what a switch takes out never reaches Tumblr's adapters or its ad
 * logging. With every switch off, paused, or before HushTumblr has its settings, the list goes
 * through untouched.
 *
 * <p>A blog's posts, likes and blog search are subclasses that keep their own copy of the list they
 * hand {@code TimelineResponse}, and read that copy back. Each of their constructors passes its list
 * through {@link #filterKept} first, so the copy is the filtered one, and the base constructor it
 * goes on to hands that same list back untouched.
 *
 * <p>The rumblr model keeps its names, so the item's kind, its Sponsored label and how Tumblr is told
 * to show it are read by name. A carousel's own items are the one renamed getter, read through
 * {@link #carouselItems}. Anything that can't be read is kept: a filter that guesses could take a
 * post out.
 *
 * <p>Suggestion cards often come after a {@code TITLE} item carrying their heading ("Check out these
 * blogs"). A heading goes with the item right after it, and one that ends a page goes too while a
 * card switch is on, since its card may be the first item of the next page.
 *
 * <p>A blog, community or tag card is a suggestion only in a feed or between a search's posts. A
 * search lists the same kinds of card as its results, through the same two constructors, so those
 * switches act only on a page {@link PageSource} knows for a feed, or on the Posts tab of a search,
 * and leave its other tabs, cards and headings, alone.
 *
 * <p>The post switches (reblogs, video, photo and text posts, and the word list) are
 * {@link PostRules}'. A heading never goes with a post they take out.
 *
 * <p>A page that loses every item comes back empty, and Tumblr takes an empty page for the end of
 * a feed. {@link TimelinePaging} is told, so the fragment showing the page loads the next one.
 */
public final class TimelineFilter {
    private TimelineFilter() {}

    static final String TIMELINE_OBJECT = "com.tumblr.rumblr.model.TimelineObject";
    static final String TIMELINEABLE = "com.tumblr.rumblr.model.Timelineable";

    /** The kind of a heading item, whose text the server sends. */
    static final String TITLE = "TITLE";

    /** The kind of a post. Of a search's tabs, only Posts has any. */
    static final String POST = "POST";

    /** The kind of a lone button the server puts between items, Tumblr's {@code GenericButton}. */
    static final String BUTTON = "BUTTON";

    /** A link that does something where it's tapped, where a {@code WebLink} opens a page. */
    static final String ACTION_LINK = "com.tumblr.rumblr.model.link.ActionLink";

    /**
     * The constant name Tumblr's {@code SponsoredState} and {@code DisplayType} both give a paid
     * placement.
     */
    static final String SPONSORED = "SPONSORED";

    /**
     * The kinds of item that are an ad whatever else they carry, by the constant names Tumblr's
     * {@code TimelineObjectType} keeps. {@code BLAZED_POST} isn't one: it's a campaign in the list
     * of your own Blaze dashboard, which loads through the same page. A paid Blaze post in a feed is
     * a post served as sponsored, see {@link Model#isPaidPlacement}.
     */
    static final Set<String> AD_TYPES = Collections.unmodifiableSet(new HashSet<>(Arrays.asList(
            "GEMINI_AD", "FACEBOOK_BIDDAABLE", "NIMBUS_AD", "DISPLAY_IO_INTERSCROLLER_S2S_ADS", "VUNGLE_AD",
            "CLIENT_SIDE_AD", "CLIENT_SIDE_MEDIATION", "DISPLAY_IO_INTERSCROLLER_AD", "GOOGLE_NATIVE")));

    /**
     * Blogs Tumblr suggests you follow, as cards, rows and the small cards of a carousel, and the
     * prompts to follow the blog you're reading. Between a blog's own posts that's a "Like this?
     * Follow to see more" heading over a "Follow <blog>" button, a {@link #BUTTON} that only counts
     * here when it follows a blog, see {@link #followsABlog}. Tumblr's {@code BlogSubscriptionCta}
     * is the same prompt in one item, {@code BLOG_FOLLOW_CTA} or {@code BLOG_SUBSCRIPTION_CTA}.
     */
    static final Set<String> BLOG_TYPES = Collections.unmodifiableSet(new HashSet<>(Arrays.asList(
            "BLOG_CARD", "COMPACT_BLOG_CARD", "BLOG_ROW", "TINY_BLOG_CAROUSEL_CARD", BUTTON,
            "BLOG_FOLLOW_CTA", "BLOG_SUBSCRIPTION_CTA")));

    /**
     * Communities Tumblr suggests you join: the card a feed shows, alone or in a carousel. A
     * {@code COMMUNITY_ROW} isn't one. It's a line in a list of communities, the ones under a
     * category of Communities' Browse page or in a search's Communities tab. Browse loads through
     * the dashboard's own response, so only the kind tells its list from a feed, and with rows in
     * here a category came up empty. A community's own header card isn't here either: it heads that
     * community's page.
     */
    static final Set<String> COMMUNITY_TYPES = Collections.singleton("COMMUNITY_CARD");

    /**
     * Tags Tumblr suggests you follow: the cards of a carousel ("Check out these tags", "Related
     * tags", "Explore more #tag"). They count only as a carousel's first item, since a page of them
     * alone is the carousel loading more of its own. A {@code FOLLOWED_TAG_CAROUSEL_CARD} isn't one,
     * it's a tag you follow, and the cards of a search's Tags tab are its results.
     */
    static final Set<String> TAG_TYPES = Collections.singleton("TAG_CAROUSEL_CARD");

    /**
     * The kind of a prompt Tumblr puts in a page, its {@code Signpost}. Between a tag's posts it asks
     * you to share the tag, so it counts as a suggested tag only on a page that holds a post. The
     * same kind is the "Follow tags to get updates here" message of an empty Your tags tab.
     */
    static final String SIGNPOST = "SIGNPOST";

    /** Tumblr TV's "Watch it" rows and the video hub cards in them. */
    static final Set<String> WATCH_IT_TYPES = Collections.unmodifiableSet(new HashSet<>(Arrays.asList(
            "VIDEO_HUB_CARD", "VIDEO_HUB_FEATURED", "VIDEO_HUB_FEATURED_BORDERED", "VIDEO_HUBS_CONTAINER",
            "VIDEO_HUBS_ROW")));

    /** Containers that hold other items. Each is judged by its first item. */
    static final Set<String> CAROUSEL_TYPES = Collections.unmodifiableSet(new HashSet<>(Arrays.asList(
            "CAROUSEL", "AVATAR_CAROUSEL")));

    /** What a blog or community card left in a page of search results is counted as. For the report. */
    static final String KEPT_RESULT = "card kept in search results";

    /** What one left in a page {@link PageSource} doesn't know is counted as. For the report. */
    static final String KEPT_UNKNOWN = "card kept on an unknown page";

    /** Tumblr's model methods, found the first time an item is read. */
    @Nullable
    private static volatile Model model;

    /** The item class whose methods couldn't be found, so each page doesn't look again. */
    @Nullable
    private static volatile Class<?> unreadable;

    /** Stands in for the patched {@link #carouselItems} in a test. Null in the app. */
    @Nullable
    static volatile Function<Object, List<?>> carouselItemsForTests;

    /**
     * What {@link #filterKept} just answered on this thread, for the base constructor its subclass
     * calls next. Cleared by that call.
     */
    private static final ThreadLocal<List<?>> passedOn = new ThreadLocal<>();

    /**
     * Injected at the start of each constructor of a {@code TimelineResponse} subclass that keeps
     * the list it hands the base constructor, on that list. Filters it as {@link #filter} does, and
     * the base constructor's own call, right after, hands it back without reading it again.
     */
    public static List<?> filterKept(List<?> items) {
        List<?> kept = filter(items);
        passedOn.set(kept);
        return kept;
    }

    /**
     * Injected at the start of both list constructors, on their list parameter. Returns the same list
     * when nothing goes, or a new one without the items that do, in the same order. Null stays
     * null. Never throws.
     */
    public static List<?> filter(List<?> items) {
        List<?> filtered = passedOn.get();
        if (filtered != null) {
            passedOn.remove();
            if (filtered == items) return items;
        }
        // Tumblr can load a page while it starts, before HushTumblr may read a switch.
        if (!Utils.settingsReady()) return items;
        Rules rules = Rules.now();
        if (rules == null || items == null || items.isEmpty()) return items;
        rules.page = items;
        try {
            int size = items.size();
            String[] removedBy = new String[size];
            boolean[] heading = new boolean[size];
            boolean any = false;
            for (int i = 0; i < size; i++) {
                removedBy[i] = rules.removes(items.get(i));
                any |= removedBy[i] != null;
            }
            // From the end, so a run of headings all go with the item after the last of them.
            for (int i = size - 1; i >= 0; i--) {
                if (removedBy[i] != null) continue;
                boolean last = i + 1 == size;
                String with = last ? rules.cardOwner() : removedBy[i + 1];
                // A heading over a run of posts heads the rest of them too, so it stays.
                if (with == null || isPostRemoval(with) || !isTitle(items.get(i), rules.owner())) continue;
                // Asked only of a heading, since it can read the call stack.
                if (last && (with = rules.pageEndOwner()) == null) continue;
                removedBy[i] = with;
                heading[i] = true;
                any = true;
            }
            if (!any) return items;
            List<Object> kept = new ArrayList<>(size);
            for (int i = 0; i < size; i++) {
                if (removedBy[i] == null) kept.add(items.get(i));
                else HookStatus.counted(removedBy[i], heading[i] ? "heading removed" : removal(removedBy[i]));
            }
            // Tumblr takes an empty page for the end of the feed, so the fragment is told to go on.
            if (kept.isEmpty()) TimelinePaging.emptied(removedBy[0]);
            return kept;
        } catch (Throwable failure) {
            HookStatus.threw(rules.owner(), "timeline filter", failure);
            return items;
        }
    }

    /** What a removal by [family] is counted as. English, for the report. */
    static String removal(String family) {
        if (FamilyNames.HIDE_ADS.equals(family)) return "ad removed";
        return isPostRemoval(family) ? "post removed" : "card removed";
    }

    private static boolean isPostRemoval(String family) {
        return PostRules.FAMILIES.contains(family) || FamilyNames.MUTE_ROOT_POSTS.equals(family);
    }

    /** Which switches take items out of this page, read once a page. */
    static final class Rules {
        final boolean ads;
        final boolean blogs;
        final boolean communities;
        final boolean tags;
        final boolean watchIt;
        final boolean mutes;
        /** The post switches, or null when none is on. */
        @Nullable
        final PostRules posts;
        /** What this page was parsed for, a {@link PageSource} constant, or null until it's asked. */
        @Nullable
        private Integer source;
        /** The page being filtered. */
        @Nullable
        private List<?> page;
        /** Whether {@link #page} holds a post, or null until it's asked. */
        @Nullable
        private Boolean amongPosts;

        private Rules(boolean ads, boolean blogs, boolean communities, boolean tags, boolean watchIt,
                      boolean mutes, @Nullable PostRules posts) {
            this.ads = ads;
            this.blogs = blogs;
            this.communities = communities;
            this.tags = tags;
            this.watchIt = watchIt;
            this.mutes = mutes;
            this.posts = posts;
        }

        /** The switches on now, or null when none is. Never throws. */
        @Nullable
        static Rules now() {
            String reading = FamilyNames.HIDE_ADS;
            try {
                // Each family's patch marks its timeline capability once the hook is in.
                boolean ads = on(PatchFamily.Capability.TIMELINE_ADS, reading, Settings.HIDE_ADS);
                reading = FamilyNames.HIDE_SUGGESTED_BLOGS;
                boolean blogs = on(PatchFamily.Capability.SUGGESTED_BLOG_CARDS, reading, Settings.HIDE_SUGGESTED_BLOGS);
                reading = FamilyNames.HIDE_SUGGESTED_COMMUNITIES;
                boolean communities = on(PatchFamily.Capability.SUGGESTED_COMMUNITY_CARDS, reading,
                        Settings.HIDE_SUGGESTED_COMMUNITIES);
                reading = FamilyNames.HIDE_SUGGESTED_TAGS;
                boolean tags = on(PatchFamily.Capability.SUGGESTED_TAG_CARDS, reading, Settings.HIDE_SUGGESTED_TAGS);
                reading = FamilyNames.HIDE_WATCH_IT_ROWS;
                boolean watchIt = on(PatchFamily.Capability.WATCH_IT_ROWS, reading, Settings.HIDE_WATCH_IT_ROWS);
                reading = FamilyNames.HIDE_REBLOGS;
                PostRules posts = PostRules.now();
                reading = FamilyNames.MUTE_ROOT_POSTS;
                boolean mutes = RootPostMutes.active();
                return ads || blogs || communities || tags || watchIt || mutes || posts != null
                        ? new Rules(ads, blogs, communities, tags, watchIt, mutes, posts) : null;
            } catch (Throwable failure) {
                HookStatus.threw(reading, "switch read", failure);
                return null;
            }
        }

        /** Whether [capability]'s hook is in and [family]'s switch is on. */
        private static boolean on(PatchFamily.Capability capability, String family, BooleanSetting setting) {
            if (!capability.installed()) return false;
            HookStatus.invoked(family);
            return setting.get();
        }

        /** The family a failure is reported under: the first switch that's on. */
        String owner() {
            if (ads) return FamilyNames.HIDE_ADS;
            String card = cardOwner();
            if (card != null) return card;
            return posts != null ? posts.owner() : mutes ? FamilyNames.MUTE_ROOT_POSTS : FamilyNames.HIDE_ADS;
        }

        /** The first card switch that's on, or null when none is. */
        @Nullable
        String cardOwner() {
            if (blogs) return FamilyNames.HIDE_SUGGESTED_BLOGS;
            if (communities) return FamilyNames.HIDE_SUGGESTED_COMMUNITIES;
            if (tags) return FamilyNames.HIDE_SUGGESTED_TAGS;
            if (watchIt) return FamilyNames.HIDE_WATCH_IT_ROWS;
            return null;
        }

        /**
         * The card switch a heading that ends this page goes with, or null to keep it. Its card may
         * start the next page, which holds for a blog, community or tag card only where it's a
         * suggestion, see {@link #suggests}.
         */
        @Nullable
        String pageEndOwner() {
            String card = blogs ? FamilyNames.HIDE_SUGGESTED_BLOGS
                    : communities ? FamilyNames.HIDE_SUGGESTED_COMMUNITIES : FamilyNames.HIDE_SUGGESTED_TAGS;
            if ((blogs || communities || tags) && suggests(card)) return card;
            return watchIt ? FamilyNames.HIDE_WATCH_IT_ROWS : null;
        }

        /** What this page was parsed for, read off the call stack the first time it matters. */
        private int source() {
            Integer known = source;
            if (known == null) source = known = PageSource.now();
            return known;
        }

        /**
         * [family] when a card on this page is a suggestion, see {@link #suggests}. Otherwise the
         * card stays and the report says why.
         */
        @Nullable
        private String suggestion(String family) {
            if (suggests(family)) return family;
            HookStatus.counted(family, source() == PageSource.RESULTS ? KEPT_RESULT : KEPT_UNKNOWN);
            return null;
        }

        /**
         * Whether a blog or community card on this page is a suggestion: in a feed, and in a page of
         * search results that holds posts, which is the Posts tab, where a carousel of a tag's top
         * blogs or related communities sits between the posts found. The Blogs and Communities tabs
         * hold no posts, and there the cards are the results. On a page {@link PageSource} doesn't
         * know, they might be results too. A read that fails goes to [owner].
         */
        private boolean suggests(String owner) {
            int from = source();
            return from == PageSource.FEED || from == PageSource.RESULTS && amongPosts(owner);
        }

        /** Whether this page holds a post, read once a page. */
        private boolean amongPosts(String owner) {
            Boolean known = amongPosts;
            if (known == null) {
                known = false;
                List<?> items = page;
                if (items != null) for (Object item : items) {
                    if (isKind(item, POST, owner)) {
                        known = true;
                        break;
                    }
                }
                amongPosts = known;
            }
            return known;
        }

        /** The patch name of the first switch that takes [item] out, or null to keep it. */
        @Nullable
        String removes(Object item) {
            if (DirectPosts.answers(item)) return null;
            if (ads && isAd(item)) return FamilyNames.HIDE_ADS;
            String card = cardOwner();
            String byCard = card == null ? null : cardFamily(item, this, card);
            if (byCard != null) return byCard;
            if (mutes && isMutedPost(item)) return FamilyNames.MUTE_ROOT_POSTS;
            return posts == null ? null : postFamily(item, posts);
        }

        /** The patch name whose switch is on and whose cards include [kind], or null. */
        @Nullable
        String family(@Nullable String kind) {
            if (kind == null) return null;
            if (blogs && BLOG_TYPES.contains(kind)) return suggestion(FamilyNames.HIDE_SUGGESTED_BLOGS);
            if (communities && COMMUNITY_TYPES.contains(kind)) {
                return suggestion(FamilyNames.HIDE_SUGGESTED_COMMUNITIES);
            }
            if (tags && TAG_TYPES.contains(kind)) return suggestion(FamilyNames.HIDE_SUGGESTED_TAGS);
            if (tags && SIGNPOST.equals(kind)) {
                return amongPosts(FamilyNames.HIDE_SUGGESTED_TAGS) ? suggestion(FamilyNames.HIDE_SUGGESTED_TAGS) : null;
            }
            if (watchIt && WATCH_IT_TYPES.contains(kind)) return FamilyNames.HIDE_WATCH_IT_ROWS;
            return null;
        }
    }

    private static boolean isMutedPost(Object item) {
        Model found = modelFor(item, FamilyNames.MUTE_ROOT_POSTS);
        if (found == null) return false;
        try {
            return RootPostMutes.shouldHide(found.data.invoke(item));
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.MUTE_ROOT_POSTS, "timeline item", failure);
            return false;
        }
    }

    /**
     * True when [item] is a timeline object Tumblr marks as an ad: by its kind, by the Sponsored
     * label, as a paid placement, or by its structured paid header context. One that can't be read
     * is kept.
     */
    static boolean isAd(Object item) {
        Model found = modelFor(item, FamilyNames.HIDE_ADS);
        if (found == null) return false;
        try {
            return AD_TYPES.contains(found.typeOf(item)) || Boolean.TRUE.equals(found.sponsored.invoke(item))
                    || found.isPaidPlacement(item) || hasPaidHeader(found.data.invoke(item));
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.HIDE_ADS, "timeline item", failure);
            return false;
        }
    }

    /**
     * Blaze and Sponsored header icons are server values, not localized label text. Followed and
     * editable posts stay on this path, as do unknown icons and an organic post's is_blazed flag.
     * A BLAZED_POST campaign wraps a Post and never implements this bridge itself.
     */
    private static boolean hasPaidHeader(@Nullable Object payload) {
        if (!(payload instanceof HushPaidPost)) return false;
        HushPaidPost post = (HushPaidPost) payload;
        if (!post.hushPaidContextKnown()) return false;
        if (post.hushFollowed() || post.hushCanEdit()) return false;
        String icon = post.hushHeaderIcon();
        return "blaze".equals(icon) || "money-alt".equals(icon);
    }

    /**
     * The patch name of the card switch that takes [item] out, or null to keep it. A carousel goes
     * by its first item, and its own heading goes with it. One that can't be read is kept, and the
     * failure is recorded under [owner].
     */
    @Nullable
    static String cardFamily(Object item, Rules rules, String owner) {
        Model found = modelFor(item, owner);
        if (found == null) return null;
        try {
            Object payload = found.data.invoke(item);
            String kind = found.kindOf(payload);
            if (kind != null && CAROUSEL_TYPES.contains(kind)) {
                List<?> children = readCarousel(payload);
                if (children == null || children.isEmpty()) return null;
                Object first = children.get(0);
                if (modelFor(first, owner) == null) return null;
                kind = found.typeOf(first);
            } else if (TAG_TYPES.contains(kind)) {
                return null;
            }
            if (BUTTON.equals(kind) && !followsABlog(payload)) return null;
            return rules.family(kind);
        } catch (Throwable failure) {
            HookStatus.threw(owner, "timeline item", failure);
            return null;
        }
    }

    /**
     * Whether a button's [payload] follows a blog when tapped: its tap is an {@link #ACTION_LINK}.
     * The one action Tumblr's button binder carries out is {@code follow_generic_button}, and a
     * button that opens a page has a {@code WebLink}. The getters are kept by name.
     */
    static boolean followsABlog(Object payload) throws ReflectiveOperationException {
        Object button = read(payload, "getButton");
        Object links = button == null ? null : read(button, "getLinks");
        Object tap = links == null ? null : read(links, "getTap");
        return tap != null && ACTION_LINK.equals(tap.getClass().getName());
    }

    @Nullable
    private static Object read(Object target, String getter) throws ReflectiveOperationException {
        return target.getClass().getMethod(getter).invoke(target);
    }

    /**
     * The patch name of the post switch that takes [item] out, or null to keep it. One that can't be
     * read is kept, and the failure is recorded under the first post switch that's on.
     */
    @Nullable
    static String postFamily(Object item, PostRules posts) {
        String owner = posts.owner();
        Model found = modelFor(item, owner);
        if (found == null) return null;
        try {
            return posts.removes(found.data.invoke(item));
        } catch (Throwable failure) {
            HookStatus.threw(owner, "timeline post", failure);
            return null;
        }
    }

    /** True when [item] is a heading. One that can't be read isn't, and the failure goes to [owner]. */
    static boolean isTitle(Object item, String owner) {
        return isKind(item, TITLE, owner);
    }

    /** True when [item] is of [kind]. One that can't be read isn't, and the failure goes to [owner]. */
    private static boolean isKind(Object item, String kind, String owner) {
        Model found = modelFor(item, owner);
        if (found == null) return false;
        try {
            return kind.equals(found.typeOf(item));
        } catch (Throwable failure) {
            HookStatus.threw(owner, "timeline item", failure);
            return false;
        }
    }

    @Nullable
    private static List<?> readCarousel(Object carousel) {
        Function<Object, List<?>> forTests = carouselItemsForTests;
        return forTests != null ? forTests.apply(carousel) : carouselItems(carousel);
    }

    /**
     * A carousel's items, each a timeline object. A stub: the timeline card patches write its body
     * to call Tumblr's {@code Carousel} getter, whose name changes with every build. Here it answers
     * null, which keeps every carousel.
     */
    @Nullable
    static List<?> carouselItems(Object carousel) {
        return null;
    }

    /**
     * The model methods for [item], or null when it isn't a timeline object or they can't be found.
     * A lookup that fails is recorded under [family] once.
     */
    @Nullable
    static Model modelFor(@Nullable Object item, String family) {
        if (item == null) return null;
        Class<?> type = item.getClass();
        if (!TIMELINE_OBJECT.equals(type.getName()) || type == unreadable) return null;
        Model found = model;
        if (found != null && found.objectType == type) return found;
        try {
            found = Model.of(type);
        } catch (Throwable failure) {
            unreadable = type;
            HookStatus.missingMember(family, "method", TIMELINE_OBJECT,
                    "getData, isShowSponsoredLabel, getDisplay, getDisplayType, Display.getSponsored"
                            + ", Timelineable.getTimelineObjectType or Timelineable.getId");
            return null;
        }
        model = found;
        return found;
    }

    /** The model methods the filter reads, all names Tumblr keeps. */
    static final class Model {
        final Class<?> objectType;
        final Method data;
        final Method sponsored;
        final Method display;
        final Method displayType;
        final Method sponsoredState;
        final Method kind;
        final Method id;

        private Model(Class<?> objectType, Method data, Method sponsored, Method display, Method displayType,
                Method sponsoredState, Method kind, Method id) {
            this.objectType = objectType;
            this.data = data;
            this.sponsored = sponsored;
            this.display = display;
            this.displayType = displayType;
            this.sponsoredState = sponsoredState;
            this.kind = kind;
            this.id = id;
        }

        static Model of(Class<?> objectType) throws ReflectiveOperationException {
            Method data = objectType.getMethod("getData");
            Method sponsored = objectType.getMethod("isShowSponsoredLabel");
            Method display = objectType.getMethod("getDisplay");
            Method displayType = objectType.getMethod("getDisplayType");
            Method sponsoredState = display.getReturnType().getMethod("getSponsored");
            Class<?> timelineable = Class.forName(TIMELINEABLE, false, objectType.getClassLoader());
            Method kind = timelineable.getMethod("getTimelineObjectType");
            Method id = timelineable.getMethod("getId");
            return new Model(objectType, data, sponsored, display, displayType, sponsoredState, kind, id);
        }

        /**
         * Whether Tumblr serves [item] as a paid placement: its {@code Display} says it's sponsored,
         * or its {@code DisplayType} is SPONSORED. Tumblr reads those two to treat a card as an ad
         * (the ad menu with its "Why am I seeing this ad?" page, the close button, and the Blaze
         * follow and action buttons of a paid Blaze post). A plain post can instead carry only the
         * structured header context checked by {@link TimelineFilter#hasPaidHeader}. The generic
         * is_blazed flag isn't evidence of a paid placement.
         */
        boolean isPaidPlacement(Object item) throws ReflectiveOperationException {
            Object shown = display.invoke(item);
            Object state = shown == null ? null : sponsoredState.invoke(shown);
            return SPONSORED.equals(nameOf(state)) || SPONSORED.equals(nameOf(displayType.invoke(item)));
        }

        /** The constant name of [item]'s kind, such as POST or GEMINI_AD, or null when it has none. */
        @Nullable
        String typeOf(Object item) throws ReflectiveOperationException {
            return kindOf(data.invoke(item));
        }

        /** The constant name of the kind of an item's [payload], or null when it has none. */
        @Nullable
        String kindOf(@Nullable Object payload) throws ReflectiveOperationException {
            return nameOf(payload == null ? null : kind.invoke(payload));
        }

        /** The constant name of [value] when it's an enum constant, or null. */
        @Nullable
        private static String nameOf(@Nullable Object value) {
            return value instanceof Enum ? ((Enum<?>) value).name() : null;
        }
    }
}
