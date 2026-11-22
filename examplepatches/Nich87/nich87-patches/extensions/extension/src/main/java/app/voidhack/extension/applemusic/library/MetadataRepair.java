package app.voidhack.extension.applemusic.library;

import android.app.Activity;
import android.app.Fragment;
import android.content.ContentResolver;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageInfo;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.util.Log;
import android.widget.Toast;

import java.io.IOException;
import java.io.OutputStream;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Set;
import java.util.TimeZone;
import java.util.concurrent.CancellationException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.atomic.AtomicBoolean;

public final class MetadataRepair extends Fragment {
    private static final String TAG = "AppleMusicMetadataRepair";
    private static final int SAVE_LOG = 0x5643;
    private static final int MAX_EVENTS = 80;
    private final ExecutorService worker = Executors.newSingleThreadExecutor();
    private final Handler main = new Handler(Looper.getMainLooper());
    private final AtomicBoolean cancelled = new AtomicBoolean();
    private final Set<Long> selected = new HashSet<>();
    private final List<String> events = new ArrayList<>();
    private LibraryMetadata service;
    private LibraryMetadata.Scan scan;
    private MetadataRepairPage page;
    private boolean busy, visible;
    private boolean onlyRomanized = true;
    private Runnable completion;
    private String progressText = "", outcome = "", query = "";
    private volatile String diagnosticLog = "";
    private String pendingLog;
    private volatile String currentStage = "connect";
    private volatile int currentCompleted, currentTotal;
    private volatile long operationStartMs;
    private Context resources;
    private Screen screen = Screen.INTRO;
    private enum Screen { INTRO, LIST, CONFIRM, RESULT }

    public MetadataRepair() {}

    public static void open(Activity activity) {
        MetadataRepair fragment = (MetadataRepair) activity.getFragmentManager().findFragmentByTag(TAG);
        if (fragment == null) {
            fragment = new MetadataRepair();
            activity.getFragmentManager().beginTransaction().add(fragment, TAG).commit();
            activity.getFragmentManager().executePendingTransactions();
        }
        MetadataRepair current = fragment;
        current.visible = true;
        activity.getWindow().getDecorView().post(current::render);
    }

    @Override public void onCreate(Bundle state) {
        super.onCreate(state);
        resources = getActivity().getApplicationContext();
        setRetainInstance(true);
        if (state != null) {
            pendingLog = state.getString("pendingLog");
            diagnosticLog = state.getString("diagnosticLog", "");
            if (!diagnosticLog.isEmpty()) {
                outcome = state.getString("outcome", "");
                visible = state.getBoolean("visible");
                screen = Screen.RESULT;
            }
        }
    }
    @Override public void onSaveInstanceState(Bundle state) {
        super.onSaveInstanceState(state);
        state.putString("pendingLog", pendingLog);
        if (!busy && screen == Screen.RESULT && !diagnosticLog.isEmpty()) {
            state.putString("diagnosticLog", diagnosticLog);
            state.putString("outcome", outcome);
            state.putBoolean("visible", visible);
        }
    }
    @Override public void onResume() {
        super.onResume();
        if (completion != null) { Runnable action = completion; completion = null; action.run(); }
        else if (visible) render();
    }
    @Override public void onDetach() { dismiss(); super.onDetach(); }
    @Override public void onDestroy() { cancelled.set(true); worker.shutdown(); super.onDestroy(); }

    private void render() {
        if (!visible || getActivity() == null || getActivity().isFinishing()) return;
        dismiss();
        page = new MetadataRepairPage(getActivity(), label(screen == Screen.CONFIRM ? "confirm_title" : "page_title"), this::back);
        if (busy) { page.progress(progressText, this::stop); return; }
        switch (screen) {
            case INTRO: page.message(label("intro"), label("scan"), this::startScan); break;
            case LIST:
                if (scan == null) { screen = Screen.INTRO; render(); return; }
                page.candidates(scan, selected, query, onlyRomanized, value -> query = value,
                        value -> onlyRomanized = value, () -> { screen = Screen.CONFIRM; render(); });
                break;
            case CONFIRM: page.review(targets(), this::startRepair); break;
            case RESULT:
                if (diagnosticLog.isEmpty()) page.message(outcome, label("rescan"), this::startScan);
                else page.message(outcome, label("rescan"), this::startScan, label("save_log"), this::saveLog);
                break;
        }
    }

    private void back() {
        if (busy) { stop(); return; }
        if (screen == Screen.CONFIRM) { screen = Screen.LIST; render(); }
        else { visible = false; dismiss(); }
    }

    private void startScan() {
        selected.clear(); query = ""; onlyRomanized = true;
        diagnosticLog = "";
        resetTimeline("connect");
        begin(label("reading"));
        worker.execute(() -> {
            LibraryMetadata next = null;
            try {
                next = new LibraryMetadata(cancelled);
                LibraryMetadata active = next;
                LibraryMetadata.Scan result = active.scan((stage, count, total) -> {
                    currentStage = stage;
                    currentCompleted = count;
                    currentTotal = total;
                    recordProgress(stage, count, total);
                    setProgress("reading".equals(stage) ? label("reading") : label("progress_" + stage, count, total));
                });
                deliver(() -> { busy = false; service = active; scan = result; screen = Screen.LIST; render(); });
            } catch (CancellationException exception) { finishWith(label("scan_stopped")); }
            catch (Exception exception) { finishWith(reportFailure("scan", next, exception)); }
        });
    }

    private List<LibraryMetadata.Candidate> targets() {
        List<LibraryMetadata.Candidate> targets = new ArrayList<>();
        if (scan != null) for (LibraryMetadata.Candidate candidate : scan.candidates)
            if (selected.contains(candidate.track.cloudId)) targets.add(candidate);
        return targets;
    }

    private void startRepair() {
        List<LibraryMetadata.Candidate> targets = targets();
        if (targets.isEmpty()) { screen = Screen.LIST; render(); return; }
        diagnosticLog = "";
        resetTimeline("repair");
        begin(label("repairing", 0, targets.size()));
        worker.execute(() -> {
            int completed = 0, failed = 0, pendingLocal = 0;
            String lastError = "";
            for (LibraryMetadata.Candidate candidate : targets) {
                if (cancelled.get()) break;
                currentStage = "repair";
                currentCompleted = completed + failed;
                currentTotal = targets.size();
                recordProgress("repair", completed + failed, targets.size());
                setProgress(label("repairing", completed + failed, targets.size()));
                try {
                    if (!service.repair(candidate)) pendingLocal++;
                    completed++;
                }
                catch (CancellationException exception) { break; }
                catch (Exception exception) {
                    failed++;
                    lastError = reportFailure("repair", service, exception);
                    if (!(exception instanceof LibraryDaap.Failure)
                            || ((LibraryDaap.Failure) exception).kind != LibraryDaap.Kind.CONFLICT) break;
                }
            }
            String result = label("repair_result", completed, failed, targets.size() - completed - failed);
            if (pendingLocal > 0) result += "\n\n" + label("local_refresh_pending", pendingLocal);
            if (!lastError.isEmpty()) result += "\n\n" + lastError;
            finishWith(result);
        });
    }

    private void saveLog() {
        String payload = diagnosticLog;
        if (payload.isEmpty() || pendingLog != null || getActivity() == null) return;
        Intent intent = new Intent(Intent.ACTION_CREATE_DOCUMENT);
        intent.addCategory(Intent.CATEGORY_OPENABLE).setType("text/plain");
        String date = new SimpleDateFormat("yyyyMMdd-HHmmss", Locale.ROOT).format(new Date());
        intent.putExtra(Intent.EXTRA_TITLE, "apple-music-metadata-log-" + date + ".txt");
        pendingLog = payload;
        try { startActivityForResult(intent, SAVE_LOG); }
        catch (RuntimeException exception) {
            pendingLog = null;
            Log.w(TAG, "Could not open log save dialog: " + LibraryMetadata.causeName(exception));
            toast("log_save_failed");
        }
    }

    @Override public void onActivityResult(int request, int result, Intent data) {
        super.onActivityResult(request, result, data);
        if (request != SAVE_LOG) return;
        String payload = pendingLog;
        pendingLog = null;
        if (result != Activity.RESULT_OK) return;
        Uri uri = data == null ? null : data.getData();
        if (uri == null || payload == null) {
            toast("log_save_failed");
            return;
        }
        ContentResolver resolver = resources.getContentResolver();
        worker.execute(() -> {
            try (OutputStream output = resolver.openOutputStream(uri, "wt")) {
                if (output == null) throw new IOException("open_destination");
                output.write(payload.getBytes(StandardCharsets.UTF_8));
            } catch (IOException | RuntimeException exception) {
                Log.w(TAG, "Could not write metadata diagnostic log: " + LibraryMetadata.causeName(exception));
                main.post(() -> toast("log_save_failed"));
                return;
            }
            main.post(() -> toast("log_saved"));
        });
    }

    private void begin(String message) { busy = true; cancelled.set(false); progressText = message; render(); }
    private void stop() { cancelled.set(true); setProgress(label("stopping")); }
    private void setProgress(String value) {
        main.post(() -> {
            progressText = cancelled.get() ? label("stopping") : value;
            if (busy && page != null) page.setProgress(progressText);
        });
    }
    private void finishWith(String value) { deliver(() -> { busy = false; outcome = value; screen = Screen.RESULT; render(); }); }
    private void deliver(Runnable action) { main.post(() -> { if (!isResumed()) completion = action; else action.run(); }); }
    private void toast(String name) {
        if (resources != null) Toast.makeText(resources, label(name), Toast.LENGTH_SHORT).show();
    }
    private synchronized void resetTimeline(String initialStage) {
        operationStartMs = SystemClock.elapsedRealtime();
        currentStage = initialStage;
        currentCompleted = 0;
        currentTotal = 0;
        events.clear();
        events.add("+0ms stage=" + initialStage + " start");
    }
    private synchronized void recordProgress(String stage, int completed, int total) {
        long elapsed = SystemClock.elapsedRealtime() - operationStartMs;
        String entry = "+" + elapsed + "ms stage=" + stage + (total > 0 ? " " + completed + "/" + total : "");
        if (events.size() < MAX_EVENTS) events.add(entry);
        else events.set(MAX_EVENTS - 1, entry);
    }
    private String reportFailure(String action, LibraryMetadata currentService, Exception exception) {
        String diagnostic = LibraryMetadata.diagnostic(currentStage, currentCompleted, currentTotal, exception);
        List<String> snapshot;
        synchronized (this) {
            long elapsed = SystemClock.elapsedRealtime() - operationStartMs;
            if (events.size() < MAX_EVENTS) events.add("+" + elapsed + "ms ERROR " + diagnostic);
            else events.set(MAX_EVENTS - 1, "+" + elapsed + "ms ERROR " + diagnostic);
            snapshot = new ArrayList<>(events);
        }
        SimpleDateFormat utc = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'", Locale.ROOT);
        utc.setTimeZone(TimeZone.getTimeZone("UTC"));
        int rawTracks = currentService == null ? -1 : currentService.lastRawTrackCount();
        int libraryTracks = currentService == null ? -1 : currentService.lastLibraryTrackCount();
        diagnosticLog = LibraryMetadata.formatLogReport(
                utc.format(new Date()), appVersion(), "Android " + Build.VERSION.RELEASE + " (API " + Build.VERSION.SDK_INT + ")",
                Locale.getDefault().toLanguageTag(), action, rawTracks, libraryTracks, snapshot, diagnostic, exception);
        Log.w(TAG, "Metadata " + action + " failed: " + diagnostic + "\n" + LibraryMetadata.stackSummary(exception));
        return error(exception) + "\n\nDetails: " + diagnostic;
    }
    private String appVersion() {
        if (resources == null) return "unknown";
        try {
            PackageInfo info = resources.getPackageManager().getPackageInfo(resources.getPackageName(), 0);
            return info.versionName + " (" + info.getLongVersionCode() + ")";
        } catch (Exception exception) { return "unknown"; }
    }
    private String error(Exception exception) {
        if (exception instanceof LibraryDaap.Failure) {
            switch (((LibraryDaap.Failure) exception).kind) {
                case ACCOUNT_CHANGED: return label("account_changed");
                case CONFLICT: case LIBRARY_CHANGED: case IDENTITY: return label("conflict");
                case VERIFICATION: return label("verification_failed");
                default: return label("request_failed");
            }
        }
        return label("request_failed");
    }
    private String label(String name, Object... args) { return MetadataStrings.text(resources, name, args); }
    private void dismiss() { if (page != null) { page.dismiss(); page = null; } }
}
