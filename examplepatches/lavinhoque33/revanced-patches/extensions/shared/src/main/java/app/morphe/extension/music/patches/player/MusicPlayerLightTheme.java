/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-25
 */

package app.morphe.extension.music.patches.player;

import static app.morphe.extension.music.patches.utils.MusicLightTheme.CONTROL_SURFACE;
import static app.morphe.extension.music.patches.utils.MusicLightTheme.FOREGROUND;
import static app.morphe.extension.music.patches.utils.MusicLightTheme.SURFACE;

import android.content.res.ColorStateList;
import android.graphics.Bitmap;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;

import java.lang.ref.WeakReference;
import java.util.WeakHashMap;

import app.morphe.extension.music.patches.utils.MusicLightTheme;
import app.morphe.extension.shared.utils.ResourceUtils;

/** The watch page's artwork chrome, never the separate controls layered over the video surface. */
@SuppressWarnings("unused") // Invoked from the native player views and backdrop painter.
public final class MusicPlayerLightTheme {
    private static final int SECONDARY = 0xFF45494E;
    private static final int PILL_SELECTION = 0xFFD8DCE0;
    private static final float ART_TOP = 0.27f;
    private static final float ART_BOTTOM = 0.06f;

    // The native presenter supplies these paints sequentially on the UI thread.
    private static boolean lightBackdrop = true;
    private static boolean solidMiniplayerAlbumColor;

    private static final class Backdrops {
        private static final int WATCH_LAYOUT = ResourceUtils.getIdIdentifier("watch_while_layout");
        private static final WeakHashMap<View, ArtworkBackdrop> WATCH_PAGES = new WeakHashMap<>();
    }

    public interface BackdropPainter {
        void rvxRepaintArtwork(int top, int bottom, long duration);
    }

    private MusicPlayerLightTheme() {
    }

    /** The constructor's initial collapsed surface; never used for the later album-color feed. */
    public static int miniplayerDefault(int stock) {
        return MusicLightTheme.isEnabled() ? SURFACE : stock;
    }

    static void useSolidMiniplayerAlbumColor(boolean useAlbumColor) {
        solidMiniplayerAlbumColor = useAlbumColor;
    }

    /** Paints the floating card face without changing any value captured from the album palette. */
    public static void setFloatingMiniplayerColor(GradientDrawable face, int stock) {
        face.setColor(MusicLightTheme.isEnabled() && !solidMiniplayerAlbumColor ? SURFACE : stock);
    }

    public static void bindBackdrop(View watchLayout, BackdropPainter painter) {
        if (MusicLightTheme.isEnabled()) {
            Backdrops.WATCH_PAGES.put(watchLayout, new ArtworkBackdrop(painter));
        }
    }

    public static boolean refreshingArtwork(View watchLayout) {
        if (!MusicLightTheme.isEnabled()) return false;

        final ArtworkBackdrop backdrop = Backdrops.WATCH_PAGES.get(watchLayout);
        return backdrop != null && backdrop.refreshing;
    }

    /** The stock thumbnail loader clears the image at a new URI and binds only the current URI's result. */
    public static void bindArtwork(View thumbnail, Bitmap artwork) {
        if (!MusicLightTheme.isEnabled() || Backdrops.WATCH_LAYOUT == 0) return;

        for (View view = thumbnail; view != null; view = view.getParent() instanceof View parent ? parent : null) {
            if (view.getId() != Backdrops.WATCH_LAYOUT) continue;

            final ArtworkBackdrop backdrop = Backdrops.WATCH_PAGES.get(view);
            if (backdrop != null) backdrop.bind(artwork);
            break;
        }
    }

    public static int[] paintBackdrop(int[] colors, View watchLayout, int rawTop, int rawBottom) {
        if (!MusicLightTheme.isEnabled() || colors.length != 2) return colors;

        // Apply after the optional Zen/custom hook. Its shared arrays are not ours to change.
        final boolean artworkBackdrop = !PlayerPatch.isExplicitPlayerBackdrop(colors);
        final boolean light = artworkBackdrop || (isBrightBackdrop(colors[0]) && isBrightBackdrop(colors[1]));
        if (light != lightBackdrop) {
            lightBackdrop = light;
            Chrome.seekPaints.forEach((paint, stock) -> paint.setColor(light ? lightSeekColor(stock) : stock));
            Chrome.pageSelectors.keySet().forEach(selector -> selector.setTintList(light ? Chrome.SELECTOR : null));
            refreshTitleChevronTint();
        }

        final ArtworkBackdrop backdrop = Backdrops.WATCH_PAGES.get(watchLayout);
        if (backdrop != null) {
            backdrop.rawTop = rawTop;
            backdrop.rawBottom = rawBottom;
            backdrop.hasNativePaint = true;
            if (artworkBackdrop) backdrop.paint(colors);
        }
        return colors;
    }

    private static final class ArtworkBackdrop {
        private final WeakReference<BackdropPainter> painter;
        private Bitmap artwork;
        private int thumbnailColor;
        private boolean sampled;
        private int rawTop;
        private int rawBottom;
        private int lastPaletteTop;
        private int lastPaletteBottom;
        private int previousTop;
        private int previousBottom;
        private boolean hasNativePaint;
        private boolean refreshing;

        private ArtworkBackdrop(BackdropPainter painter) {
            this.painter = new WeakReference<>(painter);
        }

        private void bind(Bitmap bitmap) {
            // Another track can begin while its predecessor was still waiting for a thumbnail.
            if (bitmap == null && artwork == null && (isChromatic(rawTop) || isChromatic(rawBottom))) {
                previousTop = rawTop;
                previousBottom = rawBottom;
            }

            if (artwork == bitmap) return;

            if (artwork != null) {
                previousTop = lastPaletteTop;
                previousBottom = lastPaletteBottom;
            }
            artwork = bitmap;
            sampled = false;

            final BackdropPainter owner = painter.get();
            if (owner == null || !hasNativePaint) return;

            // The native painter otherwise drops the refresh when both raw stops are the same fixed colors.
            refreshing = true;
            try {
                owner.rvxRepaintArtwork(rawTop, rawBottom, bitmap == null ? 0L : 250L);
            } finally {
                refreshing = false;
            }
        }

        private void paint(int[] colors) {
            if (artwork == null) {
                colors[0] = SURFACE;
                colors[1] = SURFACE;
                return;
            }

            // The native controller can republish its cached palette on a presentation change.
            final boolean currentPalette = rawTop != previousTop || rawBottom != previousBottom;
            final boolean hasTop = currentPalette && isChromatic(rawTop);
            final boolean hasBottom = currentPalette && isChromatic(rawBottom);
            if (hasTop || hasBottom) {
                lastPaletteTop = rawTop;
                lastPaletteBottom = rawBottom;
                colors[0] = artworkSurface(hasTop ? rawTop : rawBottom, ART_TOP);
                colors[1] = artworkSurface(hasBottom ? rawBottom : rawTop, ART_BOTTOM);
                return;
            }

            if (!sampled) {
                thumbnailColor = sampleArtwork(artwork);
                sampled = true;
            }
            colors[0] = artworkSurface(thumbnailColor, ART_TOP);
            colors[1] = artworkSurface(thumbnailColor, ART_BOTTOM);
        }
    }

    private static int sampleArtwork(Bitmap artwork) {
        if (artwork.isRecycled() || artwork.getConfig() == Bitmap.Config.HARDWARE) return SURFACE;

        // Sample the decoded thumbnail once, away from the edges. Favor chromatic pixels over letterboxing.
        final int columns = 12;
        final int rows = 12;
        final int insetX = artwork.getWidth() / 8;
        final int insetY = artwork.getHeight() / 8;
        final int width = artwork.getWidth() - 2 * insetX;
        final int height = artwork.getHeight() - 2 * insetY;
        int totalRed = 0;
        int totalGreen = 0;
        int totalBlue = 0;
        int totalWeight = 0;

        for (int row = 0; row < rows; row++) {
            final int y = insetY + (2 * row + 1) * height / (2 * rows);
            for (int column = 0; column < columns; column++) {
                final int x = insetX + (2 * column + 1) * width / (2 * columns);
                final int pixel = artwork.getPixel(x, y);
                if (Color.alpha(pixel) < 128) continue;

                final int red = Color.red(pixel);
                final int green = Color.green(pixel);
                final int blue = Color.blue(pixel);
                final int maximum = Math.max(red, Math.max(green, blue));
                if (maximum < 16) continue;

                final int chroma = maximum - Math.min(red, Math.min(green, blue));
                final int weight = 1 + chroma * chroma / 16;
                totalRed += red * weight;
                totalGreen += green * weight;
                totalBlue += blue * weight;
                totalWeight += weight;
            }
        }

        return totalWeight == 0 ? SURFACE
                : Color.rgb(totalRed / totalWeight, totalGreen / totalWeight, totalBlue / totalWeight);
    }

    private static boolean isChromatic(int color) {
        final int red = Color.red(color);
        final int green = Color.green(color);
        final int blue = Color.blue(color);
        return Color.alpha(color) != 0
                && Math.max(red, Math.max(green, blue)) - Math.min(red, Math.min(green, blue)) >= 8;
    }

    private static int artworkSurface(int color, float weight) {
        final int red = Color.red(color);
        final int green = Color.green(color);
        final int blue = Color.blue(color);
        final int brightest = Math.max(red, Math.max(green, blue));
        final int lift = Math.max(0, 224 - brightest);
        return Color.rgb(
                blendChannel(Color.red(SURFACE), red + lift, weight),
                blendChannel(Color.green(SURFACE), green + lift, weight),
                blendChannel(Color.blue(SURFACE), blue + lift, weight)
        );
    }

    private static int blendChannel(int surface, int artwork, float weight) {
        return Math.round(surface + (artwork - surface) * weight);
    }

    private static boolean isBrightBackdrop(int color) {
        return 299 * Color.red(color) + 587 * Color.green(color) + 114 * Color.blue(color) >= 158_000;
    }

    /** This is the inset glyph on a filled light face, not an ordinary icon drawn on the page. */
    public static void setPlayPauseTint(ImageView button, ColorStateList original) {
        if (MusicLightTheme.isEnabled()) {
            final View page = Chrome.findPage(button);
            if (page != null) {
                Chrome.bindPage(page);
                if (lightBackdrop) original = Chrome.PRIMARY;
            }
        }
        button.setImageTintList(original);
    }

    public static void setPageBackground(View view, Drawable original) {
        if (MusicLightTheme.isEnabled() && original instanceof ColorDrawable solid) {
            // This opaque child sits above the animated player-page gradient.
            solid.setColor(Color.TRANSPARENT);
        }
        view.setBackground(original);
    }

    public static void setSeekColor(Paint paint, int stock) {
        if (MusicLightTheme.isEnabled()) {
            if (isWhiteChrome(stock)) {
                Chrome.seekPaints.put(paint, stock);
                if (lightBackdrop) stock = lightSeekColor(stock);
            } else {
                Chrome.seekPaints.remove(paint);
            }
        }
        paint.setColor(stock);
    }

    private static int lightSeekColor(int stock) {
        return (stock & 0xFF000000) | (FOREGROUND & 0x00FFFFFF);
    }

    private static boolean isWhiteChrome(int color) {
        final int red = Color.red(color);
        final int green = Color.green(color);
        final int blue = Color.blue(color);
        final int darkest = Math.min(red, Math.min(green, blue));
        return darkest >= 224 && Math.max(red, Math.max(green, blue)) - darkest <= 8;
    }

    /** Preserve the disabled state and a dimmer appearance without making both glyphs disappear. */
    public static void setPillAlpha(View pill, float stock) {
        if (stock > 0f && stock < 0.8f && MusicLightTheme.isEnabled()
                && lightBackdrop && Chrome.findPage(pill) != null) {
            stock = 0.8f;
        }
        pill.setAlpha(stock);
    }

    public static void setPillImageTint(ImageView icon, ColorStateList original) {
        if (MusicLightTheme.isEnabled() && Chrome.findPage(icon) != null) {
            if (lightBackdrop) {
                Chrome.stockColors.put(icon, original);
                original = original == null || Color.alpha(original.getDefaultColor()) >= 0xD0
                        ? Chrome.PRIMARY : Chrome.MUTED;
            } else {
                Chrome.stockColors.remove(icon);
            }
        }
        icon.setImageTintList(original);
    }

    public static void bindPillSelector(View pill, Drawable selector) {
        if (MusicLightTheme.isEnabled() && Chrome.findPage(pill) != null) {
            if (Chrome.pageSelectors.put(selector, Boolean.TRUE) == null && lightBackdrop) {
                selector.setTintList(Chrome.SELECTOR);
            }
            Chrome.bindPill(pill);
        }
    }

    static boolean isLightPlayerChrome() {
        return MusicLightTheme.isEnabled() && lightBackdrop;
    }

    public static int pillFaceColor(View pill, int stock) {
        return isLightPlayerChrome() && Chrome.findPage(pill) != null ? CONTROL_SURFACE : stock;
    }

    public static int pillSelectionColor(View pill, int stock) {
        return isLightPlayerChrome() && Chrome.findPage(pill) != null ? PILL_SELECTION : stock;
    }

    /** The related-page chevron is a compound drawable, not part of the title's text colors. */
    public static void setTitleChevronTint(Drawable chevron, int stock) {
        if (MusicLightTheme.isEnabled()) {
            Chrome.titleChevrons.put(chevron, stock);
            applyTitleChevronTint(chevron, stock);
        } else {
            chevron.setTint(stock);
        }
    }

    private static void refreshTitleChevronTint() {
        Chrome.titleChevrons.forEach(MusicPlayerLightTheme::applyTitleChevronTint);
    }

    private static void applyTitleChevronTint(Drawable chevron, int stock) {
        chevron.setTint(lightBackdrop ? (stock & 0xFF000000) | (FOREGROUND & 0x00FFFFFF) : stock);
    }

    /** Lazy so dark-only runs do not allocate light colors, maps, or look up view IDs. */
    private static final class Chrome {
        private static final ColorStateList PRIMARY = foreground(FOREGROUND);
        private static final ColorStateList MUTED = foreground(SECONDARY);
        private static final ColorStateList LINK = new ColorStateList(new int[][] {
                { android.R.attr.state_pressed }, {},
        }, new int[] { FOREGROUND, SECONDARY });
        private static final ColorStateList PILL = ColorStateList.valueOf(CONTROL_SURFACE);
        private static final ColorStateList SELECTOR = ColorStateList.valueOf(PILL_SELECTION);

        private static final int PLAYER_PAGE = id("player_page");
        // Unlike the expanded Song chrome, the separate media controls use this ancestor on every target.
        private static final int MEDIA_CONTROLS = id("controls_layout");
        private static final int TOP = id("player_top_controls");
        private static final int METADATA = id("current_song_view");
        private static final int PLAYBACK = id("music_playback_controls");
        private static final int PILL_VIEW = id("audio_video_switch_toggle");
        private static final int PLAY_PAUSE = id("player_control_play_pause_replay_button");
        private static final int TITLE = id("title");
        private static final int ARTIST = id("artist");
        private static final int CONTAINER_TEXT = id("container_text");
        private static final int ACTION_BAR = id("video_action_bar");
        private static final int ACTION_ROW = id("action_row");
        private static final int[] TOP_ICONS = ids("player_collapse_button", "contextual_menu",
                "ask_music_global_entry_button");
        private static final int[] PLAYBACK_ICONS = ids("player_control_previous_button", "player_control_next_button",
                "player_control_rewind_button", "player_control_fast_forward_button", "playback_rate_button",
                "sleep_timer_button", "player_control_seek_backward_button", "player_control_seek_forward_button",
                "player_control_shuffle_button", "player_control_repeat_button");
        private static final int[] PLAYBACK_TEXT = ids("time_bar_current_time", "time_bar_total_time",
                "playback_rate_text_button");
        private static final int[] PILL_TEXT = ids("song_text", "video_text");
        private static final int[] PILL_ICONS = ids("song_icon", "video_icon");
        private static final int QUEUE_ICON = id("playback_control_icon");
        private static final int SHUFFLE = id("playback_queue_shuffle_button_view");
        private static final int REPEAT = id("playback_queue_loop_button_view");

        private static final WeakHashMap<Paint, Integer> seekPaints = new WeakHashMap<>();
        private static final WeakHashMap<Drawable, Boolean> pageSelectors = new WeakHashMap<>();
        private static final WeakHashMap<View, ColorStateList> stockColors = new WeakHashMap<>();
        private static final WeakHashMap<Drawable, Integer> titleChevrons = new WeakHashMap<>();
        private static final WeakHashMap<View, ColorStateList> stockLinks = new WeakHashMap<>();
        private static final WeakHashMap<View, ColorStateList> pillBackgrounds = new WeakHashMap<>();
        private static final WeakHashMap<View, Boolean> actionRoots = new WeakHashMap<>();

        private static final View.OnLayoutChangeListener ACTION_BINDING =
                (view, l, t, r, b, oldL, oldT, oldR, oldB) -> tintActionViews(view);

        private static int id(String name) {
            return ResourceUtils.getIdIdentifier(name);
        }

        private static int[] ids(String... names) {
            final int[] ids = new int[names.length];
            for (int i = 0; i < names.length; i++) ids[i] = id(names[i]);
            return ids;
        }

        private static ColorStateList foreground(int color) {
            return new ColorStateList(new int[][] { { -android.R.attr.state_enabled }, {} },
                    new int[] { (color & 0x00FFFFFF) | 0x73000000, color });
        }

        private static View findPage(View child) {
            for (View view = child; view != null; view = view.getParent() instanceof View parent ? parent : null) {
                if (view.getId() == MEDIA_CONTROLS && MEDIA_CONTROLS != 0) return null;
                if (view.getId() == PLAYER_PAGE && PLAYER_PAGE != 0) return view;
            }
            return null;
        }

        private static void bindPage(View page) {
            final View top = find(page, TOP);
            tintViews(top, TOP_ICONS, PRIMARY);
            tintText(find(page, CONTAINER_TEXT), MUTED, true);

            final View metadata = find(page, METADATA);
            tintText(find(metadata, TITLE), PRIMARY, false);
            tintText(find(metadata, ARTIST), MUTED, true);

            final View playback = find(page, PLAYBACK);
            tintViews(playback, PLAYBACK_ICONS, PRIMARY);
            tintViews(playback, PLAYBACK_TEXT, MUTED);
            tintImage(find(find(playback, SHUFFLE), QUEUE_ICON), PRIMARY);
            tintImage(find(find(playback, REPEAT), QUEUE_ICON), PRIMARY);

            bindPill(find(top, PILL_VIEW));
            bindActionRow(find(page, ACTION_ROW));
            bindActionRow(find(page, ACTION_BAR));
        }

        private static void bindPill(View pill) {
            if (pill == null) return;
            if (lightBackdrop && !pillBackgrounds.containsKey(pill)) {
                pillBackgrounds.put(pill, pill.getBackgroundTintList());
                pill.setBackgroundTintList(PILL);
            } else if (!lightBackdrop && pillBackgrounds.containsKey(pill)) {
                pill.setBackgroundTintList(pillBackgrounds.remove(pill));
            }
            tintViews(pill, PILL_TEXT, PRIMARY);
            for (int iconId : PILL_ICONS) {
                final View icon = find(pill, iconId);
                if (!lightBackdrop || !stockColors.containsKey(icon)) tintImage(icon, PRIMARY);
            }
        }

        private static View find(View root, int id) {
            return root == null || id == 0 ? null : root.findViewById(id);
        }

        private static void tintViews(View root, int[] ids, ColorStateList tint) {
            if (root == null) return;
            for (int id : ids) {
                final View child = find(root, id);
                if (child instanceof TextView) tintText(child, tint, false);
                else tintImage(child, tint);
            }
        }

        private static void tintText(View view, ColorStateList tint, boolean link) {
            if (!(view instanceof TextView text)) return;
            if (lightBackdrop) {
                if (text.getTextColors() != tint) {
                    stockColors.put(view, text.getTextColors());
                    text.setTextColor(tint);
                }
                if (link && !stockLinks.containsKey(view)) {
                    stockLinks.put(view, text.getLinkTextColors());
                    text.setLinkTextColor(LINK);
                }
            } else if (stockColors.containsKey(view)) {
                text.setTextColor(stockColors.remove(view));
                if (link && stockLinks.containsKey(view)) text.setLinkTextColor(stockLinks.remove(view));
            }
        }

        private static void tintImage(View view, ColorStateList tint) {
            if (!(view instanceof ImageView icon)) return;
            if (lightBackdrop) {
                if (icon.getImageTintList() != tint) {
                    stockColors.put(view, icon.getImageTintList());
                    icon.setImageTintList(tint);
                }
            } else if (stockColors.containsKey(view)) {
                icon.setImageTintList(stockColors.remove(view));
            }
        }

        private static void bindActionRow(View view) {
            if (view == null) return;
            if (actionRoots.put(view, Boolean.TRUE) == null) view.addOnLayoutChangeListener(ACTION_BINDING);
            tintActionViews(view);
        }

        private static void tintActionViews(View view) {
            // Action chips can bind coloured icons or have their own filled face. Only recolour ordinary
            // white labels/icons on the transparent action row; do not replace custom chip drawables.
            if (view instanceof ViewGroup group && view.getBackground() == null) {
                for (int i = 0; i < group.getChildCount(); i++) tintActionViews(group.getChildAt(i));
            } else if (view instanceof TextView text && view.getBackground() == null) {
                if (stockColors.containsKey(view) || isWhiteChrome(text.getTextColors().getDefaultColor())) {
                    tintText(text, PRIMARY, false);
                }
            } else if (view instanceof ImageView icon && view.getBackground() == null && view.getId() != PLAY_PAUSE) {
                final ColorStateList tint = icon.getImageTintList();
                if (stockColors.containsKey(view) || tint == null || isWhiteChrome(tint.getDefaultColor())) {
                    tintImage(icon, PRIMARY);
                }
            }
        }
    }
}
