package app.voidhack.extension.applemusic.library;

import android.app.Activity;
import android.app.Fragment;
import android.content.Context;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.concurrent.CancellationException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.atomic.AtomicBoolean;

public final class MetadataRepair extends Fragment {
    private static final String TAG = "AppleMusicMetadataRepair";
    private final ExecutorService worker = Executors.newSingleThreadExecutor();
    private final Handler main = new Handler(Looper.getMainLooper());
    private final AtomicBoolean cancelled = new AtomicBoolean();
    private final Set<Long> selected = new HashSet<>();
    private LibraryMetadata service;
    private LibraryMetadata.Scan scan;
    private MetadataRepairPage page;
    private boolean busy, visible;
    private boolean onlyRomanized = true;
    private Runnable completion;
    private String progressText = "", outcome = "", query = "";
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
            case RESULT: page.message(outcome, label("rescan"), this::startScan); break;
        }
    }

    private void back() {
        if (busy) { stop(); return; }
        if (screen == Screen.CONFIRM) { screen = Screen.LIST; render(); }
        else { visible = false; dismiss(); }
    }

    private void startScan() {
        selected.clear(); query = ""; onlyRomanized = true;
        begin(label("reading"));
        worker.execute(() -> {
            try {
                LibraryMetadata next = new LibraryMetadata(cancelled);
                LibraryMetadata.Scan result = next.scan((stage, count, total) -> setProgress(
                        "reading".equals(stage) ? label("reading") : label("progress_" + stage, count, total)));
                deliver(() -> { busy = false; service = next; scan = result; screen = Screen.LIST; render(); });
            } catch (CancellationException exception) { finishWith(label("scan_stopped")); }
            catch (Exception exception) { finishWith(error(exception)); }
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
        begin(label("repairing", 0, targets.size()));
        worker.execute(() -> {
            int completed = 0, failed = 0, pendingLocal = 0;
            String lastError = "";
            for (LibraryMetadata.Candidate candidate : targets) {
                if (cancelled.get()) break;
                setProgress(label("repairing", completed + failed, targets.size()));
                try {
                    if (!service.repair(candidate)) pendingLocal++;
                    completed++;
                }
                catch (CancellationException exception) { break; }
                catch (Exception exception) {
                    failed++;
                    lastError = error(exception);
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
