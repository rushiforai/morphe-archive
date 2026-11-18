package app.afterglow.extension.interfaceui;

import android.text.TextDirectionHeuristic;
import android.text.TextDirectionHeuristics;
import android.app.Activity;
import android.view.View;
import app.afterglow.extension.Afterglow;
import app.afterglow.extension.InstalledTweaks;
import app.afterglow.extension.settings.AfterglowPrefs;

/** Paragraph base direction only: the app's locale, navigation and text remain native. */
public final class TextDirectionPolicy {
    private static volatile boolean loggedFailure;
    private TextDirectionPolicy() {}

    public static TextDirectionHeuristic paragraph(TextDirectionHeuristic nativeDirection) {
        return enabled() ? TextDirectionHeuristics.LTR : nativeDirection;
    }

    /** Plain platform TextViews inherit paragraph direction from the native window. */
    public static void onActivityCreate(Activity activity) {
        try {
            if (enabled() && activity != null && activity.getWindow() != null)
                activity.getWindow().getDecorView().setTextDirection(View.TEXT_DIRECTION_LTR);
        } catch (Throwable error) { report(error); }
    }

    private static boolean enabled() {
        try {
            return InstalledTweaks.has("interface-layout") && AfterglowPrefs.getBool("disableRTL");
        } catch (Throwable error) { report(error); return false; }
    }

    private static void report(Throwable error) {
        if (!loggedFailure) {
            loggedFailure = true;
            Afterglow.error("TextDirectionPolicy.paragraph", error);
        }
    }
}
