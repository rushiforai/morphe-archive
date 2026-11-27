package app.ayham.extension.music.features;

import android.app.Activity;
import android.app.Fragment;
import android.content.ContentResolver;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.Intent;
import android.database.Cursor;
import android.net.Uri;
import android.os.Handler;
import android.os.Looper;
import android.preference.Preference;
import android.provider.DocumentsContract;
import android.util.AttributeSet;
import android.util.Log;
import android.widget.Toast;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Set;

import app.ayham.extension.music.addons.AddonDownloads;

/**
 * "Export lossless downloads" in Fork settings: copies every downloaded lossless file to a folder
 * the user picks (the system folder picker, so Music or any other), named "Artist - Title", with
 * its lyrics as an .lrc next to it where they were saved. Files already there are skipped. The
 * downloads themselves stay in the app, where YT's Downloads keeps them.
 */
@SuppressWarnings("deprecation")
public class ExportDownloadsPreference extends Preference {
    private static final String TAG = "AyhamDownloads";
    private static final String FRAGMENT = "ayham_export_picker";

    public ExportDownloadsPreference(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
        super(context, attrs, defStyleAttr, defStyleRes);
    }

    public ExportDownloadsPreference(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
    }

    public ExportDownloadsPreference(Context context, AttributeSet attrs) {
        super(context, attrs);
    }

    public ExportDownloadsPreference(Context context) {
        super(context);
    }

    @Override
    protected void onAttachedToActivity() {
        super.onAttachedToActivity();
        setTitle("Export lossless downloads");
        refresh();
    }

    private void refresh() {
        List<AddonDownloads.Saved> all = AddonDownloads.saved(getContext());
        long bytes = 0;
        for (AddonDownloads.Saved s : all) bytes += s.file.length();
        setSummary(all.isEmpty()
                ? "No lossless downloads yet. Pick Lossless in the download popup."
                : String.format(Locale.ROOT, "%d song%s, %.1f MB: copies them to a folder you pick, such as Music, named Artist - Title, with their lyrics", all.size(), all.size() == 1 ? "" : "s", bytes / 1048576.0));
    }

    @Override
    protected void onClick() {
        if (AddonDownloads.saved(getContext()).isEmpty()) {
            Toast.makeText(getContext(), "No lossless downloads yet", Toast.LENGTH_SHORT).show();
            return;
        }
        Activity a = activity(getContext());
        if (a == null) return;
        if (a.getFragmentManager().findFragmentByTag(FRAGMENT) == null) {
            a.getFragmentManager().beginTransaction().add(new Picker(), FRAGMENT).commitAllowingStateLoss();
        }
    }

    private static Activity activity(Context c) {
        while (c instanceof ContextWrapper) {
            if (c instanceof Activity) return (Activity) c;
            c = ((ContextWrapper) c).getBaseContext();
        }
        return null;
    }

    /** A headless fragment: opens the folder picker and gets its answer. */
    public static final class Picker extends Fragment {
        private static final int PICK = 0x4179;
        private boolean asked;

        @Override
        public void onCreate(android.os.Bundle saved) {
            super.onCreate(saved);
            asked = saved != null && saved.getBoolean("asked");
            if (asked) return;
            asked = true;
            Intent i = new Intent(Intent.ACTION_OPEN_DOCUMENT_TREE);
            i.addFlags(Intent.FLAG_GRANT_WRITE_URI_PERMISSION | Intent.FLAG_GRANT_READ_URI_PERMISSION);
            try {
                startActivityForResult(i, PICK);
            } catch (Exception e) {
                Toast.makeText(getActivity(), "No folder picker on this phone", Toast.LENGTH_SHORT).show();
                done();
            }
        }

        @Override
        public void onSaveInstanceState(android.os.Bundle out) {
            super.onSaveInstanceState(out);
            out.putBoolean("asked", asked);
        }

        @Override
        public void onActivityResult(int request, int result, Intent data) {
            if (request != PICK) return;
            Uri tree = result == Activity.RESULT_OK && data != null ? data.getData() : null;
            if (getActivity() == null) return;
            Context app = getActivity().getApplicationContext();
            done();
            if (tree == null) return;
            Toast.makeText(app, "Exporting…", Toast.LENGTH_SHORT).show();
            new Thread(() -> {
                String msg = export(app, tree);
                new Handler(Looper.getMainLooper()).post(() -> Toast.makeText(app, msg, Toast.LENGTH_LONG).show());
            }, "ayham-export").start();
        }

        private void done() {
            if (getFragmentManager() != null) getFragmentManager().beginTransaction().remove(this).commitAllowingStateLoss();
        }
    }

    /** Copies every downloaded file (and its lyrics) into the picked folder; returns what happened. */
    static String export(Context c, Uri tree) {
        ContentResolver r = c.getContentResolver();
        int copied = 0, skipped = 0, failed = 0;
        long bytes = 0;
        try {
            String treeDoc = DocumentsContract.getTreeDocumentId(tree);
            Uri parent = DocumentsContract.buildDocumentUriUsingTree(tree, treeDoc);
            Set<String> there = new HashSet<>();
            try (Cursor cur = r.query(DocumentsContract.buildChildDocumentsUriUsingTree(tree, treeDoc),
                    new String[]{DocumentsContract.Document.COLUMN_DISPLAY_NAME}, null, null, null)) {
                while (cur != null && cur.moveToNext()) there.add(cur.getString(0));
            }
            for (AddonDownloads.Saved s : AddonDownloads.saved(c)) {
                String base = fileName(s.name);
                String name = base + extension(s.file);
                if (there.contains(name)) {
                    skipped++;
                    continue;
                }
                try {
                    bytes += copy(r, parent, name, s.file);
                    copied++;
                    there.add(name);
                } catch (Exception e) {
                    failed++;
                    Log.w(TAG, "export of " + s.id + " failed: " + e);
                    continue;
                }
                // the lyrics are extra: a failure here leaves the song exported
                File lrc = OfflineIndex.lyricsFile(c, s.id);
                if (lrc != null && !there.contains(base + ".lrc")) {
                    try {
                        copy(r, parent, base + ".lrc", lrc);
                        there.add(base + ".lrc");
                    } catch (Exception e) {
                        Log.w(TAG, "export of " + s.id + "'s lyrics failed: " + e);
                    }
                }
            }
        } catch (Exception e) {
            Log.w(TAG, "export failed", e);
            return "Export failed: " + e.getMessage();
        }
        Log.i(TAG, "export: " + copied + " copied (" + bytes / 1024 + " KB), " + skipped + " already there, " + failed + " failed");
        return String.format(Locale.ROOT, "Exported %d song%s (%.1f MB)", copied, copied == 1 ? "" : "s", bytes / 1048576.0)
                + (skipped > 0 ? ", " + skipped + " already there" : "") + (failed > 0 ? ", " + failed + " failed" : "");
    }

    private static long copy(ContentResolver r, Uri parent, String name, File from) throws Exception {
        // octet-stream: the provider keeps the name as given
        Uri doc = DocumentsContract.createDocument(r, parent, "application/octet-stream", name);
        if (doc == null) throw new java.io.IOException("could not create " + name);
        long n = 0;
        try (InputStream in = new FileInputStream(from); OutputStream out = r.openOutputStream(doc)) {
            if (out == null) throw new java.io.IOException("could not write " + name);
            byte[] buf = new byte[1 << 16];
            for (int k; (k = in.read(buf)) > 0; ) {
                out.write(buf, 0, k);
                n += k;
            }
        } catch (Exception e) {
            // the half copy goes; failing that, the copy's own error is still the one told
            try {
                DocumentsContract.deleteDocument(r, doc);
            } catch (Exception ignored) {
            }
            throw e;
        }
        return n;
    }

    static String fileName(String name) {
        String s = name.replaceAll("[\\\\/:*?\"<>|\\p{Cntrl}]", "_").trim();
        if (s.length() > 150) s = s.substring(0, 150).trim();
        return s.isEmpty() ? "song" : s;
    }

    private static String extension(File f) {
        String n = f.getName();
        int dot = n.lastIndexOf('.');
        return dot < 0 ? ".flac" : n.substring(dot);
    }
}
