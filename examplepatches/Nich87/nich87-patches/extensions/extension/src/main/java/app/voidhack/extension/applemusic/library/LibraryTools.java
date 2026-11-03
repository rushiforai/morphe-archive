package app.voidhack.extension.applemusic.library;

import android.app.Activity;
import android.app.Dialog;
import android.app.Fragment;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import android.view.View;
import android.widget.TextView;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.concurrent.Callable;
import java.util.concurrent.CancellationException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.function.Consumer;

import static app.voidhack.extension.applemusic.library.LibraryStrings.text;
import static app.voidhack.extension.applemusic.library.LibraryStrings.quantity;

public final class LibraryTools extends Fragment {
    private static final String TAG = "AppleMusicLibraryTools";
    private static final int EXPORT = 0x5641;
    private static final int IMPORT = 0x5642;
    private final ExecutorService worker = Executors.newSingleThreadExecutor();
    private final Handler main = new Handler(Looper.getMainLooper());
    final AtomicBoolean cancelled = new AtomicBoolean();
    private String progressResource = "reading_library";
    private Object[] progressArguments = new Object[0];
    LibraryDownloads.Queue resumeDownloads;
    private boolean busy;
    private Dialog progress;
    private final Runnable revealSpinner = () -> {
        if (progress != null && progress.isShowing()) {
            View spinner = progress.findViewById(android.R.id.progress);
            if (spinner != null) spinner.setVisibility(View.VISIBLE);
        }
    };
    private String stopNotice = "";
    private Dialog dialog;
    private LibraryBackup pendingExport;
    private Runnable completion;

    public LibraryTools() {}

    static void open(Activity activity, int action) {
        LibraryTools tools = (LibraryTools) activity.getFragmentManager().findFragmentByTag(TAG);
        if (tools == null) {
            tools = new LibraryTools();
            activity.getFragmentManager().beginTransaction().add(tools, TAG).commit();
            activity.getFragmentManager().executePendingTransactions();
        }
        LibraryTools current = tools;
        activity.getWindow().getDecorView().post(() -> current.perform(action));
    }

    @Override public void onCreate(Bundle state) {
        super.onCreate(state);
        setRetainInstance(true);
    }

    @Override public void onResume() {
        super.onResume();
        if (completion != null) { Runnable action = completion; completion = null; action.run(); }
        else if (busy) showProgress();
        if (resumeDownloads != null) {
            LibraryDownloads.Queue queue = resumeDownloads;
            resumeDownloads = null;
            queue.next();
        }
    }

    @Override public void onDetach() {
        dismissDialogs();
        super.onDetach();
    }

    @Override public void onDestroy() {
        cancelled.set(true);
        worker.shutdown();
        super.onDestroy();
    }

    private void perform(int action) {
        if (busy) { showProgress(); return; }
        if (getActivity() == null) return;
        dismissDialogs();
        if (action < 2) prepareExport(action == 0);
        else if (action == 2) selectDocument(IMPORT);
        else prepareDownloads();
    }

    private void prepareExport(boolean includeLibrary) {
        run("reading_library", "", () -> new LibraryTransfer(cancelled).export(includeLibrary), backup -> {
            pendingExport = backup;
            selectDocument(EXPORT);
        });
    }

    private void selectDocument(int request) {
        Intent intent = new Intent(request == EXPORT ? Intent.ACTION_CREATE_DOCUMENT : Intent.ACTION_OPEN_DOCUMENT);
        intent.addCategory(Intent.CATEGORY_OPENABLE).setType("application/json");
        if (request == EXPORT) {
            String date = new SimpleDateFormat("yyyyMMdd-HHmmss", Locale.ROOT).format(new Date());
            intent.putExtra(Intent.EXTRA_TITLE, "apple-music-" + date + ".json");
        }
        try { startActivityForResult(intent, request); }
        catch (RuntimeException exception) { pendingExport = null; fail(exception); }
    }

    @Override public void onActivityResult(int request, int result, Intent data) {
        super.onActivityResult(request, result, data);
        if (request != EXPORT && request != IMPORT) return;
        if (result != Activity.RESULT_OK || data == null || data.getData() == null) { pendingExport = null; return; }
        Uri uri = data.getData();
        android.content.ContentResolver resolver = getActivity().getContentResolver();
        if (request == EXPORT) {
            LibraryBackup backup = pendingExport;
            pendingExport = null;
            if (backup == null) { fail(new LibraryFailure("restarted")); return; }
            run("writing_backup", "stop_export", () -> {
                try (OutputStream output = resolver.openOutputStream(uri, "wt")) {
                    if (output == null) throw new LibraryFailure("open_destination");
                    backup.write(output, cancelled);
                } catch (LibraryFailure failure) { throw failure; }
                catch (IOException | SecurityException exception) {
                    LibraryFailure failure = new LibraryFailure("file_write_failed");
                    failure.initCause(exception);
                    throw failure;
                }
                return backup;
            }, resultBackup -> showMessage("export_finished", LibraryStrings.counts(getActivity(), resultBackup)));
        } else {
            run("reading_backup", "", () -> {
                try (InputStream input = resolver.openInputStream(uri)) {
                    if (input == null) throw new LibraryFailure("open_backup");
                    return LibraryBackup.read(input, cancelled);
                } catch (LibraryFailure failure) { throw failure; }
                catch (IOException | SecurityException exception) {
                    LibraryFailure failure = new LibraryFailure("file_read_failed");
                    failure.initCause(exception);
                    throw failure;
                }
            }, this::confirmImport);
        }
    }

    private void confirmImport(LibraryBackup backup) {
        dialog = new LibraryUi(getActivity(), label("import_backup"))
                .message(label("import_preview", LibraryStrings.counts(getActivity(), backup)))
                .negative(label("cancel"), null)
                .positive(label("import"), (selected, which) -> run("importing", "stop_import",
                        () -> new LibraryTransfer(cancelled).restore(backup), result -> showMessage("import_result",
                                label("restore_summary", quantity(getActivity(), "added", result.added),
                                        quantity(getActivity(), "created", result.created),
                                        quantity(getActivity(), "existing", result.existing),
                                        quantity(getActivity(), "unresolved_tracks", result.skipped),
                                        quantity(getActivity(), "unresolved_playlists", result.unresolvedPlaylists))))).show();
    }

    private void prepareDownloads() {
        run("checking_downloads", "", () -> LibraryDownloads.pending(cancelled), songs -> {
            if (songs.isEmpty()) { showMessage("download_all", label("download_empty")); return; }
            dialog = new LibraryUi(getActivity(), label("download_all"))
                    .message(label("download_preview", quantity(getActivity(), "download_songs", songs.size())))
                    .negative(label("cancel"), null)
                    .positive(label("download"), (selected, which) -> {
                        beginOperation("requesting_downloads", "stop_download");
                        new LibraryDownloads.Queue(this, songs).next();
                    }).show();
        });
    }

    private void beginOperation(String message, String notice) {
        busy = true;
        cancelled.set(false);
        progressResource = message;
        progressArguments = new Object[0];
        stopNotice = notice;
        showProgress();
    }

    private <T> void run(String message, String notice, Callable<T> operation, Consumer<T> done) {
        beginOperation(message, notice);
        worker.execute(() -> {
            try {
                T result = operation.call();
                deliver(() -> {
                    finish();
                    if (!cancelled.get()) done.accept(result);
                    else showStopped();
                });
            } catch (CancellationException exception) {
                deliver(() -> { finish(); showStopped(); });
            } catch (Exception exception) { deliver(() -> fail(exception)); }
        });
    }

    private void deliver(Runnable action) {
        main.post(() -> {
            if (!isResumed()) completion = action;
            else action.run();
        });
    }

    private void showProgress() {
        if (getActivity() == null || (progress != null && progress.isShowing())) return;
        progress = new LibraryUi(getActivity(), label("title"))
                .negative(label("stop"), null).progress(progressText());
        TextView stop = progress.findViewById(android.R.id.button2);
        stop.setOnClickListener(view -> {
            cancelled.set(true);
            stop.setEnabled(false);
            setProgress("stopping");
        });
        View spinner = progress.findViewById(android.R.id.progress);
        if (spinner != null) {
            spinner.setVisibility(View.INVISIBLE);
            main.postDelayed(revealSpinner, 1000);
        }
    }

    private String progressText() {
        return label(progressResource, progressArguments) + (stopNotice.isEmpty() ? "" : "\n\n" + label(stopNotice));
    }

    void setProgress(String resource, Object... arguments) {
        progressResource = resource;
        progressArguments = arguments;
        if (progress != null) ((TextView) progress.findViewById(android.R.id.message)).setText(progressText());
    }

    void finishDownloads(int requested) {
        finish();
        showMessage("download_result", label("download_summary", quantity(getActivity(), "requested", requested))
                + (cancelled.get() ? "\n\n" + label("download_stopped") : ""));
    }
    private void finish() { busy = false; dismissDialogs(); }

    void fail(Exception exception) {
        fail(exception, "");
    }

    void failDownloads(int requested, Exception exception) {
        fail(exception, quantity(getActivity(), "requested", requested) + "\n" + label("download_stopped"));
    }

    private void fail(Exception exception, String outcome) {
        Log.w(TAG, "Library operation failed", exception);
        finish();
        String cause = exception instanceof LibraryFailure
                ? label(((LibraryFailure) exception).resource, ((LibraryFailure) exception).arguments)
                : label("operation_failed");
        showMessage("failed_title", outcome.isEmpty() ? cause : outcome + "\n\n" + cause);
    }

    private String label(String resource, Object... arguments) { return text(getActivity(), resource, arguments); }

    private void showStopped() { showMessage("stopped", label(stopNotice.isEmpty() ? "stopped_read" : stopNotice)); }

    private void showMessage(String title, String message) {
        if (getActivity() != null) dialog = new LibraryUi(getActivity(), label(title))
                .message(message).positive(label("close"), null).show();
    }

    private void dismissDialogs() {
        main.removeCallbacks(revealSpinner);
        if (progress != null) { progress.dismiss(); progress = null; }
        if (dialog != null) { dialog.dismiss(); dialog = null; }
    }
}
