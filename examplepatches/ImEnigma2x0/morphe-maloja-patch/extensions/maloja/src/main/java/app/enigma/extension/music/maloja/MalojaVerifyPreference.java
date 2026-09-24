package app.enigma.extension.music.maloja;

import static app.morphe.extension.shared.StringRef.str;

import android.content.Context;
import android.preference.Preference;
import android.util.AttributeSet;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;

/**
 * Preference that checks the configured server URL and API key against the Maloja server.
 */
@SuppressWarnings({"unused", "deprecation"})
public class MalojaVerifyPreference extends Preference {

    public MalojaVerifyPreference(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
        super(context, attrs, defStyleAttr, defStyleRes);
        init();
    }

    public MalojaVerifyPreference(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        init();
    }

    public MalojaVerifyPreference(Context context, AttributeSet attrs) {
        super(context, attrs);
        init();
    }

    public MalojaVerifyPreference(Context context) {
        super(context);
        init();
    }

    private void init() {
        setSelectable(true);
        setPersistent(false);
        updateSummary();
    }

    private void updateSummary() {
        setSummary(str(MalojaSettings.isConfigured()
                ? "morphe_maloja_verify_summary_ready"
                : "morphe_maloja_verify_summary_missing"));
    }

    @Override
    protected void onClick() {
        updateSummary();
        if (!MalojaSettings.isConfigured()) {
            Utils.showToastShort(str("morphe_maloja_verify_summary_missing"));
            return;
        }

        final String serverUrl = MalojaSettings.SERVER_URL.get();
        final String apiKey = MalojaSettings.API_KEY.get();
        Utils.showToastShort(str("morphe_maloja_verify_toast_checking"));

        Utils.runOnBackgroundThread(() -> {
            try {
                Maloja.TokenValidation validation = Maloja.validateToken(serverUrl, apiKey);
                if (validation.valid) {
                    Utils.showToastLong(str("morphe_maloja_verify_toast_valid", validation.userName));
                } else {
                    Utils.showToastLong(str("morphe_maloja_verify_toast_invalid", validation.message));
                }
            } catch (Exception ex) {
                Logger.printDebug(() -> "Maloja verification failed", ex);
                Utils.showToastLong(str("morphe_maloja_verify_toast_failed", ex.getMessage()));
            }
        });
    }
}
