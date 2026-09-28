/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package com.facebook.graphql.model;

import com.facebook.graphql.modelutil.BaseModelWithTree;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * A test stand-in for Facebook's kept post model. The GenAI rule looks the real class up by name
 * and hands a story to the accessor the patch fills in, which a test replaces. The video save
 * reads its attachment list and the post a share wraps through getters named the way Redex names
 * them; the patch hands the extension the real names. Its actors and creation time are read the
 * way every tree's are, by the hash of the field's name, so it is a tree like the real one. It
 * answers no type name, as the stand-in did before it was a tree, so the feed rules' debug lines
 * the feed tests pin read the same.
 */
public class GraphQLStory extends BaseModelWithTree {
    private final List<GraphQLStoryAttachment> attachments;
    private final GraphQLStory shared;

    /** A post with no attachments and no shared post, all the GenAI rule needs. */
    public GraphQLStory() {
        this(null);
    }

    public GraphQLStory(GraphQLStory shared, GraphQLStoryAttachment... attachments) {
        super((String) null);
        this.shared = shared;
        this.attachments = new ArrayList<>(Arrays.asList(attachments));
    }

    public List<GraphQLStoryAttachment> A0n() {
        return attachments;
    }

    public GraphQLStory A04() {
        return shared;
    }
}
