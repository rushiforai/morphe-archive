/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 *
 * Built on icysymmetra/tiktok-patches-for-morphe (GPL-3.0).
 */
package app.morphe.extension.tiktok.settings.preference;

import app.morphe.extension.tiktok.settings.L10n;
import android.content.Context;
import android.preference.ListPreference;
import android.view.View;
import app.morphe.extension.shared.settings.StringSetting;

@SuppressWarnings("deprecation")
public final class ChoicePreference extends ListPreference {
    private final boolean needsRestart;

    public ChoicePreference(Context context, String title, StringSetting setting, String[] labels, String[] values) {
        super(context);
        needsRestart = setting.rebootApp;
        setTitle(title);
        setDialogTitle(title);
        setKey(setting.key);
        setEntries(labels);
        setEntryValues(values);
        setValue(setting.savedValue());
        showValue();
        // Left unset, the platform's own Cancel shows, in the phone's language rather than the
        // one the rest of the dialog is translated into.
        setNegativeButtonText(L10n.t(context, "Cancel"));
    }

    /**
     * The summary the row starts with, and takes back whenever the settings screen syncs it: a
     * "%s" that ListPreference fills with the label of the chosen value. A choice TikTok reads
     * only as it starts says so under the value, like every other restart-gated row. The note
     * is translated here, so it goes past the lookup.
     */
    void showValue() {
        super.setSummary(needsRestart
                ? "%s\n" + L10n.t(getContext(), TogglePreference.RESTART_SENTENCE) : "%s");
    }

    @Override protected void showDialog(android.os.Bundle state) {
        super.showDialog(state);
        SettingsUi.styleStandardAlertDialog((android.app.AlertDialog) getDialog());
    }

    @Override protected void onBindView(View view) {
        super.onBindView(view);
        app.morphe.extension.tiktok.Utils.setTitleAndSummaryColor(view);
    }

    @Override
    public void setTitle(CharSequence title) {
        super.setTitle(L10n.t(getContext(), title));
    }

    @Override
    public void setSummary(CharSequence summary) {
        super.setSummary(L10n.t(getContext(), summary));
    }

    @Override
    public void setDialogTitle(CharSequence title) {
        super.setDialogTitle(L10n.t(getContext(), title));
    }

    @Override
    public void setEntries(CharSequence[] entries) {
        CharSequence[] translated = new CharSequence[entries.length];
        for (int i = 0; i < entries.length; i++) {
            translated[i] = L10n.t(getContext(), entries[i]);
        }
        super.setEntries(translated);
    }
}
