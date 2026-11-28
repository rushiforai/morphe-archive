/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.hushgram.extension.instagram.direct;

import android.app.Activity;
import android.content.res.ColorStateList;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.PixelFormat;
import android.graphics.Rect;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.os.Build;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.widget.ImageView;
import android.widget.TextView;

import androidx.annotation.Nullable;

import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Map;
import java.util.WeakHashMap;

import app.hushgram.extension.instagram.settings.Settings;

/**
 * The rest of a chat's full glass top bar (Muthu build), on top of {@link GlassChat}'s glass and discs: a glass
 * ring round the avatar, and white text and icons over a dark, colourful or photo chat theme.
 *
 * <p>The avatar is found by its shape, since its id isn't known: the largest round view, 28 to 64 dp across, in
 * the left half of the header, outside the back button and the button row. The ring is drawn as its foreground,
 * so the picture under it is untouched, and the foreground it had is given back.
 *
 * <p>Whether the text goes white is read off the chat's own background, the first one found going up from the
 * message list: one color, or a gradient's colors, darker than middle gray, or a picture (a photo theme), turns it
 * white. A light chat, or a header whose name Instagram already draws light (dark mode), is left as it is. Each
 * text's color and shadow, and each icon's tint, are kept and given back when the switch goes off, the glass comes
 * off or the chat closes. Everything is looked at again each frame, so a color Instagram writes back is taken over.
 */
final class ChatHeaderLook {
    static final float AVATAR_MIN_DP = 28f;
    static final float AVATAR_MAX_DP = 64f;
    /** How far up from the message list the chat's background is looked for. */
    static final int BACKGROUND_REACH = 8;
    /** How deep into the header its texts, icons and avatar are looked for. */
    static final int DEPTH = 8;
    /** Under this luminance a chat's background counts as dark. */
    static final double DARK = 0.5;
    /** Over this luminance Instagram's own name color already counts as light. */
    static final double LIGHT = 0.7;
    static final int TEXT_SHADOW = 0x59000000;

    /** What a text had before it went white. */
    private static final class Text {
        final ColorStateList colors;
        final float radius, dx, dy;
        final int shadow;

        Text(TextView view) {
            colors = view.getTextColors();
            radius = view.getShadowRadius();
            dx = view.getShadowDx();
            dy = view.getShadowDy();
            shadow = view.getShadowColor();
        }
    }

    private static final Map<TextView, Text> TEXTS = new WeakHashMap<>();
    /** Each icon's tint before it went white (null for none). */
    private static final Map<ImageView, ColorStateList> ICONS = new WeakHashMap<>();
    private static final ColorStateList WHITE = ColorStateList.valueOf(Color.WHITE);
    private static WeakReference<View> avatar = new WeakReference<>(null);
    @Nullable private static Drawable avatarForeground;
    @Nullable private static Ring ring;

    private ChatHeaderLook() {
    }

    /**
     * Dresses [header], or undresses it with [glassOn] false. [back] and [buttons] are the header's back button
     * and its row of buttons on the right, either null when not found. Main thread only.
     */
    static void apply(Activity activity, View header, @Nullable View back, @Nullable View buttons, boolean glassOn) {
        float density = header.getResources().getDisplayMetrics().density;
        if (glassOn && Settings.GLASS_CHAT_AVATAR_RING.get()) {
            ringAvatar(header, back, buttons, density);
        } else {
            unringAvatar();
        }
        white = glassOn && Settings.GLASS_CHAT_AUTO_WHITE_TEXT.get() && wantsWhite(activity, header);
        if (white) {
            whiten(header, back, buttons, density);
        } else {
            unwhiten();
        }
    }

    /** Whether the header's text is white now, so the buttons' discs take the clear glass a dark screen has. */
    static boolean white() {
        return white;
    }

    private static boolean white;

    /** Gives every text, icon and avatar back what it had. */
    static void restore() {
        white = false;
        unringAvatar();
        unwhiten();
    }

    // ------------------------------------------------------------------ avatar ring

    private static void ringAvatar(View header, @Nullable View back, @Nullable View buttons, float density) {
        View known = avatar.get();
        if (known == null || !known.isAttachedToWindow() || !inside(header, known)) {
            unringAvatar();
            known = findAvatar(header, back, buttons, density);
            if (known == null) return;
            avatar = new WeakReference<>(known);
            avatarForeground = known.getForeground();
            ring = new Ring(density);
        }
        if (ring != null && known.getForeground() != ring) known.setForeground(ring);
    }

    private static void unringAvatar() {
        View known = avatar.get();
        if (known != null && ring != null && known.getForeground() == ring) known.setForeground(avatarForeground);
        avatar = new WeakReference<>(null);
        avatarForeground = null;
        ring = null;
    }

    /** The largest round view of an avatar's size in the left half of [header], outside [back] and [buttons]. */
    @Nullable
    static View findAvatar(View header, @Nullable View back, @Nullable View buttons, float density) {
        ArrayList<View> found = new ArrayList<>();
        collectRound(header, back, buttons, density, found, 0);
        View best = null;
        int half = header.getWidth() / 2;
        int[] at = new int[2];
        int[] headerAt = new int[2];
        header.getLocationInWindow(headerAt);
        for (View view : found) {
            view.getLocationInWindow(at);
            int centre = at[0] - headerAt[0] + view.getWidth() / 2;
            if (centre > half) continue;
            if (best == null || view.getWidth() > best.getWidth()) best = view;
        }
        return best;
    }

    private static void collectRound(View view, @Nullable View back, @Nullable View buttons, float density,
                                     ArrayList<View> found, int depth) {
        if (depth > DEPTH || view == back || view == buttons || view.getVisibility() != View.VISIBLE) return;
        int width = view.getWidth(), height = view.getHeight();
        boolean sized = width >= AVATAR_MIN_DP * density && width <= AVATAR_MAX_DP * density
                && Math.abs(width - height) <= Math.max(2, Math.round(2 * density));
        if (sized && !(view instanceof TextView) && !holdsText(view)) found.add(view);
        if (!(view instanceof ViewGroup)) return;
        ViewGroup group = (ViewGroup) view;
        for (int i = 0; i < group.getChildCount(); i++) {
            collectRound(group.getChildAt(i), back, buttons, density, found, depth + 1);
        }
    }

    private static boolean holdsText(View view) {
        if (view instanceof TextView) return true;
        if (!(view instanceof ViewGroup)) return false;
        ViewGroup group = (ViewGroup) view;
        for (int i = 0; i < group.getChildCount(); i++) {
            if (holdsText(group.getChildAt(i))) return true;
        }
        return false;
    }

    private static boolean inside(View ancestor, View view) {
        for (ViewParent at = view.getParent(); at != null; at = at.getParent()) {
            if (at == ancestor) return true;
        }
        return false;
    }

    /** A glass ring: a bright inner line and a faint wider halo, drawn over the avatar's edge. */
    static final class Ring extends Drawable {
        static final int INNER = 0xbfffffff;
        static final int HALO = 0x29ffffff;
        private final Paint inner = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint halo = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final float innerWidth, haloWidth;

        Ring(float density) {
            innerWidth = Math.max(1.5f, 2.5f * density);
            haloWidth = Math.max(1f, 2.5f * density);
            inner.setStyle(Paint.Style.STROKE);
            inner.setStrokeWidth(innerWidth);
            inner.setColor(INNER);
            halo.setStyle(Paint.Style.STROKE);
            halo.setStrokeWidth(haloWidth);
            halo.setColor(HALO);
        }

        @Override
        public void draw(Canvas canvas) {
            Rect bounds = getBounds();
            if (bounds.isEmpty()) return;
            float radius = Math.min(bounds.width(), bounds.height()) / 2f;
            float x = bounds.exactCenterX(), y = bounds.exactCenterY();
            canvas.drawCircle(x, y, radius - innerWidth / 2f, inner);
            canvas.drawCircle(x, y, radius - innerWidth - haloWidth / 2f, halo);
        }

        @Override public void setAlpha(int alpha) { }
        @Override public void setColorFilter(@Nullable ColorFilter filter) { }
        @Override public int getOpacity() { return PixelFormat.TRANSLUCENT; }
    }

    // ------------------------------------------------------------------ white text

    /** Whether the chat under [header] is dark, colourful or a photo, and Instagram's name isn't light already. */
    static boolean wantsWhite(Activity activity, View header) {
        TextView name = firstText(header, 0);
        if (name != null && luminance(name.getCurrentTextColor()) > LIGHT && !TEXTS.containsKey(name)) return false;
        Boolean dark = null;
        for (String start : new String[]{GlassChat.MESSAGE_LIST, GlassChat.MESSAGES, GlassChat.CHAT}) {
            int id = GlassChat.id(activity, start);
            View view = id == 0 ? null : activity.findViewById(id);
            if (view == null) continue;
            dark = darkBackground(view);
            if (dark != null) break;
        }
        return Boolean.TRUE.equals(dark);
    }

    /** True or false for the first background up from [view] that tells, null when none does. */
    @Nullable
    static Boolean darkBackground(View view) {
        View at = view;
        for (int up = 0; up < BACKGROUND_REACH && at != null; up++) {
            Boolean dark = dark(at.getBackground());
            if (dark != null) return dark;
            ViewParent parent = at.getParent();
            at = parent instanceof View ? (View) parent : null;
        }
        return null;
    }

    /** Whether [background] is dark: null for none or one too see-through to tell, true for a picture. */
    @Nullable
    static Boolean dark(@Nullable Drawable background) {
        if (background == null) return null;
        if (background instanceof ColorDrawable) {
            int color = ((ColorDrawable) background).getColor();
            if (Color.alpha(color) < 128) return null;
            return luminance(color) < DARK;
        }
        if (background instanceof GradientDrawable && Build.VERSION.SDK_INT >= Build.VERSION_CODES.N) {
            GradientDrawable gradient = (GradientDrawable) background;
            int[] colors = gradient.getColors();
            if (colors == null || colors.length == 0) {
                ColorStateList solid = gradient.getColor();
                if (solid == null) return null;
                colors = new int[]{solid.getDefaultColor()};
            }
            double sum = 0;
            int counted = 0;
            for (int color : colors) {
                if (Color.alpha(color) < 128) continue;
                sum += luminance(color);
                counted++;
            }
            if (counted == 0) return null;
            return sum / counted < DARK;
        }
        // A picture, a layer of them or anything else drawn: a photo or patterned theme.
        return true;
    }

    static double luminance(int color) {
        return (0.2126 * Color.red(color) + 0.7152 * Color.green(color) + 0.0722 * Color.blue(color)) / 255.0;
    }

    @Nullable
    private static TextView firstText(View view, int depth) {
        if (depth > DEPTH || view.getVisibility() != View.VISIBLE) return null;
        if (view instanceof TextView && ((TextView) view).length() > 0) return (TextView) view;
        if (!(view instanceof ViewGroup)) return null;
        ViewGroup group = (ViewGroup) view;
        for (int i = 0; i < group.getChildCount(); i++) {
            TextView found = firstText(group.getChildAt(i), depth + 1);
            if (found != null) return found;
        }
        return null;
    }

    private static void whiten(View header, @Nullable View back, @Nullable View buttons, float density) {
        whitenTexts(header, density, 0);
        if (back != null) whitenIcons(back, 0);
        if (buttons != null) whitenIcons(buttons, 0);
    }

    private static void whitenTexts(View view, float density, int depth) {
        if (depth > DEPTH) return;
        if (view instanceof TextView) {
            TextView text = (TextView) view;
            if (!TEXTS.containsKey(text)) TEXTS.put(text, new Text(text));
            if (text.getCurrentTextColor() != Color.WHITE) text.setTextColor(WHITE);
            float radius = 3f * density;
            if (text.getShadowRadius() != radius || text.getShadowColor() != TEXT_SHADOW) {
                text.setShadowLayer(radius, 0f, density, TEXT_SHADOW);
            }
            return;
        }
        if (!(view instanceof ViewGroup)) return;
        ViewGroup group = (ViewGroup) view;
        for (int i = 0; i < group.getChildCount(); i++) whitenTexts(group.getChildAt(i), density, depth + 1);
    }

    private static void whitenIcons(View view, int depth) {
        if (depth > DEPTH) return;
        if (view instanceof ImageView) {
            ImageView icon = (ImageView) view;
            if (!ICONS.containsKey(icon)) ICONS.put(icon, icon.getImageTintList());
            if (icon.getImageTintList() != WHITE) icon.setImageTintList(WHITE);
            return;
        }
        if (!(view instanceof ViewGroup)) return;
        ViewGroup group = (ViewGroup) view;
        for (int i = 0; i < group.getChildCount(); i++) whitenIcons(group.getChildAt(i), depth + 1);
    }

    private static void unwhiten() {
        if (!TEXTS.isEmpty()) {
            for (Map.Entry<TextView, Text> entry : new ArrayList<>(TEXTS.entrySet())) {
                TextView text = entry.getKey();
                Text was = entry.getValue();
                if (text == null || was == null) continue;
                if (was.colors != null) text.setTextColor(was.colors);
                text.setShadowLayer(was.radius, was.dx, was.dy, was.shadow);
            }
            TEXTS.clear();
        }
        if (!ICONS.isEmpty()) {
            for (Map.Entry<ImageView, ColorStateList> entry : new ArrayList<>(ICONS.entrySet())) {
                ImageView icon = entry.getKey();
                if (icon != null && icon.getImageTintList() == WHITE) icon.setImageTintList(entry.getValue());
            }
            ICONS.clear();
        }
    }
}
