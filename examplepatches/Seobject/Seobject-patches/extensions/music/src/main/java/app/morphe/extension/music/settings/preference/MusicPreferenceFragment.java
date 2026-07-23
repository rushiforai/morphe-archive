package app.morphe.extension.music.settings.preference;

import android.app.Dialog;
import android.widget.Toolbar;

import app.morphe.extension.music.settings.MusicActivityHook;
import app.morphe.extension.shared.settings.preference.ToolbarPreferenceFragment;

/** Minimal preference fragment for the standalone Pin playlists settings. */
@SuppressWarnings("deprecation")
public class MusicPreferenceFragment extends ToolbarPreferenceFragment {
    @Override
    protected void initialize() {
        super.initialize();
        sortPreferenceGroups(getPreferenceScreen());
        setPreferenceScreenToolbar(getPreferenceScreen());
    }

    @Override
    protected void customizeToolbar(Toolbar toolbar) {
        MusicActivityHook.setToolbarLayoutParams(toolbar);
    }

    @Override
    protected void onPostToolbarSetup(Toolbar toolbar, Dialog preferenceScreenDialog) {
        // No search or unrelated preference controllers in the pin-only build.
    }
}
