/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package com.facebook.graphql.model;

import com.facebook.graphql.modelutil.BaseModelWithTree;

/**
 * A test stand-in for Facebook's GraphQLFeedback, a story's feedback. Its class name is kept by
 * Redex, which is what the reaction ceiling checks the feedback model against.
 */
public class GraphQLFeedback extends BaseModelWithTree {
    public GraphQLFeedback() {
        super((String) null);
    }
}
