/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 *
 * Built on icysymmetra/tiktok-patches-for-morphe (GPL-3.0).
 */
package app.morphe.extension.pinedrama.interaction;

import android.content.Context;
import android.content.res.Resources;
import android.util.DisplayMetrics;
import android.view.View;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.pinedrama.settings.Settings;

/**
 * Shows a photo slide whole on a screen that is nearly square, as Fit the video to the screen
 * does for videos.
 *
 * <p>PineDrama sizes a slide's picture to cover its cell whenever the slide is taller than about
 * 9:16. On a 9:16 or 9:20 phone that costs a sliver of the picture. On a 1:1 or 4:5 screen the
 * cell is far wider than the slide, so the cover scale cuts a third or more off the top and the
 * bottom, enough to lose the text on a slide. Three of PineDrama's questions are answered here: the
 * scale a slide gets, whether the full screen cell crops one, and whether the photo display mode
 * shows every slide whole. When this says yes the slide gets the fit scale, which shows all of it
 * centred with the leftover space black.
 *
 * <p>The last one is the answer that sticks. PineDrama puts each photo post in one of a few display
 * modes, and the photo cell lets the mode's layout overrule the scale it was handed: most modes
 * crop a slide taller than 9:16 to the full screen cell whatever the first two said. One mode
 * shows every slide whole, so on a squarish screen with Fit on every mode answers as that one.
 *
 * <p>Only squarish screens are touched. A tall slide on an ordinary phone keeps PineDrama's crop,
 * which is the same as before this existed.
 */
public final class PhotoSlideFit {
    private PhotoSlideFit() {}

    /**
     * The narrowest a cell has to be, as width over height, before a crop counts. A 9:16 phone is
     * 0.56 and a 9:21 one 0.43, a tablet held upright 0.75, and the square QWERTY phones this was
     * asked for sit near 0.9. 0.65 leaves every tall phone alone and takes in the rest.
     */
    static final float SQUARISH = 0.65f;

    /**
     * The share of a slide's height a cover crop can cut before fit is worth it. Below this the
     * crop is the sliver PineDrama always cut and there is nothing to read in it.
     */
    static final float WORTH_FITTING = 0.10f;

    /** Whether Fit is the switch that is on; Fill and off leave every slide to PineDrama. */
    private static boolean on() {
        return Settings.FIT_VIDEO_TO_SCREEN.get();
    }

    /**
     * How much of a slide's height covering a cell cuts off: nothing for a slide as wide as the
     * cell or wider, and the missing share of the height otherwise. Zero for sizes it can't use.
     *
     * @param aspect the slide's width over its height
     */
    static float croppedShare(float aspect, float cellWidth, float cellHeight) {
        if (!(aspect > 0f) || !(cellWidth > 0f) || !(cellHeight > 0f)) return 0f;
        float cell = cellWidth / cellHeight;
        if (aspect >= cell) return 0f;
        return 1f - aspect / cell;
    }

    /** Whether a cell or screen of this size is wide enough for PineDrama's cover crop to cost much. */
    static boolean squarish(float width, float height) {
        return width > 0f && height > 0f && width / height >= SQUARISH;
    }

    /** Whether a slide in a cell of this size should be shown whole instead of cropped to cover. */
    static boolean shouldFit(float aspect, float cellWidth, float cellHeight) {
        if (!squarish(cellWidth, cellHeight)) return false;
        return croppedShare(aspect, cellWidth, cellHeight) >= WORTH_FITTING;
    }

    /** The screen's size, which stands in for the cell where PineDrama's question only has the slide. */
    private static DisplayMetrics screen() {
        Context context = Utils.getContext();
        if (context == null) return null;
        Resources resources = context.getResources();
        return resources == null ? null : resources.getDisplayMetrics();
    }

    /**
     * The scale question for a slide in the feed, which knows the slide and not the cell, so the
     * screen stands in for it. Non-zero means use the fit scale.
     */
    public static int fitOnScreen(float aspect) {
        try {
            if (!on()) return 0;
            DisplayMetrics metrics = screen();
            if (metrics == null) return 0;
            return shouldFit(aspect, metrics.widthPixels, metrics.heightPixels) ? 1 : 0;
        } catch (Exception exception) {
            Logger.printException(() -> "Could not decide how to fit a photo slide", exception);
            return 0;
        }
    }

    /**
     * The photo display mode's question of whether it shows every slide whole. Only the photo cell
     * and the layout step that sizes it ask, and a yes puts each slide on the fit scale, PineDrama's
     * own path for the mode that answers yes. It has no slide to measure, so any slide on a
     * squarish screen counts, which costs a slide that loses only a sliver to the crop a thin
     * black edge instead. Non-zero means yes.
     */
    public static int showsWholeImage() {
        try {
            if (!on()) return 0;
            DisplayMetrics metrics = screen();
            if (metrics == null) return 0;
            return squarish(metrics.widthPixels, metrics.heightPixels) ? 1 : 0;
        } catch (Exception exception) {
            Logger.printException(() -> "Could not decide whether to show photo slides whole", exception);
            return 0;
        }
    }

    /**
     * The full screen cell's question of whether a slide this tall should be cropped to its
     * container. Non-zero means do not crop it.
     */
    public static int fitInContainer(View container, float aspect) {
        try {
            if (!on() || container == null) return 0;
            return shouldFit(aspect, container.getWidth(), container.getHeight()) ? 1 : 0;
        } catch (Exception exception) {
            Logger.printException(() -> "Could not decide how to fit a photo slide in its cell", exception);
            return 0;
        }
    }
}
