package app.waze.elevenlabs.extension;

import android.app.Activity;
import android.os.Bundle;

/**
 * Hosts the settings dialog in apps whose settings screens can't show it directly (Google Maps).
 * Translucent: only the dialog is visible, and closing it closes the activity.
 */
public final class ElevenLabsActivity extends Activity {
    private static final String MAPS_NOTE = "Maps reads each instruction with ElevenLabs as it prepares it. "
            + "If ElevenLabs is off, unreachable or fails, Maps uses its own voice.";

    @Override
    protected void onCreate(Bundle state) {
        super.onCreate(state);
        ElevenLabsBridge.initialize(this);
        ElevenLabsSettings.show(this, MAPS_NOTE, () -> MapsBridge.refreshSummary(this))
                .setOnDismissListener(dialog -> finish());
    }
}
