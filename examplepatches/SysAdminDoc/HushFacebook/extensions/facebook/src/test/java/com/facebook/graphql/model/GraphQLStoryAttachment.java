/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package com.facebook.graphql.model;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * A test stand-in for Facebook's kept attachment model. Its media getter and its list of the
 * attachments an album holds carry names of the shape Redex gives them; the patch reads the real
 * ones out of each build and hands them over.
 */
public class GraphQLStoryAttachment {
    private final GraphQLMedia media;
    private final List<GraphQLStoryAttachment> subattachments;

    public GraphQLStoryAttachment(GraphQLMedia media) {
        this(media, new GraphQLStoryAttachment[0]);
    }

    /** An attachment holding others, as an album's attachment holds one per photo. */
    public GraphQLStoryAttachment(GraphQLMedia media, GraphQLStoryAttachment... subattachments) {
        this.media = media;
        this.subattachments = new ArrayList<>(Arrays.asList(subattachments));
    }

    public GraphQLMedia A01() {
        return media;
    }

    public List<GraphQLStoryAttachment> A09() {
        return subattachments;
    }
}
