/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 *
 * Built on SysAdminDoc/hushfeed (GPL-3.0).
 */
package app.morphe.extension.facebook.settings;

import static app.morphe.extension.facebook.settings.HushfacebookPreferenceFragment.commentOrderSummary;
import static app.morphe.extension.facebook.settings.HushfacebookPreferenceFragment.downloadActionSummary;
import static app.morphe.extension.facebook.settings.HushfacebookPreferenceFragment.feedsSubtabSummary;
import static app.morphe.extension.facebook.settings.HushfacebookPreferenceFragment.fileNameSummary;
import static app.morphe.extension.facebook.settings.HushfacebookPreferenceFragment.fitAboveKeyboard;
import static app.morphe.extension.facebook.settings.HushfacebookPreferenceFragment.folderSummary;
import static app.morphe.extension.facebook.settings.HushfacebookPreferenceFragment.playbackQualitySummary;
import static app.morphe.extension.facebook.settings.HushfacebookPreferenceFragment.qualitySummary;
import static app.morphe.extension.facebook.settings.HushfacebookPreferenceFragment.saveToSummary;
import static app.morphe.extension.facebook.settings.HushfacebookPreferenceFragment.sendAppSummary;
import static app.morphe.extension.facebook.settings.HushfacebookPreferenceFragment.showAllText;
import static app.morphe.extension.facebook.settings.HushfacebookPreferenceFragment.startTabSummary;
import static app.morphe.extension.facebook.settings.HushfacebookPreferenceFragment.wordsEditorLine;
import static app.morphe.extension.facebook.settings.HushfacebookPreferenceFragment.wordsRefusal;
import static app.morphe.extension.facebook.settings.HushfacebookPreferenceFragment.wordsSummary;

import android.app.AlertDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.preference.EditTextPreference;
import android.preference.ListPreference;
import android.view.View;
import android.widget.Button;
import android.widget.ScrollView;
import android.widget.TextView;

import androidx.annotation.Nullable;

import java.util.function.Consumer;

import app.morphe.extension.facebook.comments.CommentOrder;
import app.morphe.extension.facebook.download.DownloadQuality;
import app.morphe.extension.facebook.download.FileNameTemplate;
import app.morphe.extension.facebook.download.SaveFolder;
import app.morphe.extension.facebook.download.SaveTo;
import app.morphe.extension.facebook.download.SendLink;
import app.morphe.extension.facebook.feed.PostWords;
import app.morphe.extension.facebook.media.PlaybackQuality;
import app.morphe.extension.facebook.navigation.FeedsSubtab;
import app.morphe.extension.facebook.navigation.StartTab;
import app.morphe.extension.facebook.settings.SettingsRows.RowSemantics;
import app.morphe.extension.shared.L10n;

/**
 * The rows that edit a value: the text rows, whose dialogs fit above the keyboard, and the lists,
 * each known by this class's name, as {@code ValueRows.FolderRow}. Each row's builder and summary
 * are the page's, such as {@link HushfacebookPreferenceFragment#qualityRow} and
 * {@link HushfacebookPreferenceFragment#qualitySummary}.
 */
@SuppressWarnings("deprecation")
final class ValueRows {
    private ValueRows() { }

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
            showAllText(view);
            ScreenColors.row(view, this);
            view.setAccessibilityDelegate(new RowSemantics(this, Button.class));
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
     * A word list's row. Its summary follows its text, whoever sets it: the person, the shared page
     * syncing it from the setting, or an import. Its dialog says, as the list is typed, how full the
     * room the two lists share would be, and Save refuses a list that doesn't fit with the dialog
     * still open, so nothing typed is cut or lost (#58).
     */
    static final class WordsRow extends EditTextPreference {
        final boolean hides;
        /** Says why Save was refused. The page sets it, since its dialogs close with it. */
        @Nullable Consumer<String> refused;
        @Nullable private TextView count;
        /** The other list's share of the room, read when the dialog opens. */
        private int otherBytes;

        WordsRow(Context context, boolean hides) {
            super(context);
            this.hides = hides;
            getEditText().addTextChangedListener(new android.text.TextWatcher() {
                @Override public void beforeTextChanged(CharSequence text, int start, int count, int after) { }
                @Override public void onTextChanged(CharSequence text, int start, int before, int after) {
                    if (count != null) count.setText(wordsEditorLine(PostWords.size(text.toString(), otherBytes)));
                }
                @Override public void afterTextChanged(android.text.Editable text) { }
            });
        }

        @Override
        public void setText(String text) {
            super.setText(text);
            setSummary(wordsSummary(text, hides));
        }

        @Override
        protected void onBindView(View view) {
            super.onBindView(view);
            showAllText(view);
            ScreenColors.row(view, this);
            view.setAccessibilityDelegate(new RowSemantics(this, Button.class));
        }

        /**
         * The explanation, then the whole list, in one scroll, as the file name's dialog has it. The
         * list grows with its lines rather than scrolling inside itself, so with the keyboard open
         * and the dialog shrunk above it, the first and last lines and the caret are all a scroll
         * away, and Save and Cancel stay below.
         */
        @Override protected View onCreateDialogView() {
            Context context = getContext();
            ScreenColors colors = ScreenColors.shown == null ? ScreenColors.DEFAULT : ScreenColors.shown;
            TextView help = new TextView(context);
            help.setId(android.R.id.message);
            help.setText(getDialogMessage());
            help.setTextSize(14);
            help.setTextColor(colors.summary);
            help.setPadding(0, 0, 0, Math.round(10 * context.getResources().getDisplayMetrics().density));
            count = new TextView(context);
            count.setTextSize(14);
            count.setTextColor(colors.summary);
            count.setAccessibilityLiveRegion(View.ACCESSIBILITY_LIVE_REGION_POLITE);
            return scrollingBody(context, help, count, getEditText());
        }

        @Override protected void onBindDialogView(View view) {
            // The input is already in the scroll, after its explanation.
            getEditText().setText(getText());
        }

        @Override protected void onDialogClosed(boolean positive) {
            super.onDialogClosed(positive);
            count = null;
        }

        /** Its edit dialog takes the screen's colours, as the folder's does. */
        @Override
        protected void showDialog(Bundle state) {
            // Before the dialog binds the list, which the count line measures against it.
            otherBytes = PostWords.encodedBytes(PostWords.clean((hides ? Settings.KEPT_WORDS : Settings.HIDDEN_WORDS).savedValue()));
            super.showDialog(state);
            if (getDialog() instanceof AlertDialog) {
                AlertDialog dialog = (AlertDialog) getDialog();
                ScreenColors.dialog(dialog);
                dialog.getButton(DialogInterface.BUTTON_POSITIVE).setOnClickListener(button -> {
                    String why = wordsRefusal(PostWords.size(getEditText().getText().toString(), otherBytes));
                    if (why != null) {
                        if (refused != null) refused.accept(why);
                        return;
                    }
                    // As Android's own button does: the click, then the close, each posted in turn.
                    Handler main = new Handler(Looper.getMainLooper());
                    main.post(() -> onClick(dialog, DialogInterface.BUTTON_POSITIVE));
                    main.post(dialog::dismiss);
                });
            }
            fitAboveKeyboard(getDialog());
        }
    }

    /**
     * An edit dialog's body as one scroll: [parts] top to bottom, each as wide as the dialog. With
     * the keyboard open the dialog shrinks above it ({@link HushfacebookPreferenceFragment#fitAboveKeyboard}),
     * and what no longer fits scrolls while Save and Cancel stay below.
     */
    static ScrollView scrollingBody(Context context, View... parts) {
        int pad = Math.round(20 * context.getResources().getDisplayMetrics().density);
        android.widget.LinearLayout content = new android.widget.LinearLayout(context);
        content.setOrientation(android.widget.LinearLayout.VERTICAL);
        content.setPadding(pad, pad / 2, pad, pad);
        for (View part : parts) {
            if (part.getParent() instanceof android.view.ViewGroup) ((android.view.ViewGroup) part.getParent()).removeView(part);
            content.addView(part, new android.widget.LinearLayout.LayoutParams(-1, -2));
        }
        ScrollView scroll = new ScrollView(context);
        scroll.addView(content);
        return scroll;
    }

    /**
     * The video file name's row. Its summary follows its text, whoever sets it: the person, the
     * shared page syncing it from the setting, or an import.
     */
    static final class FileNameRow extends EditTextPreference {
        @Nullable private TextView preview;
        private java.util.Date previewDate;

        FileNameRow(Context context) {
            super(context);
            getEditText().addTextChangedListener(new android.text.TextWatcher() {
                @Override public void beforeTextChanged(CharSequence text, int start, int count, int after) { }
                @Override public void onTextChanged(CharSequence text, int start, int before, int count) {
                    if (preview != null) preview.setText(previewName(text.toString(), previewDate));
                }
                @Override public void afterTextChanged(android.text.Editable text) { }
            });
        }

        static String previewName(String text, java.util.Date when) {
            return FileNameTemplate.videoName(FileNameTemplate.sanitize(text), when, "123456") + ".mp4";
        }

        @Override protected View onCreateDialogView() {
            Context context = getContext();
            ScreenColors colors = ScreenColors.shown == null ? ScreenColors.DEFAULT : ScreenColors.shown;
            int pad = Math.round(20 * context.getResources().getDisplayMetrics().density);
            TextView label = new TextView(context);
            label.setText(L10n.t("Example without post details"));
            label.setTextSize(12);
            label.setTextColor(colors.summary);
            label.setPadding(0, pad, 0, pad / 4);
            previewDate = new java.util.Date();
            preview = new TextView(context);
            preview.setTextSize(14);
            preview.setTextColor(colors.title);
            preview.setText(previewName(getText(), previewDate));
            TextView help = new TextView(context);
            help.setId(android.R.id.message);
            help.setText(getDialogMessage());
            help.setTextSize(14);
            help.setTextColor(colors.summary);
            help.setPadding(0, pad, 0, 0);
            return scrollingBody(context, getEditText(), label, preview, help);
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
            showAllText(view);
            ScreenColors.row(view, this);
            view.setAccessibilityDelegate(new RowSemantics(this, Button.class));
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
            showAllText(view);
            ScreenColors.row(view, this);
            view.setAccessibilityDelegate(new RowSemantics(this, Button.class));
        }

        /** Its list takes the screen's colours, as the other rows' dialogs do. */
        @Override
        protected void showDialog(Bundle state) {
            super.showDialog(state);
            if (getDialog() instanceof AlertDialog) ScreenColors.dialog((AlertDialog) getDialog());
        }
    }

    /**
     * The Save to row. Its summary follows its value, whoever sets it: the person, the shared page
     * syncing it from the setting, or an import.
     */
    static final class SaveToRow extends ListPreference {
        SaveToRow(Context context) {
            super(context);
        }

        @Override
        public void setValue(String value) {
            super.setValue(value);
            showSummary();
        }

        void showSummary() {
            SaveTo to = SaveTo.MOVIES_AND_PICTURES;
            for (SaveTo candidate : SaveTo.values()) {
                if (candidate.name().equals(getValue())) to = candidate;
            }
            setSummary(saveToSummary(to));
        }

        @Override
        protected void onBindView(View view) {
            super.onBindView(view);
            showAllText(view);
            ScreenColors.row(view, this);
            view.setAccessibilityDelegate(new RowSemantics(this, Button.class));
        }

        /** Its list takes the screen's colours, as the other rows' dialogs do. */
        @Override
        protected void showDialog(Bundle state) {
            super.showDialog(state);
            if (getDialog() instanceof AlertDialog) ScreenColors.dialog((AlertDialog) getDialog());
        }
    }

    /**
     * The download action's row. Its summary follows its value, whoever sets it: the person or the
     * shared page syncing it from the setting.
     */
    static final class DownloadActionRow extends ListPreference {
        DownloadActionRow(Context context) {
            super(context);
        }

        @Override
        public void setValue(String value) {
            super.setValue(value);
            showSummary();
        }

        void showSummary() {
            setSummary(downloadActionSummary(SendLink.Action.SEND.name().equals(getValue())
                    ? SendLink.Action.SEND : SendLink.Action.SAVE));
        }

        @Override
        protected void onBindView(View view) {
            super.onBindView(view);
            showAllText(view);
            ScreenColors.row(view, this);
            view.setAccessibilityDelegate(new RowSemantics(this, Button.class));
        }

        /** Its list takes the screen's colours, as the other rows' dialogs do. */
        @Override
        protected void showDialog(Bundle state) {
            super.showDialog(state);
            if (getDialog() instanceof AlertDialog) ScreenColors.dialog((AlertDialog) getDialog());
        }
    }

    /**
     * The send-to app's row. Its summary follows its text, whoever sets it: the person or the
     * shared page syncing it from the setting.
     */
    static final class SendAppRow extends EditTextPreference {
        SendAppRow(Context context) {
            super(context);
        }

        @Override
        public void setText(String text) {
            super.setText(text);
            setSummary(sendAppSummary(text));
        }

        @Override
        protected void onBindView(View view) {
            super.onBindView(view);
            showAllText(view);
            ScreenColors.row(view, this);
            view.setAccessibilityDelegate(new RowSemantics(this, Button.class));
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
     * The start tab's row. Its summary follows its value, whoever sets it: the person, the shared
     * page syncing it from the setting, or an import.
     */
    static final class StartTabRow extends ListPreference {
        StartTabRow(Context context) {
            super(context);
        }

        @Override
        public void setValue(String value) {
            super.setValue(value);
            showSummary();
        }

        void showSummary() {
            StartTab tab = StartTab.MARKETPLACE;
            for (StartTab candidate : StartTab.values()) {
                if (candidate.name().equals(getValue())) tab = candidate;
            }
            setSummary(startTabSummary(tab));
        }

        @Override
        protected void onBindView(View view) {
            super.onBindView(view);
            showAllText(view);
            ScreenColors.row(view, this);
            view.setAccessibilityDelegate(new RowSemantics(this, Button.class));
        }

        /** Its list takes the screen's colours, as the other rows' dialogs do. */
        @Override
        protected void showDialog(Bundle state) {
            super.showDialog(state);
            if (getDialog() instanceof AlertDialog) ScreenColors.dialog((AlertDialog) getDialog());
        }
    }

    /**
     * The Feeds filter's row, under the start tab's. Its summary follows its value, whoever sets
     * it: the person, the shared page syncing it from the setting, or an import.
     */
    static final class FeedsSubtabRow extends ListPreference {
        FeedsSubtabRow(Context context) {
            super(context);
        }

        @Override
        public void setValue(String value) {
            super.setValue(value);
            showSummary();
        }

        void showSummary() {
            FeedsSubtab subtab = FeedsSubtab.ALL;
            for (FeedsSubtab candidate : FeedsSubtab.values()) {
                if (candidate.name().equals(getValue())) subtab = candidate;
            }
            setSummary(feedsSubtabSummary(subtab));
        }

        @Override
        protected void onBindView(View view) {
            super.onBindView(view);
            showAllText(view);
            ScreenColors.row(view, this);
            view.setAccessibilityDelegate(new RowSemantics(this, Button.class));
        }

        /** Its list takes the screen's colours, as the other rows' dialogs do. */
        @Override
        protected void showDialog(Bundle state) {
            super.showDialog(state);
            if (getDialog() instanceof AlertDialog) ScreenColors.dialog((AlertDialog) getDialog());
        }
    }

    /**
     * The comment order's row. Its summary follows its value, whoever sets it: the person, the
     * shared page syncing it from the setting, or an import.
     */
    static final class CommentOrderRow extends ListPreference {
        CommentOrderRow(Context context) {
            super(context);
        }

        @Override
        public void setValue(String value) {
            super.setValue(value);
            showSummary();
        }

        void showSummary() {
            CommentOrder order = CommentOrder.FACEBOOK;
            for (CommentOrder candidate : CommentOrder.values()) {
                if (candidate.name().equals(getValue())) order = candidate;
            }
            setSummary(commentOrderSummary(order));
        }

        @Override
        protected void onBindView(View view) {
            super.onBindView(view);
            showAllText(view);
            ScreenColors.row(view, this);
            view.setAccessibilityDelegate(new RowSemantics(this, Button.class));
        }

        /** Its list takes the screen's colours, as the other rows' dialogs do. */
        @Override
        protected void showDialog(Bundle state) {
            super.showDialog(state);
            if (getDialog() instanceof AlertDialog) ScreenColors.dialog((AlertDialog) getDialog());
        }
    }

    /**
     * The playback quality's row. Its summary follows its value, whoever sets it: the person, the
     * shared page syncing it from the setting, or an import.
     */
    static final class PlaybackQualityRow extends ListPreference {
        PlaybackQualityRow(Context context) {
            super(context);
        }

        @Override
        public void setValue(String value) {
            super.setValue(value);
            showSummary();
        }

        void showSummary() {
            PlaybackQuality quality = PlaybackQuality.AUTO;
            for (PlaybackQuality candidate : PlaybackQuality.values()) {
                if (candidate.name().equals(getValue())) quality = candidate;
            }
            setSummary(playbackQualitySummary(quality));
        }

        @Override
        protected void onBindView(View view) {
            super.onBindView(view);
            showAllText(view);
            ScreenColors.row(view, this);
            view.setAccessibilityDelegate(new RowSemantics(this, Button.class));
        }

        /** Its list takes the screen's colours, as the other rows' dialogs do. */
        @Override
        protected void showDialog(Bundle state) {
            super.showDialog(state);
            if (getDialog() instanceof AlertDialog) ScreenColors.dialog((AlertDialog) getDialog());
        }
    }
}
