package app.czyeru.extension.tiktok.settings.preference;

import android.app.AlertDialog;
import android.content.Context;
import android.preference.Preference;
import android.view.View;

import app.czyeru.extension.shared.settings.StringSetting;

/** One value out of a fixed list, saved to a StringSetting. After Hushfeed's ChoicePreference. */
@SuppressWarnings("deprecation")
public final class ChoicePreference extends Preference {
    private final StringSetting setting;
    private final String[] labels;
    private final String[] values;

    public ChoicePreference(Context context, String title, StringSetting setting, String[] labels, String[] values) {
        super(context);
        this.setting = setting;
        this.labels = labels;
        this.values = values;
        setPersistent(false);
        setTitle(title);
        refreshSummary();
    }

    private int selected() {
        String current = setting.get();
        for (int index = 0; index < values.length; index++) {
            if (values[index].equals(current)) return index;
        }
        return 0;
    }

    @Override
    protected void onClick() {
        AlertDialog dialog = new AlertDialog.Builder(getContext())
                .setTitle(getTitle())
                .setSingleChoiceItems(labels, selected(), (dialogInterface, which) -> {
                    if (which >= 0 && which < values.length) {
                        setting.save(values[which]);
                        refreshSummary();
                    }
                    dialogInterface.dismiss();
                })
                .setNegativeButton(android.R.string.cancel, null)
                .create();
        dialog.show();
        SettingsUi.styleStandardAlertDialog(dialog);
    }

    @Override
    protected void onBindView(View view) {
        super.onBindView(view);
        app.czyeru.extension.tiktok.Utils.setTitleAndSummaryColor(view);
    }

    private void refreshSummary() {
        setSummary(labels[selected()]);
    }
}
