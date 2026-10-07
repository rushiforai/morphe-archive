package app.morphe.extension.appearance;

import android.content.Context;
import android.view.View;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.WeakHashMap;
import java.lang.ref.WeakReference;

import app.morphe.extension.Utils;
import app.morphe.extension.settings.Settings;

@SuppressWarnings("unused")
public final class HidePromotionsPatch {
    private static final Set<String> PROMOTION_HIGHLIGHTS = new HashSet<>(Arrays.asList(
            "subtember",
            "gift_promotion"
    ));

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
                    view -> Settings.HIDE_SUBSCRIPTION_PROMOTIONS.get(), false),
            // Twitch 31.3.1's dedicated Stories shelf contains the RecyclerView
            // resource "stories_shelf". This target is resolved only inside the
            // BaseViewDelegate root, so it cannot match Home/navigation containers.
            new Target("stories_shelf",
                    view -> Settings.HIDE_STORIES.get(), true),
    };

    /*
     * Twitch 31.3.1 builds these two section models from fresh mutable lists. We retain the
     * original list contents so Kizu can hide or restore the exact same data when the user flips
     * the Home & navigation switch.
     */
    private static final Map<List<?>, List<?>> RESUME_ORIGINALS = new java.util.IdentityHashMap<>();
    private static final Map<List<?>, List<?>> OFFLINE_ORIGINALS = new java.util.IdentityHashMap<>();
    private static WeakReference<View> FOLLOWING_RECYCLER =
            new WeakReference<>(null);

    public static void filterResumeWatchingList(List<?> items) {
        rememberAndFilter(items, RESUME_ORIGINALS,
                Settings.HIDE_RESUME_WATCHING.get());
    }

    public static void filterOfflineChannelsList(List<?> items) {
        rememberAndFilter(items, OFFLINE_ORIGINALS,
                Settings.HIDE_OFFLINE_CHANNELS.get());
    }

    private static void rememberAndFilter(
            List<?> items,
            Map<List<?>, List<?>> originals,
            boolean hide
    ) {
        if (items == null) return;
        synchronized (originals) {
            if (!originals.containsKey(items)) {
                originals.put(items, new ArrayList<>(items));
            }
            if (hide) items.clear();
        }
    }

    public static void onHomeSectionSettingChanged() {
        applyListSetting(RESUME_ORIGINALS, Settings.HIDE_RESUME_WATCHING.get());
        applyListSetting(OFFLINE_ORIGINALS, Settings.HIDE_OFFLINE_CHANNELS.get());
        refreshFollowingAdapter();
    }

    private static void applyListSetting(Map<List<?>, List<?>> originals, boolean hide) {
        synchronized (originals) {
            for (Map.Entry<List<?>, List<?>> entry : originals.entrySet()) {
                List<?> items = entry.getKey();
                List<?> original = entry.getValue();
                if (items == null || original == null) continue;

                if (hide) {
                    items.clear();
                } else {
                    @SuppressWarnings("unchecked")
                    List<Object> mutable = (List<Object>) items;
                    @SuppressWarnings("unchecked")
                    List<Object> saved = (List<Object>) original;
                    mutable.clear();
                    mutable.addAll(saved);
                }
            }
        }
    }

    private static void refreshFollowingAdapter() {
        try {
            View recycler = FOLLOWING_RECYCLER.get();
            if (recycler == null || !recycler.isAttachedToWindow()) return;

            try {
                java.lang.reflect.Method getAdapter =
                        recycler.getClass().getMethod("getAdapter");
                Object adapter = getAdapter.invoke(recycler);
                if (adapter != null) {
                    java.lang.reflect.Method notify =
                            adapter.getClass().getMethod("notifyDataSetChanged");
                    notify.invoke(adapter);
                }
            } catch (Throwable ignored) {
            }

            recycler.invalidate();
            recycler.requestLayout();
        } catch (Throwable t) {
            Utils.logError("Failed to refresh Following feed", t);
        }
    }

    public static void bindGoAdFree(View root) {
        if (root == null) return;
        try {
            bindGoAdFreeNow(root);
            root.postDelayed(() -> bindGoAdFreeNow(root), 100L);
            root.postDelayed(() -> bindGoAdFreeNow(root), 500L);
            root.postDelayed(() -> bindGoAdFreeNow(root), 1200L);
        } catch (Exception ex) {
            Utils.logError("Failed to bind Go Ad-Free", ex);
        }
    }

    private static void bindGoAdFreeNow(View root) {
        Context context = root.getContext();
        int id = Utils.getResourceId(context, "following_tab_turbo_button", "id");
        if (id == 0) return;
        View button = root.findViewById(id);
        if (button != null) {
            HiddenView.attach(button, view -> Settings.HIDE_TURBO_UPSELL.get(), true);
        }
    }

    public static void onViewCreated(View root) {
        try {
            Context context = root.getContext();
            try {
                int recyclerId = Utils.getResourceId(context, "following_list_recycler_view", "id");
                View recycler = recyclerId == 0 ? null : root.findViewById(recyclerId);
                if (recycler != null) FOLLOWING_RECYCLER = new WeakReference<>(recycler);
            } catch (Throwable ignored) {
            }
            for (Target target : TARGETS) {
                int id = target.id(context);
                if (id == 0) continue;
                View view = root.findViewById(id);
                if (view != null) HiddenView.attach(view, target.condition, target.restore);
            }
        } catch (Exception ex) {
            Utils.logError("Failed to hide promotions", ex);
        }
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
