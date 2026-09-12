package app.morphe.extension.tiktok.settings.preference;

import android.app.AlertDialog;
import android.content.Context;
import android.preference.Preference;
import android.view.View;

import app.morphe.extension.tiktok.Utils;
import app.morphe.extension.tiktok.seen.SeenVideoHistory;

@SuppressWarnings("deprecation")
public final class ClearSeenVideoHistoryPreference extends Preference {
    public ClearSeenVideoHistoryPreference(Context context) {
        super(context);
        setTitle("Clear seen-video history");
        setSummary("Delete BlueIT's local list of previously watched video ids.");
        setOnPreferenceClickListener(preference -> {
            new AlertDialog.Builder(context)
                    .setTitle("Clear seen-video history?")
                    .setMessage("This only deletes BlueIT's local history. TikTok account history is not changed.")
                    .setNegativeButton(android.R.string.cancel, null)
                    .setPositiveButton("Clear", (dialog, which) -> {
                        SeenVideoHistory.clear();
                        app.morphe.extension.shared.Utils.showToastShort("Seen-video history cleared");
                    })
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
