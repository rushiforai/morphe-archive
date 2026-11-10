package app.libby.font;

import android.app.Activity;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.Intent;
import android.content.SharedPreferences;
import android.database.Cursor;
import android.net.Uri;
import android.provider.OpenableColumns;
import android.util.Log;
import android.webkit.JavascriptInterface;
import android.webkit.WebView;
import android.widget.Toast;

import app.libby.web.MorpheWebRouter;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.lang.ref.WeakReference;
import java.util.Locale;

/**
 * Native side of the font UI.
 *
 * The reader is a remote WebView page, and Libby's WebChromeClient does not
 * implement onShowFileChooser, so an HTML file input cannot open a picker.
 * This bridge opens the system document picker instead, copies the chosen font
 * into the app's internal storage, and serves it through the shared
 * /morphe/ router. Uploaded fonts form a small library: one file per font plus
 * a JSON index in SharedPreferences. Files are streamed from disk, never loaded
 * into a string.
 */
public final class FontBridge {

    private static final String TAG = "MorpheFont";
    private static final String PREFS = "morphe_font";
    private static final String KEY_ENABLED = "enabled";
    private static final String KEY_SELECTED = "selected";
    private static final String KEY_LIBRARY = "library";
    private static final String KEY_WEIGHT = "weight";

    // Older builds stored exactly one font. These keys are migrated on first read.
    private static final String KEY_LEGACY_NAME = "font_name";
    private static final String KEY_LEGACY_FILE = "font_file";
    private static final String KEY_LEGACY_FORMAT = "font_format";
    private static final String KEY_LEGACY_VERSION = "font_version";

    private static final String FONT_DIR = "morphe-fonts";
    private static final int REQUEST_CODE = 0x4D46;
    private static final String FONT_ROUTE = "font";

    // "current" keeps working for older injected CSS; new URLs use the font id
    // so switching fonts never reuses a cached response.
    private static final String CURRENT = "current";

    private static final MorpheWebRouter.RouteHandler FONT_HANDLER =
            (view, request, path) -> {
                if (view == null || request == null) {
                    return null;
                }
                if (!"GET".equalsIgnoreCase(request.getMethod())) {
                    return null;
                }

                Context context = view.getContext();
                if (context == null) {
                    return null;
                }

                JSONObject entry;
                int face = 0;
                synchronized (FontBridge.class) {
                    if (CURRENT.equals(path)) {
                        entry = selectedEntry(context);
                        if (entry != null) {
                            face = Math.max(0, liveFace(context, entry));
                        }
                    } else {
                        int slash = path.indexOf('/');
                        String id = slash < 0 ? path : path.substring(0, slash);
                        if (slash >= 0) {
                            face = parseFace(path.substring(slash + 1));
                        }
                        entry = findEntry(library(context), id);
                    }
                }
                if (entry == null) {
                    return null;
                }

                JSONObject variant = variantOf(entry, face);
                if (variant == null) {
                    return null;
                }
                File file = resolve(context, variant.optString("file"));
                if (file == null) {
                    return null;
                }

                return MorpheWebRouter.stream(
                        file, mimeFor(variant.optString("format", "woff2")));
            };

    private static WeakReference<WebView> pendingWebView = new WeakReference<>(null);
    // Null means a new font; otherwise the picked file becomes a face of this entry.
    private static String pendingTargetId = null;

    private final WeakReference<WebView> webView;

    public FontBridge(WebView webView) {
        this.webView = new WeakReference<>(webView);
    }

    /**
     * Registers the bridge before the WebView loads a page. Calling
     * addJavascriptInterface from onPageFinished is too late for the current page.
     */
    public static void install(WebView webView) {
        if (webView != null) {
            MorpheWebRouter.register(FONT_ROUTE, FONT_HANDLER);
            webView.addJavascriptInterface(new FontBridge(webView), "MorpheFontBridge");
        }
    }

    @JavascriptInterface
    public String getHtml() {
        return FontUiData.HTML;
    }

    @JavascriptInterface
    public String getCss() {
        return FontUiData.CSS;
    }

    /** Opens the native document picker for a new family. */
    @JavascriptInterface
    public void pickFont() {
        openPicker(webView.get(), null);
    }

    /** Adds the picked file as another face of an existing family. */
    @JavascriptInterface
    public void pickVariant(String id) {
        if (id == null || id.isEmpty()) {
            return;
        }
        openPicker(webView.get(), id);
    }

    private static void openPicker(WebView view, String targetId) {
        if (view == null) {
            return;
        }

        // JavascriptInterface methods run on a WebView worker thread.
        // getUrl()/getContext() and startActivityForResult must run on the UI thread.
        view.post(() -> {
            try {
                String url = view.getUrl();
                if (url == null || !url.contains("read.libbyshelf.com")) {
                    return;
                }

                Activity activity = activityFrom(view.getContext());
                if (activity == null) {
                    notifyError(view, "No activity");
                    return;
                }

                pendingWebView = new WeakReference<>(view);
                pendingTargetId = targetId;
                Intent intent = new Intent(Intent.ACTION_OPEN_DOCUMENT);
                intent.addCategory(Intent.CATEGORY_OPENABLE);
                intent.setType("*/*");
                activity.startActivityForResult(intent, REQUEST_CODE);
            } catch (Throwable t) {
                Log.e(TAG, "pickFont failed", t);
                notifyError(view, "Could not open the file picker: " + t);
            }
        });
    }

    @JavascriptInterface
    public void setEnabled(boolean enabled) {
        WebView view = webView.get();
        if (view == null) {
            return;
        }
        try {
            Context context = view.getContext();
            boolean hasFont = selectedEntry(context) != null;
            prefs(context).edit()
                    .putBoolean(KEY_ENABLED, hasFont && enabled)
                    .apply();
        } catch (Throwable t) {
            Log.e(TAG, "setEnabled failed", t);
        }
    }

    /**
     * Reading weight applied to the chapter text. This is a user preference,
     * not a property of any stored face, so it lives next to enabled/selected.
     */
    @JavascriptInterface
    public String setWeight(int value) {
        WebView view = webView.get();
        if (view == null) {
            return "{}";
        }
        Context context = view.getContext();
        try {
            prefs(context).edit()
                    .putInt(KEY_WEIGHT, normalizeWeight(value))
                    .apply();
        } catch (Throwable t) {
            Log.e(TAG, "setWeight failed", t);
        }
        return libraryStateJson(context);
    }

    /**
     * Makes one stored font the active one and returns the updated library, so
     * the UI renders from one round trip.
     */
    @JavascriptInterface
    public String selectFont(String id) {
        WebView view = webView.get();
        if (view == null) {
            return "{}";
        }
        Context context = view.getContext();
        try {
            synchronized (FontBridge.class) {
                if (findEntry(library(context), id) != null) {
                    prefs(context).edit()
                            .putString(KEY_SELECTED, id)
                            .putBoolean(KEY_ENABLED, true)
                            .apply();
                }
            }
        } catch (Throwable t) {
            Log.e(TAG, "selectFont failed", t);
        }
        return libraryStateJson(context);
    }

    /**
     * Deletes one stored font and its file. Deleting the active font switches the
     * custom font off, so the reader falls back to the app's own typography; the
     * remaining fonts stay in the library.
     */
    @JavascriptInterface
    public String deleteFont(String id) {
        WebView view = webView.get();
        if (view == null || id == null || id.isEmpty()) {
            return "{}";
        }
        Context context = view.getContext();
        try {
            synchronized (FontBridge.class) {
                JSONArray stored = library(context);
                JSONArray remaining = new JSONArray();
                boolean removed = false;

                for (int i = 0; i < stored.length(); i++) {
                    JSONObject entry = stored.optJSONObject(i);
                    if (entry == null) {
                        continue;
                    }
                    if (id.equals(entry.optString("id"))) {
                        JSONArray variants = variantsOf(entry);
                        for (int j = 0; j < variants.length(); j++) {
                            JSONObject variant = variants.optJSONObject(j);
                            if (variant == null) {
                                continue;
                            }
                            File file = resolve(context, variant.optString("file"));
                            if (file != null) {
                                file.delete();
                            }
                        }
                        removed = true;
                        continue;
                    }
                    remaining.put(entry);
                }

                if (removed) {
                    SharedPreferences.Editor editor = prefs(context).edit()
                            .putString(KEY_LIBRARY, remaining.toString());
                    if (id.equals(selectedId(context))) {
                        editor.putString(KEY_SELECTED, "")
                                .putBoolean(KEY_ENABLED, false);
                    }
                    editor.apply();
                }
            }
        } catch (Throwable t) {
            Log.e(TAG, "deleteFont failed", t);
        }
        return libraryStateJson(context);
    }

    /** Renames a family; an empty name is ignored. Returns the updated library. */
    @JavascriptInterface
    public String renameFont(String id, String name) {
        WebView view = webView.get();
        if (view == null || id == null || id.isEmpty()) {
            return "{}";
        }
        Context context = view.getContext();
        try {
            String clean = cleanName(name);
            if (!clean.isEmpty()) {
                synchronized (FontBridge.class) {
                    JSONArray stored = library(context);
                    JSONObject entry = findEntry(stored, id);
                    if (entry != null && !clean.equals(entry.optString("name"))) {
                        entry.put("name", clean);
                        prefs(context).edit()
                                .putString(KEY_LIBRARY, stored.toString())
                                .apply();
                    }
                }
            }
        } catch (Throwable t) {
            Log.e(TAG, "renameFont failed", t);
        }
        return libraryStateJson(context);
    }

    /**
     * Stores the weight settings of one face. min == max means a static face; a
     * wider range is a variable face. The weight is the default instance.
     */
    @JavascriptInterface
    public String setFace(String id, int face, int weight, int weightMin,
                          int weightMax, boolean italic) {
        WebView view = webView.get();
        if (view == null || id == null || id.isEmpty()) {
            return "{}";
        }
        Context context = view.getContext();
        try {
            synchronized (FontBridge.class) {
                JSONArray stored = library(context);
                JSONObject entry = findEntry(stored, id);
                JSONObject variant = variantOf(entry, face);
                if (variant != null) {
                    int min = clampWeight(weightMin);
                    int max = clampWeight(weightMax);
                    if (min > max) {
                        int swap = min;
                        min = max;
                        max = swap;
                    }
                    int value = min == max
                            ? min
                            : Math.max(min, Math.min(max, clampWeight(weight)));

                    variant.put("weight", value);
                    variant.put("weightMin", min);
                    variant.put("weightMax", max);
                    variant.put("italic", italic);
                    variant.put("auto", false);
                    prefs(context).edit()
                            .putString(KEY_LIBRARY, stored.toString())
                            .apply();
                }
            }
        } catch (Throwable t) {
            Log.e(TAG, "setFace failed", t);
        }
        return libraryStateJson(context);
    }

    /**
     * Re-reads every face of a family. Faces that cannot be read (WOFF2, TTC)
     * are left untouched and the UI is told through a toast.
     */
    @JavascriptInterface
    public String detectFont(String id) {
        WebView view = webView.get();
        if (view == null || id == null || id.isEmpty()) {
            return "{}";
        }
        Context context = view.getContext();
        String failed = "";
        try {
            synchronized (FontBridge.class) {
                JSONArray stored = library(context);
                JSONObject entry = findEntry(stored, id);
                if (entry == null) {
                    return libraryStateJson(context);
                }

                JSONArray variants = variantsOf(entry);
                for (int i = 0; i < variants.length(); i++) {
                    JSONObject variant = variants.optJSONObject(i);
                    if (variant == null) {
                        continue;
                    }
                    File file = resolve(context, variant.optString("file"));
                    if (file == null) {
                        continue;
                    }

                    FontFileMeta meta = FontFileMeta.read(file);
                    if (!meta.ok) {
                        failed = meta.reason;
                        continue;
                    }

                    int min = clampWeight(meta.weightMin);
                    int max = clampWeight(meta.weightMax);
                    if (min > max) {
                        int swap = min;
                        min = max;
                        max = swap;
                    }
                    int value = min == max
                            ? min
                            : Math.max(min, Math.min(max, clampWeight(meta.weight)));

                    variant.put("weight", value);
                    variant.put("weightMin", min);
                    variant.put("weightMax", max);
                    variant.put("italic", meta.italic);
                    variant.put("auto", true);
                }

                entry.put("variants", variants);
                prefs(context).edit()
                        .putString(KEY_LIBRARY, stored.toString())
                        .apply();
            }
        } catch (Throwable t) {
            Log.e(TAG, "detectFont failed", t);
        }

        if (!failed.isEmpty()) {
            toast(view, "woff2".equals(failed)
                    ? "WOFF2 weights can't be read. Set the range manually."
                    : "Couldn't read this font's weight. Set it manually.");
        }
        return libraryStateJson(context);
    }

    /** Removes one face and its file. The last face cannot be removed. */
    @JavascriptInterface
    public String removeFace(String id, int face) {
        WebView view = webView.get();
        if (view == null || id == null || id.isEmpty()) {
            return "{}";
        }
        Context context = view.getContext();
        File removed = null;
        try {
            synchronized (FontBridge.class) {
                JSONArray stored = library(context);
                JSONObject entry = findEntry(stored, id);
                if (entry == null) {
                    return libraryStateJson(context);
                }
                JSONArray variants = variantsOf(entry);
                if (face < 0 || face >= variants.length()) {
                    return libraryStateJson(context);
                }

                // Never remove the only usable face, even if dead entries from
                // an older index are still around.
                int live = 0;
                for (int i = 0; i < variants.length(); i++) {
                    JSONObject variant = variants.optJSONObject(i);
                    if (variant != null
                            && resolve(context, variant.optString("file")) != null) {
                        live++;
                    }
                }
                if (live <= 1) {
                    return libraryStateJson(context);
                }

                JSONObject target = variants.optJSONObject(face);
                if (target != null) {
                    removed = resolve(context, target.optString("file"));
                }

                JSONArray next = new JSONArray();
                for (int i = 0; i < variants.length(); i++) {
                    JSONObject variant = variants.optJSONObject(i);
                    if (i != face && variant != null) {
                        next.put(variant);
                    }
                }
                entry.put("variants", next);
                // Face 0 may have changed, so bump the version and make the
                // browser fetch the new first face instead of reusing the old.
                entry.put("added", System.currentTimeMillis());
                JSONObject first = next.optJSONObject(0);
                if (first != null) {
                    entry.put("file", first.optString("file"));
                    entry.put("format", first.optString("format", "woff2"));
                }

                prefs(context).edit()
                        .putString(KEY_LIBRARY, stored.toString())
                        .apply();
            }
            if (removed != null) {
                removed.delete();
            }
        } catch (Throwable t) {
            Log.e(TAG, "removeFace failed", t);
        }
        return libraryStateJson(context);
    }

    /** Moves every live face of the source family into the target family. */
    @JavascriptInterface
    public String mergeFont(String targetId, String sourceId) {
        WebView view = webView.get();
        if (view == null || targetId == null || sourceId == null
                || targetId.isEmpty() || targetId.equals(sourceId)) {
            return "{}";
        }
        Context context = view.getContext();
        try {
            synchronized (FontBridge.class) {
                JSONArray stored = library(context);
                JSONObject target = findEntry(stored, targetId);
                JSONObject source = findEntry(stored, sourceId);
                if (target == null || source == null) {
                    return libraryStateJson(context);
                }

                JSONArray merged = variantsOf(target);
                JSONArray sourceVariants = variantsOf(source);
                String sourceName = source.optString("name", "");
                for (int i = 0; i < sourceVariants.length(); i++) {
                    JSONObject variant = sourceVariants.optJSONObject(i);
                    if (variant != null
                            && resolve(context, variant.optString("file")) != null) {
                        // Faces added before per-face names existed still need a
                        // label; the source family name is the closest match.
                        if (variant.optString("name", "").isEmpty()
                                && !sourceName.isEmpty()) {
                            variant.put("name", sourceName);
                        }
                        merged.put(variant);
                    }
                }
                target.put("variants", merged);
                target.put("added", System.currentTimeMillis());

                JSONArray remaining = new JSONArray();
                for (int i = 0; i < stored.length(); i++) {
                    JSONObject entry = stored.optJSONObject(i);
                    if (entry != null && !sourceId.equals(entry.optString("id"))) {
                        remaining.put(entry);
                    }
                }

                SharedPreferences.Editor editor = prefs(context).edit()
                        .putString(KEY_LIBRARY, remaining.toString());
                if (sourceId.equals(selectedId(context))) {
                    editor.putString(KEY_SELECTED, targetId);
                }
                editor.apply();
            }
        } catch (Throwable t) {
            Log.e(TAG, "mergeFont failed", t);
        }
        return libraryStateJson(context);
    }

    /**
     * Called from the patched Activity.onActivityResult.
     */
    public static void onActivityResult(int requestCode, int resultCode, Intent data) {
        if (requestCode != REQUEST_CODE) {
            return;
        }

        WebView view = pendingWebView.get();
        String targetId = pendingTargetId;
        pendingWebView = new WeakReference<>(null);
        pendingTargetId = null;
        if (view == null) {
            return;
        }

        if (resultCode != Activity.RESULT_OK || data == null || data.getData() == null) {
            notifyJs(view, "MorpheFont.onPickCancelled && MorpheFont.onPickCancelled();");
            return;
        }

        Uri uri = data.getData();
        Context context = view.getContext().getApplicationContext();
        new Thread(() -> handlePicked(view, context, uri, targetId), "MorpheFontPicker").start();
    }

    public static boolean isEnabled(Context context) {
        return selectedEntry(context) != null
                && prefs(context).getBoolean(KEY_ENABLED, false);
    }

    public static String fontName(Context context) {
        JSONObject entry = selectedEntry(context);
        return entry == null ? "" : entry.optString("name", "");
    }

    public static String fontFormat(Context context) {
        JSONObject entry = selectedEntry(context);
        if (entry == null) {
            return "woff2";
        }
        JSONObject variant = variantOf(entry, liveFace(context, entry));
        return variant == null ? "woff2" : variant.optString("format", "woff2");
    }

    /**
     * Root-relative URL of the active font. The reader and chapter iframe are
     * same-origin, so this avoids CORS and the request is handled by
     * MorpheWebRouter before the network.
     */
    public static String fontUrl(Context context) {
        JSONObject entry = selectedEntry(context);
        if (entry == null) {
            return "";
        }
        int face = liveFace(context, entry);
        JSONObject variant = variantOf(entry, face);
        if (variant == null) {
            return "";
        }
        File file = resolve(context, variant.optString("file"));
        long version = entry.optLong("added", file != null ? file.lastModified() : 0L);
        return urlFor(entry.optString("id"), face, version);
    }

    /**
     * JSON consumed by the injected UI and by FontHook:
     * {"selected":"id","enabled":true,"weight":400,"fonts":[...]}
     * weight 0 means "Default": the app's own weights are left alone.
     */
    public static String libraryStateJson(Context context) {
        try {
            synchronized (FontBridge.class) {
                JSONArray stored = library(context);
                JSONArray items = new JSONArray();
                String selected = selectedId(context);
                boolean selectedIsLive = false;

                for (int i = 0; i < stored.length(); i++) {
                    JSONObject entry = stored.optJSONObject(i);
                    if (entry == null) {
                        continue;
                    }
                    String id = entry.optString("id");
                    String entryName = entry.optString("name", "Custom font");
                    JSONArray storedVariants = variantsOf(entry);
                    JSONArray liveVariants = new JSONArray();
                    long totalSize = 0;
                    long added = entry.optLong("added", 0L);
                    String firstUrl = "";
                    JSONObject first = null;

                    for (int j = 0; j < storedVariants.length(); j++) {
                        JSONObject variant = storedVariants.optJSONObject(j);
                        if (variant == null) {
                            continue;
                        }
                        File file = resolve(context, variant.optString("file"));
                        if (file == null) {
                            // A face whose file disappeared is hidden; the others
                            // in the same family stay usable.
                            continue;
                        }

                        int weight = clampWeight(variant.optInt("weight", 400));
                        int min = clampWeight(variant.optInt("weightMin", weight));
                        int max = clampWeight(variant.optInt("weightMax", weight));
                        if (min > max) {
                            int swap = min;
                            min = max;
                            max = swap;
                        }
                        weight = Math.max(min, Math.min(max, weight));

                        JSONObject item = new JSONObject();
                        item.put("url", urlFor(
                                id, j, added > 0 ? added : file.lastModified()));
                        item.put("face", j);
                        item.put("name", variant.optString("name", entryName));
                        item.put("format", variant.optString("format",
                                formatFromName(variant.optString("file"))));
                        item.put("size", file.length());
                        item.put("weight", weight);
                        item.put("weightMin", min);
                        item.put("weightMax", max);
                        item.put("italic", variant.optBoolean("italic", false));
                        item.put("auto", variant.optBoolean("auto", false));
                        liveVariants.put(item);

                        totalSize += file.length();
                        if (first == null) {
                            first = item;
                            firstUrl = item.getString("url");
                        }
                    }

                    if (first == null) {
                        // No file is left; hide the row rather than offer a font
                        // that cannot be applied.
                        continue;
                    }

                    JSONObject item = new JSONObject();
                    item.put("id", id);
                    item.put("name", entryName);
                    item.put("format", first.optString("format", "woff2"));
                    item.put("size", totalSize);
                    item.put("url", firstUrl);
                    item.put("weight", first.optInt("weight", 400));
                    item.put("weightMin", first.optInt("weightMin", 400));
                    item.put("weightMax", first.optInt("weightMax", 400));
                    item.put("italic", first.optBoolean("italic", false));
                    item.put("variants", liveVariants);
                    items.put(item);

                    if (id.equals(selected)) {
                        selectedIsLive = true;
                    }
                }

                JSONObject state = new JSONObject();
                state.put("selected", selectedIsLive ? selected : "");
                state.put("enabled", selectedIsLive
                        && prefs(context).getBoolean(KEY_ENABLED, false));
                state.put("weight", normalizeWeight(prefs(context).getInt(KEY_WEIGHT, 0)));
                state.put("fonts", items);
                return state.toString();
            }
        } catch (Exception e) {
            Log.e(TAG, "libraryStateJson failed", e);
            return "{}";
        }
    }

    private static String urlFor(String id, int face, long version) {
        return "/morphe/" + FONT_ROUTE + "/" + id + "/" + face + "?v=" + version;
    }

    private static void handlePicked(WebView view, Context context, Uri uri,
                                     String targetId) {
        File dir = new File(context.getFilesDir(), FONT_DIR);
        File temp = null;

        try {
            if (!dir.exists() && !dir.mkdirs()) {
                notifyError(view, "Could not create the font folder");
                return;
            }

            String format;
            temp = new File(dir, "upload-" + System.nanoTime() + ".tmp");

            InputStream raw = context.getContentResolver().openInputStream(uri);
            if (raw == null) {
                notifyError(view, "Could not read the font");
                return;
            }

            try (InputStream in = new BufferedInputStream(raw);
                 FileOutputStream out = new FileOutputStream(temp)) {
                in.mark(4);
                byte[] header = new byte[4];
                if (!readHeader(in, header)) {
                    notifyError(view, "The file is empty");
                    return;
                }

                format = detectFormat(header);
                if (format == null) {
                    notifyError(view, "Unsupported font format");
                    return;
                }

                in.reset();
                copy(in, out);
                out.getFD().sync();
            }

            String id = newId();
            File font = new File(dir, id + "." + format);
            if (!temp.renameTo(font)) {
                notifyError(view, "Could not save the font");
                return;
            }
            temp = null;

            // The file is complete now, so metadata can be read safely. WOFF2
            // and collections report ok == false; they keep the manual default.
            FontFileMeta meta = FontFileMeta.read(font);
            int weight = meta.ok ? meta.weight : 400;
            int min = meta.ok ? meta.weightMin : weight;
            int max = meta.ok ? meta.weightMax : weight;
            if (min > max) {
                int swap = min;
                min = max;
                max = swap;
            }
            weight = Math.max(min, Math.min(max, weight));

            String name = displayName(context, uri);
            if (name == null || name.isEmpty()) {
                name = font.getName();
            }

            JSONObject variant = new JSONObject();
            variant.put("file", font.getName());
            variant.put("name", name);
            variant.put("format", format);
            variant.put("weight", weight);
            variant.put("weightMin", min);
            variant.put("weightMax", max);
            variant.put("italic", meta.ok && meta.italic);
            variant.put("auto", meta.ok);

            long added = System.currentTimeMillis();

            synchronized (FontBridge.class) {
                JSONArray stored = library(context);
                if (targetId != null) {
                    JSONObject entry = findEntry(stored, targetId);
                    if (entry == null) {
                        font.delete();
                        notifyError(view, "That font is no longer available");
                        return;
                    }
                    JSONArray variants = variantsOf(entry);
                    variants.put(variant);
                    entry.put("variants", variants);
                    prefs(context).edit()
                            .putString(KEY_LIBRARY, stored.toString())
                            .apply();
                } else {
                    JSONObject entry = new JSONObject();
                    entry.put("id", id);
                    entry.put("name", name);
                    entry.put("file", font.getName());
                    entry.put("format", format);
                    entry.put("added", added);
                    entry.put("variants", new JSONArray().put(variant));
                    stored.put(entry);

                    prefs(context).edit()
                            .putBoolean(KEY_ENABLED, true)
                            .putString(KEY_SELECTED, id)
                            .putString(KEY_LIBRARY, stored.toString())
                            .apply();
                }
            }

            cleanupUploads(dir);

            notifyJs(view, "if(window.MorpheFont){MorpheFont.onLibraryChanged("
                    + JSONObject.quote(libraryStateJson(context)) + ");}");

            if (!meta.ok) {
                toast(view, "woff2".equals(meta.reason)
                        ? "WOFF2 weights can't be read. Added as Regular (400)."
                        : "Couldn't read this font's weight. Added as Regular (400).");
            }
        } catch (Exception e) {
            Log.e(TAG, "handlePicked failed", e);
            notifyError(view, "Could not read the font");
        } finally {
            if (temp != null) {
                temp.delete();
            }
        }
    }

    private static boolean readHeader(InputStream in, byte[] header) throws IOException {
        int total = 0;
        while (total < header.length) {
            int read = in.read(header, total, header.length - total);
            if (read < 0) {
                break;
            }
            total += read;
        }
        return total == header.length;
    }

    private static void copy(InputStream in, FileOutputStream out) throws IOException {
        byte[] buffer = new byte[8192];
        int read;
        while ((read = in.read(buffer)) != -1) {
            out.write(buffer, 0, read);
        }
    }

    private static String detectFormat(byte[] bytes) {
        if (bytes == null || bytes.length < 4) {
            return null;
        }

        int b0 = bytes[0] & 0xff;
        int b1 = bytes[1] & 0xff;
        int b2 = bytes[2] & 0xff;
        int b3 = bytes[3] & 0xff;

        if (b0 == 'w' && b1 == 'O' && b2 == 'F' && b3 == '2') {
            return "woff2";
        }
        if (b0 == 'w' && b1 == 'O' && b2 == 'F' && b3 == 'F') {
            return "woff";
        }
        if (b0 == 'O' && b1 == 'T' && b2 == 'T' && b3 == 'O') {
            return "otf";
        }
        if (b0 == 0 && b1 == 1 && b2 == 0 && b3 == 0) {
            return "ttf";
        }
        if (b0 == 't' && b1 == 'r' && b2 == 'u' && b3 == 'e') {
            return "ttf";
        }
        if (b0 == 't' && b1 == 'y' && b2 == 'p' && b3 == '1') {
            return "ttf";
        }
        return null;
    }

    private static String mimeFor(String format) {
        switch (format) {
            case "woff2":
                return "font/woff2";
            case "woff":
                return "font/woff";
            case "ttf":
                return "font/ttf";
            case "otf":
                return "font/otf";
            default:
                return "application/octet-stream";
        }
    }

    private static void cleanupUploads(File dir) {
        File[] files = dir.listFiles();
        if (files == null) {
            return;
        }
        for (File file : files) {
            if (file.getName().endsWith(".tmp")) {
                file.delete();
            }
        }
    }

    /**
     * Resolves an index file name inside the private font directory. Returns null
     * for anything that is missing, empty, or outside that directory.
     */
    private static File resolve(Context context, String fileName) {
        if (fileName == null || fileName.isEmpty()) {
            return null;
        }

        File dir = new File(context.getFilesDir(), FONT_DIR);
        File file = new File(dir, fileName);
        try {
            String dirPath = dir.getCanonicalPath();
            String filePath = file.getCanonicalPath();
            if (!filePath.startsWith(dirPath + File.separator)) {
                return null;
            }
        } catch (IOException e) {
            return null;
        }

        return file.isFile() && file.length() > 0 ? file : null;
    }

    private static synchronized JSONArray library(Context context) {
        String raw = prefs(context).getString(KEY_LIBRARY, "");
        if (raw != null && !raw.isEmpty()) {
            try {
                JSONArray array = new JSONArray(raw);
                boolean changed = false;
                for (int i = 0; i < array.length(); i++) {
                    JSONObject entry = array.optJSONObject(i);
                    if (entry != null && !entry.has("variants")) {
                        entry.put("variants", legacyVariants(entry));
                        changed = true;
                    }
                }
                if (changed) {
                    prefs(context).edit().putString(KEY_LIBRARY, array.toString()).apply();
                }
                return array;
            } catch (JSONException ignored) {
                // Corrupt index: fall through and rebuild it from scratch.
            }
        }
        return migrateLegacy(context);
    }

    /**
     * Converts the pre-library single-font preferences into a one-entry library.
     * The old file keeps its name, so nothing is copied or renamed.
     */
    private static JSONArray migrateLegacy(Context context) {
        JSONArray result = new JSONArray();
        SharedPreferences prefs = prefs(context);
        String file = prefs.getString(KEY_LEGACY_FILE, null);

        if (file == null || file.isEmpty()) {
            return result;
        }

        if (resolve(context, file) == null) {
            prefs.edit()
                    .remove(KEY_LEGACY_FILE)
                    .remove(KEY_LEGACY_NAME)
                    .remove(KEY_LEGACY_FORMAT)
                    .remove(KEY_LEGACY_VERSION)
                    .putBoolean(KEY_ENABLED, false)
                    .putString(KEY_SELECTED, "")
                    .apply();
            return result;
        }

        try {
            JSONObject entry = new JSONObject();
            entry.put("id", newId());
            entry.put("name", prefs.getString(KEY_LEGACY_NAME, "Custom font"));
            entry.put("file", file);
            entry.put("format", prefs.getString(KEY_LEGACY_FORMAT, formatFromName(file)));
            entry.put("added", legacyVersion(prefs));
            entry.put("variants", legacyVariants(entry));
            result.put(entry);

            prefs.edit()
                    .putString(KEY_LIBRARY, result.toString())
                    .putString(KEY_SELECTED, entry.getString("id"))
                    .remove(KEY_LEGACY_FILE)
                    .remove(KEY_LEGACY_NAME)
                    .remove(KEY_LEGACY_FORMAT)
                    .remove(KEY_LEGACY_VERSION)
                    .apply();
        } catch (JSONException ignored) {
            // Leave the old keys in place; the next read retries the migration.
        }
        return result;
    }

    private static long legacyVersion(SharedPreferences prefs) {
        String raw = prefs.getString(KEY_LEGACY_VERSION, "");
        try {
            if (raw != null && !raw.isEmpty()) {
                return Long.parseLong(raw);
            }
        } catch (NumberFormatException ignored) {
            // Fall back to zero; the id route still serves the file.
        }
        return 0L;
    }

    private static String formatFromName(String fileName) {
        int dot = fileName.lastIndexOf('.');
        if (dot < 0 || dot == fileName.length() - 1) {
            return "woff2";
        }
        String format = fileName.substring(dot + 1).toLowerCase(Locale.ROOT);
        switch (format) {
            case "woff2":
            case "woff":
            case "ttf":
            case "otf":
                return format;
            default:
                return "woff2";
        }
    }

    private static String selectedId(Context context) {
        String id = prefs(context).getString(KEY_SELECTED, "");
        return id != null ? id : "";
    }

    private static JSONObject selectedEntry(Context context) {
        JSONObject entry = findEntry(library(context), selectedId(context));
        return entry != null && liveFace(context, entry) >= 0 ? entry : null;
    }

    private static JSONObject findEntry(JSONArray library, String id) {
        if (library == null || id == null || id.isEmpty()) {
            return null;
        }
        for (int i = 0; i < library.length(); i++) {
            JSONObject entry = library.optJSONObject(i);
            if (entry != null && id.equals(entry.optString("id"))) {
                return entry;
            }
        }
        return null;
    }

    /**
     * Index of the first face whose file still exists, or -1. A family is
     * considered usable as long as one of its faces is present.
     */
    private static int liveFace(Context context, JSONObject entry) {
        JSONArray variants = variantsOf(entry);
        for (int i = 0; i < variants.length(); i++) {
            JSONObject variant = variants.optJSONObject(i);
            if (variant != null && resolve(context, variant.optString("file")) != null) {
                return i;
            }
        }
        return -1;
    }

    private static JSONObject variantOf(JSONObject entry, int face) {
        if (entry == null || face < 0) {
            return null;
        }
        return variantsOf(entry).optJSONObject(face);
    }

    /** Faces of an entry, including the synthesized one for pre-variant data. */
    private static JSONArray variantsOf(JSONObject entry) {
        JSONArray variants = entry == null ? null : entry.optJSONArray("variants");
        return variants != null && variants.length() > 0
                ? variants
                : legacyVariants(entry);
    }

    /**
     * Builds the single face described by the entry's pre-variant fields. New
     * entries and merged families always carry a variants array; this is only
     * used for data written by an older build.
     */
    private static JSONArray legacyVariants(JSONObject entry) {
        JSONArray variants = new JSONArray();
        if (entry == null) {
            return variants;
        }
        try {
            int weight = clampWeight(entry.optInt("weight", 400));
            JSONObject variant = new JSONObject();
            variant.put("file", entry.optString("file"));
            variant.put("format", entry.optString("format",
                    formatFromName(entry.optString("file"))));
            variant.put("weight", weight);
            variant.put("weightMin", clampWeight(entry.optInt("weightMin", weight)));
            variant.put("weightMax", clampWeight(entry.optInt("weightMax", weight)));
            variant.put("italic", entry.optBoolean("italic", false));
            variant.put("auto", entry.optBoolean("auto", false));
            variants.put(variant);
        } catch (JSONException ignored) {
            // An empty list hides the entry; better than crashing the UI.
        }
        return variants;
    }

    private static int clampWeight(int weight) {
        return Math.max(1, Math.min(1000, weight));
    }

    /**
     * Reading weight uses 0 as "Default": no weight rule is emitted, so the
     * app's own typography keeps control. Any positive value is a real weight.
     */
    private static int normalizeWeight(int weight) {
        return weight <= 0 ? 0 : clampWeight(weight);
    }

    private static int parseFace(String value) {
        try {
            return Math.max(0, Integer.parseInt(value));
        } catch (NumberFormatException ignored) {
            return 0;
        }
    }

    private static String newId() {
        return Long.toString(System.currentTimeMillis(), 36)
                + "-" + Long.toString(System.nanoTime() & 0xFFFFFF, 36);
    }

    private static String cleanName(String name) {
        if (name == null) {
            return "";
        }
        String clean = name.replaceAll("\\s+", " ").trim();
        if (clean.length() > 80) {
            clean = clean.substring(0, 80).trim();
        }
        return clean;
    }

    private static String displayName(Context context, Uri uri) {
        String name = null;
        try (Cursor cursor = context.getContentResolver().query(
                uri,
                new String[]{OpenableColumns.DISPLAY_NAME},
                null,
                null,
                null)) {
            if (cursor != null && cursor.moveToFirst()) {
                int index = cursor.getColumnIndex(OpenableColumns.DISPLAY_NAME);
                if (index >= 0) {
                    name = cursor.getString(index);
                }
            }
        } catch (Exception ignored) {
            // Fall back to the URI segment.
        }

        if (name == null || name.isEmpty()) {
            name = uri.getLastPathSegment();
        }
        return name == null || name.isEmpty() ? "Custom font" : name;
    }

    private static Activity activityFrom(Context context) {
        Context current = context;
        while (current instanceof ContextWrapper) {
            if (current instanceof Activity) {
                return (Activity) current;
            }
            Context base = ((ContextWrapper) current).getBaseContext();
            if (base == null || base == current) {
                break;
            }
            current = base;
        }
        return current instanceof Activity ? (Activity) current : null;
    }

    private static SharedPreferences prefs(Context context) {
        Context app = context.getApplicationContext();
        return (app != null ? app : context).getSharedPreferences(PREFS, Context.MODE_PRIVATE);
    }

    private static void notifyError(WebView view, String message) {
        notifyJs(view, "MorpheFont.onFontError && MorpheFont.onFontError("
                + JSONObject.quote(message) + ");");
    }

    private static void notifyJs(WebView view, String script) {
        if (view == null) {
            return;
        }
        view.post(() -> view.evaluateJavascript(script, null));
    }

    /** Shows a toast on the UI thread; safe to call from the picker thread. */
    private static void toast(WebView view, String message) {
        if (view == null) {
            return;
        }
        view.post(() -> {
            try {
                Toast.makeText(view.getContext(), message, Toast.LENGTH_LONG).show();
            } catch (Throwable ignored) {
                // A toast is best effort and must never break the upload.
            }
        });
    }
}
