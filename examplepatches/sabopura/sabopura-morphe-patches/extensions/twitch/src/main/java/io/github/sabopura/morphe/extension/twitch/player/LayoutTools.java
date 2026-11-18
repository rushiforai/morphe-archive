package io.github.sabopura.morphe.extension.twitch.player;

import android.content.SharedPreferences;
import android.content.res.Configuration;
import android.graphics.Color;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.util.Log;
import android.util.Size;
import android.view.View;

import io.github.sabopura.morphe.extension.twitch.Diagnostics;
import io.github.sabopura.morphe.extension.twitch.chat.ChatSettings;
import io.github.sabopura.morphe.extension.twitch.ui.Feature;
import io.github.sabopura.morphe.extension.twitch.ui.Features;
import io.github.sabopura.morphe.extension.twitch.ui.TwitchRes;
import io.github.sabopura.morphe.extension.twitch.ui.Ui;

import java.lang.reflect.Constructor;
import java.lang.reflect.Method;
import java.util.Map;
import java.util.WeakHashMap;

/** Size hooks run at the native layout calculation, before drag boundaries are calculated. */
public final class LayoutTools {
    public static final int DEFAULT_CHAT_WIDTH = 30, DEFAULT_SPLIT_WIDTH = 50, DEFAULT_CHAT_OPACITY = 30,
            DEFAULT_MINI_SCALE = 100;
    private static final Map<View, Sized> MINI = new WeakHashMap<>();
    private static final Map<View, Background> BACKGROUNDS = new WeakHashMap<>();
    private static final Map<View, Navigation> NAVIGATION = new WeakHashMap<>();
    private static final Map<View, Integer> RAILS = new WeakHashMap<>();
    private static Class<?> nativeSize;
    private static Method nativeWidth, nativeHeight;
    private static Constructor<?> nativeNew;

    private LayoutTools() {}

    public static int chatWidth(View view, int original) {
        try {
            if (!Features.has(Feature.LANDSCAPE_CHAT) || !hasId(view, "landscape_chat_container")) return original;
            SharedPreferences p = ChatSettings.preferences(view.getContext());
            if (!p.getBoolean("landscape_width_enabled", false)) return original;
            // Native 50% is the side-by-side video/chat layout; phone/tablet defaults are 30/20%.
            return clamp(
                    p.getInt(
                            original == 50 ? "landscape_split_width" : "landscape_width",
                            original == 50 ? DEFAULT_SPLIT_WIDTH : DEFAULT_CHAT_WIDTH),
                    10,
                    70);
        } catch (RuntimeException | LinkageError e) {
            Diagnostics.note("player.landscape-chat-width", e);
            return original;
        }
    }

    private static boolean guideWarned;

    /**
     * Twitch's live theatre places the landscape chat with a guideline that ConstraintSet sets to
     * a share of the width for the video: around 0.7-0.8 beside the chat, around 0.5 for the split
     * layout, 1.0 without chat. Called with every guideline percent Twitch sets.
     */
    public static float guidePercent(float percent, int id) {
        try {
            android.content.Context c = PlayerTools.app();
            if (c == null || !Features.has(Feature.LANDSCAPE_CHAT)) return percent;
            int guideline = TwitchRes.id(c, "chat_guideline", "id");
            if (guideline == 0 || id != guideline) return percent;
            SharedPreferences p = ChatSettings.preferences(c);
            if (!p.getBoolean("landscape_width_enabled", false) || percent >= .95f) return percent;
            if (percent >= .4f && percent < .6f)
                return 1 - clamp(p.getInt("landscape_split_width", DEFAULT_SPLIT_WIDTH), 10, 70) / 100f;
            if (percent >= .6f)
                return 1 - clamp(p.getInt("landscape_width", DEFAULT_CHAT_WIDTH), 10, 70) / 100f;
            if (!guideWarned) {
                guideWarned = true;
                Log.w("SabopuraTwitch", "Unknown chat guideline percent: " + percent);
            }
        } catch (RuntimeException | LinkageError e) {
            Diagnostics.note("player.chat-guideline", e);
        }
        return percent;
    }

    public static float guidePercent(int id, float percent) {
        return guidePercent(percent, id);
    }

    public static Size miniSize(View view, Size original) {
        if (original == null) return null;
        SharedPreferences p = ChatSettings.preferences(view.getContext());
        Sized previous = MINI.get(view);
        Size base = previous != null && original.equals(previous.scaled) ? previous.base : original;
        int percent = clamp(p.getInt("mini_player_scale", DEFAULT_MINI_SCALE), 50, 200);
        if (!p.getBoolean("mini_player_scale_enabled", false) || percent == 100) {
            MINI.remove(view);
            return base;
        }
        int availableWidth =
                view.getWidth() > 0
                        ? view.getWidth()
                        : view.getResources().getDisplayMetrics().widthPixels;
        int availableHeight =
                view.getHeight() > 0
                        ? view.getHeight()
                        : view.getResources().getDisplayMetrics().heightPixels;
        float ratio =
                Math.min(
                        percent / 100f,
                        Math.min(
                                Math.max(1, availableWidth - Ui.dp(view.getContext(), 32))
                                        / (float) Math.max(1, base.getWidth()),
                                Math.max(1, availableHeight - Ui.dp(view.getContext(), 64))
                                        / (float) Math.max(1, base.getHeight())));
        Size scaled =
                new Size(
                        Math.max(1, Math.round(base.getWidth() * ratio)),
                        Math.max(1, Math.round(base.getHeight() * ratio)));
        MINI.put(view, new Sized(base, scaled));
        return scaled;
    }

    /** Injection point: Twitch's own size type for the mini player, at every layout of it. Main thread. */
    public static Object miniNativeSize(View view, Object original) {
        if (original == null || !Features.has(Feature.MINI_PLAYER)) return original;
        try {
            Class<?> type = original.getClass();
            if (type != nativeSize) {
                nativeWidth = type.getMethod("getWidth");
                nativeHeight = type.getMethod("getHeight");
                nativeNew = type.getConstructor(int.class, int.class);
                nativeSize = type;
            }
            int width = ((Number) nativeWidth.invoke(original)).intValue(),
                    height = ((Number) nativeHeight.invoke(original)).intValue();
            Size size = miniSize(view, new Size(width, height));
            return size.getWidth() == width && size.getHeight() == height
                    ? original
                    : nativeNew.newInstance(size.getWidth(), size.getHeight());
        } catch (Exception | LinkageError e) {
            Diagnostics.note("player.mini-size", e);
            return original;
        }
    }

    /** Runs on every layout pass of every screen; a failure in one feature leaves the other working. */
    public static void applyBackgrounds(View root) {
        if (Features.has(Feature.NAV_POSITION)) {
            try {
                applyNavigation(root);
            } catch (RuntimeException | LinkageError e) {
                Diagnostics.note("player.nav-position", e);
            }
        }
        if (!Features.has(Feature.LANDSCAPE_CHAT)) return;
        try {
            SharedPreferences p = ChatSettings.preferences(root.getContext());
            boolean enabled =
                    p.getBoolean("landscape_opacity_enabled", false)
                            && root.getResources().getConfiguration().orientation
                                    == Configuration.ORIENTATION_LANDSCAPE;
            if (!enabled && BACKGROUNDS.isEmpty()) return;
            int alpha = Math.round(clamp(p.getInt("landscape_opacity", DEFAULT_CHAT_OPACITY), 0, 100) * 2.55f);
            // The chat column: landscape_chat_container in the VOD/clip theatre, chat_wrapper in the
            // live one. It alone gets the colour; the chat inside is made clear so the two do not
            // stack into a darker shade than the one chosen.
            for (String name : new String[] {"landscape_chat_container", "chat_wrapper"}) {
                View column = find(root, name);
                if (column == null) continue;
                // Keep Twitch's own shade (dark or light theme) and change only how see-through it is.
                Background saved = BACKGROUNDS.get(column);
                Drawable original = saved != null ? saved.original : column.getBackground();
                int base = original instanceof ColorDrawable ? ((ColorDrawable) original).getColor() : Color.BLACK;
                paint(column, enabled, (alpha << 24) | (base & 0xFFFFFF));
                for (String inner : new String[] {"chat_view_delegate_root", "main_chomments_container"}) {
                    View view = find(column, inner);
                    if (view != null) paint(view, enabled, Color.TRANSPARENT);
                }
            }
        } catch (RuntimeException | LinkageError e) {
            Diagnostics.note("player.landscape-chat-opacity", e);
        }
    }

    public static void applyNavigation(View root) {
        String mode =
                ChatSettings.preferences(root.getContext())
                        .getString("navigation_position", "default");
        if ("default".equals(mode) && NAVIGATION.isEmpty() && RAILS.isEmpty()) return;
        applyRail(root, mode);
        View nav = find(root, "viewer_landing_bottom_navigation_group");
        if (nav == null || !(nav.getParent() instanceof View)) return;
        View parent = (View) nav.getParent(),
                body = find(parent, "fragment_container"),
                rating = find(parent, "rating_banner_container");
        if (body == null) return;
        Navigation saved = NAVIGATION.get(nav);
        if ("default".equals(mode)) {
            if (saved != null) {
                saved.restore(nav, body, rating);
                NAVIGATION.remove(nav);
            }
            return;
        }
        if (saved == null) {
            saved = new Navigation(nav, body, rating);
            NAVIGATION.put(nav, saved);
        }
        if ("hidden".equals(mode)) {
            if (nav.getVisibility() != View.GONE) {
                saved.visibility = nav.getVisibility();
                nav.setVisibility(View.GONE);
            }
            nav.setTranslationY(saved.navY);
            body.setTranslationY(saved.bodyY);
            if (rating != null) rating.setTranslationY(saved.ratingY);
            saved.hidden = true;
        } else {
            if (saved.hidden) {
                nav.setVisibility(saved.visibility);
                saved.hidden = false;
            }
            boolean visible = nav.getVisibility() == View.VISIBLE;
            // Twitch pads the screen below the status bar; the bar goes right under it.
            nav.setTranslationY(visible ? saved.navY + parent.getPaddingTop() - nav.getTop() : saved.navY);
            body.setTranslationY(saved.bodyY + (visible ? nav.getHeight() : 0));
            if (rating != null)
                rating.setTranslationY(saved.ratingY + (visible ? nav.getHeight() : 0));
        }
    }

    /** Wide windows show a side rail instead of the bottom bar; "top" cannot apply to it, "hidden" can. */
    private static void applyRail(View root, String mode) {
        View rail = find(root, "viewer_landing_navigation_rail");
        if (rail == null) return;
        if ("hidden".equals(mode)) {
            if (rail.getVisibility() != View.GONE) {
                RAILS.put(rail, rail.getVisibility());
                rail.setVisibility(View.GONE);
            }
        } else if (RAILS.containsKey(rail)) {
            rail.setVisibility(RAILS.remove(rail));
        }
    }

    private static void paint(View view, boolean enabled, int color) {
        if (enabled) {
            if (!BACKGROUNDS.containsKey(view)) BACKGROUNDS.put(view, new Background(view.getBackground()));
            Drawable current = view.getBackground();
            if (!(current instanceof ColorDrawable) || ((ColorDrawable) current).getColor() != color)
                view.setBackground(new ColorDrawable(color));
        } else {
            Background saved = BACKGROUNDS.remove(view);
            if (saved != null) view.setBackground(saved.original);
        }
    }

    private static View find(View root, String name) {
        int id = TwitchRes.id(root.getContext(), name, "id");
        return id == 0 ? null : root.findViewById(id);
    }

    private static boolean hasId(View view, String name) {
        int id = TwitchRes.id(view.getContext(), name, "id");
        return id != 0 && view.getId() == id;
    }

    private static int clamp(int n, int min, int max) {
        return Math.max(min, Math.min(max, n));
    }

    private static final class Sized {
        final Size base, scaled;

        Sized(Size b, Size s) {
            base = b;
            scaled = s;
        }
    }

    private static final class Background {
        final Drawable original;

        Background(Drawable d) {
            original = d;
        }
    }

    private static final class Navigation {
        final float navY, bodyY, ratingY;
        int visibility;
        boolean hidden;

        Navigation(View nav, View body, View rating) {
            navY = nav.getTranslationY();
            bodyY = body.getTranslationY();
            ratingY = rating == null ? 0 : rating.getTranslationY();
            visibility = nav.getVisibility();
        }

        void restore(View nav, View body, View rating) {
            nav.setTranslationY(navY);
            body.setTranslationY(bodyY);
            if (rating != null) rating.setTranslationY(ratingY);
            if (hidden) nav.setVisibility(visibility);
        }
    }
}
