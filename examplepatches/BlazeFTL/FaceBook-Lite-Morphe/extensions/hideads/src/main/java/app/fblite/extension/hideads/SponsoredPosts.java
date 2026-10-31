package app.fblite.extension.hideads;

import android.util.Log;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * Hides sponsored posts in the news feed.
 *
 * The feed is the container with component id 30001. A post is not one child but a run of children
 * (separator, header, text, media, actions) sharing the same group id (X.0gp.A0v). A sponsored post's
 * header is tappable (A2X, A2k) and has the references in X.0gs.A0M, which organic headers lack; this
 * holds whatever the language of the "Sponsored" label.
 *
 * Children are never removed, because the server updates the feed by child index. They are marked
 * hidden (A2c, which the renderer and hit testing skip) and get height 0, and the feed list stacks
 * rows by height, so no gap is left.
 *
 * Sponsored reels are handled by {@link ReelAds}, called from here for every decoded component.
 *
 * Field names are for Facebook Lite 530.0.0.8.106.
 */
public final class SponsoredPosts {
    private static final int FEED_CONTAINER_ID = 30001;

    private static boolean disabled;
    private static Field id, group, height, hidden, parent, tappable, tappableFlag, references;
    private static Method children;
    /** Children at least this tall (px) are Reels. */
    private static final int REELS_HEIGHT = 1800;

    private SponsoredPosts() {
    }

    /** Called after the app decoded the props of a component. */
    public static void afterDecode(Object component) {
        if (component == null) return;
        AdTrace.onDecode(component);
        // Sponsored reels are collapsed here too, in the Reels list only (see ReelAds).
        ReelAds.afterDecode(component);
        if (disabled) return;
        try {
            if (id == null) resolve();
            Object feed = null;
            if (((Short) id.get(component)) == FEED_CONTAINER_ID) {
                feed = component;
            } else {
                Object p = parent.get(component);
                if (p != null && ((Short) id.get(p)) == FEED_CONTAINER_ID) feed = p;
            }
            if (feed != null) hide(feed);
        } catch (Throwable t) {
            disabled = true;
            Log.e(OriginalClass.TAG, "Hiding sponsored posts failed, turning it off", t);
        }
    }

    private static void hide(Object feed) throws Exception {
        List<?> posts = (List<?>) children.invoke(feed);
        if (posts == null) return;

        Set<Integer> sponsored = null;
        for (Object child : posts) {
            int g = (Integer) group.get(child);
            if (g != 0 && (Boolean) tappable.get(child) && (Boolean) tappableFlag.get(child) && references.get(child) != null) {
                if (sponsored == null) sponsored = new HashSet<>();
                sponsored.add(g);
            }
        }
        if (AdLog.enabled()) AdTrace.checkFeed(posts, sponsored);

        for (Object child : posts) {
            if (sponsored != null && sponsored.contains((Integer) group.get(child))) {
                hidden.setBoolean(child, true);
                height.setInt(child, 0);
                continue;
            }
            // A child that carries a sponsored label ("Sponsored" in the feed, "Ad" in Marketplace, where an ad row holds
            // two ads under two advertiser names) is hidden whatever its structure. Items as tall as a screen are Reels,
            // which are left to SponsoredReels.
            if (!(Boolean) hidden.get(child) && (Integer) height.get(child) < REELS_HEIGHT && AdTrace.hasSponsoredLabel(child)) {
                if (AdLog.enabled()) AdLog.log("ads", "HIDE labelled item " + AdTrace.describe(child));
                hidden.setBoolean(child, true);
                height.setInt(child, 0);
            }
        }
    }

    private static void resolve() throws Exception {
        ClassLoader app = SponsoredPosts.class.getClassLoader();
        Class<?> component = Class.forName("X.0gp", false, app);
        Class<?> container = Class.forName("X.0gs", false, app);
        id = component.getDeclaredField("A1b");
        group = component.getDeclaredField("A0v");
        height = component.getDeclaredField("A0i");
        hidden = component.getDeclaredField("A2c");
        parent = component.getDeclaredField("A18");
        tappable = component.getDeclaredField("A2X");
        tappableFlag = component.getDeclaredField("A2k");
        references = container.getDeclaredField("A0M");
        children = Class.forName("X.0gn", false, app).getMethod("AF0");
    }
}
