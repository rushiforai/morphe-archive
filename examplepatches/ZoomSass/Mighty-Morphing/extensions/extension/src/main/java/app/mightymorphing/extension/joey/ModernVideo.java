package app.mightymorphing.extension.joey;

import android.content.Context;
import android.content.res.ColorStateList;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.SeekBar;
import android.widget.TextView;

import java.lang.reflect.Method;

/**
 * Colours for Joey's video controls while Modern UI is on: the progress bar, the buttons and time,
 * and the volume slider. Joey's player calls this once it has set its own colours, so ours go on top.
 * The "Use Joey's video colours" switch and Classic leave the player exactly as Joey draws it.
 * Must be public: Joey's player class calls it.
 */
public final class ModernVideo {
    /** The bar and buffered track sit on top of video, so they take a see-through version of the colour. */
    static final int BUFFERED_ALPHA = 0x99;
    static final int UNPLAYED_ALPHA = 0x44;
    static final int BUTTON_ALPHA = 0xDD;

    private static Method sPlayed;
    private static Method sScrubber;
    private static Method sBuffered;
    private static Method sUnplayed;
    private static Class<?> sBarClass;

    private ModernVideo() {
    }

    /**
     * @param bar     Joey's VideoTimeBar
     * @param minimal Joey's thin white progress line (set by Joey itself), which stays as it is
     */
    public static void bar(View bar, boolean minimal) {
        if (bar == null || minimal) return;
        try {
            Context context = bar.getContext();
            if (!ModernUi.isModernUiEnabled(context) || ModernTheme.videoJoey(context)) return;
            int[] roles = ModernUi.getPalette(context).roles;
            int played = pick(roles, ModernTheme.VIDEO_PLAYED) | 0xFF000000;
            int buffered = alpha(pick(roles, ModernTheme.VIDEO_BUFFERED), BUFFERED_ALPHA);
            int unplayed = alpha(pick(roles, ModernTheme.VIDEO_UNPLAYED), UNPLAYED_ALPHA);
            int buttons = pick(roles, ModernTheme.VIDEO_BUTTONS) | 0xFF000000;
            int volume = pick(roles, ModernTheme.VIDEO_VOLUME) | 0xFF000000;

            find(bar.getClass());
            call(sPlayed, bar, played);
            call(sScrubber, bar, played);
            call(sBuffered, bar, buffered);
            call(sUnplayed, bar, unplayed);

            ViewGroup row = bar.getParent() instanceof ViewGroup ? (ViewGroup) bar.getParent() : null;
            if (row != null) {
                ColorStateList tint = ColorStateList.valueOf(alpha(buttons, BUTTON_ALPHA));
                for (int i = 0; i < row.getChildCount(); i++) {
                    View child = row.getChildAt(i);
                    if (child == bar) continue;
                    if (child instanceof ImageView) ((ImageView) child).setImageTintList(tint);
                    else if (child instanceof TextView) ((TextView) child).setTextColor(buttons);
                }
                if (row.getParent() instanceof ViewGroup) slider((ViewGroup) row.getParent(), volume);
            }
        } catch (Throwable ignored) {
            // A colour that cannot be set leaves Joey's own in place.
        }
    }

    private static void slider(ViewGroup group, int color) {
        for (int i = 0; i < group.getChildCount(); i++) {
            View child = group.getChildAt(i);
            if (child instanceof SeekBar) {
                ColorStateList tint = ColorStateList.valueOf(color);
                SeekBar seek = (SeekBar) child;
                seek.setProgressTintList(tint);
                seek.setThumbTintList(tint);
            } else if (child instanceof ViewGroup) {
                slider((ViewGroup) child, color);
            }
        }
    }

    /** A role the theme left at zero shows Joey's own colour. */
    private static int pick(int[] roles, int role) {
        return roles[role] != 0 ? roles[role] : ModernTheme.standard(role);
    }

    private static int alpha(int color, int alpha) {
        return (color & 0x00FFFFFF) | (alpha << 24);
    }

    private static synchronized void find(Class<?> type) throws Exception {
        if (sBarClass == type) return;
        sPlayed = type.getMethod("setPlayedColor", int.class);
        sScrubber = type.getMethod("setScrubberColor", int.class);
        sBuffered = type.getMethod("setBufferedColor", int.class);
        sUnplayed = type.getMethod("setUnplayedColor", int.class);
        sBarClass = type;
    }

    private static void call(Method method, View bar, int color) throws Exception {
        if (method != null) method.invoke(bar, color);
    }
}
