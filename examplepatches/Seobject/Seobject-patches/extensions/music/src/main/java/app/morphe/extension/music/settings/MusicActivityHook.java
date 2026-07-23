package app.morphe.extension.music.settings;

import android.app.Activity;
import android.graphics.PorterDuff;
import android.graphics.drawable.Drawable;
import android.preference.PreferenceFragment;
import android.view.View;

import app.morphe.extension.music.patches.pinplaylist.PinPlaylistSettings;
import app.morphe.extension.music.settings.preference.MusicPreferenceFragment;
import app.morphe.extension.shared.ResourceType;
import app.morphe.extension.shared.ResourceUtils;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.settings.BaseActivityHook;

/** Minimal settings activity hook for the standalone Pin playlists bundle. */
@SuppressWarnings({"deprecation", "RedundantSuppression"})
public class MusicActivityHook extends BaseActivityHook {
    @SuppressWarnings("unused")
    public static void initialize(Activity parentActivity) {
        if (Utils.isFastClick()) {
            parentActivity.finish();
            return;
        }

        // Ensure both standalone settings are registered before the UI is inflated.
        PinPlaylistSettings.ENABLED.get();
        PinPlaylistSettings.SEPARATE_MENU_ITEM.get();
        Utils.setIsDarkModeEnabled(true);
        BaseActivityHook.initialize(new MusicActivityHook(), parentActivity);
    }

    @Override
    protected void customizeActivityTheme(Activity activity) {
        activity.setTheme(ResourceUtils.getIdentifierOrThrow(
                ResourceType.STYLE,
                "Theme.Morphe.YouTubeMusic.Settings"
        ));
    }

    @Override
    protected int getToolbarBackgroundColor() {
        return ResourceUtils.getColor("ytm_color_black");
    }

    @Override
    protected Drawable getNavigationIcon() {
        Drawable navigationIcon = MusicPreferenceFragment.getBackButtonDrawable();
        if (android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.Q) {
            navigationIcon.setColorFilter(new android.graphics.BlendModeColorFilter(
                    Utils.getAppForegroundColor(),
                    android.graphics.BlendMode.SRC_IN
            ));
        } else {
            navigationIcon.setColorFilter(
                    Utils.getAppForegroundColor(),
                    PorterDuff.Mode.SRC_IN
            );
        }
        return navigationIcon;
    }

    @Override
    protected View.OnClickListener getNavigationClickListener(Activity activity) {
        return view -> activity.finish();
    }

    @Override
    protected PreferenceFragment createPreferenceFragment() {
        return new MusicPreferenceFragment();
    }

    @SuppressWarnings("unused")
    public static boolean handleFinish() {
        return false;
    }
}
