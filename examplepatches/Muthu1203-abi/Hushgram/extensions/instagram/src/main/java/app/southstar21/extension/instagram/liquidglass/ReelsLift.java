package app.southstar21.extension.instagram.liquidglass;

import android.os.SystemClock;
import android.view.View;

import app.hushgram.extension.instagram.misc.GlassTabBar;
import app.hushgram.extension.instagram.reels.ReelSeekRoom;

/**
 * Keeps a reel's author, caption, buttons and seek bar above the Liquid Glass pill while Reels run
 * behind it. The video stays full screen under the glass; only the layer of controls over it moves,
 * found the way HushGram's own glass bar finds it ({@link GlassTabBar#reelBand}). Each band is lifted
 * by a translation just big enough for its bottom to clear the pill's top, so moving the pill with
 * Vertical position or a page's bottom gap moves the reel's controls with it. The band holding the seek
 * bar also takes the Reel seek bar position setting.
 * <p>
 * The view tree is walked for bands at most every {@link #LOOK_MS}, and on the next frame when a band
 * found before has left the window, as a reel scrolled away does; the lift itself is checked every frame,
 * since Instagram's layout can put a band back where it was. A hidden seek bar is found and its band lifted
 * too, so the next reel's seek bar is already above the pill when it shows as that reel starts playing.
 * Found only once shown, it showed under the pill until the next walk.
 */
final class ReelsLift {
    private static final long LOOK_MS = 100;
    /** How many levels under a lifted band are looked at for a view Litho put back down. */
    private static final int PUT_BACK_DEPTH = 6;
    private static final String PACKAGE = "com.instagram.android";

    private final float density;
    private final int rootId, infoId, scrubberId, footersId, mediaId;
    /** The bands found on the last walk, with whether each holds the seek bar. */
    private final java.util.WeakHashMap<View, Boolean> bands = new java.util.WeakHashMap<>();
    /** The translation this gave each band, to put back only what is still ours. */
    private final java.util.WeakHashMap<View, Float> lifted = new java.util.WeakHashMap<>();
    private final java.util.ArrayList<View> anchors = new java.util.ArrayList<>();
    private final int[] at = new int[2];
    private long lookedAt;

    ReelsLift(View bar, float density) {
        this.density = density;
        android.content.res.Resources res = bar.getResources();
        rootId = res.getIdentifier(GlassTabBar.REELS_ROOT, "id", PACKAGE);
        infoId = res.getIdentifier(GlassTabBar.REEL_INFO, "id", PACKAGE);
        scrubberId = res.getIdentifier(GlassTabBar.SCRUBBER, "id", PACKAGE);
        footersId = res.getIdentifier(GlassTabBar.REEL_FOOTERS, "id", PACKAGE);
        mediaId = res.getIdentifier(GlassTabBar.REEL_MEDIA, "id", PACKAGE);
    }

    /**
     * Lifts the bands of the reels on screen so they end [gapDp] above [pillTopInWindow], with the
     * seek bar's band moved [seekBarDp] more (positive is up). With [active] false, puts back every
     * band this lifted.
     */
    void apply(View bar, boolean active, float pillTopInWindow, int gapDp, int seekBarDp) {
        if (!active || rootId == 0 || mediaId == 0) {
            reset();
            return;
        }
        long now = SystemClock.uptimeMillis();
        if (now - lookedAt >= LOOK_MS) {
            lookedAt = now;
            look(bar.getRootView());
        }
        int gap = Math.round(gapDp * density);
        int seekExtra = Math.round(seekBarDp * density);
        boolean left = false;
        for (java.util.Map.Entry<View, Boolean> entry : bands.entrySet()) {
            View band = entry.getKey();
            if (band == null || !band.isAttachedToWindow()) {
                left = true;
                continue;
            }
            // A hidden band is lifted as well, so it shows in place rather than under the pill first.
            if (band.getVisibility() == View.GONE) continue;
            float current = band.getTranslationY();
            Float ours = lifted.get(band);
            // A translation someone else set (an animation of Instagram's) is left alone. The seek bar room's
            // lift out of the navigation bar is taken over instead: left alone, it kept the seek bar row under
            // the pill on some reels while their caption went above it. The seek bar room lets go of a lift it
            // finds rewritten.
            if (ours == null && current != 0f && !ReelSeekRoom.holdsUp(band)) continue;
            band.getLocationInWindow(at);
            // Where the band's bottom sits without any lift: getLocationInWindow counts the translation.
            float laidOutBottom = at[1] - current + band.getHeight();
            // A band whose content is scrolled up (the seek bar room raises the caption that way) already shows
            // that much higher, so it needs that much less. Counted twice, such a reel went far above the pill.
            float by = Math.max(0f, laidOutBottom - Math.max(0, band.getScrollY()) - (pillTopInWindow - gap));
            if (Boolean.TRUE.equals(entry.getValue())) by = Math.max(0f, by + seekExtra);
            float want = -Math.round(by);
            if (current != want) band.setTranslationY(want);
            lifted.put(band, want);
            keepUnderTheLift(band);
        }
        // A reel went out of the window, so another has come in: look for its bands on the next frame.
        if (left) lookedAt = 0;
    }

    /**
     * Puts back at 0 each view under [band] that Litho left translated against the band's own lift. Litho
     * ends an animation of one of its views (after a sheet over the reel closes, or the window grows back from
     * picture in picture) by putting it where its layout says, counting the translations of the views it's in,
     * so a child ends up pushed back down by the band's lift, on top of the pill. Such a child's translation and
     * those between it and [band] add up to the opposite of the band's. Anything else is left as it is.
     */
    private static void keepUnderTheLift(View band) {
        float lift = band.getTranslationY();
        if (lift != 0f && band instanceof android.view.ViewGroup) {
            putBackUnder((android.view.ViewGroup) band, lift, PUT_BACK_DEPTH);
        }
    }

    private static void putBackUnder(android.view.ViewGroup group, float above, int depth) {
        if (depth <= 0) return;
        for (int i = 0; i < group.getChildCount(); i++) {
            View child = group.getChildAt(i);
            float own = child.getTranslationY();
            if (own != 0f && own + above == 0f) {
                child.setTranslationY(0f);
                own = 0f;
            }
            if (child instanceof android.view.ViewGroup) {
                putBackUnder((android.view.ViewGroup) child, above + own, depth - 1);
            }
        }
    }

    /** Finds the reels' bands under every Reels root in the window. */
    private void look(View root) {
        bands.clear();
        if (root == null) return;
        java.util.ArrayList<View> roots = new java.util.ArrayList<>();
        findRoots(root, roots, 0);
        for (View reels : roots) {
            anchors.clear();
            anchorsUnder(reels, 0);
            for (View anchor : anchors) {
                View band = GlassTabBar.reelBand(anchor, mediaId, reels);
                if (band == null) continue;
                boolean seekBar = anchor.getId() == scrubberId;
                Boolean known = bands.get(band);
                bands.put(band, seekBar || Boolean.TRUE.equals(known));
            }
        }
        anchors.clear();
        // Bands no longer on screen go back where Instagram put them.
        java.util.Iterator<java.util.Map.Entry<View, Float>> it = lifted.entrySet().iterator();
        while (it.hasNext()) {
            java.util.Map.Entry<View, Float> entry = it.next();
            View band = entry.getKey();
            if (band == null) {
                it.remove();
            } else if (!bands.containsKey(band)) {
                putBack(band, entry.getValue());
                it.remove();
            }
        }
    }

    /**
     * Puts each view under [view] whose id is the reel's info or seek bar in {@link #anchors}, without looking
     * inside those or inside the footers. Unlike {@link GlassTabBar#reelAnchors} it also takes hidden ones: a
     * reel's seek bar is hidden until its video plays, and lifted only once shown, it first showed under the pill.
     * Only what is gone, and has no place laid out, is passed over.
     */
    private void anchorsUnder(View view, int depth) {
        if (depth > 60 || view.getVisibility() == View.GONE) return;
        int own = view.getId();
        if (own != View.NO_ID && own != 0) {
            if (own == footersId) return;
            if (own == infoId || own == scrubberId) {
                anchors.add(view);
                return;
            }
        }
        if (!(view instanceof android.view.ViewGroup)) return;
        android.view.ViewGroup group = (android.view.ViewGroup) view;
        for (int i = 0; i < group.getChildCount(); i++) anchorsUnder(group.getChildAt(i), depth + 1);
    }

    private void findRoots(View view, java.util.List<View> roots, int depth) {
        if (depth > 40 || view.getVisibility() != View.VISIBLE) return;
        if (view.getId() == rootId) {
            roots.add(view);
            return;
        }
        if (!(view instanceof android.view.ViewGroup)) return;
        android.view.ViewGroup group = (android.view.ViewGroup) view;
        for (int i = 0; i < group.getChildCount(); i++) findRoots(group.getChildAt(i), roots, depth + 1);
    }

    /** Puts back every band this lifted. */
    void reset() {
        if (lifted.isEmpty()) return;
        for (java.util.Map.Entry<View, Float> entry : lifted.entrySet()) {
            if (entry.getKey() != null) putBack(entry.getKey(), entry.getValue());
        }
        lifted.clear();
        bands.clear();
        lookedAt = 0;
    }

    private static void putBack(View band, Float ours) {
        if (ours != null && band.getTranslationY() == ours) band.setTranslationY(0f);
    }
}
