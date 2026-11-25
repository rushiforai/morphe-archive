/*
 * Copyright 2026 HushTumblr contributors
 * https://github.com/SysAdminDoc/HushTumblr
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushtumblr.extension.tumblr.ui;

import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import androidx.annotation.Nullable;

import app.hushtumblr.extension.shared.Utils;
import app.hushtumblr.extension.shared.diagnostics.HookStatus;
import app.hushtumblr.extension.tumblr.settings.FamilyNames;
import app.hushtumblr.extension.tumblr.settings.PatchFamily;
import app.hushtumblr.extension.tumblr.settings.Settings;

/**
 * Fix hard-to-read text. Two places where Tumblr's own layout leaves text you can't read.
 *
 * <p><b>Related tags under a trending topic.</b> Explore lists each trending topic with a row of
 * related tags. Tumblr gives every tag in that row a fixed height (23.5 dp) while the tag's text
 * grows with the font size, so at a bigger text size the bottom of the row is cut off.
 * {@link #relatedTagHeight} keeps Tumblr's height as the least a tag gets and lets it grow to fit.
 *
 * <p><b>The search box inside a blog.</b> A blog with a header image gets that image, blurred,
 * behind the search screen's top bar, and the text typed there is always white on a box that's
 * nearly clear. Over a bright header the words disappear. {@link #blogSearchBox} makes the box a
 * shade that stands against the text: dark behind light text, light behind dark.
 *
 * <p>Tumblr's own values stand while the switch is off, HushTumblr is paused, the settings aren't
 * ready or anything throws.
 */
public final class ReadableText {
    /** The steps a failure is reported under. */
    static final String TAG_STEP = "related tag height";
    static final String BOX_STEP = "blog search box";

    /** What the diagnostic report counts. Fixed text only. */
    static final String TAG_FITTED = "related tag fitted";
    static final String BOX_SHADED = "blog search box shaded";

    /** Black and white at 60%, enough behind text of the other shade over any photo. */
    static final int DARK_BOX = 0x99000000;
    static final int LIGHT_BOX = 0x99FFFFFF;

    private ReadableText() {
    }

    /**
     * Injected where the related tags row gives a tag its height, with the tag and Tumblr's fixed
     * height in pixels. Answers the height to use: Tumblr's, or wrap content with Tumblr's as the
     * least while the switch is on. Never throws.
     */
    public static int relatedTagHeight(@Nullable View tag, int fixed) {
        try {
            if (!(tag instanceof TextView) || fixed <= 0 || !on(PatchFamily.Capability.READABLE_TEXT)) return fixed;
            ((TextView) tag).setMinHeight(fixed);
            HookStatus.counted(FamilyNames.FIX_HARD_TO_READ_TEXT, TAG_FITTED);
            return ViewGroup.LayoutParams.WRAP_CONTENT;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.FIX_HARD_TO_READ_TEXT, TAG_STEP, failure);
            return fixed;
        }
    }

    /**
     * Injected where a blog's search screen tints the box you type in, with the box's own
     * background, the text color and Tumblr's tint. Answers the tint to use. Tumblr's shape is
     * 20% white under a 20% tint, which nearly vanishes, so while the switch is on the shape is
     * made solid and the tint is a shade that stands against the text. Never throws.
     */
    public static int blogSearchBox(@Nullable Drawable box, int text, int tint) {
        try {
            if (!(box instanceof GradientDrawable) || !on(PatchFamily.Capability.READABLE_TEXT)) return tint;
            ((GradientDrawable) box).setColor(0xFFFFFFFF);
            HookStatus.counted(FamilyNames.FIX_HARD_TO_READ_TEXT, BOX_SHADED);
            return light(text) ? DARK_BOX : LIGHT_BOX;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.FIX_HARD_TO_READ_TEXT, BOX_STEP, failure);
            return tint;
        }
    }

    /** Whether a color reads as light, by the usual weighted sum of its red, green and blue. */
    static boolean light(int color) {
        int red = (color >> 16) & 0xFF;
        int green = (color >> 8) & 0xFF;
        int blue = color & 0xFF;
        return red * 299 + green * 587 + blue * 114 >= 128 * 1000;
    }

    private static boolean on(PatchFamily.Capability capability) {
        if (!Utils.settingsReady() || !capability.installed()) return false;
        HookStatus.invoked(FamilyNames.FIX_HARD_TO_READ_TEXT);
        return Settings.FIX_HARD_TO_READ_TEXT.get();
    }
}
