// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

package io.github.joancomasfdz.extension.baconreader.slideshow;

import android.content.res.Configuration;
import android.graphics.Insets;
import android.graphics.Point;
import android.os.Build;
import android.view.View;
import android.view.ViewGroup;
import android.view.WindowInsets;
import android.view.WindowManager;
import android.view.WindowMetrics;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.TextView;

import java.util.Map;
import java.util.WeakHashMap;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.ResourceType;
import app.morphe.extension.shared.ResourceUtils;

/**
 * The Slide Show View shows each post in a page of fixed height (PortraitPageLayout), which BaconReader works out
 * from Display.getCurrentSizeRange, less its toolbar and bottom bar. That size used to leave out the status and
 * navigation bars; on newer Android versions (seen on Android 16 and 17) it is the whole screen, so the page runs
 * on behind the bottom bar and the navigation bar. The page is shortened by what the size range reports beyond the
 * window's height without its system bars.
 * <p>
 * An image, GIF or video post's text sits under its media in that page, and BaconReader lets it grow past the
 * page's bottom when it is expanded: what doesn't fit is cut off. It goes into a scroll view instead, inside a
 * vertical column, where "Embed comment images" puts the text's media.
 */
@SuppressWarnings("unused")
public final class FixSlideShowPatch {
    private static final String PAGE = "com.onelouder.baconreader.adapters.PortraitPageLayout";

    /**
     * Each page's last fit: the height BaconReader gave it, its orientation and what was taken off. Getting the
     * window's insets asks the system, and the list asks for the page's layout params on every layout pass.
     */
    private static final Map<View, int[]> FITS = new WeakHashMap<>();

    private FixSlideShowPatch() {
    }

    /** Injected before PortraitPageLayout.getLayoutParams returns: the page gets the height the window has for it. */
    public static ViewGroup.LayoutParams pageLayoutParams(View page, ViewGroup.LayoutParams params) {
        if (page == null || params == null || Build.VERSION.SDK_INT < Build.VERSION_CODES.R || params.height <= 0) {
            return params;
        }
        int orientation = page.getResources().getConfiguration().orientation;
        int[] last = FITS.get(page);
        int excess;
        if (last != null && last[0] == params.height && last[1] == orientation) {
            excess = last[2];
        } else {
            excess = excess(page, orientation);
            FITS.put(page, new int[]{params.height, orientation, excess});
        }
        if (excess > 0) params.height -= excess;
        return params;
    }

    @SuppressWarnings("deprecation")
    private static int excess(View page, int orientation) {
        try {
            WindowManager windowManager = page.getContext().getSystemService(WindowManager.class);
            WindowMetrics metrics = windowManager.getCurrentWindowMetrics();
            Insets bars = metrics.getWindowInsets().getInsets(
                    WindowInsets.Type.systemBars() | WindowInsets.Type.displayCutout());
            int available = metrics.getBounds().height() - bars.top - bars.bottom;
            Point smallest = new Point();
            Point largest = new Point();
            windowManager.getDefaultDisplay().getCurrentSizeRange(smallest, largest);
            int reported = orientation == Configuration.ORIENTATION_LANDSCAPE ? smallest.y : largest.y;
            return Math.max(0, reported - available);
        } catch (Exception ex) {
            Logger.printInfo(() -> "Could not measure the window", ex);
            return 0;
        }
    }

    /**
     * Injected right before PostMediaHandler sets the text of an image, GIF or video post: in the Slide Show View,
     * the text scrolls inside the post's page.
     */
    public static void scrollText(TextView text) {
        if (text == null || text.getParent() == null || text.getParent().getParent() instanceof EdgeScrollView
                || !inSlideShow(text) || !(text.getParent() instanceof ViewGroup)) {
            return;
        }
        ViewGroup parent = (ViewGroup) text.getParent();
        int index = parent.indexOfChild(text);
        ViewGroup.MarginLayoutParams margins = text.getLayoutParams() instanceof ViewGroup.MarginLayoutParams
                ? (ViewGroup.MarginLayoutParams) text.getLayoutParams() : null;
        parent.removeViewAt(index);

        LinearLayout column = new LinearLayout(text.getContext());
        column.setOrientation(LinearLayout.VERTICAL);
        LinearLayout.LayoutParams textParams = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        if (margins != null) {
            textParams.setMargins(margins.leftMargin, margins.topMargin, margins.rightMargin, margins.bottomMargin);
        }
        column.addView(text, textParams);
        EdgeScrollView scroll = new EdgeScrollView(text.getContext());
        scroll.setId(ResourceUtils.getIdentifier(ResourceType.ID, "baconreader_patches_post_text_scroll"));
        scroll.addView(column, new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        // In the page's column, under the media, which takes the height the text leaves it.
        parent.addView(scroll, index, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
    }

    private static boolean inSlideShow(TextView text) {
        for (Object view = text.getParent(); view instanceof View; view = ((View) view).getParent()) {
            if (view.getClass().getName().equals(PAGE)) return true;
        }
        return false;
    }
}
