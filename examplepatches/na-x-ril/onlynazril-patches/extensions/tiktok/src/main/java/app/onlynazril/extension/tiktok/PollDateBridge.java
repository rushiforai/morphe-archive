package app.onlynazril.extension.tiktok;

import android.content.Context;
import android.util.Log;
import android.widget.TextView;

import app.onlynazril.extension.tiktok.internal.Debug;
import app.onlynazril.extension.tiktok.internal.Reflect;
import app.onlynazril.extension.tiktok.settings.HandleSettings;

/**
 * Puts the post time and the creator's region on a comment poll's own date view.
 * <p>
 * A poll is drawn by its own cell, so it does not pass through the comment cell's time write and
 * keeps TikTok's short `MM-dd` until this bridge runs. The poll carries its own create time, which
 * is the source here, exactly as a comment's create time is for [CommentDateBridge]. The region
 * belongs to the poll's creator, resolved from the author captured when the video was bound; when
 * that account's region is not known, no region is written rather than guessing.
 * <p>
 * The same switches govern this writer as the comment one: the comments surface, the post time and
 * the region. With all of them off the date TikTok wrote is put back, so turning a switch off does
 * not leave a rewritten poll behind.
 */
public final class PollDateBridge {
    private static final String TAG = "tiktokHandle";
    private static final int MAX_REPORTS = 12;

    private static int reported;

    private PollDateBridge() {}

    /** Called right after the poll cell writes its date, with the poll it is showing. */
    public static void attach(Object poll, TextView dateView) {
        try {
            if (!HandleSettings.surfaceEnabled(Surfaces.COMMENTS)) {
                strip(dateView);
                report("comments surface off");
                return;
            }
            boolean showTime = HandleSettings.timeOn(Surfaces.COMMENTS);
            boolean showRegion = HandleSettings.regionOn(Surfaces.COMMENTS);
            if (!showTime && !showRegion) {
                strip(dateView);
                report("time and region switches off");
                return;
            }
            if (dateView == null) {
                report("no date view");
                return;
            }
            if (poll == null) {
                report("no poll");
                return;
            }
            Context context = dateView.getContext();
            String current = textOf(dateView);
            String time = showTime
                    ? StampText.timeText(
                            dateView,
                            current,
                            createTimeOf(poll),
                            true,
                            HandleSettings.isCompactEnabled(context),
                            HandleSettings.datePattern(context),
                            HandleSettings.isClockEnabled(context))
                    : StampText.baseText(dateView, current);
            String region = showRegion ? regionOf(poll) : null;
            if (region != null && HandleSettings.isRegionName(context)) {
                region = CountryName.of(context, region);
            }
            String target = StampText.withRegion(time, region);
            if (target.equals(current)) {
                report("already '" + current + "'");
                return;
            }
            dateView.setTag(StampText.TARGET_TAG, target);
            dateView.setTag(StampText.BASE_TAG, time);
            dateView.setText(target);
            report((time.isEmpty() ? "no time on the view -> '" : "'") + target + "'");
        } catch (Throwable t) {
            if (Debug.verbose()) Log.w(TAG, "poll date failed", t);
            report("failed: " + t);
        }
    }

    /** The poll's create time is seconds, like a comment's; `StampText` scales it to millis. */
    private static long createTimeOf(Object poll) {
        Object value = Reflect.property(poll, "getCreateTime", "createTime");
        return value instanceof Number ? ((Number) value).longValue() : 0L;
    }

    /** The poll creator's region, matched by account id from the feed bind. */
    private static String regionOf(Object poll) {
        Object creator = Reflect.property(poll, "getCreatorId", "creatorId");
        if (!(creator instanceof Number)) return null;
        return RegionSource.forUid(String.valueOf(((Number) creator).longValue()));
    }

    /** Puts back the text a render replaced, before the switch that put it there goes off. */
    private static void strip(TextView dateView) {
        if (dateView == null) return;
        String current = textOf(dateView);
        String base = StampText.baseText(dateView, current);
        if (!base.equals(current)) dateView.setText(base);
        dateView.setTag(StampText.TARGET_TAG, null);
        dateView.setTag(StampText.BASE_TAG, null);
    }

    private static String textOf(TextView view) {
        CharSequence text = view.getText();
        return text == null ? "" : text.toString();
    }

    private static void report(String what) {
        if (reported >= MAX_REPORTS) return;
        reported++;
        Debug.print("poll date: " + what + Debug.by(4));
    }
}
