package app.saketh.extension.gifs;

import android.app.AlertDialog;
import android.content.Context;
import android.net.Uri;
import android.os.Handler;
import android.os.Looper;
import android.text.InputType;
import android.util.Log;
import android.widget.EditText;
import android.widget.FrameLayout;
import android.widget.Toast;
import app.saketh.extension.controls.PatchSettings;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.lang.reflect.Constructor;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.atomic.AtomicInteger;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/**
 * Searches GIPHY for the comment GIF picker when GIPHY is the chosen provider. KLIPY, the app's own
 * provider, keeps its native request. GIPHY needs the user's own API key.
 */
public final class GifSearch {
    private static final String TAG = "SoloPatches";
    private static final String PROVIDER = "gif_provider", GIPHY_KEY = "giphy_api_key";
    private static final String GIF_ITEM = "com.qidian.QDReader.components.entity.GifItem";
    /** GifItem type that the picker grid shows as a search result. */
    private static final int SEARCH_RESULT = 1;
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    /** Newest search; older responses are dropped, like the native picker drops its cancelled calls. */
    private static final AtomicInteger latest = new AtomicInteger();

    private GifSearch() {}

    /** Replaces the native KLIPY request while GIPHY is chosen. {@code page} starts at 1. */
    public static void search(Object presenter, String query, int page, int limit, boolean append) {
        int request = latest.incrementAndGet();
        String key = apiKey();
        if (key.isEmpty()) {
            toast("Add your GIPHY API key in Patch controls.");
            finish(presenter, request, null, page, append);
            return;
        }
        new Thread(() -> {
            List<Object> gifs = null;
            try {
                gifs = fetch(query, page, limit, key);
            } catch (IOException | JSONException | ReflectiveOperationException failed) {
                Log.w(TAG, "GIPHY search failed", failed);
            }
            List<Object> found = gifs;
            MAIN.post(() -> finish(presenter, request, found, page, append));
        }, "saketh-gif-search").start();
    }

    /** Names GIPHY in the picker's search field, which otherwise says "Search KLIPY". */
    public static void hint(EditText search) {
        if (search != null && PatchSettings.giphy()) search.setHint("Search GIPHY");
    }

    private static List<Object> fetch(String query, int page, int count, String key)
            throws IOException, JSONException, ReflectiveOperationException {
        String url = Uri.parse("https://api.giphy.com/v1/gifs/search").buildUpon()
                .appendQueryParameter("api_key", key)
                .appendQueryParameter("q", query)
                .appendQueryParameter("limit", String.valueOf(count))
                .appendQueryParameter("offset", String.valueOf((page - 1) * count))
                .appendQueryParameter("rating", "pg-13")
                .build().toString();
        HttpURLConnection connection = (HttpURLConnection) new URL(url).openConnection();
        connection.setConnectTimeout(15_000);
        connection.setReadTimeout(15_000);
        try {
            int status = connection.getResponseCode();
            if (status != HttpURLConnection.HTTP_OK) {
                toast(status == 401 || status == 403
                        ? "GIPHY rejected the API key. Check it in Patch controls."
                        : status == 429 ? "GIPHY's rate limit for this key was reached. Try again later."
                        : "GIPHY search failed (HTTP " + status + ").");
                throw new IOException("GIPHY returned HTTP " + status);
            }
            JSONArray data = new JSONObject(read(connection.getInputStream())).getJSONArray("data");
            Constructor<?> gifItem = Class.forName(GIF_ITEM).getConstructor(int.class, String.class,
                    String.class, int.class, int.class, int.class, Object.class);
            List<Object> gifs = new ArrayList<>();
            for (int i = 0; i < data.length(); i++) {
                JSONObject gif = data.getJSONObject(i);
                JSONObject image = gif.getJSONObject("images").getJSONObject("fixed_height");
                gifs.add(gifItem.newInstance(SEARCH_RESULT, gif.optString("id"), image.getString("url"),
                        image.optInt("width"), image.optInt("height"), i, null));
            }
            return gifs;
        } finally {
            connection.disconnect();
        }
    }

    /**
     * Hands results to the presenter's own delivery methods, as its KLIPY callback does. They are
     * obfuscated, so they are found by signature. {@code gifs} is null when the search failed.
     */
    private static void finish(Object presenter, int request, List<Object> gifs, int page, boolean append) {
        if (request != latest.get()) return;
        try {
            if (gifs == null) {
                method(presenter, boolean.class).invoke(presenter, append);
                return;
            }
            Method show = method(presenter, null, boolean.class);
            // An empty page tells the picker there is nothing more to load.
            String next = gifs.isEmpty() ? "" : String.valueOf(page + 1);
            Object results = show.getParameterTypes()[0].getConstructor(String.class, List.class, int.class)
                    .newInstance(next, gifs, gifs.size());
            show.invoke(presenter, results, append);
        } catch (ReflectiveOperationException | RuntimeException failed) {
            Log.w(TAG, "GIPHY results not shown", failed);
        }
    }

    /** The presenter's instance method returning void with these parameters; null matches any type. */
    private static Method method(Object presenter, Class<?>... parameters) throws NoSuchMethodException {
        for (Method method : presenter.getClass().getDeclaredMethods()) {
            Class<?>[] types = method.getParameterTypes();
            if (Modifier.isStatic(method.getModifiers()) || method.getReturnType() != void.class
                    || types.length != parameters.length) continue;
            boolean matches = true;
            for (int i = 0; i < types.length; i++) {
                if (parameters[i] != null && types[i] != parameters[i]) matches = false;
            }
            if (matches) {
                method.setAccessible(true);
                return method;
            }
        }
        throw new NoSuchMethodException("GIF search presenter delivery");
    }

    private static String read(InputStream input) throws IOException {
        try (InputStream stream = input) {
            ByteArrayOutputStream bytes = new ByteArrayOutputStream();
            byte[] buffer = new byte[8192];
            for (int read; (read = stream.read(buffer)) != -1; ) bytes.write(buffer, 0, read);
            return bytes.toString(StandardCharsets.UTF_8.name());
        }
    }

    private static void toast(String message) {
        MAIN.post(() -> Toast.makeText(PatchSettings.context, message, Toast.LENGTH_LONG).show());
    }

    private static String apiKey() {
        return PatchSettings.preferences().getString(GIPHY_KEY, "").trim();
    }

    /** Name of the chosen provider for Patch controls. */
    public static String providerLabel() {
        return PatchSettings.giphy() ? "GIPHY" : "KLIPY";
    }

    /** Whether a GIPHY key is saved. The key itself is never shown outside its edit dialog. */
    public static String keyLabel() {
        return apiKey().isEmpty() ? "Not set" : "Saved";
    }

    /** Shows the provider list and saves the choice. */
    public static void chooseProvider(Context context, Runnable changed) {
        String[] names = {"KLIPY (built in)", "GIPHY (your API key)"};
        new AlertDialog.Builder(context).setTitle("GIF search")
                .setSingleChoiceItems(names, PatchSettings.giphy() ? 1 : 0, (dialog, which) -> {
                    PatchSettings.preferences().edit().putString(PROVIDER, which == 1 ? "giphy" : "klipy").apply();
                    dialog.dismiss();
                    changed.run();
                }).setNegativeButton("Cancel", null).show();
    }

    /** Edits the saved GIPHY API key. An empty key removes it. */
    public static void editKey(Context context, Runnable changed) {
        EditText field = new EditText(context);
        field.setSingleLine(true);
        field.setInputType(InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_FLAG_NO_SUGGESTIONS);
        field.setHint("API key");
        field.setText(apiKey());
        int padding = Math.round(20 * context.getResources().getDisplayMetrics().density);
        FrameLayout frame = new FrameLayout(context);
        frame.setPadding(padding, 0, padding, 0);
        frame.addView(field);
        new AlertDialog.Builder(context).setTitle("GIPHY API key")
                .setMessage("Create a free key at developers.giphy.com. It is stored only in this app.")
                .setView(frame)
                .setPositiveButton("Save", (dialog, which) -> {
                    PatchSettings.preferences().edit().putString(GIPHY_KEY, field.getText().toString().trim()).apply();
                    changed.run();
                })
                .setNegativeButton("Cancel", null).show();
    }
}
