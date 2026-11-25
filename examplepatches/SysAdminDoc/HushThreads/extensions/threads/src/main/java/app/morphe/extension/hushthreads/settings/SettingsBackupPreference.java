/*
 * Forked from https://github.com/SysAdminDoc/Hushfacebook at c15d4f79 (GPL-3.0),
 * modified for HushThreads (Threads), 2026.
 *
 * Forked from:
 * https://github.com/SysAdminDoc/hushfeed/blob/bcc57ee555f4346c4eb1cbdae9f6ca8a3fa6fef4/extensions/tiktok/src/main/java/app/morphe/extension/tiktok/settings/preference/SettingsBackupPreference.java
 * Copyright 2026 Hushfeed contributors (GPL-3.0).
 *
 * Modified for Hushfacebook (Facebook), 2026: two rows, Export settings and Import settings, on the
 * framework preference page inside Hushfacebook's settings dialog; an import is read and shown as a
 * preview of how many switches it changes before anything is written; no Reset or Undo.
 */
package app.morphe.extension.hushthreads.settings;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.ActivityNotFoundException;
import android.content.ContentResolver;
import android.content.Context;
import android.content.Intent;
import android.content.res.AssetFileDescriptor;
import android.database.Cursor;
import android.net.Uri;
import android.os.Bundle;
import android.os.CancellationSignal;
import android.os.Build;
import android.os.OperationCanceledException;
import android.preference.Preference;
import android.provider.OpenableColumns;
import android.view.View;

import androidx.annotation.Nullable;

import java.io.Closeable;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.lang.ref.WeakReference;
import java.nio.charset.StandardCharsets;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.CopyOnWriteArrayList;
import java.util.concurrent.atomic.AtomicReference;

import app.morphe.extension.hushthreads.theme.CustomFont;
import app.morphe.extension.shared.L10n;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.settings.Setting;
import app.morphe.extension.shared.settings.preference.AbstractPreferenceFragment;
import app.morphe.extension.shared.settings.preference.LogBufferManager;

/**
 * Export settings and Import settings, and the font file row for Custom font (#28).
 *
 * <p>Both open Android's file picker through {@link SettingsFilePicker}. The picker is an activity
 * of its own, so Android may rebuild Threads' activity behind it, and the settings dialog and its
 * page with it. Threads rebuilds without the framework's fragment state, so an answer addressed to
 * the page that asked would find no page; SettingsFilePicker takes it instead, and the newest page
 * takes the file when it's on screen. Without SettingsFilePicker in the manifest the page asks
 * itself, as it used to. Nothing about a request is kept on the page: the request code says which
 * row it was, and the file's address comes with the answer.
 *
 * <p>An import reads the file first and shows how many switches it changes. Nothing is written
 * until the person says so, and then everything is written in one commit. The preview is kept in
 * the page's saved state, so a rotation or a trip away from Threads brings it back.
 *
 * <p>The app holding a file opens, reads and writes it on a worker. The screen waits for it
 * {@link #timeoutMs} at most, then gives the rows back, cancels the open and closes the file.
 * Whatever that app does afterwards shows nothing and changes nothing. An export is read back, so
 * a file that won't import isn't called saved.
 *
 * <p>How a run ended is said twice: in a toast, and under the row until the next run starts.
 * Android 12 and newer cut a text toast at two lines, and a refusal, a longer translation or a
 * larger text size runs past that.
 */
@SuppressWarnings("deprecation") // Framework preferences are what the shared settings page builds on.
public class SettingsBackupPreference extends Preference {
    static final int EXPORT = 7311;
    static final int IMPORT = 7312;
    /** The font file row: a picked font is copied into Threads' files for Custom font. */
    static final int FONT = 7313;

    /** What the restart row counts for a font file kept while Custom font is on. */
    static final String FONT_FILE_CHANGE = "hushthreads_custom_font_file";

    /** What a settings file is saved as. */
    static final String MIME_TYPE = "application/json";

    /**
     * What an import offers to open. A provider that doesn't know .json files calls them text or
     * plain bytes, and a picker filtered to JSON alone greyed out a file saved there.
     */
    static final String[] OPENABLE_TYPES = {MIME_TYPE, "text/plain", "application/octet-stream"};

    /** How long the app holding a file gets to open, read or write it before the rows come back. A test sets its own. */
    static volatile long timeoutMs = 30_000L;

    /**
     * The run that holds the rows, or null. Only it may show a result or offer a preview, so a run
     * the screen stopped waiting for can't announce anything or lead to an import when it ends.
     */
    private static final AtomicReference<Run> OWNER = new AtomicReference<>();

    /**
     * A run the screen stopped waiting for. Until its file's app answers it holds a worker, so no
     * other run starts: stuck apps can't take the shared pool, and a second write can't reach a
     * file the first may still be writing.
     */
    @Nullable
    private static volatile Run stalled;

    /** One read, write or import, with what the screen needs to stop waiting for it. */
    private static final class Run {
        /** The row it was started from, which says how it ended. */
        final int action;
        /** Reaches the file's app while it opens the file, for an app that honours it. */
        final CancellationSignal cancel = new CancellationSignal();
        /** The file the worker has open, closed when the screen stops waiting. */
        @Nullable
        volatile Closeable open;
        /** The worker has returned. */
        volatile boolean ended;

        Run(int action) {
            this.action = action;
        }

        /** Keeps [file] where the screen can close it, or closes it now when the screen has stopped waiting. */
        AssetFileDescriptor hold(@Nullable AssetFileDescriptor file) throws IOException {
            if (file == null) throw new FileNotFoundException("No file");
            open = file;
            if (cancel.isCanceled()) {
                file.close();
                throw new OperationCanceledException();
            }
            return file;
        }
    }

    /** The rows on the page right now, so a run can take them all out of reach. */
    private static final List<WeakReference<SettingsBackupPreference>> ROWS = new CopyOnWriteArrayList<>();

    /** The action running and the line its row shows, so a row built during a run shows it too. */
    private static volatile int runningAction;
    @Nullable
    private static volatile String runningLine;

    /**
     * The newest page, which a file read finishes on. A page rebuilt while the file was being read
     * is a new one, and the old one can no longer show anything.
     */
    private static WeakReference<HushThreadsPreferenceFragment> latestPage = new WeakReference<>(null);

    private final HushThreadsPreferenceFragment owner;
    private final int rowAction;
    private final CharSequence restingSummary;
    /** The operation or waiting explanation this row shows while a file action runs. */
    @Nullable
    private String busyLine;

    SettingsBackupPreference(HushThreadsPreferenceFragment page, Context context, int action,
                             CharSequence title, CharSequence summary) {
        super(context);
        owner = page;
        rowAction = action;
        restingSummary = summary;
        setKey(action == EXPORT ? "action_export_settings" : action == IMPORT ? "action_import_settings" : "action_font_file");
        setPersistent(false);
        setTitle(title);
        setOnPreferenceClickListener(preference -> {
            // Rows are out of reach while a run is going, so this is only the race between a tap
            // and that. A second tap before the picker covers the page opens nothing.
            if (OWNER.get() == null && !asking && !stillStalled()) pickFile(page, action);
            return true;
        });
        latestPage = new WeakReference<>(page);
        ROWS.add(new WeakReference<>(this));
        int running = runningAction;
        // A page rebuilt after a run still shows how it ended.
        if (running != 0) showBusy(running, runningLine);
        else showResting();
    }

    /** A readable, sortable name for the file, stamped in UTC like the diagnostic report. */
    static String suggestedExportName() {
        return "hushthreads-settings-" + LogBufferManager.fileTimestamp() + ".json";
    }

    private static void pickFile(HushThreadsPreferenceFragment page, int action) {
        Intent intent = new Intent(action == EXPORT ? Intent.ACTION_CREATE_DOCUMENT : Intent.ACTION_OPEN_DOCUMENT)
                .addCategory(Intent.CATEGORY_OPENABLE);
        if (action == EXPORT) {
            intent.setType(MIME_TYPE).putExtra(Intent.EXTRA_TITLE, suggestedExportName());
        } else if (action == FONT) {
            // Apps call font files many things, and a picker filtered by type greys out the rest.
            // Whether it's a font is settled by loading it.
            intent.setType("*/*");
        } else {
            intent.setType("*/*").putExtra(Intent.EXTRA_MIME_TYPES, OPENABLE_TYPES);
        }
        // An older pick that never reached a page is let go: this one replaces it.
        dropPicked(null);
        Activity activity = page.getActivity();
        Intent around = activity == null ? null : SettingsFilePicker.around(activity, intent, action);
        asking = true;
        try {
            if (around != null) page.startActivity(around);
            else page.startActivityForResult(intent, action);
        } catch (RuntimeException error) {
            couldNotPick(action, error);
        }
    }

    static boolean isFileAction(int action) {
        return action == EXPORT || action == IMPORT || action == FONT;
    }

    /**
     * A picker was asked for and hasn't answered. Two quick taps used to open two, and the second
     * answer let go of the access the first had just kept when both named the same file. Ends with
     * the answer, a picker that didn't open, or the page back on screen, since no picker covers it then.
     */
    private static boolean asking;

    /** The picker didn't open, from the page or from {@link SettingsFilePicker}. */
    static void couldNotPick(int action, RuntimeException error) {
        asking = false;
        if (error instanceof ActivityNotFoundException) {
            Logger.printInfo(() -> "No file picker for the settings file");
            tell(action, L10n.t("This phone has no file picker, so there's no way to choose a file here."));
        } else {
            Logger.printInfo(() -> "Could not open the file picker: " + error.getClass().getSimpleName());
            tell(action, L10n.t("Couldn't open the file picker. Try again."));
        }
    }

    /**
     * A picker's answer, from the page's onActivityResult, when the page asked from its own
     * fragment because {@link SettingsFilePicker} isn't in Threads' manifest.
     *
     * @return whether the request was one of these rows'.
     */
    static boolean onResult(HushThreadsPreferenceFragment page, int request, int result, @Nullable Intent data) {
        if (!isFileAction(request)) return false;
        asking = false;
        Uri uri = result == Activity.RESULT_OK && data != null ? data.getData() : null;
        if (uri == null) return true; // Cancelled: nothing to do and nothing to say.
        if (request == EXPORT) export(page, uri, 0);
        else if (request == FONT) keepFont(page, uri, 0);
        else readForPreview(page, uri, 0);
        return true;
    }

    /** A file picked through {@link SettingsFilePicker} that no page has taken yet, with its row and lasting grant. */
    @Nullable
    private static Uri picked;
    private static int pickedAction;
    private static int pickedGrant;

    /** How long a picked file waits for the settings to be on screen again before it's let go. A test sets its own. */
    static long pickKeptMs = 120_000L;

    /**
     * {@link SettingsFilePicker}'s answer, holding [grant] on [file] when it's not zero. The newest
     * page takes the file now if it's on screen, or when it next resumes: after the picker
     * that's the page Threads rebuilt, if it rebuilt one. Main thread.
     */
    static void picked(int action, @Nullable Uri file, int grant) {
        asking = false;
        if (file == null) return; // Cancelled: nothing to do and nothing to say.
        if (!isFileAction(action)) {
            letGo(Utils.getContext(), file, grant);
            return;
        }
        dropPicked(file);
        picked = file;
        pickedAction = action;
        pickedGrant = grant;
        HushThreadsPreferenceFragment page = latestPage.get();
        if (page != null && page.isResumed()) {
            takePicked(page);
            return;
        }
        // The settings didn't come back, so the file isn't held on to forever.
        Utils.runOnMainThreadDelayed(() -> {
            if (picked != file) return;
            Logger.printInfo(() -> "Settings file: no settings page took the picked file");
            dropPicked(null);
        }, pickKeptMs);
    }

    private static void takePicked(HushThreadsPreferenceFragment page) {
        Uri file = picked;
        if (file == null) return;
        picked = null;
        if (pickedAction == EXPORT) export(page, file, pickedGrant);
        else if (pickedAction == FONT) keepFont(page, file, pickedGrant);
        else readForPreview(page, file, pickedGrant);
    }

    /**
     * Lets go of a pick no page took, unless it's [unless]: Android keeps one lasting grant per
     * file, so letting go of an older pick of the same file would end the one just kept.
     */
    private static void dropPicked(@Nullable Uri unless) {
        Uri file = picked;
        picked = null;
        if (file != null && !file.equals(unless)) letGo(Utils.getContext(), file, pickedGrant);
    }

    /** No picker asked for and no pick waiting, so a test that stopped early leaves none behind. For tests. */
    static void forgetPickForTests() {
        asking = false;
        dropPicked(null);
    }

    /** Lets go of the lasting [grant] {@link SettingsFilePicker} took on [file], if it took one. */
    private static void letGo(@Nullable Context context, Uri file, int grant) {
        SettingsFileGrants.release(context, file, grant);
    }

    private static void export(HushThreadsPreferenceFragment page, Uri uri, int grant) {
        Context context = appContext(page);
        Run run = start(EXPORT, L10n.t("Saving the settings file"));
        if (run == null) {
            letGo(context, uri, grant);
            return;
        }
        boolean accepted = Utils.runOnBackgroundThread(() -> {
            String said = null;
            try {
                said = write(context.getContentResolver(), uri, SettingsBackup.create().getBytes(StandardCharsets.UTF_8), run);
            } catch (Exception error) {
                Logger.printInfo(() -> "Settings export failed: " + error.getClass().getSimpleName());
                said = L10n.t("Couldn't save the settings file. Try again.");
            } finally {
                letGo(context, uri, grant);
                String result = said;
                ended(run, result == null ? null : () -> tell(EXPORT, result));
            }
        });
        if (!accepted) {
            letGo(context, uri, grant);
            notStarted(run);
        } else watch(run, L10n.t("The app holding the settings file is taking too long, so HushThreads stopped waiting. "
                + "That app may still finish saving it, so check the file before you rely on it."));
    }

    /**
     * Writes over whatever is there, reads the file back and says how that went. "wt" truncates a
     * file being replaced; an app that turns the mode down gets "w", which can leave old bytes past
     * the new end. The read back catches that and anything else that keeps the file from importing.
     * An app that won't hand the file back leaves it unchecked, and the answer says so.
     */
    private static String write(ContentResolver resolver, Uri uri, byte[] bytes, Run run) throws IOException {
        AssetFileDescriptor file;
        try {
            file = resolver.openAssetFileDescriptor(uri, "wt", run.cancel);
        } catch (IllegalArgumentException | UnsupportedOperationException | FileNotFoundException unsupported) {
            file = resolver.openAssetFileDescriptor(uri, "w", run.cancel);
        }
        try (AssetFileDescriptor held = run.hold(file); OutputStream stream = held.createOutputStream()) {
            stream.write(bytes);
        }
        String back;
        try {
            back = read(resolver, uri, run);
        } catch (SettingsBackup.Rejected refused) {
            if (refused.reason == SettingsBackup.Reason.UNREADABLE) {
                return L10n.t("Settings exported. The app holding the file wouldn't let HushThreads read it back, "
                        + "so it wasn't checked.");
            }
            back = null;
        }
        if (new String(bytes, StandardCharsets.UTF_8).equals(back)) return L10n.t("Settings exported.");
        Logger.printInfo(() -> "Settings export read back differently");
        return L10n.t("The settings file was saved, but it doesn't read back as what was written. "
                + "Save it again as a new file.");
    }

    private static void readForPreview(HushThreadsPreferenceFragment page, Uri uri, int grant) {
        Context context = appContext(page);
        Run run = start(IMPORT, L10n.t("Reading the settings file"));
        if (run == null) {
            letGo(context, uri, grant);
            return;
        }
        boolean accepted = Utils.runOnBackgroundThread(() -> {
            Runnable result = null;
            try {
                SettingsBackup.Snapshot snapshot = SettingsBackup.parse(read(context.getContentResolver(), uri, run));
                result = () -> offer(snapshot);
            } catch (SettingsBackup.Rejected refused) {
                Logger.printInfo(() -> "Settings file refused: " + refused.reason);
                String said = refusal(refused.reason);
                result = () -> tell(IMPORT, said);
            } finally {
                // The import itself works from what was read, so the file is done with.
                letGo(context, uri, grant);
                ended(run, result);
            }
        });
        if (!accepted) {
            letGo(context, uri, grant);
            notStarted(run);
        } else watch(run, L10n.t("The app holding that file is taking too long, so HushThreads stopped waiting. "
                + "Nothing was changed."));
    }

    /**
     * Copies a picked font into Threads' files for Custom font, once Android loads it. A font kept
     * while the switch is on owes a restart, which the restart row counts.
     */
    private static void keepFont(HushThreadsPreferenceFragment page, Uri uri, int grant) {
        Context context = appContext(page);
        Run run = start(FONT, L10n.t("Copying the font file"));
        if (run == null) {
            letGo(context, uri, grant);
            return;
        }
        boolean accepted = Utils.runOnBackgroundThread(() -> {
            String said = null;
            boolean kept = false;
            try {
                ContentResolver resolver = context.getContentResolver();
                String name = displayName(resolver, uri);
                CustomFont.Outcome outcome;
                try (InputStream stream = run.hold(resolver.openAssetFileDescriptor(uri, "r", run.cancel)).createInputStream()) {
                    outcome = CustomFont.keep(context, stream, name, run.cancel);
                }
                kept = outcome == CustomFont.Outcome.KEPT;
                said = fontOutcome(outcome);
            } catch (Exception error) {
                // The class only: an app's message can carry the document's name or address.
                Logger.printInfo(() -> "Font file not read: " + error.getClass().getSimpleName());
                said = L10n.t("Couldn't open that file. Nothing was changed.");
            } finally {
                letGo(context, uri, grant);
                String result = said;
                boolean owed = kept;
                ended(run, () -> {
                    if (owed) fontKept();
                    if (result != null) tell(FONT, result);
                });
            }
        });
        if (!accepted) {
            letGo(context, uri, grant);
            notStarted(run);
        } else watch(run, L10n.t("The app holding that file is taking too long, so HushThreads stopped waiting. "
                + "Nothing was changed."));
    }

    /** One sentence per way a picked font can go. */
    static String fontOutcome(CustomFont.Outcome outcome) {
        switch (outcome) {
            case KEPT:
                return Settings.CUSTOM_FONT.get() ? L10n.t("Font file saved. Restart Threads to see it.")
                        : L10n.t("Font file saved. Turn on Custom font to use it.");
            case TOO_LARGE:
                return L10n.t("That file is too large to be a font. Nothing was changed.");
            case NOT_A_FONT:
                return L10n.t("That isn't a font file Android can use. Nothing was changed.");
            default:
                return L10n.t("Couldn't open that file. Nothing was changed.");
        }
    }

    /** A new font is kept: with the switch on, the next start shows it, so a restart is owed. Main thread. */
    private static void fontKept() {
        if (!Settings.CUSTOM_FONT.get()) return;
        AbstractPreferenceFragment.restartPending.add(FONT_FILE_CHANGE);
        HushThreadsPreferenceFragment page = latestPage.get();
        if (page != null && page.isAdded()) page.onRestartPendingChanged();
    }

    /** The name the file's app gives it, or null when it gives none. */
    @Nullable
    private static String displayName(ContentResolver resolver, Uri uri) {
        try (Cursor cursor = resolver.query(uri, new String[] {OpenableColumns.DISPLAY_NAME}, null, null, null)) {
            if (cursor == null || !cursor.moveToFirst() || cursor.isNull(0)) return null;
            return cursor.getString(0);
        } catch (RuntimeException unanswered) {
            return null;
        }
    }

    /** The file's text, opened through its app with [run]'s cancel signal and held where the screen can close it. */
    private static String read(ContentResolver resolver, Uri uri, Run run) throws SettingsBackup.Rejected {
        InputStream stream;
        try {
            stream = run.hold(resolver.openAssetFileDescriptor(uri, "r", run.cancel)).createInputStream();
        } catch (IOException | RuntimeException error) {
            closeQuietly(run.open);
            // The class only: an app's message can carry the document's name or address.
            throw new SettingsBackup.Rejected(SettingsBackup.Reason.UNREADABLE, error.getClass().getSimpleName());
        }
        return SettingsBackup.read(stream);
    }

    /** One sentence per refusal, so a cut-off download and a newer version's file don't read the same. */
    static String refusal(SettingsBackup.Reason reason) {
        switch (reason) {
            case SIZE:
                return L10n.t("That file is too large to be a settings file. Nothing was changed.");
            case ENCODING:
                return L10n.t("That file isn't readable text, so it may have been damaged on the way. Nothing was changed.");
            case DAMAGED:
                return L10n.t("That settings file is damaged or only partly downloaded. Nothing was changed.");
            case DUPLICATE:
                return L10n.t("That file lists a setting twice, so there's no telling which value to use. Nothing was changed.");
            case FORMAT:
                return L10n.t("That isn't a HushThreads settings file. Nothing was changed.");
            case SCHEMA:
                return L10n.t("That settings file was written by a newer HushThreads than this one. Nothing was changed.");
            case VALUE:
                return L10n.t("That settings file holds a value HushThreads can't read. Nothing was changed.");
            default:
                return L10n.t("Couldn't open that file. Nothing was changed.");
        }
    }

    /** Hands a read file to the page on screen, which shows the preview now or when it resumes. */
    private static void offer(SettingsBackup.Snapshot snapshot) {
        HushThreadsPreferenceFragment page = latestPage.get();
        if (page == null || !page.isAdded()) {
            // The settings screen was closed while the file was read.
            Logger.printInfo(() -> "Settings file read with no settings page left to preview it on");
            return;
        }
        page.pendingImport = snapshot.toBundle();
        if (page.isResumed()) showPreview(page);
    }

    /**
     * Called when the page resumes: it takes a file picked while it was covered, and a preview
     * waiting on an answer is shown again.
     */
    static void onPageResumed(HushThreadsPreferenceFragment page) {
        asking = false;
        takePicked(page);
        if (page.pendingImport != null) showPreview(page);
    }

    /**
     * Takes the preview off the screen without answering it, when the page's view goes. A page
     * rebuilt from the saved state shows it again.
     */
    static void closePreview(HushThreadsPreferenceFragment page) {
        AlertDialog shown = page.importPreview;
        page.importPreview = null;
        if (shown == null) return;
        shown.setOnCancelListener(null);
        shown.dismiss();
    }

    /** How many switches the waiting file changes, and what's in it that this build doesn't know. */
    static void showPreview(HushThreadsPreferenceFragment page) {
        if (page.importPreview != null) return;
        SettingsBackup.Snapshot snapshot = SettingsBackup.Snapshot.fromBundle(page.pendingImport);
        Activity activity = page.getActivity();
        if (snapshot == null || activity == null) {
            page.pendingImport = null;
            return;
        }
        int switches = snapshot.switchChanges();
        String message = switches == 0
                ? L10n.t("Your switches already match that file, so nothing will change.")
                : L10n.quantity(switches, "%1$d switch will change.", "%1$d switches will change.", switches);
        if (snapshot.unknown > 0) {
            message += "\n\n" + L10n.quantity(snapshot.unknown,
                    "%1$d item in that file isn't a setting this version of HushThreads knows, so it'll be left out.",
                    "%1$d items in that file aren't settings this version of HushThreads knows, so they'll be left out.",
                    snapshot.unknown);
        }
        AlertDialog.Builder builder = new AlertDialog.Builder(HushThreadsPreferenceFragment.themed(activity))
                .setTitle(L10n.t("Import settings"))
                .setMessage(message)
                .setOnCancelListener(dialog -> answered(page));
        if (switches == 0) {
            builder.setPositiveButton(L10n.t("OK"), (dialog, which) -> answered(page));
        } else {
            builder.setPositiveButton(L10n.t("Import"), (dialog, which) -> {
                Bundle chosen = page.pendingImport;
                answered(page);
                apply(page, chosen);
            });
            builder.setNegativeButton(L10n.t("Cancel"), (dialog, which) -> answered(page));
        }
        page.importPreview = builder.show();
        ScreenColors.dialog(page.importPreview);
    }

    private static void answered(HushThreadsPreferenceFragment page) {
        page.pendingImport = null;
        page.importPreview = null;
    }

    private static void apply(HushThreadsPreferenceFragment page, @Nullable Bundle chosen) {
        SettingsBackup.Snapshot snapshot = SettingsBackup.Snapshot.fromBundle(chosen);
        if (snapshot == null) return;
        Run run = start(IMPORT, L10n.t("Importing settings"));
        if (run == null) return;
        // The page shows what the store now holds rather than reading its own switches back into it.
        AbstractPreferenceFragment.settingImportInProgress = true;
        boolean accepted = false;
        try {
            // Counted before the write, which makes every change match the store.
            String done = importedMessage(snapshot.switchChanges());
            // What each switch the file changes holds now, to measure the restart it owes against.
            Map<Setting<?>, Object> before = new LinkedHashMap<>();
            for (Setting<?> setting : snapshot.changes().keySet()) before.put(setting, setting.savedValue());
            accepted = Utils.runOnBackgroundThread(() -> {
                String said = null;
                try {
                    SettingsBackup.apply(snapshot);
                    said = done;
                } catch (SettingsBackup.ApplyFailed failure) {
                    Logger.printInfo(() -> "Settings import failed: " + failure.getMessage()
                            + (failure.rolledBack ? ", rolled back" : ", not rolled back"));
                    said = failure.rolledBack
                            ? L10n.t("Couldn't import the settings. Nothing was changed.")
                            : L10n.t("Couldn't import the settings, and couldn't put back the ones you had. "
                                    + "Check the switches on this screen.");
                } finally {
                    String result = said;
                    Utils.runOnMainThread(() -> {
                        AbstractPreferenceFragment.settingImportInProgress = false;
                        finish(run);
                        // First, so nothing below can keep the person from hearing how it went.
                        if (result != null) tell(IMPORT, result);
                        // An imported switch that waits for a restart owes one like a flipped one
                        // does. Measured against the store, so a failed import owes what it left.
                        for (Map.Entry<Setting<?>, Object> entry : before.entrySet()) {
                            AbstractPreferenceFragment.recordRestartPending(entry.getKey(), entry.getValue());
                        }
                        HushThreadsPreferenceFragment current = latestPage.get();
                        if (current != null && current.isAdded()) {
                            current.refreshSwitches();
                            current.onRestartPendingChanged();
                        }
                    });
                }
            });
        } catch (RuntimeException error) {
            Logger.printInfo(() -> "Settings import didn't start: " + error.getClass().getSimpleName());
        } finally {
            // This path has no wait that runs out, so nothing else would give the rows back.
            if (!accepted) {
                AbstractPreferenceFragment.settingImportInProgress = false;
                notStarted(run);
            }
        }
    }

    /** What an import says when it's done: how many switches changed. */
    static String importedMessage(int switches) {
        return switches == 0 ? L10n.t("Settings imported.") : L10n.quantity(switches,
                "Settings imported. %1$d switch changed.", "Settings imported. %1$d switches changed.", switches);
    }

    @Nullable
    private static Context appContext(HushThreadsPreferenceFragment page) {
        Activity activity = page.getActivity();
        return activity != null ? activity.getApplicationContext() : Utils.getContext();
    }

    /** Claims the rows for one run, or says why not. */
    @Nullable
    private static Run start(int action, String line) {
        if (stillStalled()) return null;
        Run run = new Run(action);
        if (!OWNER.compareAndSet(null, run)) {
            // Toast only, like the other refusals to start: the rows keep how the last run ended.
            Utils.showToastLong(L10n.t("Couldn't start that. Try again in a moment."));
            return null;
        }
        // The last run's outcome is old news once another starts.
        HushThreadsPreferenceFragment page = latestPage.get();
        if (page != null) page.backupOutcome = null;
        runningAction = action;
        runningLine = line;
        setRowsBusy(action, line);
        return run;
    }

    /** Gives the rows back, if [run] still holds them. */
    private static boolean finish(Run run) {
        if (!OWNER.compareAndSet(run, null)) return false;
        runningAction = 0;
        runningLine = null;
        setRowsBusy(0, null);
        return true;
    }

    /** The worker queue was full, so nothing ran: the rows come back and the person hears why. */
    private static void notStarted(Run run) {
        run.ended = true;
        finish(run);
        Utils.showToastLong(L10n.t("Couldn't start that. Try again in a moment."));
    }

    /**
     * A file run's worker has returned. The rows come back and [result] runs, unless the screen
     * already stopped waiting for it: then it says nothing and offers nothing.
     */
    private static void ended(Run run, @Nullable Runnable result) {
        run.ended = true;
        Utils.runOnMainThread(() -> {
            if (!finish(run)) {
                Logger.printInfo(() -> "Settings file: the app answered after the screen stopped waiting");
                return;
            }
            if (result != null) result.run();
        });
    }

    /**
     * After {@link #timeoutMs} the rows come back if [run] still holds them, the open is cancelled
     * through the file's app and the file is closed. An app can ignore both, so [message] says only
     * that the screen stopped waiting, never that the app stopped.
     */
    private static void watch(Run run, String message) {
        Utils.runOnMainThreadDelayed(() -> {
            if (!finish(run)) return;
            if (!run.ended) stalled = run;
            run.cancel.cancel();
            Closeable open = run.open;
            // Closing can wait on the app too, so not on the main thread.
            if (open != null) new Thread(() -> closeQuietly(open), "hushthreads-settings-file").start();
            Logger.printInfo(() -> "Settings file: stopped waiting on the app holding it");
            tell(run.action, message);
        }, timeoutMs);
    }

    /**
     * Says so, and answers true, while a run the screen stopped waiting for still holds a worker.
     * A toast only: under the row, it would outlast the stall it describes, and the stalled run's
     * own warning stays there.
     */
    private static boolean stillStalled() {
        Run held = stalled;
        if (held == null || held.ended) return false;
        Utils.showToastLong(L10n.t("The app holding the last settings file still hasn't answered. Try again later."));
        return true;
    }

    /**
     * Says how [action]'s run ended in a toast, and under its row on the newest page until another
     * run starts. Main thread only.
     */
    private static void tell(int action, String message) {
        Utils.showToastLong(message);
        HushThreadsPreferenceFragment page = latestPage.get();
        if (page == null) return;
        page.backupOutcomeAction = action;
        page.backupOutcome = message;
        for (WeakReference<SettingsBackupPreference> held : ROWS) {
            SettingsBackupPreference row = held.get();
            // A busy row keeps its explanation, and shows this when the rows come back.
            if (row != null && row.busyLine == null) row.showResting();
        }
    }

    private static void closeQuietly(@Nullable Closeable open) {
        if (open == null) return;
        try {
            open.close();
        } catch (IOException | RuntimeException ignored) {
            // Nothing more to do with a file that won't close.
        }
    }

    /**
     * Takes both rows out of reach while one runs. The acting row names the operation, and the
     * other explains the wait. With a zero action and no line, both regain their own summaries.
     */
    static void setRowsBusy(int action, @Nullable String line) {
        for (WeakReference<SettingsBackupPreference> held : ROWS) {
            SettingsBackupPreference row = held.get();
            if (row == null) {
                ROWS.remove(held);
                continue;
            }
            if (line == null) row.showResting();
            else row.showBusy(action, line);
        }
    }

    private void showBusy(int action, @Nullable String line) {
        busyLine = rowAction == action ? line
                : L10n.f("%1$s. This action will be available when it finishes.", line);
        setEnabled(false);
        setSummary(busyLine);
    }

    /** Usable again, under how this row's last run ended, or its own summary. */
    private void showResting() {
        busyLine = null;
        setEnabled(true);
        String said = owner.backupOutcomeAction == rowAction ? owner.backupOutcome : null;
        setSummary(said != null ? said : restingSummary);
    }

    @Override
    protected void onBindView(View view) {
        super.onBindView(view);
        // A screen reader hears the row as unavailable, and this says why. Older versions read the
        // summary, which shows the same line.
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) view.setStateDescription(busyLine);
    }
}
