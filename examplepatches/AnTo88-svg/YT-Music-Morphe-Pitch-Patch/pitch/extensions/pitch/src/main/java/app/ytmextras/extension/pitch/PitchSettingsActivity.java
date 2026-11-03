package app.ytmextras.extension.pitch;

import android.app.Activity;
import android.os.Bundle;
import android.widget.Switch;

import java.util.Locale;

/**
 * Shows the switch of the pitch controls. Used by the Morphe settings and,
 * if the app does not have them, by the app settings.
 */
public final class PitchSettingsActivity extends Activity {

    private static boolean italian() {
        return "it".equals(Locale.getDefault().getLanguage());
    }

    static String title() {
        return italian() ? "Intonazione (pitch)" : "Pitch";
    }

    static String shareDescription() {
        return italian() ? "Condividi" : "Share";
    }

    static String shareUnavailable() {
        return italian() ? "Nessun brano da condividere" : "No track to share";
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        Switch toggle = new SettingsPage(this, title()).addSwitch(title());
        toggle.setChecked(PitchPatch.isEnabled());
        toggle.setOnCheckedChangeListener((view, checked) -> PitchPatch.setEnabled(this, checked));
    }
}
