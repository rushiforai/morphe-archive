/*
 * Copyright 2026 icysymmetra/tiktok-patches-for-morphe contributors
 * https://github.com/icysymmetra/tiktok-patches-for-morphe
 *
 * Modified for Hushfacebook (Facebook), 2026.
 */
package app.morphe.extension.shared.settings.preference;

import android.app.AlertDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.preference.Preference;
import android.util.AttributeSet;
import android.widget.ListAdapter;

import androidx.annotation.Nullable;

import app.morphe.extension.shared.L10n;

/** Offers a compact choice between a quick clipboard report and a full text file. */
@SuppressWarnings({"deprecation", "unused"})
public class ExportDiagnosticReportPreference extends Preference {
    {
        // A key so the settings search can index this row. Nothing in the settings
        // framework treats it as a setting: a key with no Setting behind it is skipped.
        setKey("action_export_diagnostic_report");
        setOnPreferenceClickListener(pref -> {
            DialogInterface.OnClickListener choose = (dialog, which) -> {
                if (which == 0) LogBufferManager.exportToClipboard();
                if (which == 1) LogBufferManager.exportToFile();
            };
            AlertDialog.Builder builder = new AlertDialog.Builder(getContext()).setTitle(dialogTitle());
            ListAdapter drawn = choices(builder.getContext());
            if (drawn == null) builder.setItems(labels(), choose);
            else builder.setAdapter(drawn, choose);
            AlertDialog dialog = builder.setNegativeButton(negativeText(), null).create();
            // Built, then styled, then shown, so the first layout measures what's on show. The
            // list works out its height from rows it builds itself, and styling applied after
            // show() reached rows it had already measured without it.
            dialog.create();
            onDialogCreated(dialog);
            dialog.show();
            return true;
        });
    }

    /**
     * The dialog, built and not yet shown: a bundle's place to style it. Anything that changes a
     * size belongs here rather than after show(), where the list has already measured itself.
     */
    protected void onDialogCreated(AlertDialog dialog) {
    }

    /** The dialog's title, in the phone's language. A bundle may override these four. */
    protected CharSequence dialogTitle() {
        return L10n.t(getContext(), "Export diagnostic report");
    }

    /** The two choices, quick copy first, full file second. */
    protected CharSequence[] labels() {
        return new CharSequence[]{L10n.t(getContext(), "Copy quick report"),
                L10n.t(getContext(), "Save full report")};
    }

    /**
     * The two choices as the bundle draws them, in the order of {@link #labels()}, or null for
     * Android's own list of those labels. Each row comes from the adapter already styled, padding
     * included, which is what the list measures.
     *
     * @param dialogContext the dialog's themed context
     */
    @Nullable
    protected ListAdapter choices(Context dialogContext) {
        return null;
    }

    /**
     * Cancel from the catalog. Android's own was read from the dialog's activity, which can be
     * in another language than the title and choices above it.
     */
    protected CharSequence negativeText() {
        return L10n.t(getContext(), "Cancel");
    }

    public ExportDiagnosticReportPreference(
            Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes
    ) {
        super(context, attrs, defStyleAttr, defStyleRes);
    }

    public ExportDiagnosticReportPreference(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
    }

    public ExportDiagnosticReportPreference(Context context, AttributeSet attrs) {
        super(context, attrs);
    }

    public ExportDiagnosticReportPreference(Context context) {
        super(context);
    }
}
