/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.LinearGradient;
import android.graphics.Paint;
import android.graphics.Rect;
import android.graphics.Shader;
import android.view.View;

import androidx.annotation.Nullable;

import java.util.ArrayList;
import java.util.WeakHashMap;

import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.Settings;

/**
 * A banner on the chat list's own top bar (#86): two colors fading into each other, or a picture from
 * the gallery, painted first in the bar's draw, so the title, the buttons and everything else the bar
 * holds draw over it. Only the bar Telegram marks for its holiday image gets it, and that's the chat
 * list's. The bar's own fill, or the blurred list under it, is what the banner covers.
 *
 * <p>Each gradient has a light pair for a theme whose title is dark and a deep pair for one whose
 * title is light, picked from the title's color as the bar draws, so a theme change keeps the title
 * and icons readable. A picture gets a veil of the same kind over it. The picture is kept by
 * {@link SavedPicture} and decoded off the main thread at the bar's size.
 */
public final class ChatListBanner {
    private ChatListBanner() {}

    /** No banner: the bar as Telegram paints it. */
    public static final String NONE = "";
    /** The picture saved for the banner. */
    public static final String PICTURE = "picture";
    /** The gradients, by the name the setting keeps, in the order the choice lists them. */
    public static final String[] GRADIENTS = {"dusk", "ocean", "forest", "ember", "slate"};

    /** Each gradient's two colors, left to right, under a dark title. */
    static final int[][] LIGHT = {
            {0xFFFFD3E2, 0xFFD6D0FF},
            {0xFFC6E9FF, 0xFFC9F5E8},
            {0xFFD5F0C4, 0xFFF2EEC0},
            {0xFFFFDCC0, 0xFFFFC8C8},
            {0xFFE6EAF0, 0xFFCFD8E4},
    };

    /** The same gradients under a light title. */
    static final int[][] DEEP = {
            {0xFF4A1F45, 0xFF241E5C},
            {0xFF0B3556, 0xFF0E4A47},
            {0xFF1E3D1F, 0xFF3A3812},
            {0xFF5A2410, 0xFF5A1426},
            {0xFF2A3240, 0xFF1B222D},
    };

    /** How much of a veil lies over a picture, out of 255: white under a dark title, black under a light one. */
    static final int VEIL = 0x99;

    /** What a saved choice paints. */
    enum Kind { NONE, GRADIENT, PICTURE }

    /** Heights a picture is decoded at go up in steps of this, so a bar that grows a little keeps its copy. */
    static final int HEIGHT_STEP = 64;

    /** The bars that drew a banner this frame, so their blur doesn't paint over it. Main thread only. */
    private static final WeakHashMap<View, Boolean> DREW = new WeakHashMap<>();
    /** Every chat list bar seen, so a change reaches it at once. Main thread only. */
    private static final WeakHashMap<View, Boolean> BARS = new WeakHashMap<>();
    /** The picture as the bar draws it. Main thread only. */
    private static final SavedPicture.Shown SHOWN = new SavedPicture.Shown(SavedPicture.CHAT_LIST_BANNER,
            ChatListBanner::redraw, ChatListBanner::changed);

    private static final Paint FILL = new Paint();
    private static final Paint PICTURE_PAINT = new Paint(Paint.FILTER_BITMAP_FLAG);
    private static final Paint VEIL_PAINT = new Paint();
    private static final Rect AREA = new Rect();
    @Nullable private static LinearGradient shader;
    private static int shaderWidth, shaderStart, shaderEnd;
    private static boolean shown;

    /** What [saved] paints, with [pictureThere] saying whether the banner's picture is on the phone. */
    static Kind kind(@Nullable String saved, boolean pictureThere) {
        if (saved == null || saved.isEmpty()) return Kind.NONE;
        if (PICTURE.equals(saved)) return pictureThere ? Kind.PICTURE : Kind.NONE;
        return gradient(saved) >= 0 ? Kind.GRADIENT : Kind.NONE;
    }

    /** Where [saved] sits in {@link #GRADIENTS}, or -1. */
    static int gradient(@Nullable String saved) {
        for (int i = 0; i < GRADIENTS.length; i++) if (GRADIENTS[i].equals(saved)) return i;
        return -1;
    }

    /** [saved] when it names a gradient, otherwise empty. */
    public static String gradientName(@Nullable String saved) {
        return gradient(saved) >= 0 ? saved : NONE;
    }

    /** Whether [saved] paints anything, with [pictureThere] saying whether the banner's picture is on the phone. */
    public static boolean showsSomething(@Nullable String saved, boolean pictureThere) {
        return kind(saved, pictureThere) != Kind.NONE;
    }

    /** Whether [value] is a choice the banner's row saves. */
    public static boolean allowed(@Nullable String value) {
        return NONE.equals(value) || PICTURE.equals(value) || gradient(value) >= 0;
    }

    /** The saved choice, or none while settings aren't read yet or HushTelegram is paused. */
    static String chosen() {
        if (!Utils.settingsReady()) return NONE;
        String saved = Settings.CHAT_LIST_BANNER.get();
        return saved == null ? NONE : saved;
    }

    /** The two colors of gradient [index], light under a dark title and deep under a light one. */
    static int[] colors(int index, boolean lightTitle) {
        return (lightTitle ? DEEP : LIGHT)[index];
    }

    /** The veil over a picture: white under a dark title, black under a light one. */
    static int veil(boolean lightTitle) {
        return (VEIL << 24) | (lightTitle ? 0x000000 : 0xFFFFFF);
    }

    /** Whether [titleColor] is a light title, the kind a dark bar carries. A title not known reads as dark. */
    static boolean lightTitle(int titleColor) {
        return (titleColor >>> 24) != 0 && luminance(titleColor) > 0.4;
    }

    /** [color]'s relative luminance, from 0 for black to 1 for white, as contrast checks measure it. */
    static double luminance(int color) {
        return 0.2126 * channel(color >> 16) + 0.7152 * channel(color >> 8) + 0.0722 * channel(color);
    }

    private static double channel(int value) {
        double c = (value & 0xFF) / 255.0;
        return c <= 0.04045 ? c / 12.92 : Math.pow((c + 0.055) / 1.055, 2.4);
    }

    /** The contrast between two opaque colors, from 1 for none to 21 for black on white. */
    static double contrast(int a, int b) {
        double one = luminance(a) + 0.05, two = luminance(b) + 0.05;
        return Math.max(one, two) / Math.min(one, two);
    }

    /** [veil] laid over the opaque [under], as the canvas blends it. */
    static int blend(int veil, int under) {
        int alpha = veil >>> 24;
        int r = ((veil >> 16 & 0xFF) * alpha + (under >> 16 & 0xFF) * (255 - alpha)) / 255;
        int g = ((veil >> 8 & 0xFF) * alpha + (under >> 8 & 0xFF) * (255 - alpha)) / 255;
        int b = ((veil & 0xFF) * alpha + (under & 0xFF) * (255 - alpha)) / 255;
        return 0xFF000000 | r << 16 | g << 8 | b;
    }

    /** The height a picture for a bar [height] tall is decoded at. */
    static int decodeHeight(int height) {
        return (height + HEIGHT_STEP - 1) / HEIGHT_STEP * HEIGHT_STEP;
    }

    /**
     * Called first as a top bar draws, before its own fill and blur. The chat list's bar with a
     * banner chosen gets it painted; every other bar, and the chat list's with none, is left alone.
     */
    public static void draw(View bar, Canvas canvas) {
        if (bar == null || canvas == null) return;
        try {
            if (holiday(bar) == 0) return;
            HookStatus.invoked(FamilyNames.HOLIDAY_LOOK);
            BARS.put(bar, Boolean.TRUE);
            boolean drew = paint(bar, canvas, chosen());
            if (drew) DREW.put(bar, Boolean.TRUE);
            else DREW.remove(bar);
            if (drew != shown) {
                shown = drew;
                HookStatus.counted(FamilyNames.HOLIDAY_LOOK, drew ? "chat list banner shown" : "chat list banner cleared");
            }
        } catch (Throwable failure) {
            DREW.remove(bar);
            HookStatus.threw(FamilyNames.HOLIDAY_LOOK, "chat list banner", failure);
        }
    }

    /**
     * Called where the bar asks whether to paint the list blurred under it, with [stock], its own
     * answer. A bar that drew a banner this frame answers no, so the blur doesn't cover it.
     */
    public static int blur(View bar, int stock) {
        if (stock == 0 || bar == null) return stock;
        try {
            return DREW.containsKey(bar) ? 0 : stock;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.HOLIDAY_LOOK, "chat list banner blur", failure);
            return stock;
        }
    }

    /** Paints [saved]'s banner over [bar]. False when there's nothing to paint yet. */
    static boolean paint(View bar, Canvas canvas, String saved) {
        int width = bar.getWidth(), height = bar.getHeight();
        if (width <= 0 || height <= 0) return false;
        Context context = bar.getContext();
        Kind kind = kind(saved, PICTURE.equals(saved) && SHOWN.present(context));
        if (kind == Kind.NONE) return false;
        boolean light = lightTitle(titleColor(bar));
        AREA.set(0, 0, width, height);
        if (kind == Kind.GRADIENT) {
            int[] pair = colors(gradient(saved), light);
            if (shader == null || shaderWidth != width || shaderStart != pair[0] || shaderEnd != pair[1]) {
                shader = new LinearGradient(0, 0, width, 0, pair[0], pair[1], Shader.TileMode.CLAMP);
                shaderWidth = width;
                shaderStart = pair[0];
                shaderEnd = pair[1];
            }
            FILL.setShader(shader);
            canvas.drawRect(AREA, FILL);
            return true;
        }
        // Until the copy at this size lands, Telegram's own fill shows.
        Bitmap bitmap = SHOWN.bitmap(context, width, decodeHeight(height));
        if (bitmap == null) return false;
        SavedPicture.drawFilling(canvas, bitmap, AREA, PICTURE_PAINT);
        VEIL_PAINT.setColor(veil(light));
        canvas.drawRect(AREA, VEIL_PAINT);
        return true;
    }

    /** Called on the main thread when the choice or the picture changed, so the bar shows it at once. */
    public static void changed() {
        try {
            SHOWN.forget();
            redraw();
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.HOLIDAY_LOOK, "chat list banner change", failure);
        }
    }

    /** Asks every chat list bar to draw again, for when the picture's copy lands. Main thread only. */
    static void redraw() {
        try {
            for (View bar : new ArrayList<>(BARS.keySet())) {
                if (bar != null) bar.invalidate();
            }
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.HOLIDAY_LOOK, "chat list banner redraw", failure);
        }
    }

    /** Non-zero when [bar] is the one Telegram marks for its holiday image, the chat list's. Replaced when patching. */
    public static int holiday(View bar) { return 0; }

    /** The color of [bar]'s title, or 0 when it has none. Replaced when patching. */
    public static int titleColor(View bar) { return 0; }
}
