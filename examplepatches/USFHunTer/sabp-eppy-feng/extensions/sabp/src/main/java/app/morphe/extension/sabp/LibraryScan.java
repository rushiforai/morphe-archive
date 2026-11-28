package app.morphe.extension.sabp;

import android.content.ContentResolver;
import android.content.Context;
import android.content.UriPermission;
import android.database.Cursor;
import android.net.Uri;
import android.os.Handler;
import android.os.Looper;
import android.provider.DocumentsContract;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.concurrent.atomic.AtomicBoolean;

/**
 * Pull-to-refresh check of the library folders against SABP's library: walks the folders SABP
 * was given access to (its persisted tree permissions), finds folders that contain audio, and
 * reports books that are new, missing or moved. Runs on a background thread, can be cancelled,
 * and never touches playback or SABP's database: adding books is SABP's own scan.
 */
public final class LibraryScan {
    public interface Listener {
        void onProgress(int foldersVisited);

        void onDone(Result r);
    }

    public static final class Result {
        public final ArrayList<String> added = new ArrayList<>();   // folder names
        public final ArrayList<String> missing = new ArrayList<>(); // book titles
        public final ArrayList<String> moved = new ArrayList<>();   // book titles
        public int folders;
        public int roots;
        public boolean cancelled;
        public String error;

        public String summary() {
            if (error != null) return error;
            if (cancelled) return "Scan stopped";
            ArrayList<String> parts = new ArrayList<>();
            int newCount = added.size() - moved.size();
            if (newCount > 0) parts.add(newCount + " new");
            int gone = missing.size() - moved.size();
            if (gone > 0) parts.add(gone + " missing");
            if (!moved.isEmpty()) parts.add(moved.size() + " moved");
            return parts.isEmpty() ? "Library is up to date" : String.join(", ", parts);
        }

        public boolean hasChanges() {
            return error == null && !cancelled && (!added.isEmpty() || !missing.isEmpty());
        }
    }

    private static final String[] AUDIO = {".mp3", ".m4a", ".m4b", ".aac", ".ogg", ".oga", ".opus", ".flac", ".wav", ".wma", ".mp4", ".awb", ".amr", ".mka"};
    private static final int MAX_FOLDERS = 8000, MAX_DEPTH = 6;

    private final AtomicBoolean cancel = new AtomicBoolean();
    private final Handler main = new Handler(Looper.getMainLooper());
    private Thread thread;

    public boolean running() {
        return thread != null && thread.isAlive();
    }

    public void cancel() {
        cancel.set(true);
    }

    /** books: folder URI → title for every book SABP currently lists. */
    public void start(Context context, HashMap<String, String> books, Listener l) {
        if (running()) return;
        cancel.set(false);
        final Context c = context.getApplicationContext();
        thread = new Thread(() -> {
            Result r = new Result();
            try {
                scan(c, books, r, l);
            } catch (Throwable t) {
                r.error = "Couldn't read the library folders (" + t.getClass().getSimpleName() + ")";
                EppyDiag.error("library", "scan failed: " + t);
            }
            r.cancelled = cancel.get();
            EppyDiag.log("library", "scan: " + r.summary() + " · " + r.folders + " folders in " + r.roots + " roots");
            main.post(() -> l.onDone(r));
        }, "eppy-library-scan");
        thread.setPriority(Thread.MIN_PRIORITY);
        thread.start();
    }

    private void scan(Context c, HashMap<String, String> books, Result r, Listener l) {
        ContentResolver cr = c.getContentResolver();
        ArrayList<Uri> roots = new ArrayList<>();
        for (UriPermission p : cr.getPersistedUriPermissions()) {
            Uri u = p.getUri();
            if (p.isReadPermission() && DocumentsContract.isTreeUri(u)) roots.add(u);
        }
        if (roots.isEmpty()) {
            r.error = "Smart AudioBook Player has no library folder access yet. Choose a folder in its library first.";
            return;
        }
        // Library books by document id (the tree prefix of a URI can differ).
        HashMap<String, String> byDoc = new HashMap<>();
        for (java.util.Map.Entry<String, String> e : books.entrySet()) {
            String id = docId(e.getKey());
            if (id != null) byDoc.put(id, e.getValue());
        }
        HashSet<String> seen = new HashSet<>();
        HashMap<String, String> newByName = new HashMap<>();
        ArrayList<String> scannedRoots = new ArrayList<>();
        for (Uri tree : roots) {
            if (cancel.get()) return;
            String rootId = DocumentsContract.getTreeDocumentId(tree);
            // Read-along documents also hold tree grants; only walk trees that contain books.
            boolean holdsBooks = false;
            for (String id : byDoc.keySet()) if (id.startsWith(rootId)) holdsBooks = true;
            if (!holdsBooks && !byDoc.isEmpty()) continue;
            r.roots++;
            scannedRoots.add(rootId);
            walk(cr, tree, rootId, 0, seen, byDoc, newByName, r, l);
        }
        for (java.util.Map.Entry<String, String> e : byDoc.entrySet()) {
            boolean inScannedRoot = false;
            for (String root : scannedRoots) if (e.getKey().startsWith(root)) inScannedRoot = true;
            if (inScannedRoot && !seen.contains(e.getKey())) {
                r.missing.add(e.getValue());
                if (newByName.containsKey(lastSegment(e.getKey()).toLowerCase(Locale.ROOT))) r.moved.add(e.getValue());
            }
        }
        r.added.addAll(newByName.values());
    }

    private void walk(ContentResolver cr, Uri tree, String docId, int depth, HashSet<String> seen, HashMap<String, String> library,
                      HashMap<String, String> newByName, Result r, Listener l) {
        if (cancel.get() || depth > MAX_DEPTH || r.folders >= MAX_FOLDERS) return;
        r.folders++;
        if (r.folders % 25 == 0) {
            final int n = r.folders;
            main.post(() -> l.onProgress(n));
        }
        Uri children = DocumentsContract.buildChildDocumentsUriUsingTree(tree, docId);
        ArrayList<String> dirs = new ArrayList<>();
        boolean audio = false;
        try (Cursor cur = cr.query(children, new String[]{DocumentsContract.Document.COLUMN_DOCUMENT_ID,
                DocumentsContract.Document.COLUMN_DISPLAY_NAME, DocumentsContract.Document.COLUMN_MIME_TYPE}, null, null, null)) {
            if (cur == null) return;
            while (cur.moveToNext()) {
                String id = cur.getString(0), name = cur.getString(1), mime = cur.getString(2);
                if (DocumentsContract.Document.MIME_TYPE_DIR.equals(mime)) {
                    if (name != null && !name.startsWith(".") && !name.startsWith("!Smart AudioBook Player")) dirs.add(id);
                } else if (!audio && name != null) {
                    String n = name.toLowerCase(Locale.ROOT);
                    for (String ext : AUDIO) if (n.endsWith(ext)) { audio = true; break; }
                }
            }
        } catch (Throwable t) {
            return;
        }
        if (audio) {
            seen.add(docId);
            if (!library.containsKey(docId)) newByName.put(lastSegment(docId).toLowerCase(Locale.ROOT), lastSegment(docId));
        }
        for (String d : dirs) walk(cr, tree, d, depth + 1, seen, library, newByName, r, l);
    }

    private static String docId(String uri) {
        try {
            Uri u = Uri.parse(uri);
            return uri.contains("/document/") ? DocumentsContract.getDocumentId(u)
                    : DocumentsContract.getTreeDocumentId(u);
        } catch (Throwable t) {
            return null;
        }
    }

    private static String lastSegment(String docId) {
        int i = Math.max(docId.lastIndexOf('/'), docId.lastIndexOf(':'));
        return i >= 0 ? docId.substring(i + 1) : docId;
    }
}
