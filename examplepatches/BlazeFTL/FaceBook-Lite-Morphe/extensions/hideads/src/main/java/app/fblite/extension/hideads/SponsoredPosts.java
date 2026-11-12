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
 * (separator, header, text, media, actions) sharing the same group id (X.0hd.A0w). A sponsored post's
 * header is tappable (A2Z, A2m) and has the references in X.0hg.A0M, which organic headers lack; this
 * holds whatever the language of the "Sponsored" label.
 *
 * Children are never removed, because the server updates the feed by child index. They are marked
 * hidden (A2c, which the renderer and hit testing skip) and get height 0, and the feed list stacks
 * rows by height, so no gap is left.
 *
 * Sponsored reels are handled by {@link ReelAds}, called from here for every decoded component.
 *
 * Field names are for Facebook Lite 536.0.0.11.107.
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

        int byGroup = 0;
        int byLabel = 0;
        int alreadyHidden = 0;
        for (Object child : posts) {
            if ((Boolean) hidden.get(child)) alreadyHidden++;
            if (sponsored != null && sponsored.contains((Integer) group.get(child))) {
                hidden.setBoolean(child, true);
                height.setInt(child, 0);
                byGroup++;
                continue;
            }
            // A child that carries a sponsored label ("Sponsored" in the feed, "Ad" in Marketplace, where an ad row holds
            // two ads under two advertiser names) is hidden whatever its structure. Items as tall as a screen are Reels,
            // which are left to SponsoredReels.
            if (!(Boolean) hidden.get(child) && (Integer) height.get(child) < REELS_HEIGHT && AdTrace.hasSponsoredLabel(child)) {
                if (AdLog.enabled()) AdLog.log("ads", "HIDE labelled item " + AdTrace.describe(child));
                hidden.setBoolean(child, true);
                height.setInt(child, 0);
                byLabel++;
            }
        }
        if (AdLog.enabled()) summarize(posts, byGroup, byLabel, alreadyHidden);
    }

    private static String lastSummary = "";

    /**
     * Debug log: one line per decode of container 30001 that is small (an empty or nearly empty screen, such as a
     * creator's Reels page that says "No reels yet") or where this class hid something. It shows whether the
     * patch touched the list, and the texts of its children, so a list that arrives empty from the server can be told
     * from one that was emptied here.
     */
    private static void summarize(List<?> posts, int byGroup, int byLabel, int alreadyHidden) {
        if (posts.size() > 12 && byGroup + byLabel == 0) return;
        try {
            StringBuilder sb = new StringBuilder();
            sb.append("LIST30001 children=").append(posts.size()).append(" hidden-by-group-rule=").append(byGroup)
                    .append(" hidden-by-label-rule=").append(byLabel).append(" hidden-before=").append(alreadyHidden);
            int shown = 0;
            for (Object child : posts) {
                if (shown++ >= 12) break;
                sb.append("\n    [").append(shown - 1).append("] ").append(AdLog.cut(AdTrace.describe(child), 160))
                        .append(" hidden=").append(hidden.get(child)).append(" h=").append(height.get(child));
            }
            String line = sb.toString();
            if (line.equals(lastSummary)) return;
            lastSummary = line;
            AdLog.log("listcheck", line);
        } catch (Throwable ignored) {
        }
    }

    private static void resolve() throws Exception {
        ClassLoader app = SponsoredPosts.class.getClassLoader();
        Class<?> component = Class.forName("X.0hd", false, app);
        Class<?> container = Class.forName("X.0hg", false, app);
        id = component.getDeclaredField("A1c");
        group = component.getDeclaredField("A0w");
        height = component.getDeclaredField("A0j");
        hidden = component.getDeclaredField("A2e");
        parent = component.getDeclaredField("A19");
        tappable = component.getDeclaredField("A2Z");
        tappableFlag = component.getDeclaredField("A2m");
        references = container.getDeclaredField("A0M");
        children = Class.forName("X.0hc", false, app).getMethod("ADt");
    }
}
