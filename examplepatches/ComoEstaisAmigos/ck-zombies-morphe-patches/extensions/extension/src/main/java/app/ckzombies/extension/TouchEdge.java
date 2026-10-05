package app.ckzombies.extension;

/**
 * Keeps touch positions from going below zero before the engine sees them.
 *
 * The engine packs each position into 14 bits per axis (x &amp; 0x3fff), so a negative one, from a
 * finger left of or above the game's view, arrives as 16384 minus the distance. Where the view does
 * not start at the screen's edge, as beside a camera cutout, a fast swipe that runs past it was read
 * as a jump of thousands of pixels: the store's item strip shot off screen and took seconds to come
 * back. Clamped to 0, such a finger stays at the view's edge.
 */
@SuppressWarnings("unused")
public final class TouchEdge {

    private TouchEdge() {
    }

    /** Called first in each of the activity's four touch methods, for x and for y. */
    public static int clamp(int position) {
        return Math.max(position, 0);
    }
}
