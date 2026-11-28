package app.morphe.extension.sabp.read;

import android.content.ContentResolver;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.UriPermission;
import android.database.Cursor;
import android.net.Uri;
import android.provider.DocumentsContract;
import android.provider.OpenableColumns;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Locale;
import java.util.Map;

import app.morphe.extension.sabp.EppyDiag;

/**
 * Keeps paired EPUB/PDF files as private copies instead of holding a persistent permission to
 * the user's file.
 *
 * <p>Why: Smart AudioBook Player treats every persisted URI permission the app holds as a
 * library folder and calls DocumentsContract.getTreeDocumentId() on it — in PlayerService.onCreate
 * and in its statistics task. A permission to a single document (what read-along used to take)
 * makes that throw "Invalid URI", so SABP's service crashes on every start: the crash loop that
 * only clearing the app's data fixed (it also cleared the permission). Device log, 2026-10-24.
 *
 * <p>So eppy never keeps a document permission: it copies the picked file into its own storage and
 * reads the copy. {@link #rescue} runs at app start, before SABP's service, and removes any document
 * permission left by older eppy versions, copying the file first so the pairing keeps working.
 */
public final class DocStore {
    private static final long RESCUE_COPY_LIMIT = 150L * 1024 * 1024;

    private DocStore() {
    }

    static File dir(Context c) {
        File d = new File(c.getFilesDir(), "eppy_readalong/docs");
        d.mkdirs();
        return d;
    }

    /** Copies a picked document into private storage; returns a file:// Uri, or null on failure. */
    public static Uri importCopy(Context c, Uri src, String displayName) {
        String ext = "";
        String n = displayName != null ? displayName.toLowerCase(Locale.ROOT) : "";
        if (n.endsWith(".epub")) ext = ".epub";
        else if (n.endsWith(".pdf")) ext = ".pdf";
        else if (n.endsWith(".txt")) ext = ".txt";
        File out = new File(dir(c), "doc_" + Integer.toHexString(src.toString().hashCode()) + ext);
        File tmp = new File(out.getPath() + ".part");
        try (InputStream in = c.getContentResolver().openInputStream(src); OutputStream os = new FileOutputStream(tmp)) {
            if (in == null) return null;
            byte[] buf = new byte[64 * 1024];
            int r;
            while ((r = in.read(buf)) > 0) os.write(buf, 0, r);
        } catch (Throwable t) {
            tmp.delete();
            EppyDiag.error("readalong", "couldn't copy the document: " + t);
            return null;
        }
        if (out.exists()) out.delete();
        if (!tmp.renameTo(out)) return null;
        return Uri.fromFile(out);
    }

    public static boolean isPrivateCopy(Context c, String uri) {
        return uri != null && uri.startsWith("file:") && uri.contains(dir(c).getAbsolutePath());
    }

    public static void deleteCopy(Context c, String uri) {
        if (!isPrivateCopy(c, uri)) return;
        try {
            new File(Uri.parse(uri).getPath()).delete();
        } catch (Throwable ignored) {
        }
    }

    /**
     * Called from Application.onCreate (before PlayerService starts). Releases every persisted
     * permission that isn't a folder tree, after copying paired documents so read-along keeps them.
     */
    public static void rescue(Context c) {
        ContentResolver cr = c.getContentResolver();
        int released = 0;
        for (UriPermission p : cr.getPersistedUriPermissions()) {
            Uri u = p.getUri();
            if (DocumentsContract.isTreeUri(u)) continue;
            try {
                migratePairing(c, u);
            } catch (Throwable t) {
                EppyDiag.log("readalong", "rescue copy failed: " + t.getClass().getSimpleName());
            }
            try {
                cr.releasePersistableUriPermission(u, Intent.FLAG_GRANT_READ_URI_PERMISSION
                        | (p.isWritePermission() ? Intent.FLAG_GRANT_WRITE_URI_PERMISSION : 0));
                released++;
            } catch (Throwable t) {
                EppyDiag.error("readalong", "couldn't release document permission: " + t);
            }
        }
        if (released > 0) EppyDiag.log("readalong", "released " + released + " document permission(s) that crash SABP's service");
    }

    private static void migratePairing(Context c, Uri u) {
        SharedPreferences prefs = c.getSharedPreferences("eppy_readalong", Context.MODE_PRIVATE);
        String target = u.toString();
        for (Map.Entry<String, ?> e : prefs.getAll().entrySet()) {
            if (!e.getKey().startsWith("doc:") || !target.equals(e.getValue())) continue;
            long size = -1;
            String name = prefs.getString("name:" + e.getKey().substring(4), null);
            try (Cursor cur = c.getContentResolver().query(u, new String[]{OpenableColumns.SIZE}, null, null, null)) {
                if (cur != null && cur.moveToFirst() && !cur.isNull(0)) size = cur.getLong(0);
            } catch (Throwable ignored) {
            }
            Uri copy = size >= 0 && size <= RESCUE_COPY_LIMIT ? importCopy(c, u, name) : null;
            if (copy != null) {
                prefs.edit().putString(e.getKey(), copy.toString()).commit();
                // Keep the extracted-text cache: it's keyed by the document URI.
                File dir = new File(c.getFilesDir(), "eppy_readalong");
                File old = new File(dir, "text_" + Integer.toHexString(target.hashCode()) + ".json");
                if (old.exists()) old.renameTo(new File(dir, "text_" + Integer.toHexString(copy.toString().hashCode()) + ".json"));
                EppyDiag.log("readalong", "kept pairing by copying the document");
            } else {
                prefs.edit().remove(e.getKey()).remove("name:" + e.getKey().substring(4)).commit();
                EppyDiag.log("readalong", "pairing removed (document too large or unreadable to copy)");
            }
        }
    }
}
