/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.ads;

import com.facebook.graphql.model.GraphQLStory;

/** A timeline row as the profile filter sees one, with the stub the patch fills in played by a stand-in. */
public final class ProfileAdFilterForTests {
    private ProfileAdFilterForTests() {
    }

    /** Stands in for the SponsoredData model a story delivered as an ad carries. */
    public static final class SponsoredData {
    }

    /** The accessor as the patch fills it: a story's sponsored data, here held by the test. */
    static ProfileAdFilter.Reader reads(Object data) {
        return story -> data;
    }

    /**
     * A story with sponsored data, asked about the way the patched render method asks. True when
     * the row went, which is the switch changing what Facebook would have drawn.
     */
    public static boolean hidesASponsoredStory() {
        return ProfileAdFilter.hide(new GraphQLStory(), reads(new SponsoredData()));
    }
}
