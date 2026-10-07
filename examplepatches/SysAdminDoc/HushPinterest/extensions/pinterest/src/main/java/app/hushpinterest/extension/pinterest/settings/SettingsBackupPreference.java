/*
 * Forked from https://github.com/SysAdminDoc/HushTelegram at 8c54a1d (GPL-3.0),
 * modified for HushPinterest (Pinterest), 2026.
 *
 * Forked from https://github.com/SysAdminDoc/HushThreads at b141524 (GPL-3.0),
 * modified for HushTelegram (Telegram), 2026.
 *
 * Forked from https://github.com/SysAdminDoc/Hushfacebook at c15d4f79 (GPL-3.0),
 * modified for HushThreads (Threads), 2026.
 *
 * Forked from:
 * https://github.com/SysAdminDoc/hushfeed/blob/bcc57ee555f4346c4eb1cbdae9f6ca8a3fa6fef4/extensions/tiktok/src/main/java/app/hushpinterest/extension/tiktok/settings/preference/SettingsBackupPreference.java
 * Copyright 2026 Hushfeed contributors (GPL-3.0).
 *
 * Modified for Hushfacebook (Facebook), 2026: two rows, Export settings and Import settings, on the
 * framework preference page inside Hushfacebook's settings dialog; an import is read and shown as a
 * preview of named switch changes before anything is written, with one-step Undo after import.
 * Modified for HushPinterest (Pinterest), 2026: named before/after review and a nonmodal one-step
 * Undo row that expires when a later saved-switch edit would be overwritten.
 */
package app.hushpinterest.extension.pinterest.settings;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.ActivityNotFoundException;
import android.content.ContentResolver;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.res.AssetFileDescriptor;
import android.net.Uri;
import android.os.Bundle;
import android.os.CancellationSignal;
import android.os.Build;
import android.os.OperationCanceledException;
import android.preference.Preference;
import android.view.View;

import androidx.annotation.Nullable;

import java.io.Closeable;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.lang.ref.WeakReference;
import java.nio.charset.StandardCharsets;
import java.util.List;
import java.util.Map;
import java.util.concurrent.CopyOnWriteArrayList;
import java.util.concurrent.atomic.AtomicReference;

import app.hushpinterest.extension.shared.L10n;
import app.hushpinterest.extension.shared.Logger;
import app.hushpinterest.extension.shared.Utils;
import app.hushpinterest.extension.shared.settings.BooleanSetting;
import app.hushpinterest.extension.shared.settings.Setting;
import app.hushpinterest.extension.shared.settings.preference.AbstractPreferenceFragment;
import app.hushpinterest.extension.shared.settings.preference.ImmediateAction;
import app.hushpinterest.extension.shared.settings.preference.LogBufferManager;

/**
 * Export settings, Import settings and Undo import.
 *
 * <p>Export and Import open Android's file picker from the settings page. The picker is an activity of its
 * own, so Android may rebuild Pinterest's activity behind it, and the settings dialog and its page
 * with it. The result still reaches the page: Android hands it to the fragment the request came
 * from by the name the framework gave it, and a rebuilt page is given the same one. So nothing
 * about a request is kept on the page. Its code says which it was, and the file's address comes
 * with the result.
 *
 * <p>An import reads the file first and shows each saved-switch change by name. Nothing is written
 * until the person says so, and then everything is written in one commit. The preview is kept in
 * the page's saved state, so a rotation or a trip away from Pinterest brings it back.
 *
 * <p>The app holding a file opens, reads and writes it on a worker. The screen waits for it
 * {@link #timeoutMs} at most, then gives the rows back, cancels the open and closes the file.
 * Whatever that app does afterwards shows nothing and changes nothing. An export is read back, so
 * a file that won't import isn't called saved.
 */
@SuppressWarnings("deprecation") // Framework preferences are what the shared settings page builds on.
public class SettingsBackupPreference extends Preference implements ImmediateAction {
    static final int EXPORT = 7311;
    static final int IMPORT = 7312;
    static final int UNDO = 7313;

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
        /** Reaches the file's app while it opens the file, for an app that honours it. */
        final CancellationSignal cancel = new CancellationSignal();
        /** The file the worker has open, closed when the screen stops waiting. */
        @Nullable
        volatile Closeable open;
        /** The worker has returned. */
        volatile boolean ended;

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
    private static WeakReference<HushPinterestPreferenceFragment> latestPage = new WeakReference<>(null);

    @Nullable private static SharedPreferences observedStore;
    private static final SharedPreferences.OnSharedPreferenceChangeListener undoListener = (store, key) -> {
        if (key != null && SettingsBackup.ALLOWLIST.stream().noneMatch(setting -> setting.key.equals(key))) return;
        Utils.runOnMainThread(() -> {
            // Review successful saved revisions after the write and any rollback finish.
            if (OWNER.get() == null) setRowsBusy(0, null);
        });
    };

    private final int rowAction;
    private final CharSequence restingSummary;
    /** The line this row shows while it's the one running, else null. */
    @Nullable
    private String busyLine;

    SettingsBackupPreference(HushPinterestPreferenceFragment page, Context context, int action,
                             CharSequence title, CharSequence summary) {
        super(context);
        rowAction = action;
        restingSummary = summary;
        switch (action) {
            case EXPORT: setKey("action_export_settings"); break;
            case IMPORT: setKey("action_import_settings"); break;
            case UNDO: setKey("action_undo_import"); break;
            default: throw new IllegalArgumentException("Unknown backup action");
        }
        setPersistent(false);
        setTitle(title);
        setSummary(summary);
        setOnPreferenceClickListener(preference -> {
            // Rows are out of reach while a run is going, so this is only the race between a tap
            // and that.
            if (OWNER.get() == null && !stillStalled()) {
                if (action == UNDO) undo();
                else pickFile(page, action);
            }
            return true;
        });
        latestPage = new WeakReference<>(page);
        ROWS.add(new WeakReference<>(this));
        observeUndo();
        int running = runningAction;
        if (running != 0) showBusy(running, runningLine);
        else showResting();
    }

    @Override public boolean actsOnTap() { return rowAction == UNDO; }

    private static void observeUndo() {
        SharedPreferences current = Setting.preferences.preferences;
        if (observedStore == current) return;
        if (observedStore != null) observedStore.unregisterOnSharedPreferenceChangeListener(undoListener);
        observedStore = current;
        current.registerOnSharedPreferenceChangeListener(undoListener);
    }

    /** A readable, sortable name for the file, stamped in UTC like the diagnostic report. */
    static String suggestedExportName() {
        return "hushpinterest-settings-" + LogBufferManager.fileTimestamp() + ".json";
    }

    private static void pickFile(HushPinterestPreferenceFragment page, int action) {
        Intent intent = new Intent(action == EXPORT ? Intent.ACTION_CREATE_DOCUMENT : Intent.ACTION_OPEN_DOCUMENT)
                .addCategory(Intent.CATEGORY_OPENABLE);
        if (action == EXPORT) {
            intent.setType(MIME_TYPE).putExtra(Intent.EXTRA_TITLE, suggestedExportName());
        } else {
            intent.setType("*/*").putExtra(Intent.EXTRA_MIME_TYPES, OPENABLE_TYPES);
        }
        try {
            page.startActivityForResult(intent, action);
        } catch (ActivityNotFoundException missing) {
            Logger.printInfo(() -> "No file picker for the settings file");
            Utils.showToastLong(L10n.t("This phone has no file picker, so there's no way to choose a file here."));
        } catch (RuntimeException error) {
            Logger.printInfo(() -> "Could not open the file picker: " + error.getClass().getSimpleName());
            Utils.showToastLong(L10n.t("Couldn't open the file picker. Try again."));
        }
    }

    /**
     * A picker's answer, from the page's onActivityResult.
     *
     * @return whether the request was one of these rows'.
     */
    static boolean onResult(HushPinterestPreferenceFragment page, int request, int result, @Nullable Intent data) {
        if (request != EXPORT && request != IMPORT) return false;
        Uri uri = result == Activity.RESULT_OK && data != null ? data.getData() : null;
        if (uri == null) return true; // Cancelled: nothing to do and nothing to say.
        if (request == EXPORT) export(page, uri);
        else readForPreview(page, uri);
        return true;
    }

    private static void export(HushPinterestPreferenceFragment page, Uri uri) {
        Context context = appContext(page);
        Run run = start(EXPORT, L10n.t("Saving the settings file"));
        if (run == null) return;
        boolean accepted = Utils.runOnBackgroundThread(() -> {
            String said = null;
            try {
                said = write(context.getContentResolver(), uri, SettingsBackup.create().getBytes(StandardCharsets.UTF_8), run);
            } catch (Exception error) {
                Logger.printInfo(() -> "Settings export failed: " + error.getClass().getSimpleName());
                said = L10n.t("Couldn't save the settings file. Try again.");
            } finally {
                String result = said;
                ended(run, result == null ? null : () -> Utils.showToastLong(result));
            }
        });
        if (!accepted) notStarted(run);
        else watch(run, L10n.t("The app holding the settings file is taking too long, so HushPinterest stopped waiting. "
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
                return L10n.t("Settings exported. The app holding the file wouldn't let HushPinterest read it back, "
                        + "so it wasn't checked.");
            }
            back = null;
        }
        if (new String(bytes, StandardCharsets.UTF_8).equals(back)) return L10n.t("Settings exported.");
        Logger.printInfo(() -> "Settings export read back differently");
        return L10n.t("The settings file was saved, but it doesn't read back as what was written. "
                + "Save it again as a new file.");
    }

    private static void readForPreview(HushPinterestPreferenceFragment page, Uri uri) {
        Context context = appContext(page);
        Run run = start(IMPORT, L10n.t("Reading the settings file"));
        if (run == null) return;
        boolean accepted = Utils.runOnBackgroundThread(() -> {
            Runnable result = null;
            try {
                SettingsBackup.Snapshot snapshot = SettingsBackup.parse(read(context.getContentResolver(), uri, run));
                result = () -> offer(snapshot);
            } catch (SettingsBackup.Rejected refused) {
                Logger.printInfo(() -> "Settings file refused: " + refused.reason);
                String said = refusal(refused.reason);
                result = () -> Utils.showToastLong(said);
            } finally {
                ended(run, result);
            }
        });
        if (!accepted) notStarted(run);
        else watch(run, L10n.t("The app holding that file is taking too long, so HushPinterest stopped waiting. "
                + "Nothing was changed."));
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
                return L10n.t("That isn't a HushPinterest settings file. Nothing was changed.");
            case SCHEMA:
                return L10n.t("That settings file was written by a newer HushPinterest than this one. Nothing was changed.");
            case VALUE:
                return L10n.t("That settings file holds a value HushPinterest can't read. Nothing was changed.");
            default:
                return L10n.t("Couldn't open that file. Nothing was changed.");
        }
    }

    /** Hands a read file to the page on screen, which shows the preview now or when it resumes. */
    private static void offer(SettingsBackup.Snapshot snapshot) {
        HushPinterestPreferenceFragment page = latestPage.get();
        if (page == null || !page.isAdded()) {
            // The settings screen was closed while the file was read.
            Logger.printInfo(() -> "Settings file read with no settings page left to preview it on");
            return;
        }
        page.pendingImport = snapshot.toBundle();
        if (page.isResumed()) showPreview(page);
    }

    /** Called when the page resumes: a preview waiting on an answer is shown again. */
    static void onPageResumed(HushPinterestPreferenceFragment page) {
        if (page.pendingImport != null) showPreview(page);
    }

    /**
     * Takes the preview off the screen without answering it, when the page's view goes. A page
     * rebuilt from the saved state shows it again.
     */
    static void closePreview(HushPinterestPreferenceFragment page) {
        AlertDialog shown = page.importPreview;
        page.importPreview = null;
        if (shown == null) return;
        shown.setOnCancelListener(null);
        shown.dismiss();
    }

    /** Named saved-value changes, including switches whose patch isn't installed in this build. */
    static String previewMessage(SettingsBackup.Snapshot snapshot) {
        synchronized (Setting.class) {
            Map<Setting<?>, Object> changes = snapshot.changes();
            int switches = changes.size();
            StringBuilder message = new StringBuilder(switches == 0
                    ? L10n.t("Your switches already match that file, so nothing will change.")
                    : L10n.quantity(switches, "%1$d switch will change.", "%1$d switches will change.", switches));
            for (Map.Entry<Setting<?>, Object> entry : changes.entrySet()) {
                BooleanSetting setting = (BooleanSetting) entry.getKey();
                message.append("\n\n").append(L10n.f("%1$s (%2$s to %3$s)", switchName(setting),
                        switchValue(setting.persistedValue()), switchValue((Boolean) entry.getValue())));
                if (!available(setting)) {
                    message.append('\n').append(L10n.t("Saved choice only. This build doesn't include this control."));
                }
            }
            if (snapshot.unknown > 0) {
                message.append("\n\n").append(L10n.quantity(snapshot.unknown,
                        "%1$d item in that file isn't a setting this version of HushPinterest knows, so it'll be left out.",
                        "%1$d items in that file aren't settings this version of HushPinterest knows, so they'll be left out.",
                        snapshot.unknown));
            }
            return message.toString();
        }
    }

    private static String switchValue(boolean value) {
        return value ? L10n.t("On") : L10n.t("Off");
    }

    static String switchName(BooleanSetting setting) {
        switch (setting.key) {
            case "hushpinterest_hide_ads": return L10n.t("Hide ads");
            case "hushpinterest_hide_ai_pins": return L10n.t("Hide AI-labeled pins");
            case "hushpinterest_hide_shopping": return L10n.t("Hide shopping and product pins");
            case "hushpinterest_disable_analytics": return L10n.t("Disable analytics");
            case "hushpinterest_strip_link_tracking": return L10n.t("Strip link tracking");
            case "hushpinterest_hide_ad_id": return L10n.t("Hide advertising ID");
            case "hushpinterest_download_pins": return L10n.t("Download pins");
            case "hushpinterest_external_browser": return L10n.t("Open links in your browser");
            case "hushpinterest_system_share": return L10n.t("System share sheet");
            case "hushpinterest_hide_screenshot_share": return L10n.t("No screenshot share menu");
            case "hushpinterest_hide_search_history": return L10n.t("Hide search history");
            case "hushpinterest_hide_nav_create": return L10n.t("Hide Create button");
            case "hushpinterest_hide_nav_notifications": return L10n.t("Hide Notifications button");
            case "hushpinterest_hide_nav_search": return L10n.t("Hide Search button");
            case "hushpinterest_hide_header_buttons": return L10n.t("Hide header buttons");
            case "hushpinterest_hide_pin_menu_collage": return L10n.t("Hide collage menu items");
            case "hushpinterest_hide_pin_menu_visual_search": return L10n.t("Hide Search image menu item");
            case "hushpinterest_hide_pin_menu_pin_boost": return L10n.t("Hide Promote pin menu item");
            case "hushpinterest_hide_comments": return L10n.t("Hide comments");
            case "hushpinterest_hide_topic_suggestions": return L10n.t("Hide topic suggestions");
            case "hushpinterest_quiet_email_reminder": return L10n.t("Quiet email reminders");
            case "hushpinterest_hide_save_toasts": return L10n.t("Hide save toasts");
            case "hushpinterest_original_images": return L10n.t("Original-quality images");
            case "hushpinterest_disable_update_nag": return L10n.t("Disable update nag");
            default: throw new IllegalArgumentException("Unlisted backup switch");
        }
    }

    private static boolean available(BooleanSetting setting) {
        for (PatchFamily family : PatchFamily.values()) {
            if (family.switches.contains(setting)) {
                return family.inBuild() && !family.installedCapabilities().isEmpty();
            }
        }
        return false;
    }

    /** The existing import review; no second confirmation follows it. */
    static void showPreview(HushPinterestPreferenceFragment page) {
        if (page.importPreview != null) return;
        SettingsBackup.Snapshot snapshot = SettingsBackup.Snapshot.fromBundle(page.pendingImport);
        Activity activity = page.getActivity();
        if (snapshot == null || activity == null) {
            page.pendingImport = null;
            return;
        }
        int switches = snapshot.switchChanges();
        AlertDialog.Builder builder = new AlertDialog.Builder(HushPinterestPreferenceFragment.themed(activity))
                .setTitle(L10n.t("Import settings"))
                .setMessage(previewMessage(snapshot))
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

    private static void answered(HushPinterestPreferenceFragment page) {
        page.pendingImport = null;
        page.importPreview = null;
    }

    private static void apply(HushPinterestPreferenceFragment page, @Nullable Bundle chosen) {
        SettingsBackup.Snapshot snapshot = SettingsBackup.Snapshot.fromBundle(chosen);
        if (snapshot == null) return;
        Run run = start(IMPORT, L10n.t("Importing settings"));
        if (run == null) return;
        // The page shows what the store now holds rather than reading its own switches back into it.
        AbstractPreferenceFragment.settingImportInProgress = true;
        boolean accepted = false;
        try {
            accepted = Utils.runOnBackgroundThread(() -> {
                try {
                    int changed = SettingsBackup.apply(snapshot);
                    Utils.showToastLong(importedMessage(changed));
                } catch (SettingsBackup.ApplyFailed failure) {
                    Logger.printInfo(() -> "Settings import failed: " + failure.getMessage()
                            + (failure.rolledBack ? ", rolled back" : ", not rolled back"));
                    Utils.showToastLong(failure.rolledBack
                            ? L10n.t("Couldn't import the settings. Nothing was changed.")
                            : L10n.t("Couldn't import the settings, and couldn't put back the ones you had. "
                                    + "Check the switches on this screen."));
                } finally {
                    Utils.runOnMainThread(() -> {
                        AbstractPreferenceFragment.settingImportInProgress = false;
                        finish(run);
                        HushPinterestPreferenceFragment current = latestPage.get();
                        if (current != null && current.isAdded()) current.refreshSwitches();
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

    /** What the toast after an import says: how many switches changed. */
    static String importedMessage(int switches) {
        return switches == 0 ? L10n.t("Settings imported.") : L10n.quantity(switches,
                "Settings imported. %1$d switch changed.", "Settings imported. %1$d switches changed.", switches);
    }

    /** Restoring an import is an immediate row action with the same atomic write/recovery path. */
    private static void undo() {
        Run run = start(UNDO, L10n.t("Undoing import"));
        if (run == null) return;
        AbstractPreferenceFragment.settingImportInProgress = true;
        boolean accepted = false;
        try {
            accepted = Utils.runOnBackgroundThread(() -> {
                try {
                    switch (SettingsBackup.undo()) {
                        case UNDONE: Utils.showToastLong(L10n.t("Import undone. Your earlier switches are back.")); break;
                        case EXPIRED: Utils.showToastLong(L10n.t("Undo ended because a saved switch changed.")); break;
                        case NOTHING: Utils.showToastLong(L10n.t("There's no import to undo.")); break;
                    }
                } catch (SettingsBackup.ApplyFailed failure) {
                    Logger.printInfo(() -> "Settings import undo failed: " + failure.getMessage()
                            + (failure.rolledBack ? ", rolled back" : ", not rolled back"));
                    Utils.showToastLong(failure.rolledBack
                            ? L10n.t("Couldn't undo the import. Your imported switches are unchanged.")
                            : L10n.t("Couldn't undo the import or restore the imported switches. Check the switches on this screen."));
                } finally {
                    Utils.runOnMainThread(() -> {
                        AbstractPreferenceFragment.settingImportInProgress = false;
                        finish(run);
                        HushPinterestPreferenceFragment current = latestPage.get();
                        if (current != null && current.isAdded()) current.refreshSwitches();
                    });
                }
            });
        } catch (RuntimeException error) {
            Logger.printInfo(() -> "Settings import undo didn't start: " + error.getClass().getSimpleName());
        } finally {
            if (!accepted) {
                AbstractPreferenceFragment.settingImportInProgress = false;
                notStarted(run);
            }
        }
    }

    @Nullable
    private static Context appContext(HushPinterestPreferenceFragment page) {
        Activity activity = page.getActivity();
        return activity != null ? activity.getApplicationContext() : Utils.getContext();
    }

    /** Claims the rows for one run, or says why not. */
    @Nullable
    private static Run start(int action, String line) {
        if (stillStalled()) return null;
        Run run = new Run();
        if (!OWNER.compareAndSet(null, run)) {
            Utils.showToastLong(L10n.t("Couldn't start that. Try again in a moment."));
            return null;
        }
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
            if (open != null) new Thread(() -> closeQuietly(open), "hushpinterest-settings-file").start();
            Logger.printInfo(() -> "Settings file: stopped waiting on the app holding it");
            Utils.showToastLong(message);
        }, timeoutMs);
    }

    /** Says so, and answers true, while a run the screen stopped waiting for still holds a worker. */
    private static boolean stillStalled() {
        Run held = stalled;
        if (held == null || held.ended) return false;
        Utils.showToastLong(L10n.t("The app holding the last settings file still hasn't answered. Try again later."));
        return true;
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
     * Takes the backup rows out of reach while one of them runs and puts the running line on the one
     * acting. With a zero action and no line, they come back with their own summaries.
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
        busyLine = rowAction == action ? line : null;
        setEnabled(false);
        if (busyLine != null) setSummary(busyLine);
    }

    private void showResting() {
        busyLine = null;
        if (rowAction != UNDO) {
            setEnabled(true);
            setSummary(restingSummary);
            return;
        }
        SettingsBackup.UndoState state = SettingsBackup.undoState();
        setEnabled(state == SettingsBackup.UndoState.AVAILABLE);
        switch (state) {
            case AVAILABLE:
                setSummary(L10n.t("Restore the switches from before the last import. Editing a switch or restarting Pinterest ends Undo."));
                break;
            case EXPIRED: setSummary(L10n.t("Undo ended because a saved switch changed.")); break;
            case NONE: setSummary(restingSummary); break;
        }
    }

    @Override
    protected void onBindView(View view) {
        super.onBindView(view);
        // A screen reader hears the row as unavailable, and this says why. Older versions read the
        // summary, which shows the same line.
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) view.setStateDescription(busyLine);
    }
}
