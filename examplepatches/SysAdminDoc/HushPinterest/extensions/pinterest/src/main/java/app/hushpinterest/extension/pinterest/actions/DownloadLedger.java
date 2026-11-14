/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushpinterest.extension.pinterest.actions;

import android.app.DownloadManager;
import android.content.BroadcastReceiver;
import android.content.ClipData;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.SharedPreferences;
import android.database.Cursor;
import android.net.Uri;
import android.os.Build;
import android.os.ParcelFileDescriptor;

import androidx.annotation.Nullable;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.atomic.AtomicReference;
import java.util.function.BiFunction;
import java.util.function.Consumer;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import app.hushpinterest.extension.pinterest.settings.FamilyNames;
import app.hushpinterest.extension.pinterest.settings.PatchFamily;
import app.hushpinterest.extension.shared.L10n;
import app.hushpinterest.extension.shared.Utils;
import app.hushpinterest.extension.shared.diagnostics.HookStatus;

/** Observes native requests created by HushPinterest without canceling or deleting their files. */
public final class DownloadLedger {
    static final int LIMIT = 32;
    /**
     * How many requests are kept, unshown, once they're older than the visible history:
     * enough that a second Download board of a full board skips every pin the first one saved.
     */
    static final int EARLIER_LIMIT = BoardDownloads.PINS;
    static final String STORE = "hushpinterest_download_history";
    static final String RECORDS = "requests_v1";
    /**
     * The longest history text read: every line at its longest, with a request ID, a pin ID, a time
     * and a folder path whose every character is escaped.
     */
    static final int RECORDS_LENGTH = LIMIT * (19 + 30 + 19 + 3 + 3 + DownloadFolder.MAX_LENGTH * 3 + 1);
    static final String EARLIER = "earlier_v1";
    /** One earlier history line: a request ID, then the pin ID. */
    private static final Pattern EARLIER_LINE = Pattern.compile("([0-9]{1,19}),([0-9]{1,30})");
    /**
     * The saves HushPinterest made itself ({@link InAppDownloads}), keyed by the history entry's ID:
     * `id,STATE,type,address` lines, where the address is the MediaStore entry it wrote, or empty.
     * Written only once a save happens.
     */
    static final String SAVED = "saved_v1";
    private static final Pattern SAVED_LINE = Pattern.compile("([0-9]{1,19}),(RUNNING|COMPLETED|FAILED),"
            + "(image/(?:jpeg|png|webp|gif)|video/mp4),"
            + "((?:content://media/[a-z0-9_.-]{1,40}/(?:images/media|video/media|downloads|file)/[0-9]{1,19})?)");
    /**
     * History IDs from here up belong to saves HushPinterest started itself and never handed to
     * Android's Downloads (a streamed video). Android numbers its requests from 1, so it never gets near them.
     */
    static final long IN_APP = 1L << 62;
    static final String SENDER_PERMISSION = "android.permission.SEND_DOWNLOAD_COMPLETED_INTENTS";
    private static final Object LOCK = new Object();
    private static final Object RECEIVER_LOCK = new Object();
    private static Context receiverContext;
    private static volatile Context cachedContext;
    private static volatile List<Job> cached = Collections.emptyList();

    private final Context app;
    private final SharedPreferences preferences;

    DownloadLedger(Context context) {
        app = application(context);
        preferences = app.getSharedPreferences(STORE, Context.MODE_PRIVATE);
    }

    public enum State { QUEUED, RUNNING, PAUSED, FAILED, COMPLETED, MISSING, UNAVAILABLE, SKIPPED, UNSUPPORTED }

    public static final class Job {
        // Negative keys identify local outcomes, never DownloadManager requests.
        public final long id;
        public final String pinId;
        public final long createdAt;
        public final State state;
        private final int reason;
        // Read only from Android's current failed request. Never persisted or shown in history.
        private final PinMedia.Source source;
        // The image type of a request Android finished. Read from Android, never persisted.
        private final String image;
        // The folder the request saves in, null for Download: kept with the request (",P" for
        // Pinterest's folder, ",F:" and the path for another) when it's queued, and read from the
        // destination Android reports while it still has the request.
        private final String folder;

        private Job(long id, String pinId, long createdAt, State state, int reason, PinMedia.Source source) {
            this(id, pinId, createdAt, state, reason, source, null, null);
        }

        private Job(long id, String pinId, long createdAt, State state, int reason, PinMedia.Source source, String image,
                    String folder) {
            this.id = id;
            this.pinId = pinId;
            this.createdAt = createdAt;
            this.state = state;
            this.reason = reason;
            this.source = source;
            this.image = image;
            this.folder = folder;
        }

        private Job with(State state, int reason, PinMedia.Source source) {
            return with(state, reason, source, null, folder);
        }

        private Job with(State state, int reason, PinMedia.Source source, String image, String folder) {
            return new Job(id, pinId, createdAt, state, reason, source, image, folder);
        }

        /** This entry as HushPinterest's own save of it left it. One that stopped part way failed. */
        private Job with(Saved saved) {
            State shown = saved.state == State.RUNNING && !InAppDownloads.saving(id) ? State.FAILED : saved.state;
            return with(shown, 0, null, shown == State.COMPLETED ? image(saved.mime) : null, folder);
        }

        public boolean canRetry() { return state == State.FAILED && source != null; }

        /** A finished image download Android's Set as options can take. */
        public boolean canSetAs() { return state == State.COMPLETED && image != null; }

        /** A finished download whose saved file can be opened or shared. Local results never are. */
        public boolean canOpen() { return state == State.COMPLETED && id >= 0; }

        public String pinUrl() { return "https://www.pinterest.com/pin/" + pinId + "/"; }

        public String statusText() {
            switch (state) {
                case QUEUED: return L10n.t("Queued");
                case RUNNING: return L10n.t("Downloading");
                case PAUSED: return L10n.t("Paused");
                case FAILED: return L10n.t("Failed");
                case COMPLETED: return L10n.t("Completed");
                case MISSING: return L10n.t("Missing");
                case SKIPPED: return L10n.t("Skipped");
                case UNSUPPORTED: return L10n.t("Unsupported");
                default: return L10n.t("Unavailable");
            }
        }

        public String reasonText() {
            if (state == State.SKIPPED) return L10n.t("Nothing was queued. The selection stopped or wasn't available.");
            if (state == State.UNSUPPORTED) return L10n.t("Pinterest didn't supply supported media for this pin.");
            if (state == State.PAUSED) {
                // Waiting for a network isn't a failure: Android resumes the download itself. Android
                // also reports a roaming network a download may not use as waiting for a network, and
                // one that must be unmetered as queued for Wi-Fi, though not every Wi-Fi is unmetered.
                switch (reason) {
                    case DownloadManager.PAUSED_WAITING_TO_RETRY: return L10n.t("Android will retry the download.");
                    case DownloadManager.PAUSED_WAITING_FOR_NETWORK:
                        return L10n.t("Waiting for a network connection this download can use.");
                    case DownloadManager.PAUSED_QUEUED_FOR_WIFI:
                        return L10n.t("Waiting for Wi-Fi that isn't metered. A hotspot doesn't count.");
                    default: return L10n.t("Paused by Android.");
                }
            }
            if (state == State.FAILED) {
                switch (reason) {
                    case DownloadManager.ERROR_INSUFFICIENT_SPACE: return L10n.t("Not enough storage.");
                    case DownloadManager.ERROR_DEVICE_NOT_FOUND: return L10n.t("Download storage is unavailable.");
                    case DownloadManager.ERROR_FILE_ALREADY_EXISTS: return L10n.t("The file already exists.");
                    case DownloadManager.ERROR_CANNOT_RESUME: return L10n.t("Android couldn't resume the download.");
                    case DownloadManager.ERROR_FILE_ERROR: return L10n.t("Android couldn't save the file.");
                    case DownloadManager.ERROR_HTTP_DATA_ERROR:
                    case DownloadManager.ERROR_UNHANDLED_HTTP_CODE:
                    case DownloadManager.ERROR_TOO_MANY_REDIRECTS:
                        return L10n.t("The download server couldn't complete the request.");
                    default:
                        return reason >= 400 && reason <= 599
                                ? L10n.t("The download server couldn't complete the request.")
                                : L10n.t("Download failed.");
                }
            }
            if (state == State.COMPLETED) {
                // Android's Downloads list shows only the Download folder.
                return folder != null ? L10n.f("Saved in %s.", folder) : L10n.t("Check Downloads for the saved file.");
            }
            if (state == State.MISSING) {
                return folder != null ? L10n.f("Android dropped this request. Check %s before retrying.", folder)
                        : L10n.t("Android dropped this request. Check Downloads before retrying.");
            }
            if (state == State.UNAVAILABLE) return L10n.t("Couldn't check Downloads. Try again.");
            return "";
        }
    }

    /** A request queued to Download. */
    public static boolean record(Context context, long id, String pinId) {
        return record(context, id, pinId, null);
    }

    /**
     * Call after native enqueue on its worker. Only the returned ID is an ownership claim.
     * [folder] is where the request was told to save, null for Download.
     */
    public static boolean record(Context context, long id, String pinId, String folder) {
        if (context == null || !Utils.isMainProcess() ||
                id < 0 || pinId == null || !pinId.matches("[0-9]{1,30}")) return false;
        try {
            DownloadLedger ledger = new DownloadLedger(context);
            synchronized (LOCK) {
                ledger.insert(id, pinId, -1, folder);
            }
            return true;
        } catch (RuntimeException failure) {
            HookStatus.threw(FamilyNames.DOWNLOAD_PINS, "record native download", failure);
            return false;
        }
    }

    /**
     * Records a save HushPinterest starts itself, with no request for Android (a streamed video),
     * as being written. Returns its history ID, or -1 when the history couldn't be written.
     */
    static long recordInApp(Context context, String pinId, @Nullable String folder, String mime) {
        if (context == null || !Utils.isMainProcess() || pinId == null || !pinId.matches("[0-9]{1,30}")) return -1;
        try {
            DownloadLedger ledger = new DownloadLedger(context);
            synchronized (LOCK) {
                long id = IN_APP;
                for (Job job : ledger.load()) if (job.id >= id) id = job.id + 1;
                for (Job job : ledger.earlier()) if (job.id >= id) id = job.id + 1;
                // Claimed first, so the entry never reads as a save that stopped part way.
                InAppDownloads.claim(id);
                ledger.insert(id, pinId, -1, folder);
                if (ledger.keep(new Saved(id, State.RUNNING, mime, null))) return id;
                InAppDownloads.release(id);
                return -1;
            }
        } catch (RuntimeException failure) {
            HookStatus.threw(FamilyNames.DOWNLOAD_PINS, "record in-app download", failure);
            return -1;
        }
    }

    /** Records a terminal batch outcome without inventing a native download ID or retaining its URL. */
    static boolean recordResult(Context context, String pinId, State state) {
        if (context == null || !Utils.isMainProcess() || pinId == null || !pinId.matches("[0-9]{1,30}") ||
                !(state == State.SKIPPED || state == State.UNSUPPORTED || state == State.FAILED)) return false;
        try {
            DownloadLedger ledger = new DownloadLedger(context);
            synchronized (LOCK) {
                List<Job> jobs = ledger.load();
                long key = -Math.max(2, System.currentTimeMillis());
                for (Job job : jobs) if (job.id <= key) key = job.id - 1;
                if (key >= -1) throw new IllegalStateException("Local history keys exhausted");
                jobs.add(0, new Job(key, pinId, System.currentTimeMillis(), state, 0, null));
                ledger.store(jobs, ledger.trim(jobs));
                ledger.publish(jobs);
            }
            return true;
        } catch (RuntimeException failure) {
            HookStatus.threw(FamilyNames.DOWNLOAD_PINS, "record batch outcome", failure);
            return false;
        }
    }

    /**
     * The pins whose saved history holds a request handed to Android's Downloads, counting the
     * earlier ones the visible history no longer shows. Skipped, unsupported and failed results
     * don't count, and neither does a request Android reports failed or missing, so those pins can
     * be tried again. A request Android can't be asked about still counts, so a pin isn't saved
     * twice. Asks Android's Downloads about this app's own requests only, so call it off the main
     * thread.
     */
    static Set<String> downloadedPinIds(Context context) {
        Set<String> ids = new HashSet<>();
        if (context == null || !Utils.isMainProcess()) return ids;
        try {
            DownloadLedger ledger = new DownloadLedger(context);
            synchronized (LOCK) {
                List<Job> jobs = ledger.load();
                Set<Long> shown = new HashSet<>();
                for (Job job : jobs) shown.add(job.id);
                for (Job job : ledger.earlier()) if (shown.add(job.id)) jobs.add(job);
                for (Job job : ledger.query(jobs)) {
                    boolean requested = job.id >= 0 && job.state != State.FAILED && job.state != State.MISSING;
                    if (requested) ids.add(job.pinId);
                }
            }
        } catch (RuntimeException failure) {
            HookStatus.threw(FamilyNames.DOWNLOAD_PINS, "read download history", failure);
        }
        return ids;
    }

    /** Reconciles missed broadcasts without changing Android's retries, notifications or jobs. */
    public static void onStart(Context context) {
        if (context == null || !Utils.isMainProcess()) return;
        Context app = application(context);
        try {
            synchronized (RECEIVER_LOCK) {
                if (receiverContext != app) {
                    if (receiverContext != null) {
                        try { receiverContext.unregisterReceiver(COMPLETIONS); }
                        catch (IllegalArgumentException alreadyGone) { /* No registration to release. */ }
                    }
                    IntentFilter filter = new IntentFilter(DownloadManager.ACTION_DOWNLOAD_COMPLETE);
                    // DownloadProvider has a different UID and holds this signature permission.
                    if (Build.VERSION.SDK_INT >= 33) {
                        app.registerReceiver(COMPLETIONS, filter, SENDER_PERMISSION, null, Context.RECEIVER_EXPORTED);
                    } else {
                        app.registerReceiver(COMPLETIONS, filter, SENDER_PERMISSION, null);
                    }
                    receiverContext = app;
                }
            }
        } catch (RuntimeException failure) {
            HookStatus.threw(FamilyNames.DOWNLOAD_PINS, "watch native download results", failure);
        }
        schedule(app, ledger -> ledger.reconcile(), null, null);
        // Requests Android still holds from before the app last stopped are looked at again.
        InAppDownloads.watch(app);
    }

    private static final BroadcastReceiver COMPLETIONS = new BroadcastReceiver() {
        @Override public void onReceive(Context context, Intent intent) {
            if (intent == null || !DownloadManager.ACTION_DOWNLOAD_COMPLETE.equals(intent.getAction())) return;
            long id = intent.getLongExtra(DownloadManager.EXTRA_DOWNLOAD_ID, -1);
            if (cachedContext != application(context)) return;
            boolean owned = false;
            for (Job job : cached) if (job.id == id) { owned = true; break; }
            if (!owned) return;
            // This only refreshes an in-memory view. Death before the worker runs is recovered
            // on startup; a goAsync result must not wait behind the shared worker queue.
            schedule(context, ledger -> ledger.reconcile(), null, null);
        }
    };

    /** Main-thread callback, including refusal. Null means history loading or scheduling failed. */
    public static boolean refresh(Context context, Consumer<List<Job>> after) {
        AtomicReference<List<Job>> result = new AtomicReference<>();
        return schedule(context, ledger -> result.set(ledger.reconcile()),
                after == null ? null : () -> after.accept(result.get()), L10n.t("Couldn't check Downloads. Try again."));
    }

    /** A stale history row never authorizes a retry. Requery and validate the failed source first. */
    public static boolean retry(Context context, long id, Runnable after) {
        return schedule(context, ledger -> ledger.retryNow(id), after, L10n.t("Couldn't save this pin."));
    }

    public static boolean removeHistory(Context context, long id, Runnable after) {
        return schedule(context, ledger -> {
            synchronized (LOCK) {
                List<Job> jobs = ledger.load();
                List<Job> earlier = ledger.earlier();
                // Forgetting a download forgets the pin's earlier ones too, so Download board saves it
                // again. A skipped, unsupported or failed result never counted, so it forgets nothing.
                // A board run can move the row to the earlier history while its dialog is open.
                Set<String> forget = new HashSet<>();
                for (Job job : jobs) if (job.id == id && counts(job)) forget.add(job.pinId);
                for (Job job : earlier) if (job.id == id) forget.add(job.pinId);
                jobs.removeIf(job -> job.id == id);
                boolean forgot = earlier.removeIf(job -> job.id == id || forget.contains(job.pinId));
                ledger.store(jobs, forgot ? earlier : null);
                ledger.publish(jobs);
            }
            Utils.showToastLong(L10n.t("History removed. Files and active downloads were kept."));
        }, after, L10n.t("Couldn't remove this history entry. Try again."));
    }

    public static boolean openDownloads(Context context) {
        return open(context, new Intent(DownloadManager.ACTION_VIEW_DOWNLOADS), L10n.t("Couldn't open Downloads."));
    }

    private static String image(String mime) {
        return mime != null && mime.toLowerCase(Locale.ROOT).startsWith("image/") ? mime : null;
    }

    /** The type of a saved image or video, the only files a pin download saves. Null for anything else. */
    private static String media(String mime) {
        return image(mime) != null || (mime != null && mime.toLowerCase(Locale.ROOT).startsWith("video/")) ? mime : null;
    }

    /**
     * Hands a finished image download to Android's own Set as options, where the system picker and
     * its cropper set it as the wallpaper. Nothing is copied and no wallpaper permission is used.
     */
    public static boolean setAs(Context context, Job job) {
        if (context == null || job == null || !job.canSetAs()) return false;
        return handOver(context, job, true, (file, mime) -> Intent.createChooser(new Intent(Intent.ACTION_ATTACH_DATA)
                        .setDataAndType(file, mime).putExtra("mimeType", mime).addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION),
                        L10n.t("Set as")),
                job.folder != null ? L10n.f("Couldn't open Set as. Check %s for the saved file.", job.folder)
                        : L10n.t("Couldn't open Set as. Check Downloads for the saved file."),
                job.folder != null ? L10n.f("This download isn't a finished image anymore. Check %s.", job.folder)
                        : L10n.t("This download isn't a finished image anymore. Check Downloads."),
                "finished image handed to Set as");
    }

    /** Opens a finished download in the app Android picks for its type, or lets the person pick one. */
    public static boolean openFile(Context context, Job job) {
        if (context == null || job == null || !job.canOpen()) return false;
        return handOver(context, job, false, (file, mime) -> new Intent(Intent.ACTION_VIEW).setDataAndType(file, mime)
                        .addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION),
                job.folder != null ? L10n.f("Couldn't open this file. Check %s for the saved file.", job.folder)
                        : L10n.t("Couldn't open this file. Check Downloads for the saved file."),
                gone(job), "saved download opened");
    }

    /** Sends a finished download to an app picked in Android's share sheet. */
    public static boolean shareFile(Context context, Job job) {
        if (context == null || job == null || !job.canOpen()) return false;
        return handOver(context, job, false, (file, mime) -> {
                    // A video goes out through HushPinterest's own address so the share sheet can show a frame.
                    Uri shared = SharePreviewProvider.wrap(context, file, mime);
                    Intent send = new Intent(Intent.ACTION_SEND).setType(mime).putExtra(Intent.EXTRA_STREAM, shared)
                            .addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION);
                    // The chooser passes the read grant on only for a URI it finds in the clip.
                    send.setClipData(ClipData.newRawUri("", shared));
                    return Intent.createChooser(send, L10n.t("Share file"));
                },
                job.folder != null ? L10n.f("Couldn't share this file. Check %s for the saved file.", job.folder)
                        : L10n.t("Couldn't share this file. Check Downloads for the saved file."),
                gone(job), "saved download shared");
    }

    private static String gone(Job job) {
        return job.folder != null ? L10n.f("This download isn't a saved file anymore. Check %s.", job.folder)
                : L10n.t("This download isn't a saved file anymore. Check Downloads.");
    }

    /**
     * Hands a saved download to another app by Android's own content address for it, with a read
     * grant and nothing copied. A history row can be stale, so Android is asked again first: the
     * request has to be one this history still holds, finished, of a type a pin download saves
     * ([image] asks for an image), and its file still there to read. [error] is said when Android
     * can't be asked or nothing takes the file, [gone] when the download no longer qualifies.
     */
    private static boolean handOver(Context context, Job job, boolean image, BiFunction<Uri, String, Intent> handoff,
                                    String error, String gone, String handed) {
        Context app = application(context);
        boolean scheduled = Utils.runOnBackgroundThread(() -> {
            try {
                if (!PinDownloads.active()) {
                    Utils.showToastLong(L10n.t("Resume HushPinterest and turn on Download pins to use this."));
                    return;
                }
                DownloadLedger ledger = new DownloadLedger(app);
                if (!ledger.owns(job.id)) {
                    Utils.showToastLong(gone);
                    return;
                }
                Saved own;
                synchronized (LOCK) { own = ledger.saved().get(job.id); }
                String mime = null;
                Uri file;
                if (own != null) {
                    // HushPinterest saved this one itself, into the MediaStore entry it keeps.
                    mime = own.state == State.COMPLETED && own.address != null ? (image ? image(own.mime) : media(own.mime)) : null;
                    if (mime == null || !readable(app, own.address)) {
                        Utils.showToastLong(gone);
                        return;
                    }
                    file = own.address;
                } else {
                    DownloadManager manager = ledger.manager();
                    String filed = null;
                    try (Cursor cursor = manager.query(new DownloadManager.Query().setFilterById(job.id))) {
                        if (cursor != null && cursor.moveToFirst() && cursor.getInt(cursor.getColumnIndexOrThrow(
                                DownloadManager.COLUMN_STATUS)) == DownloadManager.STATUS_SUCCESSFUL) {
                            int type = cursor.getColumnIndex(DownloadManager.COLUMN_MEDIA_TYPE);
                            mime = type < 0 ? null : cursor.getString(type);
                            int media = cursor.getColumnIndex(DownloadManager.COLUMN_MEDIAPROVIDER_URI);
                            filed = media < 0 ? null : cursor.getString(media);
                        }
                    }
                    mime = image ? image(mime) : media(mime);
                    if (mime == null || !readable(manager, job.id)) {
                        Utils.showToastLong(gone);
                        return;
                    }
                    file = address(manager, job.id, filed);
                    if (file == null) throw new IllegalStateException("Finished download has no content URI");
                }
                Intent intent = handoff.apply(file, mime);
                Utils.runOnMainThread(() -> {
                    if (open(app, intent, error)) HookStatus.counted(FamilyNames.DOWNLOAD_PINS, handed);
                });
            } catch (RuntimeException failure) {
                HookStatus.threw(FamilyNames.DOWNLOAD_PINS, "hand a saved download to another app", failure);
                Utils.showToastLong(error);
            }
        });
        if (!scheduled) Utils.showToastLong(error);
        return scheduled;
    }

    /**
     * Where another app reads the file. DownloadManager's own address names the file after the
     * request's title, so apps saw every download as "Download pin". The MediaStore entry Android
     * filed for the download has the file's own name and an image's preview, and from Android 11
     * the app that owns it can grant it to another app. Share file wraps a video's entry in
     * [SharePreviewProvider], since MediaStore gives the share sheet no frame of a video.
     */
    private static Uri address(DownloadManager manager, long id, String filed) {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R && filed != null && filed.startsWith("content://media/")) {
            return Uri.parse(filed);
        }
        return manager.getUriForDownloadedFile(id);
    }

    /** Whether [id] is a request this history holds, shown or earlier. Local results never are. */
    private boolean owns(long id) {
        if (id < 0) return false;
        synchronized (LOCK) {
            for (Job job : load()) if (job.id == id) return true;
            for (Job job : earlier()) if (job.id == id) return true;
        }
        return false;
    }

    /** Android keeps a finished request whose file was deleted, so the file itself is opened to check. */
    private static boolean readable(DownloadManager manager, long id) {
        try (ParcelFileDescriptor file = manager.openDownloadedFile(id)) {
            return file != null;
        } catch (IOException missing) {
            return false;
        }
    }

    /** The same for a file HushPinterest saved itself. Someone may have deleted it in a gallery app. */
    private static boolean readable(Context app, Uri address) {
        try (ParcelFileDescriptor file = app.getContentResolver().openFileDescriptor(address, "r")) {
            return file != null;
        } catch (IOException | SecurityException | IllegalArgumentException missing) {
            return false;
        }
    }

    public static boolean reopenPin(Context context, Job job) {
        if (context == null || job == null) return false;
        return open(context, new Intent(Intent.ACTION_VIEW, Uri.parse(job.pinUrl()))
                .addCategory(Intent.CATEGORY_BROWSABLE).setPackage(context.getPackageName()), L10n.t("Couldn't open this pin."));
    }

    private void retryNow(long id) {
        synchronized (LOCK) {
            if (!Utils.settingsReady() || !PatchFamily.Capability.PIN_DOWNLOADS.installed()) {
                Utils.showToastLong(L10n.t("Open the pin again to get a fresh download link."));
                return;
            }
            if (!PinDownloads.active()) {
                Utils.showToastLong(L10n.t("Resume HushPinterest and turn on Download pins to retry."));
                return;
            }
            Job old = null;
            for (Job job : load()) if (job.id == id) { old = job; break; }
            if (old == null) {
                Utils.showToastLong(L10n.t("Open the pin again to get a fresh download link."));
                return;
            }
            Job current = query(Collections.singletonList(old)).get(0);
            if (current.state == State.UNAVAILABLE) {
                Utils.showToastLong(current.reasonText());
                return;
            }
            if (!current.canRetry()) {
                Utils.showToastLong(current.state == State.MISSING || current.state == State.FAILED
                        ? L10n.t("Open the pin again to get a fresh download link.")
                        : current.folder != null ? L10n.f("Can't retry this. Check %s or open the pin again.", current.folder)
                        : L10n.t("Can't retry this. Check Downloads or open the pin again."));
                return;
            }
            if (!PinDownloads.active()) {
                Utils.showToastLong(L10n.t("Resume HushPinterest and turn on Download pins to retry."));
                return;
            }
            String name = "Pinterest_" + current.pinId + "_" + Long.toUnsignedString(System.nanoTime()) + current.source.suffix;
            String folder = DownloadFolder.current();
            long next = manager().enqueue(PinDownloads.request(current.source, name, folder));
            if (next < 0) throw new IllegalStateException("Download service rejected retry");
            // Enqueue and preference persistence cannot be one transaction. Never remove the
            // native request or file to undo a bookkeeping failure, and never retry automatically.
            boolean saved = false;
            try {
                insert(next, current.pinId, id, folder);
                saved = true;
            } catch (RuntimeException failure) {
                HookStatus.threw(FamilyNames.DOWNLOAD_PINS, "record native download retry", failure);
            }
            HookStatus.counted(FamilyNames.DOWNLOAD_PINS, "native download retry queued");
            Utils.showToastLong(PinDownloads.startedMessage(saved, folder));
        }
    }

    List<Job> reconcile() {
        synchronized (LOCK) {
            List<Job> jobs = query(load());
            publish(jobs);
            HookStatus.counted(FamilyNames.DOWNLOAD_PINS, "native download history checked");
            return jobs;
        }
    }

    private List<Job> query(List<Job> owned) {
        if (owned.isEmpty()) return Collections.emptyList();
        // Android no longer has a request HushPinterest took over, and never had one it saved itself.
        Map<Long, Saved> saves = saved();
        long[] ids = owned.stream().filter(job -> job.id >= 0 && job.id < IN_APP && !saves.containsKey(job.id))
                .mapToLong(job -> job.id).toArray();
        Map<Long, Job> results = new LinkedHashMap<>();
        for (int i = 0; i < owned.size(); i++) {
            Job job = owned.get(i);
            Saved own = saves.get(job.id);
            // A save of its own whose record didn't stick never finished.
            results.put(job.id, job.id < 0 ? job : own != null ? job.with(own)
                    : job.with(job.id >= IN_APP ? State.FAILED : State.MISSING, 0, null));
        }
        if (ids.length == 0) return Collections.unmodifiableList(new ArrayList<>(results.values()));
        try (Cursor cursor = manager().query(new DownloadManager.Query().setFilterById(ids))) {
            if (cursor == null) throw new IllegalStateException("Download query unavailable");
            int idColumn = cursor.getColumnIndexOrThrow(DownloadManager.COLUMN_ID);
            int statusColumn = cursor.getColumnIndexOrThrow(DownloadManager.COLUMN_STATUS);
            int reasonColumn = cursor.getColumnIndexOrThrow(DownloadManager.COLUMN_REASON);
            int sourceColumn = cursor.getColumnIndexOrThrow(DownloadManager.COLUMN_URI);
            int mimeColumn = cursor.getColumnIndex(DownloadManager.COLUMN_MEDIA_TYPE);
            int localColumn = cursor.getColumnIndex(DownloadManager.COLUMN_LOCAL_URI);
            while (cursor.moveToNext()) {
                long id = cursor.getLong(idColumn);
                Job job = results.get(id);
                if (job == null || job.id < 0 || saves.containsKey(id)) continue;
                State state = state(cursor.getInt(statusColumn));
                int reason = state == State.PAUSED || state == State.FAILED ? cursor.getInt(reasonColumn) : 0;
                PinMedia.Source source = null;
                String mime = mimeColumn < 0 ? null : cursor.getString(mimeColumn);
                if (state == State.FAILED) {
                    String url = cursor.getString(sourceColumn);
                    source = PinMedia.sourceUrl(url, false);
                    if (source == null) source = PinMedia.sourceUrl(url, true);
                    // Our original request sets its MIME type. Don't reinterpret a video as
                    // an image, or guess a type when Android no longer has that contract.
                    if (source != null && !source.mime.equalsIgnoreCase(mime)) source = null;
                }
                // For a public folder, Android reports the requested destination in every state.
                String folder = job.folder != null ? job.folder
                        : localColumn >= 0 ? DownloadFolder.of(cursor.getString(localColumn)) : null;
                results.put(id, job.with(state, reason, source, state == State.COMPLETED ? image(mime) : null, folder));
            }
            return Collections.unmodifiableList(new ArrayList<>(results.values()));
        } catch (RuntimeException failure) {
            HookStatus.threw(FamilyNames.DOWNLOAD_PINS, "query native download history", failure);
            List<Job> unavailable = new ArrayList<>();
            for (Job job : owned) {
                boolean android = job.id >= 0 && job.id < IN_APP && !saves.containsKey(job.id);
                unavailable.add(android ? job.with(State.UNAVAILABLE, 0, null) : results.get(job.id));
            }
            return Collections.unmodifiableList(unavailable);
        }
    }

    private static State state(int status) {
        switch (status) {
            case DownloadManager.STATUS_PENDING: return State.QUEUED;
            case DownloadManager.STATUS_RUNNING: return State.RUNNING;
            case DownloadManager.STATUS_PAUSED: return State.PAUSED;
            case DownloadManager.STATUS_FAILED: return State.FAILED;
            case DownloadManager.STATUS_SUCCESSFUL: return State.COMPLETED;
            default: return State.UNAVAILABLE;
        }
    }

    private List<Job> load() {
        List<Job> jobs = new ArrayList<>();
        String text;
        try { text = preferences.getString(RECORDS, ""); }
        catch (ClassCastException invalid) { return jobs; }
        if (text == null) return jobs;
        // Only a damaged store holds more than this class writes. Its newest whole lines come first
        // and are kept, so the next write doesn't replace the history with nothing. A line the bound
        // cuts through is dropped whole: cut short, it could still read as a different valid line.
        if (text.length() > RECORDS_LENGTH) text = text.substring(0, Math.max(0, text.lastIndexOf('\n', RECORDS_LENGTH)));
        for (String line : text.split("\n")) {
            String[] fields = line.split(",", -1);
            // A local outcome ends in its state. A native request saved outside Download ends in its
            // folder: ",P" for Pinterest's, ",F:" and the path for another.
            boolean local = fields.length == 4 && fields[0].matches("-[0-9]{1,19}");
            String folder = local || fields.length != 4 ? null
                    : fields[3].equals("P") ? DownloadFolder.PINTEREST
                    : fields[3].startsWith("F:") ? DownloadFolder.decode(fields[3].substring(2)) : null;
            if ((!local && (fields.length != (folder != null ? 4 : 3) || !fields[0].matches("[0-9]{1,19}"))) ||
                    !fields[1].matches("[0-9]{1,30}") || !fields[2].matches("[0-9]{1,19}")) continue;
            try {
                long id = Long.parseLong(fields[0]);
                long time = Long.parseLong(fields[2]);
                if (time <= 0) continue;
                State state = local ? State.valueOf(fields[3]) : State.UNAVAILABLE;
                if (local && (id >= -1 || !(state == State.SKIPPED || state == State.UNSUPPORTED || state == State.FAILED))) continue;
                boolean duplicate = false;
                for (Job job : jobs) if (job.id == id) { duplicate = true; break; }
                if (!duplicate) jobs.add(new Job(id, fields[1], time, state, 0, null, null, folder));
                if (jobs.size() == LIMIT) break;
            } catch (IllegalArgumentException invalid) {
                // Invalid private metadata cannot become an ID to query.
            }
        }
        return jobs;
    }

    /**
     * The requests older than the visible history, newest first: `id,pinId` lines. Nothing else is
     * kept for them, and Android is asked about them again whenever they're read.
     */
    private List<Job> earlier() {
        List<Job> jobs = new ArrayList<>();
        String text;
        try { text = preferences.getString(EARLIER, ""); }
        catch (ClassCastException invalid) { return jobs; }
        // A 19-digit ID, a 30-digit pin ID and two separators per line.
        if (text == null || text.length() > EARLIER_LIMIT * 51) return jobs;
        Set<Long> seen = new HashSet<>();
        for (String line : text.split("\n")) {
            Matcher fields = EARLIER_LINE.matcher(line);
            if (!fields.matches()) continue;
            try {
                long id = Long.parseLong(fields.group(1));
                if (!seen.add(id)) continue;
                jobs.add(new Job(id, fields.group(2), 0, State.UNAVAILABLE, 0, null));
                if (jobs.size() == EARLIER_LIMIT) break;
            } catch (NumberFormatException invalid) {
                // Invalid private metadata cannot become an ID to query.
            }
        }
        return jobs;
    }

    /**
     * Cuts [jobs] to the visible history. Returns the earlier requests with the cut ones put in
     * front, or null when the cut held none and the earlier ones stay as they are. Skipped,
     * unsupported and failed results are dropped, since they never count.
     */
    private List<Job> trim(List<Job> jobs) {
        if (jobs.size() <= LIMIT) return null;
        List<Job> cut = jobs.subList(LIMIT, jobs.size());
        List<Job> kept = new ArrayList<>();
        for (Job job : cut) if (counts(job)) kept.add(job);
        cut.clear();
        if (kept.isEmpty()) return null;
        Set<Long> seen = new HashSet<>();
        for (Job job : kept) seen.add(job.id);
        for (Job job : earlier()) if (seen.add(job.id)) kept.add(job);
        if (kept.size() > EARLIER_LIMIT) kept.subList(EARLIER_LIMIT, kept.size()).clear();
        return kept;
    }

    /** A request handed to Android's Downloads: the only rows that can stop a pin saving twice. */
    private static boolean counts(Job job) { return job.id >= 0; }

    /** Writes the visible history, and [earlier] too unless it's null, in one commit. */
    private void store(List<Job> jobs, List<Job> earlier) {
        StringBuilder text = new StringBuilder();
        for (Job job : jobs) {
            text.append(job.id).append(',').append(job.pinId).append(',').append(job.createdAt);
            if (job.id < 0) text.append(',').append(job.state.name());
            else if (DownloadFolder.PINTEREST.equals(job.folder)) text.append(",P");
            else if (job.folder != null) text.append(",F:").append(DownloadFolder.encode(job.folder));
            text.append('\n');
        }
        SharedPreferences.Editor edit = preferences.edit().putString(RECORDS, text.toString());
        if (earlier != null) {
            StringBuilder kept = new StringBuilder();
            for (Job job : earlier) kept.append(job.id).append(',').append(job.pinId).append('\n');
            edit.putString(EARLIER, kept.toString());
        }
        // A save is kept only while its entry is in one of the histories.
        Map<Long, Saved> saves = saved();
        if (!saves.isEmpty()) {
            Set<Long> held = new HashSet<>();
            for (Job job : jobs) held.add(job.id);
            for (Job job : earlier != null ? earlier : earlier()) held.add(job.id);
            if (saves.keySet().retainAll(held)) putSaved(edit, saves);
        }
        if (!edit.commit()) {
            throw new IllegalStateException("Download history write failed");
        }
    }

    private void insert(long id, String pinId, long replacedId, String folder) {
        List<Job> jobs = load();
        jobs.removeIf(job -> job.id == id || job.id == replacedId);
        jobs.add(0, new Job(id, pinId, System.currentTimeMillis(), State.QUEUED, 0, null, null, folder));
        store(jobs, trim(jobs));
        publish(jobs);
        // Android may hold the request back for hours (#27, #29). HushPinterest looks again shortly.
        InAppDownloads.watch(app);
    }

    /** A save HushPinterest made itself, in place of Android's Downloads. */
    static final class Saved {
        final long id;
        /** RUNNING while it's being written, then COMPLETED or FAILED. */
        final State state;
        final String mime;
        /** The MediaStore entry written, or null when none was made. */
        @Nullable final Uri address;

        Saved(long id, State state, String mime, @Nullable Uri address) {
            this.id = id;
            this.state = state;
            this.mime = mime;
            this.address = address;
        }
    }

    /** The saves HushPinterest made itself, by history ID. Lines that don't read whole are dropped. */
    private Map<Long, Saved> saved() {
        Map<Long, Saved> saves = new LinkedHashMap<>();
        String text;
        try { text = preferences.getString(SAVED, ""); }
        catch (ClassCastException invalid) { return saves; }
        int most = LIMIT + EARLIER_LIMIT;
        if (text == null || text.length() > most * 160) return saves;
        for (String line : text.split("\n")) {
            Matcher fields = SAVED_LINE.matcher(line);
            if (!fields.matches()) continue;
            try {
                long id = Long.parseLong(fields.group(1));
                String address = fields.group(4);
                saves.putIfAbsent(id, new Saved(id, State.valueOf(fields.group(2)), fields.group(3),
                        address.isEmpty() ? null : Uri.parse(address)));
                if (saves.size() == most) break;
            } catch (IllegalArgumentException invalid) {
                // Invalid private metadata cannot become a file to hand over.
            }
        }
        return saves;
    }

    private static void putSaved(SharedPreferences.Editor edit, Map<Long, Saved> saves) {
        if (saves.isEmpty()) {
            edit.remove(SAVED);
            return;
        }
        StringBuilder text = new StringBuilder();
        for (Saved save : saves.values()) {
            text.append(save.id).append(',').append(save.state.name()).append(',').append(save.mime).append(',')
                    .append(save.address == null ? "" : save.address.toString()).append('\n');
        }
        edit.putString(SAVED, text.toString());
    }

    /**
     * Records [save] for an entry this history holds, shown or earlier, and refreshes the in-memory
     * view. False when the entry is gone (its history was removed) or the write failed.
     */
    private boolean keep(Saved save) {
        boolean held = false;
        for (Job job : load()) if (job.id == save.id) { held = true; break; }
        if (!held) for (Job job : earlier()) if (job.id == save.id) { held = true; break; }
        if (!held) return false;
        Map<Long, Saved> saves = saved();
        saves.remove(save.id);
        saves.put(save.id, save);
        SharedPreferences.Editor edit = preferences.edit();
        putSaved(edit, saves);
        return edit.commit();
    }

    /** A request Android's Downloads hasn't started, as {@link InAppDownloads} needs it to save it instead. */
    static final class Stalled {
        final long id;
        final String pinId;
        /** Where it saves, null for Download. */
        @Nullable final String folder;
        final PinMedia.Source source;
        /** The file name Android was given. */
        final String name;
        final long createdAt;
        /** PENDING, or waiting for a network. */
        final int status;

        Stalled(long id, String pinId, @Nullable String folder, PinMedia.Source source, String name, long createdAt, int status) {
            this.id = id;
            this.pinId = pinId;
            this.folder = folder;
            this.source = source;
            this.name = name;
            this.createdAt = createdAt;
            this.status = status;
        }
    }

    /** Where this app's requests stand in Android's Downloads, for {@link InAppDownloads}. */
    static final class Queue {
        /** Requests Android hasn't started, oldest last as the history keeps them. */
        final List<Stalled> stalled;
        /** Whether Android is downloading one of this app's requests right now. */
        final boolean running;
        /** Saves recorded as being written that no live save is writing: the app stopped part way. */
        final List<Saved> abandoned;

        Queue(List<Stalled> stalled, boolean running, List<Saved> abandoned) {
            this.stalled = stalled;
            this.running = running;
            this.abandoned = abandoned;
        }
    }

    /** One file name Android was given for a pin, the only kind HushPinterest asks for. */
    private static final Pattern FILE_NAME = Pattern.compile("Pinterest_[0-9]{1,30}_[0-9]{1,20}\\.(?:jpg|png|webp|gif|mp4)");

    /** Reads where this app's requests stand. Worker threads only: it asks Android's Downloads. */
    static Queue queue(Context context) {
        DownloadLedger ledger = new DownloadLedger(context);
        synchronized (LOCK) {
            List<Job> jobs = ledger.load();
            Set<Long> shown = new HashSet<>();
            for (Job job : jobs) shown.add(job.id);
            for (Job job : ledger.earlier()) if (shown.add(job.id)) jobs.add(job);
            Map<Long, Saved> saves = ledger.saved();
            List<Saved> abandoned = new ArrayList<>();
            for (Saved save : saves.values()) {
                if (save.state == State.RUNNING && !InAppDownloads.saving(save.id)) abandoned.add(save);
            }
            Map<Long, Job> asked = new LinkedHashMap<>();
            for (Job job : jobs) if (job.id >= 0 && job.id < IN_APP && !saves.containsKey(job.id)) asked.put(job.id, job);
            List<Stalled> stalled = new ArrayList<>();
            boolean running = false;
            if (asked.isEmpty()) return new Queue(stalled, false, abandoned);
            long[] ids = asked.keySet().stream().mapToLong(Long::longValue).toArray();
            try (Cursor cursor = ledger.manager().query(new DownloadManager.Query().setFilterById(ids))) {
                if (cursor == null) throw new IllegalStateException("Download query unavailable");
                int idColumn = cursor.getColumnIndexOrThrow(DownloadManager.COLUMN_ID);
                int statusColumn = cursor.getColumnIndexOrThrow(DownloadManager.COLUMN_STATUS);
                int reasonColumn = cursor.getColumnIndexOrThrow(DownloadManager.COLUMN_REASON);
                int sourceColumn = cursor.getColumnIndexOrThrow(DownloadManager.COLUMN_URI);
                int mimeColumn = cursor.getColumnIndex(DownloadManager.COLUMN_MEDIA_TYPE);
                int localColumn = cursor.getColumnIndex(DownloadManager.COLUMN_LOCAL_URI);
                Map<Long, Stalled> found = new HashMap<>();
                while (cursor.moveToNext()) {
                    Job job = asked.get(cursor.getLong(idColumn));
                    if (job == null) continue;
                    int status = cursor.getInt(statusColumn);
                    if (status == DownloadManager.STATUS_RUNNING) running = true;
                    // Waiting for a network Android says it lacks, or never started at all.
                    boolean held = status == DownloadManager.STATUS_PENDING || (status == DownloadManager.STATUS_PAUSED
                            && (cursor.getInt(reasonColumn) == DownloadManager.PAUSED_WAITING_FOR_NETWORK
                            || cursor.getInt(reasonColumn) == DownloadManager.PAUSED_QUEUED_FOR_WIFI));
                    if (!held) continue;
                    String url = cursor.getString(sourceColumn);
                    String mime = mimeColumn < 0 ? null : cursor.getString(mimeColumn);
                    PinMedia.Source source = PinMedia.sourceUrl(url, false);
                    if (source == null) source = PinMedia.sourceUrl(url, true);
                    if (source == null || !source.mime.equalsIgnoreCase(mime)) continue;
                    String local = localColumn < 0 ? null : cursor.getString(localColumn);
                    String name = local == null ? null : Uri.decode(local.substring(local.lastIndexOf('/') + 1));
                    if (name == null || !FILE_NAME.matcher(name).matches() || !name.endsWith(source.suffix)) {
                        name = "Pinterest_" + job.pinId + "_" + Long.toUnsignedString(System.nanoTime()) + source.suffix;
                    }
                    String folder = job.folder != null ? job.folder : DownloadFolder.of(local);
                    found.put(job.id, new Stalled(job.id, job.pinId, folder, source, name, job.createdAt, status));
                }
                for (Job job : jobs) {
                    Stalled one = found.get(job.id);
                    if (one != null) stalled.add(one);
                }
            }
            return new Queue(stalled, running, abandoned);
        }
    }

    /** Marks [id] as being saved by HushPinterest into [address]. False when its entry is gone. */
    static boolean saving(Context context, long id, String mime, Uri address) {
        DownloadLedger ledger = new DownloadLedger(context);
        synchronized (LOCK) { return ledger.keep(new Saved(id, State.RUNNING, mime, address)); }
    }

    /** Marks [id] saved, into [address]. */
    static boolean saved(Context context, long id, String mime, Uri address) {
        DownloadLedger ledger = new DownloadLedger(context);
        synchronized (LOCK) { return ledger.keep(new Saved(id, State.COMPLETED, mime, address)); }
    }

    /** Marks [id] failed. Nothing of it was kept. */
    static boolean failed(Context context, long id, String mime) {
        DownloadLedger ledger = new DownloadLedger(context);
        synchronized (LOCK) { return ledger.keep(new Saved(id, State.FAILED, mime, null)); }
    }

    /** Drops HushPinterest's save of [id]: Android's request is shown as Android reports it again. */
    static void forget(Context context, long id) {
        DownloadLedger ledger = new DownloadLedger(context);
        synchronized (LOCK) {
            Map<Long, Saved> saves = ledger.saved();
            if (saves.remove(id) == null) return;
            SharedPreferences.Editor edit = ledger.preferences.edit();
            putSaved(edit, saves);
            if (!edit.commit()) throw new IllegalStateException("Download history write failed");
        }
    }


    private void publish(List<Job> jobs) {
        cachedContext = app;
        cached = Collections.unmodifiableList(new ArrayList<>(jobs));
    }

    private DownloadManager manager() {
        DownloadManager manager = (DownloadManager) app.getSystemService(Context.DOWNLOAD_SERVICE);
        if (manager == null) throw new IllegalStateException("Download service unavailable");
        return manager;
    }

    private static boolean schedule(Context context, Consumer<DownloadLedger> work, Runnable after, String error) {
        if (context == null || !Utils.isMainProcess()) {
            if (after != null) Utils.runOnMainThread(after);
            return false;
        }
        boolean queued = Utils.runOnBackgroundThread(() -> {
            try { work.accept(new DownloadLedger(context)); }
            catch (RuntimeException failure) {
                HookStatus.threw(FamilyNames.DOWNLOAD_PINS, "update native download history", failure);
                if (error != null) Utils.showToastLong(error);
            } finally {
                if (after != null) Utils.runOnMainThread(after);
            }
        });
        if (!queued) {
            HookStatus.threw(FamilyNames.DOWNLOAD_PINS, "schedule native download history", new IllegalStateException("Worker unavailable"));
            if (error != null) Utils.showToastLong(error);
            if (after != null) Utils.runOnMainThread(after);
        }
        return queued;
    }

    private static Context application(Context context) {
        Context app = context.getApplicationContext();
        return app == null ? context : app;
    }

    private static boolean open(Context context, Intent intent, String error) {
        if (context == null) return false;
        try {
            context.startActivity(intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));
            return true;
        } catch (RuntimeException failure) {
            HookStatus.threw(FamilyNames.DOWNLOAD_PINS, "open native download guidance", failure);
            Utils.showToastLong(error);
            return false;
        }
    }
}
