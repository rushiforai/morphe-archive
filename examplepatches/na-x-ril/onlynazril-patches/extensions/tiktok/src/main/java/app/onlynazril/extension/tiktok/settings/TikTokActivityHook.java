package app.onlynazril.extension.tiktok.settings;

import android.content.Context;
import android.content.Intent;
import android.graphics.Insets;
import android.os.Build;
import android.os.Bundle;
import android.view.View;
import android.view.WindowInsets;
import android.widget.ScrollView;

import app.onlynazril.extension.tiktok.internal.AppContext;
import app.onlynazril.extension.tiktok.ui.Tokens;
import app.onlynazril.extension.tiktok.ui.TweaksScreen;

import com.bytedance.ies.ugc.aweme.commercialize.compliance.personalization.AdPersonalizationActivity;

/**
 * Hosts the Tweaks screen in TikTok's ad-personalisation activity, reached from the Settings row.
 *
 * The screen is built directly into the activity instead of through a Fragment: the whole state
 * lives in shared preferences, so a recreate (rotation, process death) just rebuilds it, and there
 * is no fragment lifecycle or back stack to keep in step.
 */
@SuppressWarnings("unused")
public class TikTokActivityHook {
    private static final String ACTION = "morphe_settings";
    private static final String EXTRA = "morphe";

    public static boolean initialize(AdPersonalizationActivity base) {
        Intent intent = base.getIntent();
        if (!isOurs(intent)) return false;
        AppContext.set(base.getApplicationContext());

        ScrollView screen = new ScrollView(base);
        screen.setBackgroundColor(Tokens.BACKGROUND);
        screen.setFillViewport(true);
        screen.setOverScrollMode(ScrollView.OVER_SCROLL_NEVER);
        screen.addView(
                TweaksScreen.build(base),
                new ScrollView.LayoutParams(
                        ScrollView.LayoutParams.MATCH_PARENT,
                        ScrollView.LayoutParams.WRAP_CONTENT));
        padForSystemBars(screen);
        base.setContentView(screen);
        return true;
    }

    /**
     * Keeps the screen's content clear of the status and navigation bars.
     *
     * The app targets SDK 36, and from Android 15 the platform enforces edge to edge: the window
     * reaches under both bars whatever the activity asks for, so a plain `setContentView` puts the
     * title behind the clock and the last row behind the navigation bar.
     *
     * The insets are taken as padding rather than by asking the window to stop being edge to edge:
     * the background still reaches the edges, the content does not, and it works the same on a build
     * where the window is not edge to edge, because the bars report a zero inset there.
     */
    private static void padForSystemBars(View screen) {
        screen.setOnApplyWindowInsetsListener((view, insets) -> {
            int[] bars = systemBars(insets);
            view.setPadding(bars[0], bars[1], bars[2], bars[3]);
            return insets;
        });
        screen.requestApplyInsets();
    }

    /** Left, top, right and bottom of the status and navigation bars. */
    @SuppressWarnings("deprecation")
    private static int[] systemBars(WindowInsets insets) {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
            Insets bars = insets.getInsets(WindowInsets.Type.systemBars());
            return new int[] {bars.left, bars.top, bars.right, bars.bottom};
        }
        return new int[] {
                insets.getSystemWindowInsetLeft(),
                insets.getSystemWindowInsetTop(),
                insets.getSystemWindowInsetRight(),
                insets.getSystemWindowInsetBottom(),
        };
    }

    public static boolean handleBackPressed(AdPersonalizationActivity activity) {
        if (!isOurs(activity.getIntent())) return false;
        activity.finish();
        return true;
    }

    public static void open() {
        Context context = AppContext.get();
        if (context == null) return;
        Intent intent = new Intent(context, AdPersonalizationActivity.class);
        intent.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
        intent.setAction(ACTION);
        intent.putExtra(EXTRA, true);
        context.startActivity(intent);
    }

    private static boolean isOurs(Intent intent) {
        if (intent == null) return false;
        Bundle extras = intent.getExtras();
        return ACTION.equals(intent.getAction())
                || (extras != null && extras.getBoolean(EXTRA, false));
    }
}
