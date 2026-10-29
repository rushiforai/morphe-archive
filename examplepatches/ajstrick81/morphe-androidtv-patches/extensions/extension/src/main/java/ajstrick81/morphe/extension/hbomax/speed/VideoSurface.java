package ajstrick81.morphe.extension.hbomax.speed;

import android.view.SurfaceView;
import android.view.TextureView;
import android.view.View;
import android.view.ViewGroup;

/**
 * Finds the view the video is rendered into, so the speed chip is only shown on
 * a playback screen and not over the browse UI.
 *
 * HBO Max renders through media3, which means either a SurfaceView (the default,
 * and the only option for L1-protected output) or a TextureView. Rather than
 * fingerprinting the app's player view — a different obfuscated class in every
 * release — the surface is located by walking the Activity's view tree, which is
 * framework API and cannot be obfuscated. The largest candidate wins, because a
 * player screen can legitimately contain more than one (thumbnail scrubber, ad
 * surface, PiP stub).
 */
final class VideoSurface {
    /** Anything smaller than this is a thumbnail, not the video. */
    private static final int MINIMUM_EDGE_PIXELS = 160;

    private VideoSurface() {
    }

    static View find(View root) {
        return findLargest(root, null);
    }

    private static View findLargest(View view, View best) {
        if (view == null) return best;

        if (view instanceof SurfaceView || view instanceof TextureView) {
            if (view.getWidth() >= MINIMUM_EDGE_PIXELS
                    && view.getHeight() >= MINIMUM_EDGE_PIXELS
                    && view.getVisibility() == View.VISIBLE
                    && (best == null || area(view) > area(best))) {
                best = view;
            }
            return best;
        }

        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) {
                best = findLargest(group.getChildAt(i), best);
            }
        }

        return best;
    }

    private static long area(View view) {
        return (long) view.getWidth() * view.getHeight();
    }
}
