package app.morphe.extension.tiktok.settings.preference;

import android.app.AlertDialog;
import android.content.Context;
import android.preference.Preference;
import android.view.View;

import app.morphe.extension.tiktok.Utils;

@SuppressWarnings("deprecation")
public class BlueITCreditsPreference extends Preference {
    public BlueITCreditsPreference(Context context) {
        super(context);
        setTitle("Credits");
        setSummary("BlueIT Service and the upstream projects this patch source builds on.");
        setOnPreferenceClickListener(preference -> {
            new AlertDialog.Builder(context)
                    .setTitle("Credits")
                    .setMessage(
                            "BlueIT Service\n\n" +
                            "Built and maintained as a BlueIT TikTok patch source for Morphe.\n\n" +
                            "Based on earlier TikTok patch work from icysymmetra, ReVanced, " +
                            "RookieEnough/De-Vanced and their contributors.\n\n" +
                            "Morphe provides the patching framework/runtime.\n\n" +
                            "Not affiliated with TikTok or ByteDance."
                    )
                    .setPositiveButton(android.R.string.ok, null)
                    .show();
            return true;
        });
    }

    @Override
    protected void onBindView(View view) {
        super.onBindView(view);
        Utils.setTitleAndSummaryColor(view);
    }
}
