package app.voidhack.extension.applemusic.font;

import android.app.Activity;
import android.app.Fragment;
import android.content.ActivityNotFoundException;
import android.content.Intent;
import android.database.Cursor;
import android.net.Uri;
import android.provider.OpenableColumns;
import android.util.Log;
import android.widget.Toast;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

@SuppressWarnings("deprecation")
public final class FontPickerFragment extends Fragment {
    private static final String TAG = "VoidhackFontPicker";
    private static final String LOG_TAG = "AppleMusicFont";
    private static final int REQ_PICK_FONT = 0x5646;
    private static final long MAX_FONT_BYTES = 64L * 1024L * 1024L;

    interface Callback {
        void onFontImported(FontPrefs.FontSlot slot, FontInspector.FontInfo info);
    }

    private FontPrefs.FontSlot pendingSlot;
    private Callback pendingCallback;

    static void pick(Activity activity, FontPrefs.FontSlot slot, Callback callback) {
        if (activity == null || activity.isFinishing()) return;
        FontPickerFragment frag = (FontPickerFragment) activity.getFragmentManager().findFragmentByTag(TAG);
        if (frag == null) {
            frag = new FontPickerFragment();
            activity.getFragmentManager().beginTransaction().add(frag, TAG).commit();
            activity.getFragmentManager().executePendingTransactions();
        }
        frag.pendingSlot = slot;
        frag.pendingCallback = callback;

        Intent intent = new Intent(Intent.ACTION_OPEN_DOCUMENT);
        intent.addCategory(Intent.CATEGORY_OPENABLE);
        intent.setType("*/*");
        try {
            frag.startActivityForResult(intent, REQ_PICK_FONT);
        } catch (ActivityNotFoundException e) {
            Toast.makeText(activity, FontStrings.text(activity, "picker_unavailable"), Toast.LENGTH_SHORT).show();
        }
    }

    @Override
    public void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        if (requestCode != REQ_PICK_FONT) return;
        Activity act = getActivity();
        FontPrefs.FontSlot slot = pendingSlot;
        Callback cb = pendingCallback;
        pendingSlot = null;
        pendingCallback = null;

        if (act == null || slot == null || resultCode != Activity.RESULT_OK || data == null || data.getData() == null) {
            return;
        }
        Uri uri = data.getData();
        importFontUri(act, slot, uri, cb);
    }

    private void importFontUri(Activity act, FontPrefs.FontSlot slot, Uri uri, Callback cb) {
        File target = FontPrefs.slotFile(act, slot);
        File tmp = new File(target.getParentFile(), target.getName() + ".tmp");
        try (InputStream in = act.getContentResolver().openInputStream(uri)) {
            if (in == null) {
                Toast.makeText(act, FontStrings.text(act, "import_error"), Toast.LENGTH_SHORT).show();
                return;
            }
            long total = 0L;
            try (FileOutputStream out = new FileOutputStream(tmp)) {
                byte[] buf = new byte[16384];
                int n;
                while ((n = in.read(buf)) != -1) {
                    total += n;
                    if (total > MAX_FONT_BYTES) {
                        throw new IOException("Font file exceeds 64MB limit");
                    }
                    out.write(buf, 0, n);
                }
            }
            FontInspector.FontInfo info = FontInspector.inspect(tmp);
            if (!info.valid) {
                tmp.delete();
                Toast.makeText(act, FontStrings.text(act, "import_invalid"), Toast.LENGTH_LONG).show();
                return;
            }

            if (target.exists()) target.delete();
            if (!tmp.renameTo(target)) {
                try (InputStream copyIn = new java.io.FileInputStream(tmp);
                     FileOutputStream copyOut = new FileOutputStream(target)) {
                    byte[] buf = new byte[16384];
                    int n;
                    while ((n = copyIn.read(buf)) != -1) copyOut.write(buf, 0, n);
                }
                tmp.delete();
            }

            String displayName = info.displayName;
            if (displayName.isEmpty() || displayName.endsWith(".tmp")) {
                displayName = queryFileName(act, uri);
            }
            FontPrefs.setSlotDisplayName(act, slot, displayName);
            FontController.invalidateCache();
            Toast.makeText(act, FontStrings.text(act, "import_success", displayName), Toast.LENGTH_SHORT).show();
            if (cb != null) cb.onFontImported(slot, info);
        } catch (IOException | RuntimeException e) {
            tmp.delete();
            Log.w(LOG_TAG, "Failed importing custom font", e);
            Toast.makeText(act, FontStrings.text(act, "import_error"), Toast.LENGTH_LONG).show();
        }
    }

    private static String queryFileName(Activity act, Uri uri) {
        try (Cursor c = act.getContentResolver().query(uri, new String[]{OpenableColumns.DISPLAY_NAME}, null, null, null)) {
            if (c != null && c.moveToFirst()) {
                String name = c.getString(0);
                if (name != null && !name.trim().isEmpty()) return name.trim();
            }
        } catch (RuntimeException ignored) {
        }
        String last = uri.getLastPathSegment();
        return last != null ? last : "Custom Font";
    }
}
