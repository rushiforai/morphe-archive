package app.yydarlinker.aicaptions.overlay;

import android.content.res.Resources;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewStub;
import android.view.ViewTreeObserver;
import android.widget.ImageView;
import android.widget.ProgressBar;
import android.widget.Space;
import android.widget.TextView;
import app.yydarlinker.aicaptions.host.CaptionSurface;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

/** Discovers regular-player control views on layout and samples their visible bounds on pre-draw. */
final class CaptionBottomObstacles {
    private static final Set<String> BARS = Set.of("time_bar", "large_controls_time_bar",
            "watch_while_time_bar_view_overlay", "watch_while_time_bar_view", "player_seekbar");
    private static final Set<String> LABELS = Set.of("time_bar_current_time", "time_bar_total_time",
            "time_bar_live_label", "time_bar_chapter_title", "time_bar_timeline_title");
    private static final Set<String> BOTTOM_ROWS = Set.of("youtube_controls_bottom_ui_container",
            "bottom_ui_container", "quick_actions_container", "bottom_end_container");

    private static final class Sample {
        final boolean bar;
        boolean visible;

        Sample(boolean bar) { this.bar = bar; }
    }

    private final Map<View, Sample> candidates = new HashMap<>();
    private final Map<Integer, String> names = new HashMap<>();
    private final Rect drawing = new Rect();
    private final RectF imageDrawing = new RectF();
    private final RectF bounds = new RectF();
    private final ViewTreeObserver.OnGlobalLayoutListener layout = this::discover;
    private final View.OnAttachStateChangeListener attachment = new View.OnAttachStateChangeListener() {
        @Override public void onViewAttachedToWindow(View v) {}
        @Override public void onViewDetachedFromWindow(View v) { CaptionOverlay.controlHostChanged(); }
    };
    private ViewTreeObserver tree;
    private View host;

    boolean observes(View root) { return host == root && tree != null && tree.isAlive(); }

    void start(View root) {
        host = root;
        for (Set<String> known : List.of(BARS, LABELS, BOTTOM_ROWS, Set.of(
                "big_boards_timestamp_container", "timestamp", "chapter_title", "fullscreen_button",
                "watch_player", "reel_player_page_container", "controls_button_group_layout",
                "player_control_play_pause_replay_button", "top_bar_background", "scrim_overlay",
                "time_bar_entry_point_tap_container", "time_bar_reference_view"))) {
            for (String name : known) {
                int id = root.getResources().getIdentifier(name, "id", root.getContext().getPackageName());
                if (id != 0) names.put(id, name);
            }
        }
        tree = root.getViewTreeObserver();
        root.addOnAttachStateChangeListener(attachment);
        tree.addOnGlobalLayoutListener(layout);
        discover();
    }

    void stop() {
        if (tree != null && tree.isAlive()) tree.removeOnGlobalLayoutListener(layout);
        if (host != null) host.removeOnAttachStateChangeListener(attachment);
        tree = null;
        host = null;
        candidates.clear();
        names.clear();
    }

    private String name(View view) {
        int id = view.getId();
        if (id <= 0) return "";
        return names.computeIfAbsent(id, key -> {
            try {
                return view.getResources().getResourceEntryName(key);
            } catch (Resources.NotFoundException missing) {
                return "";
            }
        });
    }

    private void discover() {
        Map<View, Sample> previous = new HashMap<>(candidates);
        candidates.clear();
        collect(host, false, false, false, previous);
    }

    private void collect(View view, boolean inRow, boolean inBar, boolean inTimestamp,
            Map<View, Sample> previous) {
        if (view instanceof Space || view instanceof ViewStub) return;
        String name = name(view);
        if (view != host && (name.equals("watch_player") || name.equals("reel_player_page_container")
                || excluded(name))) return;
        boolean bar = BARS.contains(name);
        boolean label = LABELS.contains(name) || inTimestamp
                && (name.equals("timestamp") || name.equals("chapter_title"));
        boolean icon = view instanceof ImageView || view instanceof TextView;
        if (bar || label || name.equals("fullscreen_button") || inRow && icon
                || inBar && (!view.willNotDraw() || view instanceof ProgressBar)) {
            Sample last = previous.get(view);
            candidates.put(view, last == null ? new Sample(bar || inBar) : last);
        }
        if (view instanceof ViewGroup group) {
            for (int i = 0; i < group.getChildCount(); i++)
                collect(group.getChildAt(i), inRow || BOTTOM_ROWS.contains(name)
                                || name.equals("fullscreen_button"), inBar || bar,
                        inTimestamp || name.equals("big_boards_timestamp_container"), previous);
        }
    }

    private static boolean excluded(String name) {
        return name.equals("controls_button_group_layout")
                || name.startsWith("player_control_play_pause_replay_button")
                || name.contains("scrim") || name.contains("touch_area")
                || name.contains("touch_target") || name.contains("tap_container")
                || name.equals("time_bar_reference_view")
                || name.startsWith("top_") || name.contains("top_controls")
                || name.startsWith("player_title") || name.startsWith("player_overflow")
                || name.startsWith("player_collapse");
    }

    float bandTop(CaptionSurface.Projection frame, Rect video) {
        float top = Float.POSITIVE_INFINITY;
        for (var entry : candidates.entrySet()) {
            View view = entry.getKey();
            Sample sample = entry.getValue();
            float alpha = effectiveAlpha(view);
            sample.visible = alpha >= .08f || sample.visible && alpha > .02f;
            if (!sample.visible || !draws(view, sample.bar)) continue;
            Rect painted = drawingBounds(view) ? drawing : null;
            if (frame.bounds(view, painted, bounds, video.height() * .42f)
                    && bounds.top >= video.exactCenterY()
                    && bounds.intersect(video.left, video.top, video.right, video.bottom)) {
                top = Math.min(top, bounds.top);
            }
        }
        return top;
    }

    private float effectiveAlpha(View view) {
        if (view.getWindowVisibility() != View.VISIBLE) return 0;
        View root = view.getRootView();
        boolean inHost = false;
        float alpha = 1;
        for (View item = view; item != null;
                item = item.getParent() instanceof View parent ? parent : null) {
            if (item.getVisibility() != View.VISIBLE) return 0;
            alpha *= item.getAlpha();
            if (item == host) inHost = true;
            if (item == root) return inHost ? alpha : 0;
        }
        return 0;
    }

    private boolean drawingBounds(View view) {
        if (view instanceof ImageView image) {
            imageDrawing.set(image.getDrawable().getBounds());
            image.getImageMatrix().mapRect(imageDrawing);
            imageDrawing.offset(image.getPaddingLeft(), image.getPaddingTop());
            imageDrawing.roundOut(drawing);
            return true;
        }
        if (!(view instanceof ProgressBar progress)) return false;
        Drawable drawable = progress.isIndeterminate()
                ? progress.getIndeterminateDrawable() : progress.getProgressDrawable();
        if (!draws(drawable) || drawable.getBounds().isEmpty()) return false;
        drawing.set(drawable.getBounds());
        drawing.offset(view.getPaddingLeft(), view.getPaddingTop());
        return true;
    }

    private static boolean draws(View view, boolean bar) {
        if (view instanceof TextView text) return text.length() > 0;
        if (view instanceof ImageView image) return draws(image.getDrawable());
        if (view instanceof ProgressBar progress)
            return draws(progress.isIndeterminate()
                    ? progress.getIndeterminateDrawable() : progress.getProgressDrawable());
        // InlineTimeBarWrapper positions a custom drawing child, which can itself be a group.
        if (view instanceof ViewGroup)
            return bar && !view.willNotDraw()
                    && !view.getClass().getSimpleName().equals("InlineTimeBarWrapper");
        return draws(view.getBackground()) || bar && view.getClass() != View.class && !view.willNotDraw();
    }

    private static boolean draws(Drawable drawable) {
        return drawable != null && drawable.getAlpha() > 0
                && (!(drawable instanceof ColorDrawable color) || color.getColor() >>> 24 != 0);
    }
}
