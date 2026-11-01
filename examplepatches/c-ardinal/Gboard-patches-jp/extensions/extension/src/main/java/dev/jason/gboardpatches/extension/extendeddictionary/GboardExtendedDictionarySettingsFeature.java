package dev.jason.gboardpatches.extension.extendeddictionary;

import android.app.AlertDialog;
import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicReference;

import dev.jason.gboardpatches.extension.R;
import dev.jason.gboardpatches.extension.settings.GboardPatchesFeatureAvailability;
import dev.jason.gboardpatches.extension.settings.GboardPatchesIcons;
import dev.jason.gboardpatches.extension.settings.GboardPatchesSettingsContract;
import dev.jason.gboardpatches.extension.settings.GboardSettingsText;

public final class GboardExtendedDictionarySettingsFeature
        implements GboardPatchesSettingsContract.Feature {
    private static final String TAG = "GboardExtendedDictionary";
    private static final String[] WORD_LIST_MIME_TYPES = {"text/plain", "application/zip"};
    private static final ExecutorService WORKER = Executors.newSingleThreadExecutor(runnable -> {
        Thread thread = new Thread(runnable, "GboardExtendedDictionary");
        thread.setDaemon(true);
        return thread;
    });
    private static final AtomicReference<ExtendedDictionaryProgressDialog.Job> CURRENT_JOB =
            new AtomicReference<>();

    private final String entryTitle;
    private final String entrySummary;
    private final ClassLoader gboardClassLoader;

    public GboardExtendedDictionarySettingsFeature(Context context) {
        this(context, context.getClassLoader());
    }

    GboardExtendedDictionarySettingsFeature(Context context, ClassLoader gboardClassLoader) {
        this.gboardClassLoader = gboardClassLoader;
        entryTitle = text(context, R.string.gboard_patches_extended_dictionary_title);
        entrySummary = text(context, R.string.gboard_patches_extended_dictionary_summary);
    }

    @Override
    public String getEntryTitle() {
        return entryTitle;
    }

    @Override
    public String getEntrySummary() {
        return entrySummary;
    }

    @Override
    public int getEntryIcon() {
        return GboardPatchesIcons.MENU_BOOK;
    }

    @Override
    public String getEntryTone() {
        return "violet";
    }

    @Override
    public boolean isAvailable(Context context) {
        return GboardPatchesFeatureAvailability.hasFeature(
                context,
                GboardPatchesFeatureAvailability.FEATURE_EXTENDED_DICTIONARY);
    }

    @Override
    public GboardPatchesSettingsContract.Screen buildScreen(
            GboardPatchesSettingsContract.FeatureHost host) {
        Context context = host.getContext();
        boolean supported = GboardPersonalDictionaryReflectionGateway.isSupported(
                gboardClassLoader);
        int managedCount = managedCount(context);
        ExtendedDictionaryProgressDialog.Job job = CURRENT_JOB.get();
        boolean running = job != null;
        if (running && job.attachedHost.getAndSet(host) != host) {
            GboardPatchesSettingsContract.showManagedDialog(host,
                    ExtendedDictionaryProgressDialog.create(context, job));
        }
        List<GboardPatchesSettingsContract.Row> rows = new ArrayList<>();
        rows.add(new GboardPatchesSettingsContract.CommandRow(
                text(context, R.string.gboard_patches_extended_dictionary_import_title),
                GboardSettingsText.format(context,
                        R.string.gboard_patches_extended_dictionary_import_summary,
                        WordListParser.MAX_ROWS_PER_IMPORT),
                supported && !running,
                () -> importWordList(host)));
        rows.add(new GboardPatchesSettingsContract.CommandRow(
                text(context, R.string.gboard_patches_extended_dictionary_remove_title),
                text(context, R.string.gboard_patches_extended_dictionary_remove_summary),
                supported && !running,
                () -> confirmRemoval(host)));
        rows.add(new GboardPatchesSettingsContract.InfoRow(
                text(context, R.string.gboard_patches_extended_dictionary_status_title),
                statusSummary(context, managedCount),
                true));
        List<GboardPatchesSettingsContract.Section> sections = Collections.singletonList(
                new GboardPatchesSettingsContract.Section(
                        text(context, R.string.gboard_patches_extended_dictionary_section_title),
                        rows));
        return new GboardPatchesSettingsContract.Screen(
                entryTitle,
                "Gboard",
                entryTitle,
                supported ? entrySummary : text(context,
                        R.string.gboard_patches_extended_dictionary_unsupported_summary),
                Collections.emptyList(),
                sections);
    }

    private static String statusSummary(Context context, int managedCount) {
        return managedCount < 0
                ? text(context, R.string.gboard_patches_extended_dictionary_status_unreadable)
                : GboardSettingsText.format(context,
                        R.string.gboard_patches_extended_dictionary_status_summary, managedCount);
    }

    private static int managedCount(Context context) {
        try (ManagedEntryStore store = ManagedEntryStore.open(context)) {
            return store.count();
        } catch (RuntimeException failure) {
            Log.w(TAG, "Managed dictionary entries are unreadable");
            return -1;
        }
    }

    private void importWordList(GboardPatchesSettingsContract.FeatureHost host) {
        GboardPatchesSettingsContract.openBinaryDocument(host, WORD_LIST_MIME_TYPES,
                document -> runInBackground(host,
                        new ExtendedDictionaryProgressDialog.Job(
                                R.string.gboard_patches_extended_dictionary_progress_import_title,
                                true, "import", IMPORT_PHASES,
                                loadRates(host.getContext(), "import")),
                        text(host.getContext(),
                                R.string.gboard_patches_extended_dictionary_import_failed),
                        (progress, cancel) -> importDocument(host.getContext(),
                                document.getData(), progress, cancel)));
    }

    /** Counts untracked extended-tag rows off the main thread, then asks how far to go. */
    private void confirmRemoval(GboardPatchesSettingsContract.FeatureHost host) {
        Context context = host.getContext();
        Handler main = new Handler(Looper.getMainLooper());
        WORKER.execute(() -> {
            int untracked = countUntracked(context);
            main.post(() -> {
                if (!ExtendedDictionaryProgressDialog.isHostGone(context)) {
                    GboardPatchesSettingsContract.showManagedDialog(host, removalDialog(
                            context, untracked,
                            includeUntracked -> removeImportedWords(host, includeUntracked)));
                }
            });
        });
    }

    interface RemovalChoice {
        void remove(boolean includeUntracked);
    }

    /** Default (positive) action removes tracked words only; untracked ones need "Remove all". */
    static GboardPatchesSettingsContract.ManagedDialogAction removalDialog(Context context,
            int untracked, RemovalChoice choice) {
        return onDismiss -> {
            // The removal starts only after this dialog is gone, so the progress dialog does not
            // overlap it in the host's modal bookkeeping.
            Boolean[] chosen = new Boolean[1];
            AlertDialog.Builder builder = new AlertDialog.Builder(context)
                    .setTitle(text(context,
                            R.string.gboard_patches_extended_dictionary_remove_confirm_title))
                    .setNegativeButton(text(context, R.string.gboard_patches_dialog_cancel), null);
            if (untracked > 0) {
                builder.setMessage(GboardSettingsText.format(context,
                                R.string.gboard_patches_extended_dictionary_remove_untracked_message,
                                untracked))
                        .setPositiveButton(text(context,
                                R.string.gboard_patches_extended_dictionary_remove_tracked_only),
                                (dialog, which) -> chosen[0] = false)
                        .setNeutralButton(text(context,
                                R.string.gboard_patches_extended_dictionary_remove_all),
                                (dialog, which) -> chosen[0] = true);
            } else {
                builder.setMessage(text(context,
                                R.string.gboard_patches_extended_dictionary_remove_confirm_message))
                        .setPositiveButton(text(context,
                                R.string.gboard_patches_extended_dictionary_remove_title),
                                (dialog, which) -> chosen[0] = false);
            }
            AlertDialog dialog = builder.create();
            dialog.setOnDismissListener(ignored -> {
                onDismiss.run();
                if (chosen[0] != null) {
                    choice.remove(chosen[0]);
                }
            });
            dialog.show();
            return true;
        };
    }

    private int countUntracked(Context context) {
        GboardPersonalDictionaryReflectionGateway gateway =
                GboardPersonalDictionaryReflectionGateway.open(context, gboardClassLoader);
        if (gateway == null) {
            return 0;
        }
        try (ManagedEntryStore store = ManagedEntryStore.open(context)) {
            return ExtendedDictionaryImporter.countUntracked(gateway, store);
        } catch (Throwable failure) {
            Log.w(TAG, "Untracked count failed: " + failure.getClass().getName());
            return 0;
        } finally {
            gateway.close();
        }
    }

    private void removeImportedWords(GboardPatchesSettingsContract.FeatureHost host,
            boolean includeUntracked) {
        runInBackground(host,
                new ExtendedDictionaryProgressDialog.Job(
                        R.string.gboard_patches_extended_dictionary_progress_remove_title, false,
                        "remove", REMOVE_PHASES, loadRates(host.getContext(), "remove")),
                text(host.getContext(), R.string.gboard_patches_extended_dictionary_remove_failed),
                (progress, cancel) -> removeAll(host.getContext(), progress, includeUntracked));
    }

    /** Average size of one word-list line, used to size phases before the file is parsed. */
    private static final int ESTIMATED_BYTES_PER_ROW = 50;
    private static final List<PhasedEta.Phase> IMPORT_PHASES = java.util.Arrays.asList(
            PhasedEta.Phase.PARSE, PhasedEta.Phase.REPAIR, PhasedEta.Phase.RECONCILE,
            PhasedEta.Phase.DEDUPE,
            PhasedEta.Phase.INSERT, PhasedEta.Phase.STORE_WRITE);
    private static final List<PhasedEta.Phase> REMOVE_PHASES = java.util.Arrays.asList(
            PhasedEta.Phase.REPAIR, PhasedEta.Phase.RECONCILE, PhasedEta.Phase.DELETE);

    private static java.util.Map<PhasedEta.Phase, Double> loadRates(Context context,
            String jobKind) {
        try {
            return PhasedEta.loadRates(etaPreferences(context), jobKind);
        } catch (RuntimeException failure) {
            return java.util.Collections.emptyMap();
        }
    }

    private static android.content.SharedPreferences etaPreferences(Context context) {
        return context.getSharedPreferences(ManagedEntryStore.PREF_FILE, Context.MODE_PRIVATE);
    }

    static ExtendedDictionaryProgressDialog.Job currentJob() {
        return CURRENT_JOB.get();
    }

    static void runInBackground(GboardPatchesSettingsContract.FeatureHost host,
            ExtendedDictionaryProgressDialog.Job job, String failureMessage, Work work) {
        if (!CURRENT_JOB.compareAndSet(null, job)) {
            return;
        }
        job.attachedHost.set(host);
        GboardPatchesSettingsContract.showManagedDialog(host,
                ExtendedDictionaryProgressDialog.create(host.getContext(), job));
        Handler main = new Handler(Looper.getMainLooper());
        Context context = host.getContext();
        boolean[] outcome = {false};
        ExtendedDictionaryImporter.JobProgress progress = new ExtendedDictionaryImporter
                .JobProgress() {
            @Override
            public void expect(PhasedEta.Phase phase, long units) {
                job.eta.expect(phase, units);
            }

            @Override
            public void onProgress(PhasedEta.Phase phase, int done, int total) {
                job.onProgress(phase, done, total);
                main.post(job::render);
            }

            @Override
            public void succeeded() {
                outcome[0] = true;
            }
        };
        WORKER.execute(() -> {
            String message = runSafely(() -> work.run(progress, job.cancel), failureMessage);
            job.complete(outcome[0]);
            try {
                // Phases that ran to completion give the next job a device-specific rate.
                PhasedEta.saveRates(etaPreferences(context), job.kind,
                        job.eta.measuredRates());
            } catch (RuntimeException failure) {
                Log.w(TAG, "Could not store phase rates: " + failure.getClass().getName());
            }
            job.finished = true;
            CURRENT_JOB.set(null);
            main.post(() -> finish(host, job, message));
        });
    }

    private static void finish(GboardPatchesSettingsContract.FeatureHost host,
            ExtendedDictionaryProgressDialog.Job job, String message) {
        job.render();
        if (ExtendedDictionaryProgressDialog.isHostGone(host.getContext())) {
            Log.i(TAG, "Settings screen closed before the dictionary job finished");
            return;
        }
        try {
            GboardPatchesSettingsContract.showMessage(host, message);
            GboardPatchesSettingsContract.refresh(host);
        } catch (RuntimeException failure) {
            Log.w(TAG, "Could not report dictionary job result: " + failure.getClass().getName());
        }
    }

    /** The worker runs inside Gboard's main process, so nothing may escape it. */
    static String runSafely(Task task, String failureMessage) {
        try {
            return task.run();
        } catch (Throwable failure) {
            Log.w(TAG, "Dictionary task failed: " + failure.getClass().getName());
            return failureMessage;
        }
    }

    String importDocument(Context context, byte[] data) {
        return importDocument(context, data, ExtendedDictionaryImporter.JobProgress.only(
                PhasedEta.Phase.INSERT, (done, total) -> {
                }), new AtomicBoolean());
    }

    String importDocument(Context context, byte[] data,
            ExtendedDictionaryImporter.JobProgress progress, AtomicBoolean cancel) {
        List<WordListParser.Row> rows;
        try {
            // The ring's phase weights are fixed at the first progress sample, so every phase
            // gets its expected size now; row counts are estimated from the file size.
            long estimatedRows = data.length / ESTIMATED_BYTES_PER_ROW;
            progress.expect(PhasedEta.Phase.PARSE, data.length);
            progress.expect(PhasedEta.Phase.REPAIR, 0);
            progress.expect(PhasedEta.Phase.RECONCILE, Math.max(0, managedCount(context)));
            progress.expect(PhasedEta.Phase.DEDUPE, estimatedRows);
            progress.expect(PhasedEta.Phase.INSERT, estimatedRows);
            progress.expect(PhasedEta.Phase.STORE_WRITE, estimatedRows);
            rows = WordListParser.parse(data, progress.phase(PhasedEta.Phase.PARSE));
        } catch (WordListParser.ParseException failure) {
            return parseErrorMessage(context, failure);
        }
        if (rows.isEmpty()) {
            return text(context, R.string.gboard_patches_extended_dictionary_import_empty);
        }
        GboardPersonalDictionaryReflectionGateway gateway =
                GboardPersonalDictionaryReflectionGateway.open(context, gboardClassLoader);
        if (gateway == null) {
            return text(context, R.string.gboard_patches_extended_dictionary_unsupported_summary);
        }
        try (ManagedEntryStore store = ManagedEntryStore.open(context)) {
            ExtendedDictionaryImporter.ImportResult result =
                    ExtendedDictionaryImporter.importRows(gateway, store, rows, progress, cancel);
            Log.i(TAG, "Import rows=" + rows.size() + " inserted=" + result.inserted
                    + " skipped=" + result.skippedExisting + " failed=" + result.failed
                    + " skippedReading=" + result.skippedReading
                    + " rolledBack=" + result.rolledBack + " cancelled=" + result.cancelled);
            if (result.cancelled) {
                return text(context, R.string.gboard_patches_extended_dictionary_import_cancelled);
            }
            if (!result.rolledBack) {
                progress.succeeded();
                String done = GboardSettingsText.format(context,
                        R.string.gboard_patches_extended_dictionary_import_done,
                        result.inserted, result.skippedExisting, result.failed);
                if (result.skippedReading > 0) {
                    done += "\n" + GboardSettingsText.format(context,
                            R.string.gboard_patches_extended_dictionary_import_skipped_reading,
                            result.skippedReading);
                }
                if (result.unmatchedLanguage > 0) {
                    done += "\n" + GboardSettingsText.format(context,
                            R.string.gboard_patches_extended_dictionary_import_unmatched_language,
                            result.unmatchedLanguage);
                }
                if (result.forgotten > 0) {
                    done += "\n" + GboardSettingsText.format(context,
                            R.string.gboard_patches_extended_dictionary_import_forgotten,
                            result.forgotten);
                }
                return done + repairLine(context, result.repairedPos);
            }
            return result.rollbackLeftovers == 0
                    ? text(context, R.string.gboard_patches_extended_dictionary_import_rolled_back)
                    : GboardSettingsText.format(context,
                            R.string.gboard_patches_extended_dictionary_import_rollback_incomplete,
                            result.rollbackLeftovers);
        } catch (RuntimeException failure) {
            Log.w(TAG, "Import failed: " + failure.getClass().getName());
            return text(context, R.string.gboard_patches_extended_dictionary_import_failed);
        } finally {
            gateway.close();
        }
    }

    String removeAll(Context context) {
        return removeAll(context, (done, total) -> {
        });
    }

    String removeAll(Context context, ExtendedDictionaryImporter.Progress progress) {
        return removeAll(context, ExtendedDictionaryImporter.JobProgress.only(
                PhasedEta.Phase.DELETE, progress), false);
    }

    String removeAll(Context context, ExtendedDictionaryImporter.JobProgress progress,
            boolean includeUntracked) {
        int managed = Math.max(0, managedCount(context));
        progress.expect(PhasedEta.Phase.REPAIR, 0);
        progress.expect(PhasedEta.Phase.RECONCILE, managed);
        progress.expect(PhasedEta.Phase.DELETE, managed);
        GboardPersonalDictionaryReflectionGateway gateway =
                GboardPersonalDictionaryReflectionGateway.open(context, gboardClassLoader);
        if (gateway == null) {
            return text(context, R.string.gboard_patches_extended_dictionary_unsupported_summary);
        }
        try (ManagedEntryStore store = ManagedEntryStore.open(context)) {
            ExtendedDictionaryImporter.RemoveResult result =
                    ExtendedDictionaryImporter.removeAll(gateway, store, progress,
                            includeUntracked);
            Log.i(TAG, "Remove deleted=" + result.deleted + " forgotten=" + result.forgotten
                    + " failed=" + result.failed + " orphans=" + result.orphansDeleted);
            if (result.failed == 0) {
                progress.succeeded();
            }
            String done = GboardSettingsText.format(context,
                    R.string.gboard_patches_extended_dictionary_remove_done,
                    result.deleted, result.forgotten, result.failed);
            if (result.orphansDeleted > 0) {
                done += "\n" + GboardSettingsText.format(context,
                        R.string.gboard_patches_extended_dictionary_remove_orphans,
                        result.orphansDeleted);
            }
            return done + repairLine(context, result.repairedPos);
        } catch (RuntimeException failure) {
            Log.w(TAG, "Remove failed: " + failure.getClass().getName());
            return text(context, R.string.gboard_patches_extended_dictionary_remove_failed);
        } finally {
            gateway.close();
        }
    }

    /** Extra toast line after Gboard's own Restore was undone; empty when nothing changed. */
    private static String repairLine(Context context, int repaired) {
        return repaired == 0 ? "" : "\n" + GboardSettingsText.format(context,
                R.string.gboard_patches_extended_dictionary_repaired, repaired);
    }

    static String parseErrorMessage(Context context, WordListParser.ParseException failure) {
        int line = failure.lineNumber;
        return switch (failure.error) {
            case INVALID_ENCODING -> GboardSettingsText.format(context,
                    R.string.gboard_patches_extended_dictionary_error_encoding, line);
            case UNSUPPORTED_HEADER -> GboardSettingsText.format(context,
                    R.string.gboard_patches_extended_dictionary_error_header, line);
            case WRONG_COLUMN_COUNT -> GboardSettingsText.format(context,
                    R.string.gboard_patches_extended_dictionary_error_columns, line);
            case INVALID_LANGUAGE_TAG -> GboardSettingsText.format(context,
                    R.string.gboard_patches_extended_dictionary_error_language_tag, line);
            case FIELD_TOO_LONG -> GboardSettingsText.format(context,
                    R.string.gboard_patches_extended_dictionary_error_too_long, line,
                    WordListParser.MAX_FIELD_LENGTH);
            case TOO_MANY_ROWS -> GboardSettingsText.format(context,
                    R.string.gboard_patches_extended_dictionary_error_too_many,
                    WordListParser.MAX_ROWS_PER_IMPORT);
            case TOO_MANY_LINES -> GboardSettingsText.format(context,
                    R.string.gboard_patches_extended_dictionary_error_too_many_lines,
                    WordListParser.MAX_LINES);
            case LINE_TOO_LONG -> GboardSettingsText.format(context,
                    R.string.gboard_patches_extended_dictionary_error_line_too_long, line,
                    WordListParser.MAX_LINE_CHARS);
            case INPUT_TOO_LARGE -> GboardSettingsText.format(context,
                    R.string.gboard_patches_extended_dictionary_error_input_too_large,
                    WordListParser.MAX_INPUT_BYTES / (1024 * 1024));
            case UNREADABLE -> text(context,
                    R.string.gboard_patches_extended_dictionary_error_unreadable);
        };
    }

    private static String text(Context context, int resourceId) {
        return GboardSettingsText.get(context, resourceId);
    }

    interface Task {
        String run();
    }

    interface Work {
        String run(ExtendedDictionaryImporter.JobProgress progress, AtomicBoolean cancel);
    }
}
