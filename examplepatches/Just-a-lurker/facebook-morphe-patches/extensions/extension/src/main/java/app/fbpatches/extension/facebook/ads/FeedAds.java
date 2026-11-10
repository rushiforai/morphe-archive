package app.fbpatches.extension.facebook.ads;

import android.util.Log;

@SuppressWarnings("unused")
public final class FeedAds {
    private static final String TAG = "FbPatches";

    private FeedAds() {
    }

    /**
     * Injection point. Called with a feed edge's GraphQLFeedStoryCategory enum constant. The enum's
     * fields are obfuscated, but name() returns the original constant name.
     *
     * @return true to drop the edge from the feed. Fails open (false) on any error.
     */
    public static boolean shouldHide(Object category) {
        try {
            if (!(category instanceof Enum)) return false;
            String name = ((Enum<?>) category).name();
            return "SPONSORED".equals(name) || "PROMOTION".equals(name);
        } catch (Throwable t) {
            Log.w(TAG, "FeedAds.shouldHide failed", t);
            return false;
        }
    }
}
