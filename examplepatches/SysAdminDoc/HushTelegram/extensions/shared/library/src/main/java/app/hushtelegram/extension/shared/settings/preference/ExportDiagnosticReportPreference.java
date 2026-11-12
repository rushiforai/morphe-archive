/*
 * Forked from https://github.com/SysAdminDoc/HushThreads at b141524 (GPL-3.0),
 * modified for HushTelegram (Telegram), 2026.
 *
 * Forked from https://github.com/SysAdminDoc/Hushfacebook at c15d4f79 (GPL-3.0),
 * modified for HushThreads (Threads), 2026.
 *
 * Copyright 2026 icysymmetra/tiktok-patches-for-morphe contributors
 * https://github.com/icysymmetra/tiktok-patches-for-morphe
 *
 * Modified for Hushfacebook (Facebook), 2026.
 */
package app.hushtelegram.extension.shared.settings.preference;

import android.app.AlertDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.graphics.Typeface;
import android.preference.Preference;
import android.util.AttributeSet;
import android.util.TypedValue;
import android.view.View;
import android.widget.CheckBox;
import android.widget.LinearLayout;
import android.widget.ListAdapter;
import android.widget.ScrollView;
import android.widget.TextView;

import androidx.annotation.Nullable;

import java.text.NumberFormat;
import java.util.Arrays;
import java.util.List;
import java.util.concurrent.CountDownLatch;

import app.hushtelegram.extension.shared.L10n;
import app.hushtelegram.extension.shared.Logger;
import app.hushtelegram.extension.shared.Utils;

/**
 * Offers a quick clipboard report, a full text file, or a look at the report first, where any
 * part can be left out before it's copied or saved.
 */
@SuppressWarnings({"deprecation", "unused"})
public class ExportDiagnosticReportPreference extends Preference {
    /** Tags the preview's content, so a bundle styling the dialog can find it. */
    public static final String PREVIEW_TAG = "diagnostic_report_preview";
    /** The most of a report the preview draws. Copy and Save still use every part that's ticked. */
    static final int PREVIEW_MAX_CHARS = 30_000;

    /** Thrown by the next redraw's worker and then cleared: how a test reaches the note it leaves. */
    static volatile RuntimeException failNextRedraw;
    /** Waited on by the next redraw's worker and then cleared, so a test can run what's posted before it. */
    static volatile CountDownLatch holdNextRedraw;

    /** The summary to put back once a report is done, while the row says it's busy; null otherwise. */
    @Nullable private CharSequence restingSummary;
    private boolean busy;

    {
        // A key so the settings search can index this row. Nothing in the settings
        // framework treats it as a setting: a key with no Setting behind it is skipped.
        setKey("action_export_diagnostic_report");
        setOnPreferenceClickListener(pref -> {
            if (busy || !canStartExport()) return true;
            DialogInterface.OnClickListener choose = (dialog, which) -> {
                if (which < 0 || which > 2) return;
                if (busy || !canStartExport()) return;
                // Building the report can take a few seconds on a full buffer, so the row says
                // so and takes no second tap until the copy, the file or the preview is ready.
                showBusy();
                if (which == 0) LogBufferManager.exportToClipboard(this::showResting);
                else if (which == 1) LogBufferManager.exportToFile(this::showResting);
                else LogBufferManager.preview(this::previewReady);
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

    /** A host can reject queued clicks after the settings view that owns this row is gone. */
    protected boolean canStartExport() {
        return true;
    }

    /** Whether a report this row started is still being built. */
    public boolean isBusy() {
        return busy;
    }

    /** The summary this row rests on, also while it says a report is being built. */
    @Nullable
    public CharSequence restingSummary() {
        return busy ? restingSummary : getSummary();
    }

    private void showBusy() {
        if (busy) return;
        busy = true;
        restingSummary = getSummary();
        setSummary(L10n.t(getContext(), "Preparing the diagnostic report"));
        setEnabled(false);
    }

    private void showResting() {
        if (!busy) return;
        busy = false;
        setSummary(restingSummary);
        restingSummary = null;
        setEnabled(true);
    }

    /** A built preview, on the main thread. A page gone while it was built gets nothing shown. */
    private void previewReady(@Nullable LogBufferManager.Preview preview, @Nullable String text) {
        showResting();
        if (preview == null || text == null || !canStartExport()) return;
        showPreview(preview, text);
    }

    /**
     * The report as it will be shared, one box per part that can be left out, and Copy and Save
     * for what's ticked. Cancel leaves no file and nothing on the clipboard.
     */
    private void showPreview(LogBufferManager.Preview preview, String whole) {
        Context context = getContext();
        float density = context.getResources().getDisplayMetrics().density;
        int side = Math.round(20 * density);
        int gap = Math.round(8 * density);
        LinearLayout content = new LinearLayout(context);
        content.setOrientation(LinearLayout.VERTICAL);
        content.setPadding(side, gap, side, gap);
        content.setTag(PREVIEW_TAG);

        TextView hint = new TextView(context);
        hint.setText(L10n.t(context, "Untick a part to leave it out. Copy and Save use only what's ticked."));
        hint.setPadding(0, 0, 0, gap);
        content.addView(hint);

        List<String> parts = preview.parts();
        boolean[] kept = new boolean[parts.size()];
        Arrays.fill(kept, true);
        TextView note = new TextView(context);
        note.setPadding(0, gap, 0, gap);
        TextView body = new TextView(context);
        body.setTypeface(Typeface.MONOSPACE);
        body.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12);
        // The report is written left to right whatever the phone's language, so it reads that way.
        body.setTextDirection(View.TEXT_DIRECTION_LTR);
        body.setLayoutDirection(View.LAYOUT_DIRECTION_LTR);
        body.setTextIsSelectable(true);
        AlertDialog[] shown = new AlertDialog[1];
        int[] drawn = new int[1];
        for (int i = 0; i < parts.size(); i++) {
            int part = i;
            CheckBox box = new CheckBox(context);
            box.setText("[" + parts.get(i) + "]");
            box.setChecked(true);
            box.setOnCheckedChangeListener((button, checked) -> {
                kept[part] = checked;
                redraw(preview, kept, body, note, drawn, shown);
            });
            content.addView(box);
        }
        content.addView(note);
        content.addView(body);
        bind(context, body, note, whole);
        ScrollView scroll = new ScrollView(context);
        scroll.addView(content);

        AlertDialog dialog = new AlertDialog.Builder(context)
                .setTitle(L10n.t(context, "Preview the report"))
                .setView(scroll)
                .setPositiveButton(L10n.t(context, "Save"), (d, which) -> {
                    if (busy || !canStartExport()) return;
                    showBusy();
                    LogBufferManager.savePreview(preview, kept, this::showResting);
                })
                .setNeutralButton(L10n.t(context, "Copy"), (d, which) -> {
                    if (busy || !canStartExport()) return;
                    showBusy();
                    LogBufferManager.copyPreview(preview, kept, this::showResting);
                })
                .setNegativeButton(negativeText(), null)
                .create();
        shown[0] = dialog;
        dialog.create();
        onDialogCreated(dialog);
        dialog.show();
    }

    /**
     * Works out the report for the boxes ticked now on a worker, and draws it only if it's still
     * the newest choice and its dialog and page are still there.
     */
    private void redraw(LogBufferManager.Preview preview, boolean[] kept, TextView body, TextView note,
                        int[] drawn, AlertDialog[] shown) {
        int choice = ++drawn[0];
        boolean[] ticked = kept.clone();
        Context context = getContext();
        boolean started = Utils.runOnBackgroundThread(() -> {
            String text;
            try {
                RuntimeException failing = failNextRedraw;
                if (failing != null) {
                    failNextRedraw = null;
                    throw failing;
                }
                CountDownLatch hold = holdNextRedraw;
                if (hold != null) {
                    holdNextRedraw = null;
                    hold.await();
                }
                text = preview.text(ticked);
            } catch (Throwable failure) {
                Logger.printException(() -> "Failed to redraw the diagnostic preview", failure);
                Utils.runOnMainThread(() -> {
                    if (current(choice, drawn, shown)) stale(context, note);
                });
                return;
            }
            Utils.runOnMainThread(() -> {
                if (current(choice, drawn, shown)) bind(context, body, note, text);
            });
        });
        if (!started) {
            Logger.printInfo(() -> "The diagnostic preview couldn't redraw; Copy and Save still follow the boxes");
            if (current(choice, drawn, shown)) stale(context, note);
        }
    }

    /** Whether [choice] is still the newest and its dialog and page are still there. */
    private boolean current(int choice, int[] drawn, AlertDialog[] shown) {
        AlertDialog dialog = shown[0];
        return choice == drawn[0] && dialog != null && dialog.isShowing() && canStartExport();
    }

    /** The text above no longer matches the boxes; the buttons still do. */
    private static void stale(Context context, TextView note) {
        note.setText(L10n.t(context, "Couldn't update the preview. Copy and Save still use only what's ticked."));
        note.setVisibility(View.VISIBLE);
    }

    /** Shows [text] up to {@link #PREVIEW_MAX_CHARS}, and says so under the boxes when it's cut. */
    static void bind(Context context, TextView body, TextView note, String text) {
        int end = Math.min(text.length(), PREVIEW_MAX_CHARS);
        if (end < text.length() && end > 0 && Character.isHighSurrogate(text.charAt(end - 1))) end--;
        body.setText(text.substring(0, end));
        if (end < text.length()) {
            NumberFormat numbers = NumberFormat.getIntegerInstance(L10n.locale(context));
            note.setText(String.format(L10n.t(context, "Showing the first %1$s of %2$s characters. Save keeps all of "
                            + "it, and Copy keeps what fits, leaving out the oldest events first."),
                    numbers.format(end), numbers.format(text.length())));
            note.setVisibility(View.VISIBLE);
        } else {
            note.setText(null);
            note.setVisibility(View.GONE);
        }
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

    /** The three choices: quick copy, full file, and a look at the report first. */
    protected CharSequence[] labels() {
        return new CharSequence[]{L10n.t(getContext(), "Copy quick report"),
                L10n.t(getContext(), "Save full report"), L10n.t(getContext(), "Preview the report")};
    }

    /**
     * The three choices as the bundle draws them, in the order of {@link #labels()}, or null for
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
