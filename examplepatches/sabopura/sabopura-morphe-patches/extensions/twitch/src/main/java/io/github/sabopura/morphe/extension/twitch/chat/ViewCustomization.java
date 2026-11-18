package io.github.sabopura.morphe.extension.twitch.chat;

import android.app.*;
import android.content.*;
import android.os.Bundle;
import android.view.*;

import io.github.sabopura.morphe.extension.twitch.Diagnostics;
import io.github.sabopura.morphe.extension.twitch.ui.Feature;
import io.github.sabopura.morphe.extension.twitch.ui.Features;
import io.github.sabopura.morphe.extension.twitch.ui.TwitchRes;

import java.lang.ref.WeakReference;
import java.util.*;

/**
 * Visibility options. Native views are hidden by resource ID and restored on disable; the bottom
 * bar's tabs through its menu, so the other tabs close the gap; chat highlights (hype trains,
 * pinned messages) by their type, before Twitch shows them.
 */
public final class ViewCustomization {
    public static final String[][] OPTIONS = {
        {"hide_chat_header", "チャットの見出し", "Chat header", "chat_header_container", "chat_header"},
        {"hide_vod_header", "VODチャットの見出し", "VOD chat header", "chomments_header_container"},
        {
            "hide_leaderboards",
            "ランキング",
            "Leaderboards",
            "leaderboards_with_extension_header",
            "leaderboards_container",
            "leaderboards_extensions_container"
        },
        // The chat's own hype train is a highlight (keepHighlight); this is the landscape one.
        {"hide_hype_train", "ハイプトレイン", "Hype Train", "one_chat_hype_train_landscape_container"},
        // bit_picker in the chat's message box, bits_button in the landscape chat bar.
        {"hide_bits", "Bitsボタン", "Bits buttons", "bit_picker", "bits_button"},
        // cast_button in the live player, media_route_button in the VOD and clip player.
        {"hide_cast", "キャストボタン", "Cast button", "cast_button", "media_route_button"},
        {
            "hide_clips",
            "クリップ作成ボタン",
            "Create clip buttons",
            "create_clip_button_compose_view",
            "create_clip_text_button"
        },
        {
            "hide_share",
            "共有ボタン",
            "Share buttons",
            "share_button",
            "share_stream_button",
            "share_stream_container"
        },
        // The heart under the player is an item of Twitch's button list (metadataButtons); these
        // are the ones in search results and stories.
        {"hide_unfollow", "フォロー解除ボタン", "Unfollow buttons", "unfollow_button"},
        {
            "hide_create",
            "配信作成ボタン",
            "Create buttons",
            "custom_create_bottom_nav_button",
            "following_nav_rail_create_button"
        },
        {
            "hide_input",
            "チャット入力欄",
            "Chat input",
            "chat_message_input_view_container",
            "one_chat_message_input_view_container"
        },
        {
            "hide_landscape_input",
            "横画面のチャット入力欄",
            "Chat input in landscape",
            "chat_message_input_view_container",
            "one_chat_message_input_view_container"
        },
        // Paid (Hype Chat) pins here; the streamer's pinned message is a highlight (keepHighlight).
        {"hide_pinned", "ピン留めメッセージ", "Pinned messages", "paid_pinned_chat_container"},
        {
            "hide_stories",
            "ストーリー",
            "Stories",
            "stories_shelf_container",
            "stories_shelf_compose",
            "stories_shelf",
            "stories_button",
            "stories_button_xml"
        },
        // A tab of the bottom bar: see TABS.
        {"hide_discover", "ブラウズタブ", "Browse tab"},
        {"hide_one_chat_popup", "チャットの案内", "Chat callouts", "one_chat_callout", "one_chat_tooltip"},
        {
            "hide_stream_extensions",
            "配信の拡張機能",
            "Stream extensions",
            "extension_button_container",
            "extensions_container",
            "extension_icons_container",
            "extension_overlay_container"
        },
        {
            "hide_subscribe",
            "サブスクボタン",
            "Subscribe buttons",
            "sub_button_container",
            "extended_subscribe_button_container",
            "subscribe_button_container",
            "theatre_overlay_subscribe_button_container"
        },
        {"hide_gift_sub", "ギフトサブボタン", "Gift a Sub buttons", "gift_a_sub_button"},
        {
            "hide_go_ad_free",
            "広告なしプランの案内",
            "Go Ad-Free prompts",
            "following_tab_turbo_button",
            "own_profile_turbo_button",
            "turbo_upsell_container",
            "promo_banner_container"
        }
    };
    /**
     * Tabs of the bottom bar (and the side rail on tablets) hidden through the bar's menu: hiding
     * a tab's view would leave its slot empty. The create button sits over an empty placeholder
     * tab, which goes with it.
     */
    private static final String[][] TABS = {
        {"hide_create", "viewer_bottom_nav_create_placeholder"},
        {"hide_discover", "viewer_bottom_nav_explore"},
    };
    private static final String[] BARS = {"viewer_landing_bottom_navigation", "viewer_landing_navigation_rail"};
    /** Menu items this class hid; only these are shown again. */
    private static final Map<MenuItem, Boolean> HIDDEN_TABS = new WeakHashMap<>();

    private static final Map<View, Observer> ROOTS = new WeakHashMap<>();
    private static boolean registered;
    /** Resource IDs per option, looked up once; this runs on every layout pass of the screen. */
    private static int[][] resolved;
    /** The bottom bar's menu by bar view, found by reflection once. */
    private static final Map<View, Menu> MENUS = new WeakHashMap<>();
    /** Layout passes come in bursts; hiding is applied at most this often. */
    private static final long MIN_INTERVAL_MS = 100;

    private static int[][] ids(View view) {
        int[][] result = resolved;
        if (result != null) return result;
        result = new int[OPTIONS.length][];
        for (int o = 0; o < OPTIONS.length; o++) {
            result[o] = new int[OPTIONS[o].length - 3];
            for (int i = 3; i < OPTIONS[o].length; i++)
                result[o][i - 3] = TwitchRes.id(view.getContext(), OPTIONS[o][i], "id");
        }
        return resolved = result;
    }

    public static void initialize(Context context) {
        // Lets Twitch's own code paths (button lists, highlight filter) read the settings early.
        ChatSettings.preferences(context);
        if (registered || !(context.getApplicationContext() instanceof Application)) return;
        registered = true;
        ((Application) context.getApplicationContext())
                .registerActivityLifecycleCallbacks(
                        new Application.ActivityLifecycleCallbacks() {
                            public void onActivityResumed(Activity a) {
                                try {
                                    observe(a.getWindow().getDecorView());
                                } catch (RuntimeException | LinkageError e) {
                                    Diagnostics.note("chat.declutter-observe", e);
                                }
                            }

                            public void onActivityDestroyed(Activity a) {
                                Observer o = ROOTS.remove(a.getWindow().getDecorView());
                                if (o != null) o.close();
                            }

                            public void onActivityCreated(Activity a, Bundle b) {}

                            public void onActivityStarted(Activity a) {}

                            public void onActivityPaused(Activity a) {}

                            public void onActivityStopped(Activity a) {}

                            public void onActivitySaveInstanceState(Activity a, Bundle b) {}
                        });
    }

    public static void observe(View root) {
        if (ROOTS.containsKey(root)) return;
        Observer o = new Observer(root);
        ROOTS.put(root, o);
        root.getViewTreeObserver().addOnGlobalLayoutListener(o);
        o.onGlobalLayout();
    }

    public static void refresh() {
        for (Observer o : new ArrayList<>(ROOTS.values())) o.onGlobalLayout();
    }

    private static int id(View view, String name) {
        return TwitchRes.id(view.getContext(), name, "id");
    }

    private static Menu menuOf(View bar) {
        Menu known = MENUS.get(bar);
        if (known == null) {
            known = findMenu(bar);
            if (known != null) MENUS.put(bar, known);
        }
        return known;
    }

    private static Menu findMenu(View bar) {
        for (Class<?> c = bar.getClass(); c != null && c != View.class; c = c.getSuperclass()) {
            for (java.lang.reflect.Method m : c.getDeclaredMethods()) {
                if (m.getParameterTypes().length != 0 || !Menu.class.isAssignableFrom(m.getReturnType())
                        || java.lang.reflect.Modifier.isStatic(m.getModifiers())) continue;
                try {
                    m.setAccessible(true);
                    Object menu = m.invoke(bar);
                    if (menu instanceof Menu) return (Menu) menu;
                } catch (ReflectiveOperationException | RuntimeException ignored) {
                }
            }
        }
        return null;
    }

    private static void applyTabs(View root, SharedPreferences prefs) {
        for (String bar : BARS) {
            int barId = id(root, bar);
            View view = barId == 0 ? null : root.findViewById(barId);
            Menu menu = view == null ? null : menuOf(view);
            if (menu == null) continue;
            for (String[] tab : TABS) {
                int itemId = id(root, tab[1]);
                MenuItem item = itemId == 0 ? null : menu.findItem(itemId);
                if (item == null) continue;
                if (prefs.getBoolean(tab[0], false)) {
                    if (item.isVisible()) {
                        HIDDEN_TABS.put(item, Boolean.TRUE);
                        item.setVisible(false);
                    }
                } else if (HIDDEN_TABS.remove(item) != null) {
                    item.setVisible(true);
                }
            }
        }
    }

    /**
     * Called with the list of buttons under the player before Twitch keeps it; Twitch keeps what
     * this returns. With the unfollow button hidden, a followed channel shows no heart: one tap
     * there unfollows. The follow button of a channel not followed stays.
     *
     * <p>An ArrayList is changed in place and returned as it is (the patch relies on that where
     * Twitch declares one). Any other list may be read-only, so the buttons kept go into a new one.
     */
    public static List<?> metadataButtons(List<?> buttons) {
        try {
            return buttons == null || !hideUnfollow() ? buttons : withoutUnfollow(buttons);
        } catch (RuntimeException e) {
            Diagnostics.note("chat.hide-unfollow", e);
            return buttons;
        }
    }

    static List<?> withoutUnfollow(List<?> buttons) {
        if (buttons instanceof ArrayList) {
            for (Iterator<?> it = buttons.iterator(); it.hasNext(); ) if (isUnfollow(it.next())) it.remove();
            return buttons;
        }
        List<Object> kept = null;
        for (int i = 0; i < buttons.size(); i++) {
            Object button = buttons.get(i);
            if (isUnfollow(button)) {
                if (kept == null) kept = new ArrayList<>(buttons.subList(0, i));
            } else if (kept != null) {
                kept.add(button);
            }
        }
        return kept == null ? buttons : kept;
    }

    private static boolean isUnfollow(Object button) {
        return "UnfollowIconButton".equals(String.valueOf(button));
    }

    private static boolean hideUnfollow() {
        SharedPreferences prefs = ChatSettings.preferences();
        return prefs != null && prefs.getBoolean("hide_unfollow", false);
    }

    /**
     * Called from Twitch's filter of chat highlight events, for additions only (the patch checks
     * the event type): false drops the event. Removals never get here, so a highlight shown
     * before never stays stuck. Twitch's events are not turned into text: some take seconds.
     */
    public static boolean keepHighlight(Object event) {
        try {
            SharedPreferences prefs = ChatSettings.preferences();
            if (event == null || prefs == null) return true;
            boolean hype = prefs.getBoolean("hide_hype_train", false), pinned = prefs.getBoolean("hide_pinned", false);
            ChatSettings settings = ChatSettings.current();
            boolean gifts = settings != null && settings.hideGiftBanners && Features.has(Feature.CHAT_HIDE_HIGHLIGHTS);
            if (!hype && !pinned && !gifts) return true;
            String type = highlightType(event, 0);
            if (type == null) return true;
            return !(hype && type.startsWith("hype_train") || pinned && type.equals("creator_pinned_message")
                    || gifts && isGiftBanner(type));
        } catch (RuntimeException | LinkageError e) {
            Diagnostics.note("chat.highlight-filter", e);
            return true;
        }
    }

    private static boolean isGiftBanner(String type) {
        return type.equals("gift_sub") || type.equals("gift_promotion") || type.equals("subtember");
    }

    /**
     * The highlight's type key ("hype_train", "polls", "creator_pinned_message", …). Every type
     * extends one base class holding just that key and a flag; it is found by that shape.
     */
    static String highlightType(Object value, int depth) {
        for (Class<?> c = value.getClass(); c != null && c != Object.class; c = c.getSuperclass()) {
            java.lang.reflect.Field key = null;
            int fields = 0, flags = 0;
            for (java.lang.reflect.Field f : c.getDeclaredFields()) {
                if (java.lang.reflect.Modifier.isStatic(f.getModifiers())) continue;
                fields++;
                if (f.getType() == String.class) key = f;
                else if (f.getType() == boolean.class) flags++;
            }
            if (fields == 2 && flags == 1 && key != null && c != value.getClass()) {
                try {
                    key.setAccessible(true);
                    Object text = key.get(value);
                    if (text instanceof String && ((String) text).matches("[a-z_]{2,64}")) return (String) text;
                } catch (ReflectiveOperationException ignored) {
                }
            }
        }
        if (depth >= 2) return null;
        for (Class<?> c = value.getClass(); c != null && c != Object.class; c = c.getSuperclass()) {
            for (java.lang.reflect.Field f : c.getDeclaredFields()) {
                Class<?> t = f.getType();
                if (java.lang.reflect.Modifier.isStatic(f.getModifiers()) || t.isPrimitive() || t == String.class
                        || Number.class.isAssignableFrom(t) || t == Boolean.class || Map.class.isAssignableFrom(t)
                        || Collection.class.isAssignableFrom(t)) continue;
                try {
                    f.setAccessible(true);
                    Object inner = f.get(value);
                    String found = inner == null ? null : highlightType(inner, depth + 1);
                    if (found != null) return found;
                } catch (ReflectiveOperationException | RuntimeException ignored) {
                }
            }
        }
        return null;
    }

    /**
     * Visibility of each view before it was hidden. Shared by all observers: two roots can
     * contain the same view, and only the first one to hide it knows how it looked before.
     */
    private static final Map<View, Integer> HIDDEN = new WeakHashMap<>();

    private static final class Observer implements ViewTreeObserver.OnGlobalLayoutListener {
        final WeakReference<View> root;
        final Map<View, Integer> hidden = HIDDEN;
        final Runnable delayed = this::applyNow;
        boolean applying, scheduled;
        long lastApplied;

        Observer(View v) {
            root = new WeakReference<>(v);
        }

        void close() {
            View v = root.get();
            if (v != null && v.getViewTreeObserver().isAlive())
                v.getViewTreeObserver().removeOnGlobalLayoutListener(this);
        }

        public void onGlobalLayout() {
            View view = root.get();
            if (view == null || applying || scheduled) return;
            long wait = lastApplied + MIN_INTERVAL_MS - android.os.SystemClock.uptimeMillis();
            if (wait <= 0) {
                applyNow();
            } else {
                scheduled = true;
                view.postDelayed(delayed, wait);
            }
        }

        private void applyNow() {
            scheduled = false;
            View view = root.get();
            if (view == null || applying) return;
            lastApplied = android.os.SystemClock.uptimeMillis();
            applying = true;
            try {
                io.github.sabopura.morphe.extension.twitch.player.LayoutTools.applyBackgrounds(view);
                if (!Features.has(Feature.DECLUTTER)) return;
                SharedPreferences prefs = ChatSettings.preferences(view.getContext());
                Map<Integer, Boolean> ids = new HashMap<>();
                boolean any = false;
                for (String[] option : OPTIONS) any |= prefs.getBoolean(option[0], false);
                if (any || !HIDDEN_TABS.isEmpty()) applyTabs(view, prefs);
                if (!any && hidden.isEmpty()) return;
                int[][] known = ids(view);
                for (int o = 0; o < OPTIONS.length; o++) {
                    String[] option = OPTIONS[o];
                    boolean enabled = prefs.getBoolean(option[0], false);
                    if ("hide_landscape_input".equals(option[0]))
                        enabled &=
                                view.getResources().getConfiguration().orientation
                                        == android.content.res.Configuration.ORIENTATION_LANDSCAPE;
                    for (int id : known[o])
                        if (id != 0) ids.put(id, enabled || Boolean.TRUE.equals(ids.get(id)));
                }
                ArrayDeque<View> pending = new ArrayDeque<>();
                pending.add(view);
                int count = 0;
                while (!pending.isEmpty() && count++ < 5000) {
                    View v = pending.removeFirst();
                    boolean hide = Boolean.TRUE.equals(ids.get(v.getId()));
                    if (hide) {
                        if (!hidden.containsKey(v)) hidden.put(v, v.getVisibility());
                        if (v.getVisibility() != View.GONE) v.setVisibility(View.GONE);
                    } else if (hidden.containsKey(v)) {
                        int original = hidden.remove(v);
                        v.setVisibility(original);
                    }
                    if (v instanceof ViewGroup) {
                        ViewGroup group = (ViewGroup) v;
                        for (int i = 0; i < group.getChildCount(); i++)
                            pending.addLast(group.getChildAt(i));
                    }
                }
            } catch (RuntimeException | LinkageError e) {
                Diagnostics.note("chat.declutter", e);
            } finally {
                applying = false;
            }
        }
    }
}
