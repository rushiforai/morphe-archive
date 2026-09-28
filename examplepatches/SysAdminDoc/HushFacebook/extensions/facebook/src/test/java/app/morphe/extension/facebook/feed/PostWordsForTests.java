/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.feed;

/** The word filter's count of hidden posts, for a test outside this package. */
public final class PostWordsForTests {
    private PostWordsForTests() {
    }

    /** Counts [posts] more hidden posts, as the filter does for each one it hides. */
    public static void countHidden(int posts) {
        PostWords.HIDDEN.addAndGet(posts);
    }

    /** Forgets the count and the folded lists. */
    public static void forget() {
        PostWords.forgetForTests();
    }
}
