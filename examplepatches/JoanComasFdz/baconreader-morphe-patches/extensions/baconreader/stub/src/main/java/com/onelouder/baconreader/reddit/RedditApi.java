// SPDX-FileCopyrightText: 2026 ReVanced contributors
// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

package com.onelouder.baconreader.reddit;

import android.content.Context;

import com.onelouder.baconreader.connectivity.Tasks;

import java.util.List;

public class RedditApi {
    /**
     * GET comments/linkId(/-/commentId).json: the post and its comments, or the thread of one comment, as
     * [the post's Listing, the comments' Listing].
     */
    public static void getComments(Context context, String linkId, String commentId, int context2, String sort,
                                   int limit, Tasks.OnCompleteListener<List<Listing>> listener) {
    }

    /** GET api/link_flair?r=subreddit: the post flairs users can choose in the subreddit. */
    public static void getLinkFlairs(Context context, String subreddit, Tasks.OnCompleteListener<List<LinkFlair>> listener) {
    }

    /** POST api/read_message with id=ids: marks the messages, separated by commas, as read. */
    public static void readMessage(Context context, String ids) {
    }
}
