package app.onlynazril.extension.tiktokHandle.settings;

import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.widget.ScrollView;

import app.onlynazril.extension.tiktokHandle.internal.AppContext;
import app.onlynazril.extension.tiktokHandle.ui.Tokens;
import app.onlynazril.extension.tiktokHandle.ui.TweaksScreen;

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
        base.setContentView(screen);
        return true;
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
