package app.morphe.extension.chmate;

import android.net.Uri;
import android.os.Looper;
import android.widget.EditText;
import java.lang.reflect.Field;
import java.lang.ref.WeakReference;
import java.util.Map;
import java.util.WeakHashMap;

/** Restores the live Edge reply body when ChMate serializes a stale ViewModel snapshot. */
public final class EdgeDraftAutosave {
    private static final Map<Object, Entry> EDITORS = new WeakHashMap<>();

    private static final class Entry {
        final String url;
        final WeakReference<EditText> body;
        Entry(String url, EditText body) { this.url = url; this.body = new WeakReference<>(body); }
    }

    public static void bind(Object fragment, EditText body, String threadUrl) {
        if (fragment == null || body == null || !isEdgeThread(threadUrl)) return;
        synchronized (EDITORS) { EDITORS.put(fragment, new Entry(threadUrl, body)); }
    }

    /** Called before the native draft writer drops its stale body from the current form. */
    static boolean restoreLiveBody(Object data, String url, String bodyField) {
        if (data == null || Looper.myLooper() != Looper.getMainLooper() || !isEdgeThread(url)) return false;
        String currentUrl = canonical(url);
        synchronized (EDITORS) {
            java.util.Iterator<Map.Entry<Object, Entry>> iterator = EDITORS.entrySet().iterator();
            while (iterator.hasNext()) {
                Map.Entry<Object, Entry> item = iterator.next();
                Entry entry = item.getValue();
                EditText body = entry.body.get();
                if (item.getKey() == null || body == null) { iterator.remove(); continue; }
                if (!currentUrl.equals(canonical(entry.url))) continue;
                try {
                    CharSequence text = body.getText();
                    if (text == null || text.length() == 0) return false;
                    Field field = NativeFields.find(data.getClass(), bodyField);
                    field.set(data, text.toString());
                    return true;
                } catch (Exception failure) {
                    android.util.Log.w("Haiagaru.Posting", "Live Edge draft body restore failed", failure);
                    return false;
                }
            }
        }
        return false;
    }

    private static boolean isEdgeThread(String raw) {
        if (raw == null || !BoardUrlPicker.threadUrl(raw)) return false;
        String host = Uri.parse(raw).getHost();
        return "bbs.eddibb.cc".equalsIgnoreCase(host) || "bbs.eddibb.net".equalsIgnoreCase(host)
                || "bbs.eddibb.org".equalsIgnoreCase(host);
    }

    private static String canonical(String raw) {
        Uri uri = Uri.parse(raw);
        String path = uri.getPath();
        if (path == null) path = "";
        while (path.length() > 1 && path.endsWith("/")) path = path.substring(0, path.length() - 1);
        return String.valueOf(uri.getHost()).toLowerCase(java.util.Locale.ROOT) + path;
    }

    private EdgeDraftAutosave() { }
}
