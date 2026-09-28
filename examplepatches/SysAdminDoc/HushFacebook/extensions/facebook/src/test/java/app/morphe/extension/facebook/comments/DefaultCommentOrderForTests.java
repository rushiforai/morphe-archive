/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.comments;

/** Default comment order as the request's constructor asks it, for tests in any package. */
public final class DefaultCommentOrderForTests {
    private DefaultCommentOrderForTests() {
    }

    /** Says the patch is in the build, or with null, asks SettingsStatus again. */
    public static void inBuild(Boolean inBuild) {
        DefaultCommentOrder.inBuildForTests = inBuild;
    }

    /** Chooses an order without saving one, or with null, reads the saved one again. */
    public static void order(CommentOrder order) {
        DefaultCommentOrder.orderForTests = order;
    }

    /** Forgets the picks and the log count, as a new process would. */
    public static void forget() {
        DefaultCommentOrder.forget();
    }

    /**
     * Asks the hook about an ordinary request for a post's comments, one that names no order, with
     * the patch in the build and Newest chosen. True when it names an order, which is the switch
     * changing what Facebook would have done.
     */
    public static boolean asksForTheChosenOrder() {
        Boolean before = DefaultCommentOrder.inBuildForTests;
        CommentOrder chosen = DefaultCommentOrder.orderForTests;
        DefaultCommentOrder.inBuildForTests = Boolean.TRUE;
        DefaultCommentOrder.orderForTests = CommentOrder.NEWEST;
        try {
            return DefaultCommentOrder.requestedOrder(null, "ZmVlZGJhY2s6MTAx", null) != null;
        } finally {
            DefaultCommentOrder.inBuildForTests = before;
            DefaultCommentOrder.orderForTests = chosen;
        }
    }
}
