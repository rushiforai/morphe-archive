/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-20.
 */
package app.morphe.extension.shared.downloads;

import static app.morphe.extension.shared.utils.StringRef.str;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.Dialog;
import android.app.DialogFragment;
import android.app.FragmentManager;
import android.content.ContentResolver;
import android.content.Intent;
import android.content.SharedPreferences;
import android.net.Uri;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.provider.DocumentsContract;
import android.text.format.Formatter;
import android.view.View;
import android.widget.LinearLayout;
import android.widget.ProgressBar;
import android.widget.TextView;

import androidx.annotation.Nullable;

import app.morphe.extension.shared.utils.Logger;
import app.morphe.extension.shared.utils.Utils;

/** Uses the caller's Activity, including on rooted mounts where the installed manifest stays stock. */
@SuppressWarnings("deprecation")
public final class PortableExportDialog extends DialogFragment {
    private static final String TAG = "rvx_portable_export";
    private static final String LAST_TREE = "last_tree";
    private static final int PICK_TREE = 1;
    private static final Object GRANT_LOCK = new Object();
    private static final int READ_WRITE = Intent.FLAG_GRANT_READ_URI_PERMISSION | Intent.FLAG_GRANT_WRITE_URI_PERMISSION;

    private final Handler main = new Handler(Looper.getMainLooper());
    private final Runnable poll = this::render;
    private PortableExport.Request request;
    @Nullable private PortableExport.Job job;
    @Nullable private String pickerError;
    private boolean picking;
    @Nullable private PortableExport.Progress shownProgress;
    private boolean shownCancelling;
    private TextView message;
    private ProgressBar progressBar;

    public static void show(Activity activity, PortableExport.Request request) {
        if (activity.isFinishing() || activity.isDestroyed()) return;
        FragmentManager fragments = activity.getFragmentManager();
        if (fragments.isStateSaved() || fragments.findFragmentByTag(TAG) != null) return;
        PortableExportDialog dialog = new PortableExportDialog();
        dialog.request = request;
        dialog.show(fragments, TAG);
    }

    @Override
    public void onCreate(@Nullable Bundle state) {
        super.onCreate(state);
        // Keep the whole request and the worker reference on rotation without passing playlist data through Binder.
        setRetainInstance(true);
    }

    @Override
    public Dialog onCreateDialog(@Nullable Bundle state) {
        Activity activity = getActivity();
        LinearLayout content = new LinearLayout(activity);
        content.setOrientation(LinearLayout.VERTICAL);
        int margin = Utils.dipToPixels(24);
        content.setPadding(margin, Utils.dipToPixels(14), margin, 0);
        message = new TextView(activity);
        message.setTextIsSelectable(true);
        content.addView(message);
        progressBar = new ProgressBar(activity, null, android.R.attr.progressBarStyleHorizontal);
        LinearLayout.LayoutParams barParams = new LinearLayout.LayoutParams(-1, -2);
        barParams.topMargin = Utils.dipToPixels(10);
        content.addView(progressBar, barParams);
        return new AlertDialog.Builder(activity)
                .setTitle(str(request != null && request.playlist() ? "rvx_export_playlist" : "rvx_export_file"))
                .setView(content)
                .setPositiveButton(str("rvx_export_choose_folder"), null)
                .setNegativeButton(android.R.string.cancel, null)
                .setNeutralButton(str("rvx_export_use_previous"), null)
                .create();
    }

    @Override
    public void onStart() {
        super.onStart();
        AlertDialog dialog = (AlertDialog) getDialog();
        dialog.getButton(AlertDialog.BUTTON_POSITIVE).setOnClickListener(view -> chooseFolder());
        dialog.getButton(AlertDialog.BUTTON_NEUTRAL).setOnClickListener(view -> reuseTree());
        dialog.getButton(AlertDialog.BUTTON_NEGATIVE).setOnClickListener(view -> {
            if (job != null && job.result == null) stopExport();
            else dismiss();
        });
        shownProgress = null;
        render();
    }

    @Override
    public void onStop() {
        main.removeCallbacks(poll);
        super.onStop();
    }

    @Override
    public void onDestroyView() {
        // The platform dismiss message would remove a retained dialog when its old Activity is destroyed.
        if (getDialog() != null) getDialog().setDismissMessage(null);
        super.onDestroyView();
        message = null;
        progressBar = null;
    }

    @Override
    public void onDestroy() {
        if (job != null && job.result == null) job.cancel();
        super.onDestroy();
    }

    private void chooseFolder() {
        pickerError = null;
        picking = true;
        render();
        try {
            startActivityForResult(new Intent(Intent.ACTION_OPEN_DOCUMENT_TREE)
                    .addFlags(READ_WRITE | Intent.FLAG_GRANT_PERSISTABLE_URI_PERMISSION), PICK_TREE);
        } catch (RuntimeException ex) {
            Logger.printDebug(() -> "Could not launch the document tree picker", ex);
            picking = false;
            pickerError = str("rvx_export_picker_failed");
            render();
        }
    }

    @Override
    public void onActivityResult(int requestCode, int resultCode, @Nullable Intent data) {
        if (requestCode != PICK_TREE) {
            super.onActivityResult(requestCode, resultCode, data);
            return;
        }
        picking = false;
        if (request == null || resultCode != Activity.RESULT_OK || data == null) {
            render();
            return;
        }
        Uri tree = data.getData();
        if (tree == null || !DocumentsContract.isTreeUri(tree) || (data.getFlags() & READ_WRITE) != READ_WRITE) {
            pickerError = str("rvx_export_no_grant");
            render();
            return;
        }
        rememberTree(tree);
        startExport(tree);
    }

    private void rememberTree(Uri tree) {
        ContentResolver resolver = getActivity().getApplicationContext().getContentResolver();
        SharedPreferences preferences = preferences();
        synchronized (GRANT_LOCK) {
            String previous = preferences.getString(LAST_TREE, null);
            try {
                resolver.takePersistableUriPermission(tree, READ_WRITE);
            } catch (SecurityException ex) {
                // A temporary grant can still serve this copy, but must never be offered next time.
                Logger.printDebug(() -> "The selected export grant was not persistable", ex);
                return;
            }
            String next = tree.toString();
            preferences.edit().putString(LAST_TREE, next).apply();
            if (previous != null && !previous.equals(next)) {
                PortableExport.afterQueuedExports(() -> releasePreviousTree(resolver, preferences, previous));
            }
        }
    }

    private static void releasePreviousTree(ContentResolver resolver, SharedPreferences preferences, String previous) {
        synchronized (GRANT_LOCK) {
            if (previous.equals(preferences.getString(LAST_TREE, null))) return;
            try {
                resolver.releasePersistableUriPermission(Uri.parse(previous), READ_WRITE);
            } catch (SecurityException ex) {
                Logger.printDebug(() -> "The previous export grant was already unavailable", ex);
            }
        }
    }

    private SharedPreferences preferences() {
        return getActivity().getApplicationContext().getSharedPreferences(TAG, 0);
    }

    @Nullable
    private Uri previousTree() {
        SharedPreferences preferences = preferences();
        String previous = preferences.getString(LAST_TREE, null);
        if (previous == null) return null;
        Uri tree = Uri.parse(previous);
        for (var grant : getActivity().getContentResolver().getPersistedUriPermissions()) {
            if (tree.equals(grant.getUri()) && grant.isReadPermission() && grant.isWritePermission()) return tree;
        }
        preferences.edit().remove(LAST_TREE).apply();
        pickerError = str("rvx_export_no_grant");
        return null;
    }

    private void reuseTree() {
        Uri tree = previousTree();
        if (tree != null) startExport(tree);
        else render();
    }

    private void startExport(Uri tree) {
        pickerError = null;
        shownProgress = null;
        job = PortableExport.enqueue(getActivity().getApplicationContext().getContentResolver(), tree, request);
        render();
    }

    private void stopExport() {
        if (job != null && job.result == null) job.cancel();
        render();
    }

    private void render() {
        main.removeCallbacks(poll);
        if (!(getDialog() instanceof AlertDialog dialog) || !dialog.isShowing() || getActivity() == null) return;
        PortableExport.Result result = job == null ? null : job.result;
        boolean running = job != null && result == null;
        setCancelable(!running && !picking);
        progressBar.setVisibility(running ? View.VISIBLE : View.GONE);
        if (request == null) {
            message.setText(str("rvx_export_interrupted"));
            configureButtons(dialog, false, false, android.R.string.ok);
        } else if (picking) {
            message.setText(str("rvx_export_picking"));
            configureButtons(dialog, false, false, 0);
        } else if (running) {
            PortableExport.Progress progress = job.progress;
            boolean cancelling = job.cancelling();
            if (shownProgress != progress || shownCancelling != cancelling) {
                shownProgress = progress;
                shownCancelling = cancelling;
                showProgress(progress, cancelling);
                configureButtons(dialog, false, false, android.R.string.cancel);
                dialog.getButton(AlertDialog.BUTTON_NEGATIVE).setEnabled(!cancelling);
            }
            main.postDelayed(poll, 250);
        } else if (result != null) {
            String text = summary(result);
            message.setText(pickerError == null ? text : text + "\n\n" + pickerError);
            boolean repick = result.outcome() == PortableExport.Outcome.DESTINATION_FAILED;
            configureButtons(dialog, repick, false, android.R.string.ok);
        } else {
            boolean usePrevious = previousTree() != null;
            String text = str("rvx_export_ready", request.title(), request.media().size());
            message.setText(pickerError == null ? text : text + "\n\n" + pickerError);
            configureButtons(dialog, true, usePrevious, android.R.string.cancel);
        }
    }

    private void configureButtons(AlertDialog dialog, boolean pick, boolean reuse, int negative) {
        var positive = dialog.getButton(AlertDialog.BUTTON_POSITIVE);
        positive.setVisibility(pick ? View.VISIBLE : View.GONE);
        var neutral = dialog.getButton(AlertDialog.BUTTON_NEUTRAL);
        neutral.setVisibility(reuse ? View.VISIBLE : View.GONE);
        var cancel = dialog.getButton(AlertDialog.BUTTON_NEGATIVE);
        cancel.setVisibility(negative == 0 ? View.GONE : View.VISIBLE);
        if (negative != 0) cancel.setText(negative);
        cancel.setEnabled(true);
    }

    private void showProgress(PortableExport.Progress progress, boolean cancelling) {
        int total = request.media().size();
        String text = str(cancelling ? "rvx_export_cancelling" : "rvx_export_progress",
                progress.processed(), total, progress.copied());
        if (progress.name() != null) {
            String copied = Formatter.formatShortFileSize(getActivity(), progress.bytes());
            text += "\n\n" + progress.name() + "\n";
            text += progress.size() <= 0 ? copied : str("rvx_export_bytes", copied,
                    Formatter.formatShortFileSize(getActivity(), progress.size()));
        }
        message.setText(text);
        progressBar.setMax(total);
        progressBar.setProgress(progress.processed());
    }

    private String summary(PortableExport.Result result) {
        String summaryKey = switch (result.outcome()) {
            case CANCELLED -> "rvx_export_cancelled";
            case DESTINATION_FAILED -> "rvx_export_destination_failed";
            case FINISHED -> result.copied() == 0 ? "rvx_export_no_sources"
                    : result.missing() > 0 ? "rvx_export_partial" : "rvx_export_complete";
        };
        String text = str(summaryKey, result.copied(), result.total());
        if (result.missing() > 0) text += "\n" + str("rvx_export_missing", result.missing());
        if (result.folderName() != null) text += "\n" + str("rvx_export_folder", result.folderName());
        if (request.playlist() && result.copied() > 0 && !result.wrotePlaylist()) {
            text += "\n" + str("rvx_export_playlist_not_written");
        }
        if (result.cleanupFailures() > 0) text += "\n" + str("rvx_export_cleanup_failed", result.cleanupFailures());
        return text;
    }
}
