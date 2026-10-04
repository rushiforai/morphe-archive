package app.onlynazril.extension.tiktok;

import android.content.Context;
import android.content.res.Resources;
import android.text.Editable;
import android.text.TextWatcher;
import android.util.Log;
import android.view.View;
import android.widget.TextView;

import java.lang.ref.WeakReference;
import java.util.Collections;
import java.util.Map;
import java.util.WeakHashMap;

import app.onlynazril.extension.tiktok.internal.Debug;
import app.onlynazril.extension.tiktok.internal.Reflect;
import app.onlynazril.extension.tiktok.internal.RestartPrompt;
import app.onlynazril.extension.tiktok.settings.HandleSettings;

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

    /** Marks a time view that already carries the re-assert watcher, so it is added exactly once. */
    private static final int WATCHED_TAG = 0x7f0f9997;

    private static int timeViewId;
    private static boolean idResolved;
    private static int reported;
    private static int reportedHides;
    private static int reportedNoViews;
    private static int reportedViewMisses;
    private static int reportedGates;
    private static int reportedRestores;
    /**
     * Raised by hand while a surface outside the feed is being traced: the render worth seeing is
     * always the one that comes after the feed has spent its lines, so a small cap does not make the
     * failure rare, it makes it invisible. `no view` and `view miss` are the two silent returns that
     * a surface with no region has to be told apart by, so they get their own counters.
     */
    private static final int MAX_REPORTS = 120;
    private static final int MAX_HIDES = 40;
    private static final int MAX_NO_VIEW = 40;
    private static final int MAX_VIEW_MISS = 40;
    private static final int MAX_GATES = 20;
    /** One line per write the view took back, so the path that overwrites us can be named. */
    private static final int MAX_RESTORES = 20;
    private static final int MAX_RESTORE_FRAMES = 8;

    private AuthorInfoBridge() {}

    /** View creation: resolve the time view once for this component. */
    public static void onHeaderView(Object assem, View root) {
        try {
            if (assem == null || root == null) return;
            // The first header of a freshly patched install is where a restart is asked for: it is
            // the earliest point in the app's own UI where an Activity is in hand.
            RestartPrompt.maybeShow(root);
            int id = timeViewId(root.getContext());
            if (id == 0) {
                reportViewMiss(assem, "no post-time id resolved");
                return;
            }
            View time = root.findViewById(id);
            if (time == null) {
                reportViewMiss(assem, "the id is not in this component's view");
                return;
            }
            // The post time is not written by this component: the header is also updated from the view
            // model's state, and that path writes the time text itself, after the render this patch
            // hooks. Watching the view is what makes the outcome independent of who writes last.
            if (time.getTag(WATCHED_TAG) == null) {
                time.setTag(WATCHED_TAG, Boolean.TRUE);
                if (time instanceof TextView) {
                    ((TextView) time).addTextChangedListener(new Reassert((TextView) time));
                }
            }
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
            if (time == null) {
                reportNoView(assem);
                return;
            }
            apply(time, aweme);
        } catch (Throwable t) {
            Log.w(TAG, "post-time write failed", t);
        }
    }

    private static void apply(View view, Object aweme) {
        try {
            if (!(view instanceof TextView)) {
                reportGate("the time view is not a TextView");
                return;
            }
            if (!HandleSettings.surfaceEnabled(Surfaces.FEED)) {
                reportGate("the feed surface switch is off");
                return;
            }

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
            // Exactly what was rendered, and the time text it was built from. The base is
            // remembered rather than recovered from the text later: a view carrying a region on its
            // own has no time to rebuild from, and a recycled view is recognised by its own render.
            // Written before the text, because the watcher reads the tag: with the old target still
            // on the view it would put the previous render back the moment this one is set.
            timeView.setTag(StampText.TARGET_TAG, target);
            timeView.setTag(StampText.BASE_TAG, base);
            timeView.setText(target);
            timeView.setVisibility(View.VISIBLE);
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
        // The tags go first: the watcher restores whatever the tag holds, and this is the one write
        // that has to stand. A view the extension has nothing to put on must stay empty.
        timeView.setTag(StampText.TARGET_TAG, null);
        timeView.setTag(StampText.BASE_TAG, null);
        if (!currentText(timeView).isEmpty()) timeView.setText("");
        if (timeView.getVisibility() != View.GONE) timeView.setVisibility(View.GONE);
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

    /**
     * A renderer that ran on a component whose time view was never captured. On screen this is
     * exactly "TikTok's own post time, no region" and so is "the component is not the one we
     * hooked", which produces no line here at all. These two reports are what tells them apart.
     */
    private static void reportNoView(Object assem) {
        if (reportedNoViews >= MAX_NO_VIEW) return;
        reportedNoViews++;
        Debug.print("header write skipped: no time view captured for " + nameOf(assem));
    }

    /** A component whose root view does not carry the time view, so none of its renders can write. */
    private static void reportViewMiss(Object assem, String why) {
        if (reportedViewMisses >= MAX_VIEW_MISS) return;
        reportedViewMisses++;
        Debug.print("header view not found: " + why + " on " + nameOf(assem));
    }

    /** A render that reached the write and was stopped by a switch before it could compose. */
    private static void reportGate(String why) {
        if (reportedGates >= MAX_GATES) return;
        reportedGates++;
        Debug.print("header write skipped: " + why);
    }

    private static String nameOf(Object assem) {
        return assem == null ? "a null component" : assem.getClass().getName();
    }

    /**
     * Puts the rendered line back when something else writes over the time view.
     *
     * The post time is not written by the component this patch hooks: the header is also updated
     * from the view model's state, and that path sets the time text itself. Which of the two writes
     * lands last is a question of timing, so the answer is not one more hook but a view that always
     * carries the line the extension rendered means the string is already on the view's tag, so putting
     * it back needs to know nothing about the item and nothing about who wrote.
     */
    private static final class Reassert implements TextWatcher {
        private final TextView view;
        private boolean writing;

        Reassert(TextView view) {
            this.view = view;
        }

        @Override
        public void beforeTextChanged(CharSequence s, int start, int count, int after) {}

        @Override
        public void onTextChanged(CharSequence s, int start, int before, int count) {}

        @Override
        public void afterTextChanged(Editable editable) {
            if (writing) return;
            Object tag = view.getTag(StampText.TARGET_TAG);
            if (!(tag instanceof String)) return;
            String target = (String) tag;
            String current = editable == null ? "" : editable.toString();
            if (target.equals(current)) return;
            writing = true;
            try {
                reportRestore(current, target);
                view.setText(target);
                if (view.getVisibility() != View.VISIBLE) view.setVisibility(View.VISIBLE);
            } catch (Throwable t) {
                Log.w(TAG, "post-time re-assert failed", t);
            } finally {
                writing = false;
            }
        }
    }

    /**
     * One line per write that had to be taken back, capped, with the frames above it: the class that
     * wrote over the time view is the one thing a screen cannot show, and it is what says whether a
     * hook on that path would be better than putting the line back here.
     */
    private static void reportRestore(String was, String target) {
        if (reportedRestores >= MAX_RESTORES) return;
        reportedRestores++;
        Debug.print("header text restored: '" + was + "' -> '" + target + "' via " + frames());
    }

    /** The frames above the view write, minus the extension's own and the framework's. */
    private static String frames() {
        StringBuilder chain = new StringBuilder();
        int taken = 0;
        for (StackTraceElement frame : new Throwable().getStackTrace()) {
            String name = frame.getClassName();
            if (name.startsWith("app.onlynazril.extension")
                    || name.startsWith("android.widget.")
                    || name.startsWith("android.view.")
                    || name.startsWith("android.text.")
                    || name.startsWith("java.lang.Thread")) {
                continue;
            }
            if (taken++ > 0) chain.append(" <- ");
            chain.append(name).append('#').append(frame.getMethodName());
            if (taken >= MAX_RESTORE_FRAMES) break;
        }
        return chain.toString();
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
