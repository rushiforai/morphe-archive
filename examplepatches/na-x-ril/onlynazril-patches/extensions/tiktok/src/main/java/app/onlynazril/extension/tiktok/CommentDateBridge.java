package app.onlynazril.extension.tiktok;

import android.content.Context;
import android.util.Log;
import android.util.TypedValue;
import android.widget.TextView;

import app.onlynazril.extension.tiktok.internal.Debug;
import app.onlynazril.extension.tiktok.internal.Reflect;
import app.onlynazril.extension.tiktok.settings.HandleSettings;

/**
 * Puts the post time and a commenter's region on the comment's own time view.
 * <p>
 * The feed hangs both on the post-time view, and that view's dim color is what keeps the region
 * from reading as part of the name. A comment has the same kind of view, the time under the
 * comment, so both belong there too: the name stays the name, the region stops sitting against the
 * verified badge that follows the name, and it takes the time's color without this writing one.
 * A `String` cannot carry a color for one part of itself, so a region in a name always comes out
 * in the name's color, on the name's side of the badge.
 * <p>
 * The time is rebuilt from the comment's own create time whenever the post-time switch is on, so a
 * comment is dated the same way as the feed: the compact age, and the chosen date format once it is
 * older than a week. With the switch off the text TikTok wrote stays as it is, and only the region
 * is appended; the two switches are asked separately.
 * <p>
 * Both values are read from the comment the cell is writing the time for, not from the name view.
 * That matters: the time is written before the name is, so a bridge that looked for the name on
 * screen found nothing, and in this cell every view id is obfuscated, so there was nothing to look
 * it up by either. The comment itself is a source that is there whenever the time is.
 * <p>
 * Every switch that governs this writer is asked here rather than assumed from another element's
 * state: the surface (`surfaceEnabled`), the post time (`timeOn`) and the region (`regionOn`).
 * Turning the comments surface off therefore stops both on comments too, which is what that switch
 * says it does.
 *
 * The line is drawn one step larger than TikTok laid the view out, so the date, the clock and the
 * region stay readable at comment-row size. The original size is remembered on the view and put
 * back whenever this bridge writes nothing.
 */
public final class CommentDateBridge {
    private static final String TAG = "tiktokHandle";
    private static final int MAX_REPORTS = 12;

    /** Tag holding the view's own text size, before this bridge enlarged it. */
    private static final int SIZE_TAG = 0x7f0f9997;

    /** One step above TikTok's own size: readable without redrawing the row around it. */
    private static final float STEP_SP = 1f;

    private static int reported;

    private CommentDateBridge() {}

    /** Called right after the comment cell sets its time, with the comment it is showing. */
    public static void attach(Object comment, TextView timeView) {
        try {
            // Collected before the switches are asked: what a comment knows about its author and the
            // person it replies to is what lets a reply name resolve to a handle later, and it has
            // to be gathered whether or not a time or region is drawn here.
            if (comment != null) {
                Object author = Reflect.property(comment, "getUser", "user");
                Object nickname = Reflect.readField(author, "nickname");
                UserIndex.rememberComment(
                        Reflect.string(comment, "getCid", "cid"),
                        Reflect.string(author, "getUid", "uid"),
                        nickname instanceof String ? (String) nickname : null,
                        RegionSource.handleOf(author));
                UserIndex.rememberReply(
                        Reflect.string(comment, "getReplyToNickName", "replyToNickName"),
                        Reflect.string(comment, "getReplyToUserId", "replyToUserId"),
                        Reflect.string(
                                comment,
                                "getReplyToReplyCommentId",
                                "replyToReplyId"));
            }
            if (!HandleSettings.surfaceEnabled(Surfaces.COMMENTS)) {
                strip(timeView);
                report("comments surface off");
                return;
            }
            boolean showTime = HandleSettings.timeOn(Surfaces.COMMENTS);
            boolean showRegion = HandleSettings.regionOn(Surfaces.COMMENTS);
            if (!showTime && !showRegion) {
                strip(timeView);
                report("time and region switches off");
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
            Context context = timeView.getContext();
            String current = textOf(timeView);
            // TikTok's own age is needed only while the post-time switch is off; with it on the
            // comment's create time is the source, exactly as in the feed header.
            String time = showTime
                    ? StampText.timeText(
                            timeView,
                            current,
                            createTimeOf(comment),
                            true,
                            HandleSettings.isCompactEnabled(context),
                            HandleSettings.datePattern(context),
                            HandleSettings.isClockEnabled(context))
                    : StampText.baseText(timeView, current);
            String region = showRegion ? RegionSource.forComment(comment) : null;
            if (region != null && HandleSettings.isRegionName(context)) {
                region = CountryName.of(context, region);
            }
            String target = StampText.withRegion(time, region);
            if (target.equals(current)) {
                report("already '" + current + "'");
                return;
            }
            timeView.setTag(StampText.TARGET_TAG, target);
            timeView.setTag(StampText.BASE_TAG, time);
            enlarge(timeView);
            timeView.setText(target);
            report((time.isEmpty() ? "no time on the view -> '" : "'") + target + "'");
        } catch (Throwable t) {
            Log.w(TAG, "comment time failed", t);
            report("failed: " + t);
        }
    }

    /** A comment's create time is seconds, like a post's; `StampText` scales it to millis. */
    private static long createTimeOf(Object comment) {
        Object value = Reflect.property(comment, "getCreateTime", "createTime");
        return value instanceof Number ? ((Number) value).longValue() : 0L;
    }

    /**
     * One step above the size the row was laid out with. The original is kept on the view, so a
     * recycled cell is never enlarged twice, and it is restored when the extension writes nothing.
     */
    private static void enlarge(TextView view) {
        float base = baseSize(view);
        float target = base + TypedValue.applyDimension(
                TypedValue.COMPLEX_UNIT_SP, STEP_SP, view.getResources().getDisplayMetrics());
        if (Math.abs(view.getTextSize() - target) > 0.5f) {
            view.setTextSize(TypedValue.COMPLEX_UNIT_PX, target);
        }
    }

    private static float baseSize(TextView view) {
        Object tag = view.getTag(SIZE_TAG);
        if (tag instanceof Float) return (Float) tag;
        float size = view.getTextSize();
        view.setTag(SIZE_TAG, size);
        return size;
    }

    private static void restoreSize(TextView view) {
        Object tag = view.getTag(SIZE_TAG);
        if (tag instanceof Float && Math.abs(view.getTextSize() - (Float) tag) > 0.5f) {
            view.setTextSize(TypedValue.COMPLEX_UNIT_PX, (Float) tag);
        }
    }

    /** Puts the text a render replaced back, before the switch that put it there goes off. */
    private static void strip(TextView timeView) {
        if (timeView == null) return;
        String current = textOf(timeView);
        String base = StampText.baseText(timeView, current);
        if (!base.equals(current)) timeView.setText(base);
        restoreSize(timeView);
        timeView.setTag(StampText.TARGET_TAG, null);
        timeView.setTag(StampText.BASE_TAG, null);
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
        Debug.print("comment time: " + what);
    }
}
