package io.github.bakwudo.uyu.extension.appearance;

import android.content.Context;
import android.view.View;
import android.view.ViewTreeObserver;

import java.util.Arrays;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;
import java.util.WeakHashMap;

import io.github.bakwudo.uyu.extension.Utils;
import io.github.bakwudo.uyu.extension.settings.Settings;

@SuppressWarnings("unused")
public final class HidePromotionsPatch {
    private static final Set<String> PROMOTION_HIGHLIGHTS = new HashSet<>(Arrays.asList(
            "subtember",
            "gift_promotion"
    ));

    /** Exact Twitch 31.3.1 Following-header Go Ad-Free button id, verified from the supplied APKM. */
    private static final int FOLLOWING_GO_AD_FREE_BUTTON_ID = 0x7f0b0942;

    /** Clear the exact freshly-built ResumeWatching list before Twitch constructs its section model. */
    public static void filterResumeWatchingList(java.util.List<?> items) {
        if (items != null && app.morphe.extension.settings.Settings.HIDE_RESUME_WATCHING.get()) {
            items.clear();
        }
    }

    /** Clear the exact freshly-built OfflineChannels list before Twitch constructs its section model. */
    public static void filterOfflineChannelsList(java.util.List<?> items) {
        if (items != null && app.morphe.extension.settings.Settings.HIDE_OFFLINE_CHANNELS.get()) {
            items.clear();
        }
    }

    public static void bindGoAdFree(View root) {
        try {
            if (root == null) return;
            View button = root.findViewById(FOLLOWING_GO_AD_FREE_BUTTON_ID);
            if (button != null) {
                HiddenView.attach(button, v -> app.morphe.extension.settings.Settings.HIDE_TURBO_UPSELL.get(), false);
            }
        } catch (Exception ex) {
            Utils.logError("Failed to bind Go Ad-Free hiding", ex);
        }
    }

    private static final Target LEADERBOARD_BUTTON =
            new Target("leaderboards_icon", view -> Settings.HIDE_GIFT_LEADERBOARD.get(), false);
    private static final Target[] OTHER_CHAT_HEADER_ITEMS = {
            new Target("chat_name", null, false),
            LEADERBOARD_BUTTON,
            new Target("extension_button_container", null, false),
    };

    private static final Target[] TARGETS = {
            new Target("chat_header_buttons_container",
                    view -> Settings.HIDE_SUBSCRIBE_BUTTONS.get(), false),
            new Target("chat_header_container", HidePromotionsPatch::isChatHeaderEmpty, true),
            new Target("bit_picker", view -> Settings.HIDE_CHAT_BITS_BUTTON.get(), false),
            new Target("leaderboards_container", view -> Settings.HIDE_GIFT_LEADERBOARD.get(), false),
            LEADERBOARD_BUTTON,
            new Target("promo_banner_container",
                    view -> Settings.HIDE_SUBSCRIPTION_PROMOTIONS.get(), false),
            new Target("turbo_upsell_container",
                    view -> app.morphe.extension.settings.Settings.HIDE_TURBO_UPSELL.get(), false),
            new Target("following_tab_turbo_button",
                    view -> app.morphe.extension.settings.Settings.HIDE_TURBO_UPSELL.get(), false),
    };

    private static final Map<View, ViewTreeObserver.OnGlobalLayoutListener> TURBO_LAYOUT_LISTENERS =
            new WeakHashMap<>();

    private HidePromotionsPatch() {
    }

    public static void onViewCreated(View root) {
        try {
            Context context = root.getContext();
            for (Target target : TARGETS) {
                int id = target.id(context);
                if (id == 0) continue;
                View view = root.findViewById(id);
                if (view != null) HiddenView.attach(view, target.condition, target.restore);
            }
            scheduleFollowingTurboScan(root);
        } catch (Exception ex) {
            Utils.logError("Failed to hide promotions", ex);
        }
    }

    private static void scheduleFollowingTurboScan(View root) {
        if (!isFollowingRoot(root)) return;
        if (TURBO_LAYOUT_LISTENERS.containsKey(root)) return;
        attachFollowingTurboViews(root);
        if (hasFollowingTurboTarget(root)) return;
        ViewTreeObserver observer = root.getViewTreeObserver();
        if (!observer.isAlive()) return;
        ViewTreeObserver.OnGlobalLayoutListener listener = () -> {
            attachFollowingTurboViews(root);
            if (hasFollowingTurboTarget(root)) removeFollowingTurboScan(root);
        };
        TURBO_LAYOUT_LISTENERS.put(root, listener);
        observer.addOnGlobalLayoutListener(listener);
        root.postDelayed(() -> removeFollowingTurboScan(root), 15000);
    }

    private static void attachFollowingTurboViews(View root) {
        attachTarget(root, "following_tab_turbo_button");
        attachTarget(root, "turbo_upsell_container");
    }

    private static boolean hasFollowingTurboTarget(View root) {
        return findId(root, "following_tab_turbo_button") != null
                || findId(root, "turbo_upsell_container") != null;
    }

    private static void removeFollowingTurboScan(View root) {
        ViewTreeObserver.OnGlobalLayoutListener listener = TURBO_LAYOUT_LISTENERS.remove(root);
        if (listener == null) return;
        ViewTreeObserver observer = root.getViewTreeObserver();
        if (observer.isAlive()) observer.removeOnGlobalLayoutListener(listener);
    }

    private static void attachTarget(View root, String resourceName) {
        Context context = root.getContext();
        int id = Utils.getResourceId(context, resourceName, "id");
        if (id == 0) return;
        View view = root.findViewById(id);
        if (view != null) HiddenView.attach(view, v -> app.morphe.extension.settings.Settings.HIDE_TURBO_UPSELL.get(), false);
    }

    private static boolean isFollowingRoot(View root) {
        return findId(root, "following_list_recycler_view") != null
                || findId(root, "following_tab_section_header") != null;
    }

    private static View findId(View root, String name) {
        Context context = root.getContext();
        int id = Utils.getResourceId(context, name, "id");
        return id == 0 ? null : root.findViewById(id);
    }

    public static boolean hideCommunityHighlight(Object event) {
        try {
            String type = highlightType(event);
            if (type == null || !PROMOTION_HIGHLIGHTS.contains(type)
                    || !Settings.HIDE_SUBSCRIPTION_PROMOTIONS.get()) {
                return false;
            }
            Utils.logInfo("Hid community highlight " + type);
            return true;
        } catch (Exception ex) {
            Utils.logError("Failed to check a community highlight", ex);
            return false;
        }
    }

    private static String highlightType(Object event) {
        return null;
    }

    private static boolean isChatHeaderEmpty(View header) {
        if (!Settings.HIDE_SUBSCRIBE_BUTTONS.get()) return false;
        boolean leaderboardHidden = Settings.HIDE_GIFT_LEADERBOARD.get();
        for (Target item : OTHER_CHAT_HEADER_ITEMS) {
            if (leaderboardHidden && item == LEADERBOARD_BUTTON) continue;
            int id = item.id(header.getContext());
            View view = id == 0 ? null : header.findViewById(id);
            if (view != null && view.getVisibility() == View.VISIBLE) return false;
        }
        return true;
    }

    private static final class Target {
        final String name;
        final HiddenView.Condition condition;
        final boolean restore;
        private int id = -1;

        Target(String name, HiddenView.Condition condition, boolean restore) {
            this.name = name;
            this.condition = condition;
            this.restore = restore;
        }

        int id(Context context) {
            if (id == -1) {
                id = Utils.getResourceId(context, name, "id");
                if (id == 0) Utils.logInfo("View " + name + " not found, it is not hidden");
            }
            return id;
        }
    }
}
