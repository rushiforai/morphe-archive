package app.bin0culars.extension.reddit;

import android.content.Context;
import android.content.res.Resources;
import android.hardware.display.DisplayManager;
import android.util.DisplayMetrics;
import android.view.Display;
import app.bin0culars.extension.reddit.settings.BinocularsMods;

public final class TabletGridFeedPatch {

    private static final float TOP_GAP_DP = 8f;

    private static Context appContext;

    private static void callMasonry(
            Object state,
            Object sink,
            Object f1,
            Object modifier,
            Object padding,
            float spacing,
            Object arrangement,
            Object footer,
            boolean fullSpan,
            Object stateSlot,
            Object header,
            Object composer,
            int changed0,
            int changed1) {
        // Modified during patching.
    }

    private static Object newPadding(
            float start,
            float top,
            float end,
            float bottom,
            Object scratch) {
        // Modified during patching.
        return null;
    }

    private static Object footer(Object scratch) {
        // Modified during patching.
        return null;
    }

    private static int screenWidthDp() {
        try {
            Context context = appContext;
            if (context == null) {
                context = (Context) Class.forName("android.app.ActivityThread")
                        .getMethod("currentApplication")
                        .invoke(null);
                appContext = context;
            }
            if (context != null) {
                DisplayManager dm = (DisplayManager) context.getSystemService(Context.DISPLAY_SERVICE);
                if (dm != null) {
                    Display display = dm.getDisplay(Display.DEFAULT_DISPLAY);
                    if (display != null) {
                        DisplayMetrics metrics = new DisplayMetrics();
                        display.getRealMetrics(metrics);
                        if (metrics.density > 0) {
                            return (int) (metrics.widthPixels / metrics.density);
                        }
                    }
                }
            }
        } catch (Throwable ignored) {
        }
        return Resources.getSystem().getConfiguration().screenWidthDp;
    }

    public static int columns() {
        int widthDp = screenWidthDp();
        if (widthDp < 600) {
            return 1;
        }
        String choice = BinocularsMods.getChoice("tablet_grid_columns");
        if ("two".equals(choice)) {
            return 2;
        }
        if ("three".equals(choice)) {
            return 3;
        }
        if (widthDp < 900) {
            return 2;
        }
        return 3;
    }

    public static int columnsForWidth(int availablePx, int original) {
        String choice = BinocularsMods.getChoice("tablet_grid_columns");
        if ("two".equals(choice)) {
            return 2;
        }
        if ("three".equals(choice)) {
            return 3;
        }
        float dp = availablePx / Resources.getSystem().getDisplayMetrics().density;
        return dp >= 840f ? Math.max(original, 3) : original;
    }

    public static boolean masonryFeed(
            Object state,
            Object sink,
            Object f1,
            Object modifier,
            Object feedType,
            Object header,
            Object stateSlot,
            Object composer,
            float topInset) {
        if (!BinocularsMods.isEnabled("tablet_grid_feed")) {
            return false;
        }
        if (columns() <= 1) {
            return false;
        }
        if (!(feedType instanceof Enum)) {
            return false;
        }
        String name = ((Enum<?>) feedType).name();
        switch (name) {
            case "HOME":
            case "POPULAR":
            case "LATEST":
            case "NEWS":
            case "SUBREDDIT":
            case "FOLLOWING":
            case "CUSTOM":
                break;
            default:
                return false;
        }
        callMasonry(
                state,
                sink,
                f1,
                modifier,
                newPadding(16f, topInset + TOP_GAP_DP, 16f, 16f, null),
                0f,
                null,
                footer(null),
                true,
                stateSlot,
                header,
                composer,
                0,
                0);
        return true;
    }
}
