package app.onlynazril.extension.tiktokHandle;

import android.content.Context;
import android.content.res.Resources;
import android.util.Log;
import android.view.View;
import android.widget.TextView;

import java.lang.ref.WeakReference;
import java.util.Collections;
import java.util.Map;
import java.util.WeakHashMap;

import app.onlynazril.extension.tiktokHandle.internal.Debug;
import app.onlynazril.extension.tiktokHandle.internal.Reflect;
import app.onlynazril.extension.tiktokHandle.internal.RestartPrompt;
import app.onlynazril.extension.tiktokHandle.settings.HandleSettings;

/**
 * The feed header's post-time view.
 *
 * Two things shape this class. The view is only reachable by id (`tv_post_time`; the header's other
 * ids are obfuscated), so the root view is taken at view creation and the time view resolved once
 * from it. And the values must come from *the item this header is showing*, read off the component
 * itself: reading a "last seen" value at write time gives the neighbouring video's region and age,
 * which is what a shared, deferred value produces once the list starts prefetching.
 *
 * This class writes one view and owns nothing beyond it: the region comes from `RegionSource`, the
 * text from `StampText`. The post time and the region are therefore two switches over one line
 * rather than two writers over one view — a view can only be written once per bind, so both switches
 * have to be read before that write, not after it.
 *
 * Writing here rather than appending to the author name is also what gives the region its colour:
 * the time view already carries TikTok's dimmer colour, while a suffix in the name would take the
 * name's, and a String return from the name getter cannot carry a per-part span.
 */
public final class AuthorInfoBridge {
    private static final String TAG = "tiktokHandle";

    /** `tv_post_time` is the header's own name for it on 47.0.3; the rest are fallbacks. */
    private static final String[] TIME_VIEW_IDS = {
        "tv_post_time", "tv_create_time", "time", "tvTime", "tv_time", "tv_date",
    };

    private static final Map<Object, WeakReference<View>> TIME_VIEWS =
            Collections.synchronizedMap(new WeakHashMap<>());

    private static int timeViewId;
    private static boolean idResolved;
    private static int reported;
    private static int reportedHides;
    private static final int MAX_REPORTS = 12;
    private static final int MAX_HIDES = 4;

    private AuthorInfoBridge() {}

    /** View creation: resolve the time view once for this component. */
    public static void onHeaderView(Object assem, View root) {
        try {
            if (assem == null || root == null) return;
            // The first header of a freshly patched install is where a restart is asked for: it is
            // the earliest point in the app's own UI where an Activity is in hand.
            RestartPrompt.maybeShow(root);
            int id = timeViewId(root.getContext());
            if (id == 0) return;
            View time = root.findViewById(id);
            if (time == null) return;
            TIME_VIEWS.put(assem, new WeakReference<>(time));
        } catch (Throwable t) {
            Log.w(TAG, "post-time view lookup failed", t);
        }
    }

    /**
     * Per-item renderer, called at each of its returns: the item handed over is the one this
     * header is drawing, and TikTok's own text is already set.
     */
    public static void onHeaderItem(Object assem, Object aweme) {
        try {
            if (assem == null || aweme == null) return;
            WeakReference<View> ref = TIME_VIEWS.get(assem);
            View time = ref == null ? null : ref.get();
            if (time == null) return;
            apply(time, aweme);
        } catch (Throwable t) {
            Log.w(TAG, "post-time write failed", t);
        }
    }

    private static void apply(View view, Object aweme) {
        try {
            if (!(view instanceof TextView)) return;
            if (!HandleSettings.surfaceEnabled(Surfaces.FEED)) return;

            TextView timeView = (TextView) view;
            boolean showTime = HandleSettings.timeOn(Surfaces.FEED);
            boolean showRegion = HandleSettings.regionOn(Surfaces.FEED);
            long createTime = createTimeOf(aweme);

            // The time element switched off means TikTok's own time goes as well: this view is where
            // that text lives, and the element that keeps it is the one that is off. Writing nothing
            // here would leave TikTok's time on screen, which is what a switch called "post time"
            // cannot look like. What may remain is the region, which is a separate switch.
            String current = currentText(timeView);
            String base = showTime ? StampText.timeText(timeView, current, createTime, true) : "";
            String region = showRegion ? RegionSource.forAweme(aweme) : null;
            if (base.isEmpty() && region == null) {
                hide(timeView);
                reportHide(showTime, showRegion);
                return;
            }

            // The header separates the name from the time with a margin, not a dot, so the dot is
            // put in front of the time here — on TikTok's own text as well, which is otherwise
            // left as TikTok wrote it.
            String target = StampText.headerTime(base, region);
            report(aweme, region, createTime, showTime, showRegion, current, target);
            if (target.equals(current) && timeView.getVisibility() == View.VISIBLE) return;
            timeView.setText(target);
            timeView.setVisibility(View.VISIBLE);
            // Exactly what was rendered, and the time text it was built from. The base is
            // remembered rather than recovered from the text later: a view carrying a region on its
            // own has no time to rebuild from, and a recycled view is recognised by its own render.
            timeView.setTag(StampText.TARGET_TAG, target);
            timeView.setTag(StampText.BASE_TAG, base);
        } catch (Throwable t) {
            Log.w(TAG, "post-time / region write failed", t);
        }
    }

    /**
     * Takes TikTok's own time off this view, and its copy with it. Called when the time element is
     * off and there is no region to keep, so nothing on the view belongs to the extension and
     * TikTok's text is not left behind. The tags go too: a view that carries no render must not be
     * read as one, or turning the switch back on rebuilds from a base that was never on screen.
     */
    private static void hide(TextView timeView) {
        if (!currentText(timeView).isEmpty()) timeView.setText("");
        if (timeView.getVisibility() != View.GONE) timeView.setVisibility(View.GONE);
        timeView.setTag(StampText.TARGET_TAG, null);
        timeView.setTag(StampText.BASE_TAG, null);
    }

    /**
     * One line per render, capped: what the item carries next to what is drawn, and the state of the
     * two switches that shaped it. This is the only way to tell a wrong source from a wrong item on
     * a device, because both look the same on screen; and a line that names its own switches lets
     * the post time be checked from the region's line and the other way round.
     */
    private static void report(Object aweme, String region, long createTime, boolean showTime,
            boolean showRegion, String before, String after) {
        if (reported >= MAX_REPORTS) return;
        reported++;
        Object author = Reflect.property(aweme, "getAuthor", "author");
        Debug.print("header item: author=" + Reflect.string(author, "getUniqueId", "uniqueId")
                + " authorRegion=" + Reflect.string(author, "getRegion", "region")
                + " itemRegion=" + Reflect.string(aweme, "getRegion", "region")
                + " used=" + (region == null ? "none" : region)
                + " createTime=" + createTime
                + " (time=" + onOff(showTime) + " region=" + onOff(showRegion) + ")"
                + " before='" + before + "' -> '" + after + "'");
    }

    private static String onOff(boolean value) {
        return value ? "on" : "off";
    }

    /**
     * A view left with nothing on it, printed so that a time removed from the screen is readable in
     * the log as well: an empty view and a hook that never ran look the same otherwise.
     */
    private static void reportHide(boolean showTime, boolean showRegion) {
        if (reportedHides >= MAX_HIDES) return;
        reportedHides++;
        Debug.print("header hide: time off, nothing to keep (time=" + onOff(showTime)
                + " region=" + onOff(showRegion) + ")");
    }

    private static long createTimeOf(Object aweme) {
        Object value = Reflect.property(aweme, "getCreateTime", "createTime");
        return value instanceof Number ? ((Number) value).longValue() : 0L;
    }

    private static int timeViewId(Context context) {
        if (idResolved || context == null) return timeViewId;
        idResolved = true;
        Resources resources = context.getResources();
        for (String name : TIME_VIEW_IDS) {
            int id = resources.getIdentifier(name, "id", context.getPackageName());
            if (id == 0) continue;
            timeViewId = id;
            return timeViewId;
        }
        Log.w(TAG, "no post-time view id resolved — post time and region stay off");
        return 0;
    }

    private static String currentText(TextView view) {
        CharSequence text = view.getText();
        return text == null ? "" : text.toString();
    }
}
