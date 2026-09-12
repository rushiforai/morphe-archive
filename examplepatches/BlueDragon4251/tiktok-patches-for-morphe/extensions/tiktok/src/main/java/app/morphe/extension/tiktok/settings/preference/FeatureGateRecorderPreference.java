package app.morphe.extension.tiktok.settings.preference;

import android.app.AlertDialog;
import android.content.ClipData;
import android.content.ClipboardManager;
import android.content.Context;
import android.preference.Preference;
import android.view.View;

import app.morphe.extension.tiktok.Utils;
import app.morphe.extension.tiktok.featuregatelab.FeatureGateLearnMode;

@SuppressWarnings("deprecation")
public final class FeatureGateRecorderPreference extends Preference {
    public FeatureGateRecorderPreference(Context context) {
        super(context);
        setTitle("Feature Gate Recorder (Learn mode)");
        refreshSummary();
        setOnPreferenceClickListener(preference -> {
            if (FeatureGateLearnMode.isRecording()) {
                showStopDialog(context);
            } else {
                showStartDialog(context);
            }
            return true;
        });
    }

    @Override
    protected void onBindView(View view) {
        refreshSummary();
        super.onBindView(view);
        Utils.setTitleAndSummaryColor(view);
    }

    private void showStartDialog(Context context) {
        new AlertDialog.Builder(context)
                .setTitle("Start Learn mode?")
                .setMessage(
                        "BlueIT takes a baseline of the currently observed feature gates. " +
                        "After starting, leave settings and use the TikTok feature you want to investigate. " +
                        "Then return here to copy only newly observed candidates."
                )
                .setNegativeButton(android.R.string.cancel, null)
                .setPositiveButton("Start", (dialog, which) -> {
                    FeatureGateLearnMode.begin();
                    refreshSummary();
                    notifyChanged();
                    app.morphe.extension.shared.Utils.showToastShort("BlueIT Learn mode started");
                })
                .show();
    }

    private void showStopDialog(Context context) {
        new AlertDialog.Builder(context)
                .setTitle("Learn mode is recording")
                .setMessage("Stop now and copy the candidate report, or cancel this recording without exporting it.")
                .setNegativeButton("Keep recording", null)
                .setNeutralButton("Discard", (dialog, which) -> {
                    FeatureGateLearnMode.cancel();
                    refreshSummary();
                    notifyChanged();
                })
                .setPositiveButton("Stop & copy", (dialog, which) -> {
                    String report = FeatureGateLearnMode.stopAndBuildReport();
                    ClipboardManager clipboard = (ClipboardManager) context.getSystemService(Context.CLIPBOARD_SERVICE);
                    if (clipboard != null) {
                        clipboard.setPrimaryClip(ClipData.newPlainText("BlueIT Feature Gate Learn Mode", report));
                    }
                    int candidates = FeatureGateLearnMode.lastCandidateCount();
                    refreshSummary();
                    notifyChanged();
                    app.morphe.extension.shared.Utils.showToastShort(
                            "Copied " + candidates + " feature-gate candidate(s)"
                    );
                })
                .show();
    }

    private void refreshSummary() {
        if (FeatureGateLearnMode.isRecording()) {
            setSummary("Recording. Use the target TikTok feature, then return here to stop and copy candidates.");
        } else {
            int previous = FeatureGateLearnMode.lastCandidateCount();
            if (previous > 0) {
                setSummary("Ready. Last recording found " + previous + " candidate(s).");
            } else {
                setSummary("Record newly observed SettingsManager and player-config candidates while using a TikTok feature.");
            }
        }
    }
}
