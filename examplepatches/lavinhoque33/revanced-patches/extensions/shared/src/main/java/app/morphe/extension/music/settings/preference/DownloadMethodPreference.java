/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-11.
 */

package app.morphe.extension.music.settings.preference;

import static app.morphe.extension.shared.utils.StringRef.str;

import android.app.Dialog;
import android.content.Context;
import android.os.Bundle;
import android.util.AttributeSet;
import android.util.Pair;
import android.view.Window;
import android.widget.LinearLayout;
import android.widget.ListView;

import app.morphe.extension.shared.settings.preference.CustomDialogListPreference;
import app.morphe.extension.shared.settings.preference.NewSettingsIndicator;
import app.morphe.extension.shared.ui.CustomDialog;

/** Keeps method selection compact, with the full explanations in a separate, read-only dialog. */
@SuppressWarnings({"unused", "deprecation"})
public class DownloadMethodPreference extends CustomDialogListPreference {

    public DownloadMethodPreference(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
        super(context, attrs, defStyleAttr, defStyleRes);
    }

    public DownloadMethodPreference(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
    }

    public DownloadMethodPreference(Context context, AttributeSet attrs) {
        super(context, attrs);
    }

    public DownloadMethodPreference(Context context) {
        super(context);
    }

    @Override
    protected void showDialog(Bundle state) {
        Context context = getContext();
        CharSequence[] entries = getEntriesForDialog();
        CharSequence[] entryValues = getEntryValues();

        ListView listView = new ListView(context);
        listView.setId(android.R.id.list);
        listView.setChoiceMode(ListView.CHOICE_MODE_SINGLE);
        listView.setDividerHeight(0);
        listView.setAdapter(new ListPreferenceArrayAdapter(
                context, LAYOUT_REVANCED_CUSTOM_LIST_ITEM_CHECKED, entries, entryValues, getValue()));

        int selectedIndex = findIndexOfValue(getValue());
        if (selectedIndex >= 0) {
            listView.setItemChecked(selectedIndex, true);
        }

        Pair<Dialog, LinearLayout> dialogPair = CustomDialog.create(
                context,
                getTitle() != null ? getTitle().toString() : "",
                null,
                null,
                null,
                null,
                () -> {},
                str("morphe_music_download_method_info"),
                this::showMethodInfo,
                false
        );

        Dialog dialog = dialogPair.first;
        dialog.setOnDismissListener(ignored -> clearHighlightedEntriesForDialog());

        LinearLayout mainLayout = dialogPair.second;
        mainLayout.addView(listView, mainLayout.getChildCount() - 1, new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.MATCH_PARENT, 0, 1.0f));

        listView.setOnItemClickListener((parent, view, position, id) -> {
            String selectedValue = entryValues[position].toString();
            if (callChangeListener(selectedValue)) {
                setValue(selectedValue);
                setSummary(getEntry());
            }
            dialog.dismiss();
        });

        dialog.show();
        useAvailableWidth(dialog);
        NewSettingsIndicator.watchVisibleEntries(listView, this, entries, entryValues);
    }

    /** Landscape has room for the full labels without making the three rows taller. */
    private void useAvailableWidth(Dialog dialog) {
        Window window = dialog.getWindow();
        if (window != null) {
            int width = (int) (getContext().getResources().getDisplayMetrics().widthPixels * 0.9f);
            window.setLayout(width, LinearLayout.LayoutParams.WRAP_CONTENT);
        }
    }

    private void showMethodInfo() {
        String message = str("morphe_music_download_method_entry_stream") + "\n"
                + str("morphe_music_download_method_help_stream") + "\n\n"
                + str("morphe_music_download_method_entry_device_files") + "\n"
                + str("morphe_music_download_method_help_device_files") + "\n\n"
                + str("morphe_music_download_method_entry_delegated") + "\n"
                + str("morphe_music_download_method_help_delegated");

        CustomDialog.create(
                getContext(),
                str("morphe_music_download_method_info_title"),
                message,
                null,
                null,
                () -> {},
                null,
                null,
                null,
                false
        ).first.show();
    }
}
