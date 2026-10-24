/*
 * Copyright 2026 HushTumblr contributors
 * https://github.com/SysAdminDoc/HushTumblr
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushtumblr.extension.tumblr.timeline;

import com.tumblr.rumblr.model.BlazedPost;
import com.tumblr.rumblr.model.Display;
import com.tumblr.rumblr.model.GenericButton;
import com.tumblr.rumblr.model.RelatedBlogsJsonAdapter;
import com.tumblr.rumblr.model.SponsoredState;
import com.tumblr.rumblr.model.TimelineObject;
import com.tumblr.rumblr.model.link.ActionLink;
import com.tumblr.rumblr.model.link.WebLink;
import com.tumblr.rumblr.model.TimelineObjectType;
import com.tumblr.rumblr.model.Timelineable;
import com.tumblr.rumblr.model.post.DisplayType;
import com.tumblr.rumblr.model.post.blocks.ImageBlock;
import com.tumblr.rumblr.model.post.blocks.TextBlock;
import com.tumblr.rumblr.model.post.blocks.VideoBlock;
import com.tumblr.rumblr.response.SearchResultsResponseJsonAdapter;
import com.tumblr.rumblr.response.WrappedTimelineResponseJsonAdapter;
import com.tumblr.rumblr.response.timeline.LikesResponseJsonAdapter;
import com.tumblr.rumblr.response.timeline.PostsResponseJsonAdapter;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;

/** Timeline objects built from the stand-ins in {@code com.tumblr.rumblr.model}. */
public final class TimelineItems {
    private TimelineItems() {}

    /** An item of [type] with no Sponsored label. */
    public static TimelineObject of(TimelineObjectType type) {
        return new TimelineObject(new Item(type), false);
    }

    public static TimelineObject post() {
        return of(TimelineObjectType.POST);
    }

    /** A plain post Tumblr is asked to label Sponsored. */
    public static TimelineObject sponsoredPost() {
        return new TimelineObject(new Item(TimelineObjectType.POST), true);
    }

    /**
     * A plain post the server tells Tumblr to show with a display block saying [sponsored] and the
     * display type [type], either left out when null. A paid Blaze post is a post served as
     * sponsored this way.
     */
    public static TimelineObject postServed(SponsoredState sponsored, DisplayType type) {
        return new TimelineObject(new Item(TimelineObjectType.POST), false,
                sponsored == null ? null : new Display(sponsored), type);
    }

    /** The "Follow <blog>" button between a blog's posts, whose tap follows the blog. */
    public static TimelineObject followButton() {
        return new TimelineObject(new GenericButton(new ActionLink()), false);
    }

    /** A button the server sends that opens a page. */
    public static TimelineObject webButton() {
        return new TimelineObject(new GenericButton(new WebLink()), false);
    }

    /** An item whose payload throws when its kind is read. */
    public static TimelineObject unreadable() {
        return new TimelineObject(new Item(null) {
            @Override
            public TimelineObjectType getTimelineObjectType() {
                throw new IllegalStateException("a payload that can't say what it is");
            }
        }, false);
    }

    /**
     * A carousel holding [children]. The filter reads a carousel's items through a stub the patch
     * writes, so this also has the filter read them from here.
     */
    public static TimelineObject carousel(TimelineObjectType type, TimelineObject... children) {
        TimelineFilter.carouselItemsForTests = payload -> ((Carousel) payload).children;
        return new TimelineObject(new Carousel(type, Arrays.asList(children)), false);
    }

    /** PausedHooksTest's probe for Hide ads: true when a page with an ad comes back without it. */
    public static boolean aPageLosesItsAd() {
        return aPageLoses(TimelineObjectType.GEMINI_AD);
    }

    /** PausedHooksTest's probe for Hide suggested blogs. */
    public static boolean aPageLosesItsBlogCard() {
        return aPageLoses(TimelineObjectType.BLOG_CARD);
    }

    /** PausedHooksTest's probe for Hide suggested communities. */
    public static boolean aPageLosesItsCommunityCard() {
        return aPageLoses(TimelineObjectType.COMMUNITY_CARD);
    }

    /** PausedHooksTest's probe for Hide suggested tags. */
    public static boolean aPageLosesItsTagCarousel() {
        return aPageLoses(carousel(TimelineObjectType.CAROUSEL, of(TimelineObjectType.TAG_CAROUSEL_CARD)));
    }

    /** PausedHooksTest's probe for Hide Watch it rows. */
    public static boolean aPageLosesItsWatchItRow() {
        return aPageLoses(TimelineObjectType.VIDEO_HUBS_ROW);
    }

    /** True when a page with an item of [type] between two posts comes back without it. */
    private static boolean aPageLoses(TimelineObjectType type) {
        return aPageLoses(of(type));
    }

    /** True when a dashboard page with [item] between two posts comes back without it. */
    private static boolean aPageLoses(TimelineObject item) {
        List<Object> page = Arrays.asList(post(), item, post());
        return onTheDashboard(page).size() == 2;
    }

    /**
     * What the filter makes of [page] while Tumblr parses a page of the dashboard, or of any other
     * feed that loads the same response. The filter tells feeds from search results by the adapter
     * on the call stack, so the call goes through a class with that adapter's name.
     */
    public static List<?> onTheDashboard(List<?> page) {
        return WrappedTimelineResponseJsonAdapter.fromJson(() -> TimelineFilter.filter(page));
    }

    /** What the filter makes of [page] while Tumblr parses a page of a blog's posts. */
    public static List<?> onABlog(List<?> page) {
        return PostsResponseJsonAdapter.fromJson(() -> TimelineFilter.filter(page));
    }

    /** What the filter makes of [page] while Tumblr parses a page of likes. */
    public static List<?> inLikes(List<?> page) {
        return LikesResponseJsonAdapter.fromJson(() -> TimelineFilter.filter(page));
    }

    /** What the filter makes of [page] while Tumblr parses a page of any tab of a search. */
    public static List<?> inSearchResults(List<?> page) {
        return SearchResultsResponseJsonAdapter.fromJson(() -> TimelineFilter.filter(page));
    }

    /**
     * What the filter makes of [page] as the blogs offered beside a blog card, when that card is
     * itself in a page of search results or, with [inSearch] false, in a dashboard page.
     */
    public static List<?> besideABlogCard(List<?> page, boolean inSearch) {
        return inSearch
                ? SearchResultsResponseJsonAdapter.fromJson(
                        () -> RelatedBlogsJsonAdapter.fromJson(() -> TimelineFilter.filter(page)))
                : WrappedTimelineResponseJsonAdapter.fromJson(
                        () -> RelatedBlogsJsonAdapter.fromJson(() -> TimelineFilter.filter(page)));
    }

    /** A post Tumblr's model would carry, with [blocks] as its own content and no trail. */
    public static TimelineObject postWith(Object... blocks) {
        return new TimelineObject(new Post(Arrays.asList(blocks), null, null, null, null), false);
    }

    /** A reblog of a post made of [original], adding [added] of its own. */
    public static TimelineObject reblogOf(List<?> original, Object... added) {
        List<HushTrail> trail = Collections.singletonList(() -> original);
        return new TimelineObject(new Post(Arrays.asList(added), trail, null, null, "100"), false);
    }

    /** A post with nothing but [tags] and a [summary]. */
    public static TimelineObject postTagged(String summary, String... tags) {
        return new TimelineObject(new Post(Collections.emptyList(), null, Arrays.asList(tags), summary, null), false);
    }

    /**
     * A post Tumblr would cover with "This post contains filtered content", its filtered note
     * naming [tags] and [content] words, with [blocks] as its own content.
     */
    public static TimelineObject filteredPost(List<?> tags, List<?> content, Object... blocks) {
        HushFiltered note = new HushFiltered() {
            @Override public List<?> hushFilteredTags() { return tags; }
            @Override public List<?> hushFilteredContent() { return content; }
        };
        return new TimelineObject(new Post(Arrays.asList(blocks), null, null, null, null) {
            @Override public Object hushFiltered() { return note; }
        }, false);
    }

    /** A plain post whose server header context names [icon], without any timeline Sponsored flag. */
    public static TimelineObject postWithHeader(String icon, boolean followed, boolean editable) {
        return postWithHeader(icon, followed, editable, true);
    }

    public static TimelineObject postWithHeader(String icon, boolean followed, boolean editable, boolean known) {
        return new TimelineObject(new Post(Collections.emptyList(), null, null, null, null) {
            @Override public String hushHeaderIcon() { return icon; }
            @Override public boolean hushFollowed() { return followed; }
            @Override public boolean hushCanEdit() { return editable; }
            @Override public boolean hushPaidContextKnown() { return known; }
        }, false);
    }

    /** A blazed post displayed organically, with no paid header context. */
    public static TimelineObject organicBlazedPost() {
        return new TimelineObject(new Post(Collections.emptyList(), null, null, null, null) {
            public boolean isBlazed() { return true; }
        }, false);
    }

    /** A campaign in your own Blaze dashboard's list, carrying [post]'s payload. */
    public static TimelineObject blazed(TimelineObject post) {
        return new TimelineObject(new BlazedPost(post.getData()), false);
    }

    /** PausedHooksTest's probe for Hide reblogs. */
    public static boolean aPageLosesItsReblog() {
        return aPageLoses(reblogOf(Collections.singletonList(new TextBlock("first")), new TextBlock("second")));
    }

    /** PausedHooksTest's probe for Hide video posts. */
    public static boolean aPageLosesItsVideoPost() {
        return aPageLoses(postWith(new TextBlock("look"), new VideoBlock()));
    }

    /** PausedHooksTest's probe for Hide photo posts. */
    public static boolean aPageLosesItsPhotoPost() {
        return aPageLoses(postWith(new ImageBlock(), new TextBlock("a photo")));
    }

    /** PausedHooksTest's probe for Hide text posts. */
    public static boolean aPageLosesItsTextPost() {
        return aPageLoses(postWith(new TextBlock("just words")));
    }

    /** The word PausedHooksTest saves for Hide posts with these words to look for. */
    public static final String PROBE_WORD = "spoilers";

    /** PausedHooksTest's probe for Hide posts with these words, once [PROBE_WORD] is saved. */
    public static boolean aPageLosesItsPostWithAHiddenWord() {
        return aPageLoses(postWith(new TextBlock("Big Spoilers ahead")));
    }

    /** PausedHooksTest's probe for Hide filtered posts. */
    public static boolean aPageLosesItsFilteredPost() {
        return aPageLoses(filteredPost(Collections.singletonList("spoilers"), null, new TextBlock("covered")));
    }

    /** A post Tumblr's model would carry, as the post bridge patches make it. */
    static class Post extends Item implements HushPost, HushPaidPost, HushFilteredPost {
        private final List<?> content;
        private final List<?> trail;
        private final List<?> tags;
        private final String summary;
        private final String rebloggedFrom;

        Post(List<?> content, List<?> trail, List<?> tags, String summary, String rebloggedFrom) {
            super(TimelineObjectType.POST);
            this.content = content;
            this.trail = trail;
            this.tags = tags;
            this.summary = summary;
            this.rebloggedFrom = rebloggedFrom;
        }

        @Override public List<?> hushContent() { return content; }
        @Override public List<?> hushTrail() { return trail; }
        @Override public List<?> hushTags() { return tags; }
        @Override public String hushSummary() { return summary; }
        @Override public String hushRebloggedFrom() { return rebloggedFrom; }
        @Override public String hushHeaderIcon() { return null; }
        @Override public boolean hushFollowed() { return false; }
        @Override public boolean hushCanEdit() { return false; }
        @Override public boolean hushPaidContextKnown() { return true; }
        @Override public Object hushFiltered() { return null; }
    }

    private static final class Carousel extends Item {
        final List<TimelineObject> children;

        Carousel(TimelineObjectType type, List<TimelineObject> children) {
            super(type);
            this.children = children;
        }
    }

    private static class Item implements Timelineable {
        private final TimelineObjectType type;

        Item(TimelineObjectType type) {
            this.type = type;
        }

        @Override
        public String getId() {
            return "1";
        }

        @Override
        public TimelineObjectType getTimelineObjectType() {
            return type;
        }
    }
}
