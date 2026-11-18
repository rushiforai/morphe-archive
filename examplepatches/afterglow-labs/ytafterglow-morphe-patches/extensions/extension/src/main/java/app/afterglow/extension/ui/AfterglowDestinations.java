package app.afterglow.extension.ui;

import android.app.Activity;
import android.content.Intent;
import android.os.Handler;
import android.os.Looper;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.lang.ref.WeakReference;
import java.util.Map;
import java.util.WeakHashMap;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/** Destination factory and document handoff owned by the settings activity. */
public final class AfterglowDestinations {
    public interface Navigator {
        void openDestination(String destination);
        void openSettingsPage(String pageId);
        void closeToNativeHome();
    }
    interface Importer { void accept(byte[] bytes) throws Exception; }
    private static final int EXPORT = 7411, IMPORT = 7412;
    private static final Map<Activity, Pending> PENDING = new WeakHashMap<>();
    private static final ExecutorService FILES = Executors.newSingleThreadExecutor();
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private AfterglowDestinations() {}

    static SettingsScreen create(AfterglowActivity activity, String destination, Navigator navigator) {
        switch (destination) {
            case "controlCenter": return new ControlCenterScreen(activity, navigator);
            case "experimentLab": return new ExperimentLabScreen(activity, false);
            case "experimentSafety": return new ExperimentLabScreen(activity, true);
            case "aiHome": return new AiHomeScreen(activity, navigator);
            default: return null;
        }
    }

    static void export(AfterglowActivity activity, String name, byte[] bytes) {
        Intent intent = new Intent(Intent.ACTION_CREATE_DOCUMENT).addCategory(Intent.CATEGORY_OPENABLE)
                .setType("application/xml").putExtra(Intent.EXTRA_TITLE, name);
        start(activity, intent, EXPORT, new Pending(bytes, null));
    }
    static void importDocument(AfterglowActivity activity, Importer importer) {
        Intent intent = new Intent(Intent.ACTION_OPEN_DOCUMENT).addCategory(Intent.CATEGORY_OPENABLE).setType("*/*");
        start(activity, intent, IMPORT, new Pending(null, importer));
    }
    private static void start(AfterglowActivity activity, Intent intent, int request, Pending pending) {
        if (PENDING.containsKey(activity)) { activity.alert("Document", "Finish the current document action first."); return; }
        PENDING.put(activity, pending);
        try { activity.startActivityForResult(intent, request); }
        catch (Exception error) { PENDING.remove(activity); activity.alert("Document", "No document provider is available."); }
    }

    /** Return true when this is one of our requests, including a cancelled chooser. */
    public static boolean onActivityResult(AfterglowActivity activity, int request, int result, Intent data) {
        if (request != EXPORT && request != IMPORT) return false;
        Pending pending = PENDING.remove(activity);
        if (result != Activity.RESULT_OK || data == null || data.getData() == null) return true;
        if (pending == null) { activity.alert("Document", "The document action was interrupted. Please try it again."); return true; }
        WeakReference<AfterglowActivity> owner = new WeakReference<>(activity);
        android.content.ContentResolver resolver = activity.getApplicationContext().getContentResolver();
        android.net.Uri uri = data.getData();
        FILES.execute(() -> {
            String failure = null;
            try {
                if (request == EXPORT) {
                    try (OutputStream out = resolver.openOutputStream(uri, "wt")) {
                        if (out == null) throw new java.io.IOException("Couldn't open the destination document.");
                        out.write(pending.bytes); out.flush();
                    }
                } else {
                    try (InputStream in = resolver.openInputStream(uri); ByteArrayOutputStream out = new ByteArrayOutputStream()) {
                        if (in == null) throw new java.io.IOException("Couldn't open the selected document.");
                        byte[] buffer = new byte[8192]; int count;
                        while ((count = in.read(buffer)) != -1) {
                            if (out.size() + count > 4 * 1024 * 1024) throw new java.io.IOException("The document exceeds 4 MB.");
                            out.write(buffer, 0, count);
                        }
                        pending.importer.accept(out.toByteArray());
                    }
                }
            } catch (Exception error) { failure = error.getMessage() == null ? "The document action couldn't be completed." : error.getMessage(); }
            String message = failure;
            MAIN.post(() -> {
                AfterglowActivity host = owner.get();
                if (host == null || host.isFinishing() || host.isDestroyed()) return;
                host.alert("Document", message == null ? (request == EXPORT ? "Exported successfully." : "Imported successfully.") : message);
                host.refresh();
            });
        });
        return true;
    }

    /** Called by the activity on destruction; screen listeners detach with their views. */
    public static void onDestroy(AfterglowActivity activity) { PENDING.remove(activity); }
    private static final class Pending {
        final byte[] bytes; final Importer importer;
        Pending(byte[] bytes, Importer importer) { this.bytes = bytes; this.importer = importer; }
    }
}
