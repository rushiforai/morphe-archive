/*
 * Copyright 2026 HushTumblr contributors
 * https://github.com/SysAdminDoc/HushTumblr
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushtumblr.extension.tumblr.timeline;

import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

/**
 * Which of Tumblr's responses the page being filtered was parsed for, read off the call stack.
 *
 * <p>The list hook sits in the two page constructors every screen shares, so the list alone can't
 * say whether a blog card is a suggestion in a feed or a result somebody searched for. The stack
 * can. In Tumblr 46.5.0.109 a page with items is only ever built while one of Moshi's generated
 * adapters parses a response: {@code Timeline.<init>(List, PaginationLink)} is called from
 * {@code TimelineJsonAdapter.fromJson} alone, and
 * {@code TimelineResponse.<init>(List, PaginationLink, Map)} from the {@code fromJson} of the
 * TimelineResponse, PostsResponse, LikesResponse and BlogSearchResponse adapters. A
 * {@code Timeline} is in turn one field of the response a screen asked for, read by that response's
 * own adapter through its {@code timelineAdapter}, so that adapter's frame is on the stack while the
 * hook runs. Moshi finds a generated adapter by its name, so R8 keeps every one of these names.
 *
 * <p>Every tab of a search is a {@code GraywaterSearchResultsFragment} ({@code SearchActivity}'s
 * pager builds nothing else). Its first page comes from
 * {@code TumblrCommonService.searchTimeline} and each later one from
 * {@code searchTimelinePagination}, both an {@code ApiResponse<SearchResultsResponse>}, so
 * {@code SearchResultsResponseJsonAdapter.fromJson} is on the stack for every page of results and
 * for nothing else. On its Blogs and Communities tabs the cards are what was asked for, and they
 * stay. Its Posts tab is the one whose pages hold posts, and there {@code TimelineFilter} takes a
 * card between them for a suggestion.
 *
 * <p>The cards go only under a response known to be a feed: the dashboard, Explore and the other
 * feeds that load a {@code WrappedTimelineResponse}, a tag's page ({@code CommunityHubResponse}),
 * the blogs offered beside a blog card ({@code RelatedBlogs}), and a blog's posts, likes and blog
 * search. Anything else keeps them, so a response this doesn't know costs a suggestion left on
 * screen and never a list emptied.
 */
final class PageSource {
    private PageSource() {}

    /** A response this doesn't know, or a page built outside any adapter. The cards stay. */
    static final int UNKNOWN = 0;

    /** A feed, where a blog or community card is a suggestion. */
    static final int FEED = 1;

    /** A page of search results, where the cards are the results. */
    static final int RESULTS = 2;

    /** The adapter of every page of every search tab. */
    static final String SEARCH_RESULTS = "com.tumblr.rumblr.response.SearchResultsResponseJsonAdapter";

    /** The adapters of the responses that are feeds. */
    static final Set<String> FEEDS = Collections.unmodifiableSet(new HashSet<>(Arrays.asList(
            "com.tumblr.rumblr.response.WrappedTimelineResponseJsonAdapter",
            "com.tumblr.rumblr.response.CommunityHubResponseJsonAdapter",
            "com.tumblr.rumblr.model.RelatedBlogsJsonAdapter",
            "com.tumblr.rumblr.response.timeline.TimelineResponseJsonAdapter",
            "com.tumblr.rumblr.response.timeline.PostsResponseJsonAdapter",
            "com.tumblr.rumblr.response.timeline.LikesResponseJsonAdapter",
            "com.tumblr.rumblr.response.timeline.BlogSearchResponseJsonAdapter")));

    /** What the page being built on this thread right now was parsed for. Never throws. */
    static int now() {
        return of(new Throwable().getStackTrace());
    }

    /**
     * What a page built under [frames] was parsed for. Search results win wherever they are on the
     * stack, so the blogs offered beside a result stay with it.
     */
    static int of(StackTraceElement[] frames) {
        int source = UNKNOWN;
        for (StackTraceElement frame : frames) {
            String owner = frame.getClassName();
            if (SEARCH_RESULTS.equals(owner)) return RESULTS;
            if (FEEDS.contains(owner)) source = FEED;
        }
        return source;
    }
}
