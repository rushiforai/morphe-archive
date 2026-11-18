package app.afterglow.extension.theme;

import android.app.Activity;
import android.app.Application;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.graphics.drawable.GradientDrawable;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;

import java.util.WeakHashMap;
import java.util.Map;

import app.afterglow.extension.Afterglow;
import app.afterglow.extension.InstalledTweaks;
import app.afterglow.extension.settings.NativeThemeColors;
import app.afterglow.extension.settings.ThemePalette;
import app.afterglow.extension.settings.ThemeRole;

/** Native view adapters, attached once per activity and coalesced across layout changes. */
public final class NativeViews {
    private static final Map<View, Boolean> ATTACHED = new WeakHashMap<>();
    private static boolean registered;
    private static final java.util.Set<String> PAGE_SURFACES = new java.util.HashSet<>(java.util.Arrays.asList(
            "more_drawer_container", "slim_status_bar_player_container", "navigation_bar_divider_frame",
            "global_slim_status_bar_container", "accessibility_layer_container", "next_gen_watch_container_layout",
            "watch_while_layout_coordinator_layout", "fab_container", "pane_fragment_container",
            "pane_fragment_background_container", "pane_fragment_contents", "browse_fragment_layout_coordinator_layout",
            "results", "loading_layout"));
    // The fullscreen overlay also contains artwork with no resource id. Only
    // verified controls are icons; thumbnails must keep their own pixels.
    private static final java.util.Set<String> PLAYER_ICONS = new java.util.HashSet<>(java.util.Arrays.asList(
            "player_collapse_button", "player_subtitle_button", "player_overflow_button",
            "player_control_previous_button", "player_control_play_pause_replay_button",
            "player_control_next_button", "fullscreen_button"));
    private NativeViews() {}

    public static void install(Activity activity) {
        try {
            if (!registered) {
                registered = true;
                activity.getApplication().registerActivityLifecycleCallbacks(new Application.ActivityLifecycleCallbacks() {
                    public void onActivityCreated(Activity a, Bundle b) {}
                    public void onActivityStarted(Activity a) {}
                    public void onActivityResumed(Activity a) { attach(a); }
                    public void onActivityPaused(Activity a) {}
                    public void onActivityStopped(Activity a) {}
                    public void onActivitySaveInstanceState(Activity a, Bundle b) {}
                    public void onActivityDestroyed(Activity a) {}
                });
            }
            attach(activity);
        } catch (Throwable error) { Afterglow.error("NativeViews.install", error); }
    }
    private static void attach(Activity activity) {
        if (activity.getClass().getName().startsWith("app.afterglow.")) return;
        View root = activity.findViewById(android.R.id.content);
        if (root == null) return;
        if (ATTACHED.containsKey(root)) { root.requestLayout(); return; }
        ATTACHED.put(root, true);
        Controller controller = new Controller(root);
        root.getViewTreeObserver().addOnGlobalLayoutListener(controller::schedule);
        root.getViewTreeObserver().addOnPreDrawListener(() -> { GlowRenderer.frame(root); return true; });
        controller.schedule();
    }
    private static final class Controller implements Runnable {
        final View root;
        final Handler handler = new Handler(Looper.getMainLooper());
        final Map<View, Boolean> cleared = new WeakHashMap<>();
        boolean pending;
        Controller(View root) { this.root = root; }
        void schedule() { if (!pending) { pending = true; handler.postDelayed(this, 100); } }
        @Override public void run() {
            pending = false;
            if (!root.isAttachedToWindow()) return;
            try {
                ThemePalette palette = NativeTheme.activePalette();
                if (palette != null && palette.hasGradient() && !cleared.containsKey(root)) {
                    root.setBackground(new GradientDrawable(GradientDrawable.Orientation.TOP_BOTTOM,
                            new int[]{palette.color(ThemeRole.GRADIENT_START), palette.color(ThemeRole.GRADIENT_END)}));
                    cleared.put(root, true);
                }
                visit(root, palette, false, false, 0);
            } catch (Throwable error) { Afterglow.error("NativeViews.layout", error); }
        }
        void visit(View view, ThemePalette palette, boolean tab, boolean overlay, int depth) {
            if (depth > 48) return;
            String id = name(view);
            tab |= id.equals("pivot_bar") || id.equals("bottom_bar_container");
            overlay |= id.equals("player_overlays") || id.equals("player_control_view") || id.equals("player_controls_layout");
            if (palette != null && palette.hasGradient() && !cleared.containsKey(view) && PAGE_SURFACES.contains(id)) {
                view.setBackgroundColor(0); cleared.put(view, true);
            }
            if (palette != null && !cleared.containsKey(view) &&
                    (id.equals("appbar_layout") || id.equals("toolbar_container") || id.equals("toolbar")
                            || id.equals("bottom_bar_container") || id.equals("pivot_bar"))) {
                Integer navigation = palette.color(ThemeRole.NAVIGATION_SURFACE);
                if (navigation != null) { view.setBackgroundColor(navigation); cleared.put(view, true); }
            }
            if (view instanceof TextView) {
                TextView text = (TextView) view;
                if (palette != null && !text.getTextColors().isStateful()) {
                    int original = text.getCurrentTextColor();
                    int color = NativeTheme.foregroundColor(original);
                    if (color != original) text.setTextColor(color);
                }
                Typography.textView(text, tab);
            }
            boolean icon = view instanceof ImageView && isIcon((ImageView) view, tab, overlay);
            if (palette != null && icon) {
                Integer color = palette.color(tab ? ThemeRole.TAB_ICON : ThemeRole.OVERLAY_CONTROL);
                if (color != null)
                    ((ImageView) view).setImageTintList(android.content.res.ColorStateList.valueOf(color));
            }
            if (icon)
                GlowRenderer.update((ImageView) view, tab, overlay, palette);
            if (view instanceof ViewGroup) {
                ViewGroup group = (ViewGroup) view;
                for (int i=0; i<group.getChildCount(); i++) visit(group.getChildAt(i), palette, tab, overlay, depth+1);
            }
        }
    }
    static boolean isIcon(ImageView image, boolean tab, boolean overlay) {
        String id = name(image);
        return ((tab && !(image.getDrawable() instanceof android.graphics.drawable.BitmapDrawable))
                || (overlay && PLAYER_ICONS.contains(id)))
                && !id.contains("avatar") && !id.contains("thumbnail") && !id.contains("profile")
                ;
    }
    static String name(View view) {
        if (view.getId() == View.NO_ID) return "";
        try { return view.getResources().getResourceEntryName(view.getId()); }
        catch (android.content.res.Resources.NotFoundException ignored) { return ""; }
    }
}
