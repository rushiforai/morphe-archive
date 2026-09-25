package app.onlynazril.extension.tiktokHandle;

import android.util.Log;
import android.widget.TextView;

import app.onlynazril.extension.tiktokHandle.internal.Debug;
import app.onlynazril.extension.tiktokHandle.settings.HandleSettings;

/**
 * Puts a commenter's region on the comment's own time view.
 *
 * The feed hangs the region on the post-time view, and that view's dim colour is what keeps it from
 * reading as part of the name. A comment has the same kind of view — the time under the comment —
 * so the region belongs there too: the name stays the name, the region stops sitting against the
 * verified badge that follows the name, and it takes the time's colour without this writing one.
 * A `String` cannot carry a colour for one part of itself, so a region in a name always comes out
 * in the name's colour, on the name's side of the badge.
 *
 * The region is read from the comment the cell is writing the time for, not from the name view.
 * That matters: the time is written before the name is, so a bridge that looked for the name on
 * screen found nothing, and in this cell every view id is obfuscated, so there was nothing to look
 * it up by either. The comment itself is a source that is there whenever the time is.
 *
 * Both switches that govern this writer are asked here rather than assumed from another element's
 * state: the surface (`surfaceEnabled`) and the region (`regionOn`). Turning the comments surface
 * off therefore stops the region on comments too, which is what that switch says it does.
 */
public final class CommentDateBridge {
    private static final String TAG = "tiktokHandle";
    private static final int MAX_REPORTS = 12;

    private static int reported;

    private CommentDateBridge() {}

    /** Called right after the comment cell sets its time, with the comment it is showing. */
    public static void attach(Object comment, TextView timeView) {
        try {
            if (!HandleSettings.surfaceEnabled(Surfaces.COMMENTS)) {
                report("comments surface off");
                return;
            }
            if (!HandleSettings.regionOn(Surfaces.COMMENTS)) {
                report("region switch off");
                return;
            }
            if (timeView == null) {
                report("no time view");
                return;
            }
            if (comment == null) {
                report("no comment");
                return;
            }
            String region = RegionSource.forComment(comment);
            if (region == null) {
                report("no region for this commenter");
                return;
            }
            String current = textOf(timeView);
            String time = StampText.withoutRegion(current);
            // An empty time view is no reason to drop the region: it is written on its own, the same
            // way the feed header does it, so the region switch stands without the post-time one.
            String target = StampText.withRegion(time, region);
            if (target.equals(current)) {
                report("already '" + current + "'");
                return;
            }
            timeView.setText(target);
            report((time.isEmpty() ? "no time on the view -> '" : "'") + target + "'");
        } catch (Throwable t) {
            Log.w(TAG, "comment time region failed", t);
            report("failed: " + t);
        }
    }

    private static String textOf(TextView view) {
        CharSequence text = view.getText();
        return text == null ? "" : text.toString();
    }

    /**
     * One line per call, capped. Every branch is reported: a hook that never ran, one that ran with
     * no region to place, and one that worked all look the same on screen.
     */
    private static void report(String what) {
        if (reported >= MAX_REPORTS) return;
        reported++;
        Debug.print("comment time region: " + what);
    }
}
