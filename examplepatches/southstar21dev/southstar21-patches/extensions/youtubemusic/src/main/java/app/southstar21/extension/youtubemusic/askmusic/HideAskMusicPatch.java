package app.southstar21.extension.youtubemusic.askmusic;

import android.app.Activity;
import android.content.res.Resources;
import android.text.TextUtils;
import android.util.Log;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;

import java.lang.ref.WeakReference;
import java.util.Map;
import java.util.WeakHashMap;

import app.southstar21.extension.youtubemusic.YouTubeMusicHooks;
import app.southstar21.extension.youtubemusic.settings.Settings;

/**
 * Hide Ask Music button: YouTube Music's AI assistant (the sparkle) leaves the top bar, the full
 * player, the mini player, the video's fullscreen controls and the search bar, with its banner.
 * <p>
 * The buttons are hidden after each layout pass, as YouTube Music shows them again when it builds
 * a screen. The player's and the search bar's buttons have ids of their own. The top bar's are
 * generic buttons YouTube Music fills from its server's data, so Ask Music is told apart by its
 * label, which is YouTube Music's own translated "Ask Music" string.
 */
@SuppressWarnings("unused")
public final class HideAskMusicPatch {
    private static final String[] IDS = {
            "ask_music_global_entry_button",
            "mini_player_ask_music_global_entry_button",
            "fullscreen_ask_music_global_entry_button",
            "ask_music",
            "ask_music_banner",
    };

    private static WeakReference<Activity> installedOn = new WeakReference<>(null);
    /** The views this hid and the visibility each had, to give back when the setting is switched off. */
    private static final Map<View, Integer> hidden = new WeakHashMap<>();
    /** A layout pass happened since the last look: YouTube Music may have shown a button again. */
    private static boolean layoutPending = true;
    /** Frames skipped in a row (see onPreDraw): a few at most, so a fight can never freeze the app. */
    private static int skippedFrames;
    private static int playerButtonId;
    private static int extraSpaceId;
    private static int[] ids;
    private static int topBarImageId;
    private static String label;

    private HideAskMusicPatch() {
    }

    /** The patch makes this return true. */
    public static boolean isIncluded() {
        return false;
    }

    /** Called by YouTubeMusicHooks whenever the main activity gains or loses focus. */
    public static void onMainActivityReady(Activity activity) {
        try {
            if (installedOn.get() == activity) return;
            installedOn = new WeakReference<>(activity);
            resolve(activity);
            ViewTreeObserver observer = activity.getWindow().getDecorView().getViewTreeObserver();
            observer.addOnGlobalLayoutListener(() -> layoutPending = true);
            // Hidden before the frame is drawn, not after its layout: YouTube Music shows the
            // player's button again on every song change, and hiding it after the layout drew one
            // frame with it (the other buttons jumped aside and back). When anything had to be
            // hidden, that frame is skipped and laid out again first.
            observer.addOnPreDrawListener(() -> {
                if (!layoutPending) return true;
                layoutPending = false;
                if (apply(activity) && skippedFrames < 2) {
                    skippedFrames++;
                    return false;
                }
                skippedFrames = 0;
                return true;
            });
            apply(activity);
        } catch (Throwable t) {
            Log.e(YouTubeMusicHooks.TAG, "Hide Ask Music", t);
        }
    }

    /** The setting changed: hides the buttons, or shows the ones this hid. */
    public static void refresh() {
        Activity activity = installedOn.get();
        if (activity == null) return;
        if (!Settings.hideAskMusic()) {
            for (Map.Entry<View, Integer> entry : hidden.entrySet()) {
                View view = entry.getKey();
                if (view != null && view.getVisibility() == View.GONE) view.setVisibility(entry.getValue());
            }
            hidden.clear();
            return;
        }
        apply(activity);
    }

    private static void resolve(Activity activity) {
        Resources res = activity.getResources();
        ids = new int[IDS.length];
        for (int i = 0; i < IDS.length; i++) ids[i] = id(res, activity, IDS[i], "id");
        playerButtonId = ids[0];
        extraSpaceId = id(res, activity, "top_bar_extra_space", "id");
        topBarImageId = id(res, activity, "top_bar_menu_item_image_view", "id");
        int labelId = id(res, activity, "accessibility_ask_music", "string");
        label = labelId == 0 ? "Ask Music" : res.getString(labelId);
    }

    private static int id(Resources res, Activity activity, String name, String type) {
        // Resources keep the original package name even if the app was renamed (GmsCore support).
        int id = res.getIdentifier(name, type, "com.google.android.apps.youtube.music");
        return id != 0 ? id : res.getIdentifier(name, type, activity.getPackageName());
    }


    /** @return whether anything was hidden just now */
    private static boolean apply(Activity activity) {
        try {
            if (!Settings.hideAskMusic()) return false;
            changed = false;
            hideAll(activity.getWindow().getDecorView());
            hideTopBarButton(activity);
            return changed;
        } catch (Throwable t) {
            Log.e(YouTubeMusicHooks.TAG, "Hide Ask Music", t);
            return false;
        }
    }

    /** Set when a view had to be hidden in this look. */
    private static boolean changed;

    /**
     * Every view with one of the ids, in one walk: YouTube Music keeps copies of some (the
     * player's, for videos). Lists are skipped: none of the buttons is in one, and a list lays
     * itself out on every frame it scrolls.
     */
    private static void hideAll(View view) {
        int viewId = view.getId();
        if (viewId != View.NO_ID) {
            for (int id : ids) {
                if (id == viewId) {
                    hide(view);
                    if (id == playerButtonId) hideBalancingSpace(view);
                    return;
                }
            }
        }
        if (view instanceof ViewGroup && !view.getClass().getName().endsWith("RecyclerView")) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) hideAll(group.getChildAt(i));
        }
    }

    /** The top bar's Ask Music button: the menu item whose image carries Ask Music's label. */
    private static void hideTopBarButton(Activity activity) {
        if (topBarImageId == 0 || TextUtils.isEmpty(label)) return;
        int toolbarId = id(activity.getResources(), activity, "toolbar", "id");
        View toolbar = toolbarId == 0 ? null : activity.findViewById(toolbarId);
        if (!(toolbar instanceof ViewGroup)) return;
        findLabelled((ViewGroup) toolbar, 0);
    }

    private static void findLabelled(ViewGroup group, int depth) {
        if (depth > 4) return;
        for (int i = 0; i < group.getChildCount(); i++) {
            View child = group.getChildAt(i);
            if (child.getId() == topBarImageId && label.contentEquals(String.valueOf(child.getContentDescription()))) {
                // The whole menu item (the image's parent), so the bar closes the gap.
                hide(group);
                return;
            }
            if (child instanceof ViewGroup) findLabelled((ViewGroup) child, depth + 1);
        }
    }

    private static void hide(View view) {
        int visibility = view.getVisibility();
        if (visibility == View.GONE) return;
        if (!hidden.containsKey(view)) hidden.put(view, visibility);
        view.setVisibility(View.GONE);
        changed = true;
    }

    /**
     * The full player's top bar is symmetrical, so the song/video switch sits in its middle: on
     * the left the collapse button and two spacers, as wide as cast, Ask Music and the menu on the
     * right. YouTube Music pairs Ask Music with the spacer top_bar_extra_space (it hides both
     * while a new song loads), so that spacer goes with it, or the switch slides off center.
     */
    private static void hideBalancingSpace(View button) {
        if (!(button.getParent() instanceof ViewGroup)) return;
        ViewGroup row = (ViewGroup) button.getParent();
        View space = extraSpaceId == 0 ? null : row.findViewById(extraSpaceId);
        if (space != null && space.getParent() == row) hide(space);
    }
}
