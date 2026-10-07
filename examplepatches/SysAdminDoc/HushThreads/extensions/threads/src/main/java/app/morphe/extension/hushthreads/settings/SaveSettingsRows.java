/*
 * Forked from https://github.com/SysAdminDoc/HushGram at 539b646 (GPL-3.0),
 * modified for HushThreads (Threads), 2026.
 *
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.morphe.extension.hushthreads.settings;

import android.app.AlertDialog;
import android.app.Dialog;
import android.content.Context;
import android.graphics.Color;
import android.os.Bundle;
import android.os.Environment;
import android.preference.EditTextPreference;
import android.preference.ListPreference;
import android.preference.Preference;
import android.preference.PreferenceCategory;
import android.text.Editable;
import android.text.TextWatcher;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.view.WindowManager;
import android.widget.Button;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;

import androidx.annotation.Nullable;

import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import app.morphe.extension.hushthreads.download.DownloadQuality;
import app.morphe.extension.hushthreads.download.FileNameTemplate;
import app.morphe.extension.hushthreads.download.SaveControl;
import app.morphe.extension.hushthreads.download.SaveFolder;
import app.morphe.extension.hushthreads.download.SaveLeftovers;
import app.morphe.extension.hushthreads.download.SaveSettings;
import app.morphe.extension.shared.L10n;
import app.morphe.extension.shared.Utils;

/**
 * The Downloads section's rows that aren't plain switches: the quality, the folder and the video
 * file name a save uses, and a row for each save running now, with its Cancel. The settings page
 * builds the section ({@link HushThreadsPreferenceFragment}); the rows and their wording are here.
 */
final class SaveSettingsRows {
    private SaveSettingsRows() {
    }

    static QualityRow qualityRow(Context context) {
        QualityRow row = new QualityRow(context);
        row.setKey(SaveSettings.DOWNLOAD_QUALITY.key);
        row.setTitle(L10n.t("Download quality"));
        row.setDialogTitle(L10n.t("Download quality"));
        // A list's dialog keeps DialogPreference's Cancel, which Android fills in the activity's
        // language unless it's set here, as the folder and file name rows' are.
        row.setNegativeButtonText(L10n.t("Cancel"));
        DownloadQuality[] qualities = DownloadQuality.values();
        CharSequence[] entries = new CharSequence[qualities.length];
        CharSequence[] values = new CharSequence[qualities.length];
        for (int i = 0; i < qualities.length; i++) {
            entries[i] = qualityLabel(qualities[i]);
            values[i] = qualities[i].name();
        }
        row.setEntries(entries);
        row.setEntryValues(values);
        row.setValue(SaveSettings.DOWNLOAD_QUALITY.savedValue().name());
        return row;
    }

    /** What the list shows for [quality]: a word for the two ends, the label itself between them. */
    static String qualityLabel(DownloadQuality quality) {
        switch (quality) {
            case BEST:
                return L10n.t("Best");
            case SMALLEST:
                return L10n.t("Smallest");
            default:
                return L10n.isolate(quality.ceilingLabel());
        }
    }

    /**
     * What a save does with [quality], for the row's summary. A cap takes the best rendition at or
     * under it, and only a video with nothing that low goes above it ({@link DownloadQuality}), so
     * the sentence names both directions: "the closest quality" alone read as 1080p beating 240p
     * under a 720p cap, and the save picks 240p.
     */
    static String qualitySummary(DownloadQuality quality) {
        switch (quality) {
            case BEST:
                return L10n.t("Each video saves at the best quality the player streams.");
            case SMALLEST:
                return L10n.t("Each video saves at its lowest quality, for the smallest file.");
            default:
                return L10n.f("Each video saves at %1$s or the closest quality below it. A video with nothing "
                        + "that low saves at the closest quality above.", L10n.isolate(quality.ceilingLabel()));
        }
    }

    /**
     * The folder every save goes to. What's typed is cleaned before it's kept, so the row, the
     * setting and the next save all show the one folder name the save will use.
     */
    static FolderRow folderRow(Context context) {
        FolderRow row = new FolderRow(context);
        row.setKey(SaveSettings.SAVE_FOLDER.key);
        row.setTitle(L10n.t("Save folder"));
        row.setDialogTitle(L10n.t("Save folder"));
        row.setDialogMessage(L10n.f("Choose a folder name under Movies and Pictures. Invalid characters become "
                + "underscores. Leave it blank to use the default folder, %1$s.", L10n.isolate(SaveFolder.DEFAULT)));
        row.setPositiveButtonText(L10n.t("Save"));
        // Unset, Android fills in its own Cancel in the activity's language, which can differ
        // from Threads', and the dialog read "Speichern" next to "Cancel".
        row.setNegativeButtonText(L10n.t("Cancel"));
        EditText field = row.getEditText();
        field.setSingleLine(true);
        field.setHint(L10n.t("Folder name"));
        row.setText(SaveSettings.SAVE_FOLDER.savedValue());
        row.setOnPreferenceChangeListener((preference, typed) -> {
            String raw = typed == null ? "" : typed.toString();
            String clean = SaveFolder.sanitize(raw);
            if (clean.equals(raw)) return true;
            // Keeps the clean name in place of what was typed. The store changes, and the shared
            // page reads the setting from the row as it does for any change.
            ((FolderRow) preference).setText(clean);
            Utils.showToastShort(L10n.f("Folder set to %1$s.", L10n.isolate(clean)));
            return false;
        });
        return row;
    }

    /**
     * The name every saved video gets, next to the folder it goes to. What's typed is cleaned the
     * way the folder is, and held to the gallery's naming, so the row, the setting and the next
     * save all show the one template the save will use.
     */
    static FileNameRow fileNameRow(Context context) {
        FileNameRow row = new FileNameRow(context);
        row.setKey(SaveSettings.FILENAME_TEMPLATE.key);
        row.setTitle(L10n.t("Video file name"));
        row.setDialogTitle(L10n.t("Video file name"));
        row.setDialogMessage(L10n.f("%1$s becomes the date and time of the save, %2$s the video's number on "
                        + "Threads, %3$s who posted it and %4$s the day it was posted. What a save doesn't know is "
                        + "left out, and a name with none of these gets the date added. When the name is already in "
                        + "the folder, the time of the save goes on the end. Invalid characters become underscores. "
                        + "Leave it blank to use the default, %5$s.",
                L10n.isolate(FileNameTemplate.DATE), L10n.isolate(FileNameTemplate.VIDEO_ID),
                L10n.isolate(FileNameTemplate.OWNER), L10n.isolate(FileNameTemplate.POSTED),
                L10n.isolate(FileNameTemplate.DEFAULT)));
        row.setPositiveButtonText(L10n.t("Save"));
        // Android's own Cancel follows the activity's language, as the folder row's did.
        row.setNegativeButtonText(L10n.t("Cancel"));
        EditText field = row.getEditText();
        field.setSingleLine(true);
        field.setHint(L10n.t("File name"));
        row.setText(SaveSettings.FILENAME_TEMPLATE.savedValue());
        row.setOnPreferenceChangeListener((preference, typed) -> {
            String raw = typed == null ? "" : typed.toString();
            String clean = FileNameTemplate.sanitize(raw);
            if (clean.equals(raw)) return true;
            // Keeps the clean template in place of what was typed, as the folder row does.
            ((FileNameRow) preference).setText(clean);
            Utils.showToastShort(L10n.f("File name set to %1$s.", L10n.isolate(clean)));
            return false;
        });
        return row;
    }

    /**
     * "Videos are named TH_VID_{date}. Photos are always named TH_IMG_ followed by the date and
     * time." for [template]. The photo prefix is HushThreads', not Threads', so it isn't called
     * Threads' own naming.
     */
    static String fileNameSummary(String template) {
        return L10n.f("Videos are named %1$s. Photos are always named %2$s followed by the date and time.",
                L10n.isolate(template), L10n.isolate(FileNameTemplate.PHOTO_PREFIX));
    }

    /** "Videos go to Movies/Threads and photos to Pictures/Threads." for the folder [leaf]. */
    static String folderSummary(String leaf) {
        String videos = Environment.DIRECTORY_MOVIES + "/" + leaf;
        String photos = Environment.DIRECTORY_PICTURES + "/" + leaf;
        return L10n.f("Videos go to %1$s and photos to %2$s.", L10n.isolate(videos), L10n.isolate(photos));
    }

    /**
     * The saves listed in Downloads while the page shows: one row for each save running now, the
     * counts of the last post saved in several files, and how many saves Android stopped. The
     * notification was the only way to follow or stop a save, and with Threads' notifications or
     * the saves channel off there wasn't one. A row that stays is changed in place.
     */
    static final class Saves implements SaveControl.Watcher {
        private final PreferenceCategory group;
        @Nullable private HushThreadsPreferenceFragment.Row interruptedSaves;
        @Nullable private HushThreadsPreferenceFragment.Row lastCarouselSave;

        /** The rows of the saves running now, by save number. */
        private final Map<Integer, SaveRow> saveRows = new HashMap<>();

        Saves(PreferenceCategory group) {
            this.group = group;
        }

        /** The page is showing: follow the saves, and say once if Android stopped one. */
        void resume(Context context) {
            SaveControl.watch(this);
            SaveLeftovers.showInterrupted(context);
            show();
        }

        /** The page is hidden. Its rows catch up when it shows again. */
        void pause() {
            SaveControl.unwatch(this);
        }

        /** Saves tell the page from their own thread. */
        @Override
        public void savesChanged() {
            Utils.runOnMainThread(this::show);
        }

        void show() {
            int stopped = SaveLeftovers.interruptedCount();
            if (stopped > 0 && interruptedSaves == null) {
                interruptedSaves = new HushThreadsPreferenceFragment.Row(group.getContext());
                interruptedSaves.setKey("hushthreads_interrupted_saves");
                interruptedSaves.setPersistent(false);
                interruptedSaves.setSelectable(false);
                interruptedSaves.setOrder(Integer.MIN_VALUE / 2 - 1);
                interruptedSaves.setTitle(L10n.quantity(stopped,
                        "A save was interrupted", "%1$d saves were interrupted", stopped));
                interruptedSaves.setSummary(L10n.t("Reopen the post and save again."));
                group.addPreference(interruptedSaves);
            }
            String outcome = SaveControl.batchOutcome();
            if (outcome != null) {
                if (lastCarouselSave == null) {
                    lastCarouselSave = new HushThreadsPreferenceFragment.Row(group.getContext());
                    lastCarouselSave.setKey("hushthreads_last_carousel_save");
                    lastCarouselSave.setPersistent(false);
                    lastCarouselSave.setSelectable(false);
                    lastCarouselSave.setOrder(Integer.MIN_VALUE / 4);
                    lastCarouselSave.setTitle(L10n.t("Last carousel save"));
                }
                lastCarouselSave.setSummary(outcome);
                if (group.findPreference(lastCarouselSave.getKey()) == null) group.addPreference(lastCarouselSave);
            } else if (lastCarouselSave != null && group.findPreference(lastCarouselSave.getKey()) != null) {
                group.removePreference(lastCarouselSave);
            }
            List<SaveControl.Running> running = SaveControl.running();
            Set<Integer> now = new HashSet<>();
            for (SaveControl.Running save : running) now.add(save.id);
            for (Iterator<Map.Entry<Integer, SaveRow>> rows = saveRows.entrySet().iterator(); rows.hasNext(); ) {
                Map.Entry<Integer, SaveRow> row = rows.next();
                if (now.contains(row.getKey())) continue;
                group.removePreference(row.getValue());
                rows.remove();
            }
            for (SaveControl.Running save : running) {
                SaveRow row = saveRows.get(save.id);
                if (row != null) {
                    row.show(save);
                    continue;
                }
                row = new SaveRow(group.getContext(), save);
                saveRows.put(save.id, row);
                group.addPreference(row);
            }
        }
    }

    /**
     * A running save: what it is, what it's doing, how far it has got, and a Cancel button. Its text
     * changes in place: a row rebuilt under a finger loses the tap on its button.
     */
    static final class SaveRow extends Preference {
        /** Before every setting of the section, oldest save first. */
        private static final int FIRST = Integer.MIN_VALUE / 2;

        final int id;
        private final String cancelDescription;
        private String status;
        @Nullable
        private View bound;

        SaveRow(Context context, SaveControl.Running save) {
            super(context);
            id = save.id;
            cancelDescription = SaveControl.cancelDescription(save);
            status = SaveControl.status(save);
            setKey("running_save_" + save.id);
            setPersistent(false);
            setSelectable(false);
            setOrder(FIRST + save.id);
            setTitle(SaveControl.title(save));
        }

        @Override
        public CharSequence getSummary() {
            return status;
        }

        void show(SaveControl.Running save) {
            String next = SaveControl.status(save);
            if (next.equals(status)) return;
            status = next;
            TextView summary = bound == null ? null : bound.findViewById(android.R.id.summary);
            if (summary != null) summary.setText(next);
        }

        @Override
        protected void onBindView(View view) {
            super.onBindView(view);
            bound = view;
            HushThreadsPreferenceFragment.showAllText(view);
            ScreenColors.row(view, this);
            ViewGroup frame = view.findViewById(android.R.id.widget_frame);
            if (frame == null) return;
            frame.removeAllViews();
            Button cancel = new Button(getContext());
            cancel.setText(L10n.t("Cancel"));
            // Two saves can be listed at once, so the button says whose it is.
            cancel.setContentDescription(cancelDescription);
            cancel.setAllCaps(false);
            cancel.setTextSize(14);
            cancel.setTextColor(ScreenColors.DEFAULT.heading);
            cancel.setBackgroundColor(Color.TRANSPARENT);
            int touch = Math.round(48 * view.getResources().getDisplayMetrics().density);
            cancel.setMinWidth(touch);
            cancel.setMinimumWidth(touch);
            cancel.setMinHeight(touch);
            cancel.setMinimumHeight(touch);
            cancel.setPadding(touch / 4, 0, touch / 4, 0);
            cancel.setOnClickListener(ignored -> {
                cancel.setEnabled(false);
                SaveControl.cancel(id);
            });
            frame.addView(cancel, new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT));
            frame.setVisibility(View.VISIBLE);
        }
    }

    /**
     * An edit dialog shrinks to fit above the keyboard instead of going under it. Android's own
     * EditTextPreference only asks for the keyboard, so at a large font size a long message pushed
     * the dialog's Save and Cancel behind the keyboard, where nobody could reach them. The dialog's
     * keyboard state is kept; only how it adjusts changes.
     */
    static void fitAboveKeyboard(Dialog dialog) {
        Window window = dialog == null ? null : dialog.getWindow();
        if (window == null) return;
        int mode = window.getAttributes().softInputMode;
        window.setSoftInputMode((mode & ~WindowManager.LayoutParams.SOFT_INPUT_MASK_ADJUST)
                | WindowManager.LayoutParams.SOFT_INPUT_ADJUST_RESIZE);
    }

    /**
     * The save folder's row. Its summary follows its text, whoever sets it: the person, the shared
     * page syncing it from the setting, or an import.
     */
    static final class FolderRow extends EditTextPreference {
        FolderRow(Context context) {
            super(context);
        }

        @Override
        public void setText(String text) {
            super.setText(text);
            setSummary(folderSummary(SaveFolder.sanitize(text)));
        }

        @Override
        protected void onBindView(View view) {
            super.onBindView(view);
            HushThreadsPreferenceFragment.showAllText(view);
            ScreenColors.row(view, this);
            view.setAccessibilityDelegate(new HushThreadsPreferenceFragment.RowSemantics(this, Button.class));
        }

        /** Its edit dialog takes the screen's colours, as the other rows' dialogs do. */
        @Override
        protected void showDialog(Bundle state) {
            super.showDialog(state);
            if (getDialog() instanceof AlertDialog) ScreenColors.dialog((AlertDialog) getDialog());
            fitAboveKeyboard(getDialog());
        }
    }

    /**
     * The video file name's row. Its summary follows its text, whoever sets it: the person, the
     * shared page syncing it from the setting, or an import. Its dialog shows what the typed
     * template names a video, as it's typed.
     */
    static final class FileNameRow extends EditTextPreference {
        @Nullable private TextView preview;
        private Date previewDate;

        FileNameRow(Context context) {
            super(context);
            getEditText().addTextChangedListener(new TextWatcher() {
                @Override public void beforeTextChanged(CharSequence text, int start, int count, int after) { }
                @Override public void onTextChanged(CharSequence text, int start, int before, int count) {
                    if (preview != null) preview.setText(previewName(text.toString(), previewDate));
                }
                @Override public void afterTextChanged(Editable text) { }
            });
        }

        static String previewName(String text, Date when) {
            return FileNameTemplate.videoName(FileNameTemplate.sanitize(text), when, "123456") + ".mp4";
        }

        @Override protected View onCreateDialogView() {
            Context context = getContext();
            ScreenColors colors = ScreenColors.DEFAULT;
            int pad = Math.round(20 * context.getResources().getDisplayMetrics().density);
            LinearLayout content = new LinearLayout(context);
            content.setOrientation(LinearLayout.VERTICAL);
            content.setPadding(pad, pad / 2, pad, pad);
            EditText field = getEditText();
            if (field.getParent() instanceof ViewGroup) ((ViewGroup) field.getParent()).removeView(field);
            content.addView(field, new LinearLayout.LayoutParams(-1, -2));
            TextView label = new TextView(context);
            label.setText(L10n.t("Example without post details"));
            label.setTextSize(12);
            label.setTextColor(colors.summary);
            label.setPadding(0, pad, 0, pad / 4);
            content.addView(label);
            previewDate = new Date();
            preview = new TextView(context);
            preview.setTextSize(14);
            preview.setTextColor(colors.title);
            preview.setText(previewName(getText(), previewDate));
            content.addView(preview);
            TextView help = new TextView(context);
            help.setId(android.R.id.message);
            help.setText(getDialogMessage());
            help.setTextSize(14);
            help.setTextColor(colors.summary);
            help.setPadding(0, pad, 0, 0);
            content.addView(help);
            ScrollView scroll = new ScrollView(context);
            scroll.addView(content);
            return scroll;
        }

        @Override protected void onBindDialogView(View view) {
            // The input is already in the custom scroll container, before its explanatory text.
            getEditText().setText(getText());
        }

        @Override protected void onDialogClosed(boolean positive) {
            super.onDialogClosed(positive);
            preview = null;
        }

        @Override
        public void setText(String text) {
            super.setText(text);
            setSummary(fileNameSummary(FileNameTemplate.sanitize(text)));
        }

        @Override
        protected void onBindView(View view) {
            super.onBindView(view);
            HushThreadsPreferenceFragment.showAllText(view);
            ScreenColors.row(view, this);
            view.setAccessibilityDelegate(new HushThreadsPreferenceFragment.RowSemantics(this, Button.class));
        }

        /** Its edit dialog takes the screen's colours, as the folder's does. */
        @Override
        protected void showDialog(Bundle state) {
            super.showDialog(state);
            if (getDialog() instanceof AlertDialog) ScreenColors.dialog((AlertDialog) getDialog());
            fitAboveKeyboard(getDialog());
        }
    }

    /**
     * The download quality's row. Its summary follows its value, whoever sets it: the person, the
     * shared page syncing it from the setting, or an import.
     */
    static final class QualityRow extends ListPreference {
        QualityRow(Context context) {
            super(context);
        }

        @Override
        public void setValue(String value) {
            super.setValue(value);
            showSummary();
        }

        void showSummary() {
            DownloadQuality quality = DownloadQuality.BEST;
            for (DownloadQuality candidate : DownloadQuality.values()) {
                if (candidate.name().equals(getValue())) quality = candidate;
            }
            setSummary(qualitySummary(quality));
        }

        @Override
        protected void onBindView(View view) {
            super.onBindView(view);
            HushThreadsPreferenceFragment.showAllText(view);
            ScreenColors.row(view, this);
            view.setAccessibilityDelegate(new HushThreadsPreferenceFragment.RowSemantics(this, Button.class));
        }

        /** Its list takes the screen's colours, as the other rows' dialogs do. */
        @Override
        protected void showDialog(Bundle state) {
            super.showDialog(state);
            if (getDialog() instanceof AlertDialog) ScreenColors.dialog((AlertDialog) getDialog());
        }
    }
}
