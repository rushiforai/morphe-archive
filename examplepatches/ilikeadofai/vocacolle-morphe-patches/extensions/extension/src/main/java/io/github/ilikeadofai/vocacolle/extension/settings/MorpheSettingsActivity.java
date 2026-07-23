package io.github.ilikeadofai.vocacolle.extension.settings;

import android.annotation.SuppressLint;
import android.app.Activity;
import android.app.Fragment;
import android.content.Context;
import android.content.Intent;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import java.util.Locale;

/** Initializes Morphe settings inside VocaColle's existing license Activity. */
@SuppressWarnings({"deprecation", "unused"})
public final class MorpheSettingsActivity {
    private static final String HOST_ACTIVITY =
            "com.google.android.gms.oss.licenses.OssLicensesMenuActivity";
    private static final String EXTRA_MORPHE_SETTINGS =
            "io.github.ilikeadofai.vocacolle.extra.MORPHE_SETTINGS";
    private static final String FRAGMENT_TAG = "morphe_settings";
    private static final int CONTENT_VIEW_ID = 0x6d6f7270;

    private MorpheSettingsActivity() {
    }

    public static Intent createIntent(Context context) {
        Intent intent = new Intent();
        intent.setClassName(context.getPackageName(), HOST_ACTIVITY);
        intent.putExtra(EXTRA_MORPHE_SETTINGS, true);
        return intent;
    }

    public static boolean initialize(Activity activity) {
        Intent intent = activity.getIntent();
        if (intent == null || !intent.getBooleanExtra(EXTRA_MORPHE_SETTINGS, false)) {
            return false;
        }

        SettingsStore settingsStore = SettingsStore.from(activity);
        MorpheSettingsStrings strings = MorpheSettingsStrings.resolve(
                settingsStore.getDisplayLanguage(),
                Locale.getDefault().getLanguage()
        );
        activity.setTitle(strings.settingsTitle);
        hideHostActionBar(activity);
        MorpheSettingsTheme.applySystemBars(activity, MorpheSettingsTheme.resolve(activity));

        FrameLayout content = new FrameLayout(activity);
        content.setId(CONTENT_VIEW_ID);
        content.setLayoutParams(new ViewGroup.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.MATCH_PARENT
        ));
        activity.setContentView(content);

        Fragment existing = activity.getFragmentManager().findFragmentByTag(FRAGMENT_TAG);
        if (existing == null) {
            activity.getFragmentManager()
                    .beginTransaction()
                    .replace(CONTENT_VIEW_ID, new MorpheSettingsFragment(), FRAGMENT_TAG)
                    .commit();
        }
        return true;
    }

    @SuppressLint("DiscouragedApi")
    private static void hideHostActionBar(Activity activity) {
        int actionBarContainerId = activity.getResources().getIdentifier(
                "action_bar_container",
                "id",
                activity.getPackageName()
        );
        if (actionBarContainerId == 0) {
            return;
        }
        View actionBarContainer = activity.findViewById(actionBarContainerId);
        if (actionBarContainer != null) {
            actionBarContainer.setVisibility(View.GONE);
        }
    }
}
