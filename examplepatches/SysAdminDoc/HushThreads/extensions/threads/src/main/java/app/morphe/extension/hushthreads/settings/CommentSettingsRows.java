/*
 * Copyright 2026 HushThreads contributors
 * https://github.com/SysAdminDoc/HushThreads
 */
package app.morphe.extension.hushthreads.settings;

import android.app.AlertDialog;
import android.content.Context;
import android.os.Bundle;
import android.preference.EditTextPreference;
import android.view.View;
import android.widget.Button;

import app.morphe.extension.hushthreads.comments.CommentSettings;
import app.morphe.extension.shared.L10n;

/**
 * The Comments section's one row that isn't a plain switch: the words and domains a reply is
 * matched against, typed into its dialog.
 *
 * <p>It keeps the screen's colours, its dialog's buttons and its row's role the way the Downloads
 * section's text rows do, so the page reads and speaks the same throughout.
 */
final class CommentSettingsRows {
    private CommentSettingsRows() {
    }

    /** The patterns' row, keyed by the setting that holds them. */
    static EditTextPreference patternsRow(Context context) {
        PatternRow row = new PatternRow(context);
        row.setKey(CommentSettings.FILTER_COMMENT_PATTERNS.key);
        row.setIcon(SettingsIcons.icon(context, SettingsIcons.BLOCK, ScreenColors.DEFAULT.heading));
        row.setTitle(L10n.t("Blocked words and domains"));
        row.setDialogTitle(L10n.t("Blocked words and domains"));
        // DialogPreference's own OK and Cancel follow the activity's language, which can differ from
        // Threads', so both are set here, as the Downloads rows' dialogs do.
        row.setPositiveButtonText(L10n.t("Save"));
        row.setNegativeButtonText(L10n.t("Cancel"));
        row.setDialogMessage(L10n.t("One pattern a line, or separated by commas. A shop's domain such "
                + "as shopee.vn takes out the replies linking to it."));
        row.setText(CommentSettings.FILTER_COMMENT_PATTERNS.savedValue());
        return row;
    }

    /** What the row says under its title: how its list is written, whatever it holds. */
    static String summary() {
        return L10n.t("One pattern a line, or separated by commas. Matched whatever the letter case.");
    }

    static final class PatternRow extends EditTextPreference {
        PatternRow(Context context) {
            super(context);
        }

        @Override
        public void setText(String text) {
            super.setText(text);
            setSummary(summary());
        }

        @Override
        protected void onBindView(View view) {
            super.onBindView(view);
            HushThreadsPreferenceFragment.showAllText(view);
            ScreenColors.row(view, this);
            view.setAccessibilityDelegate(new HushThreadsPreferenceFragment.RowSemantics(this, Button.class));
        }

        /** Its dialog takes the screen's colours, as the other rows' dialogs do. */
        @Override
        protected void showDialog(Bundle state) {
            super.showDialog(state);
            if (getDialog() instanceof AlertDialog) ScreenColors.dialog((AlertDialog) getDialog());
            SaveSettingsRows.fitAboveKeyboard(getDialog());
        }
    }
}
