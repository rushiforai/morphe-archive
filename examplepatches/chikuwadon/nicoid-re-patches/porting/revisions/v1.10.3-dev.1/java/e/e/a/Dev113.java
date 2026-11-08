package e.e.a;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.text.InputType;
import android.view.Menu;
import android.view.MenuItem;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.Toast;

import org.json.JSONArray;
import org.json.JSONObject;
import org.xmlpull.v1.XmlPullParser;

import java.lang.ref.WeakReference;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.function.Consumer;

/** Adds URLs copied from a browser to the currently open device playlist. */
public final class Dev113 {
    private Dev113() {}

    private static String language(Context c, String ja, String en) {
        return c.getResources().getConfiguration().locale.getLanguage().equals("ja") ? ja : en;
    }
    private static int dp(Context c, int value) {
        return (int) (value * c.getResources().getDisplayMetrics().density + 0.5f);
    }
    private static String pageFolder(Object page) {
        if (page == null) return null;
        try {
            Field folder = page.getClass().getDeclaredField("folder");
            folder.setAccessible(true);
            return (String) folder.get(page);
        } catch (Exception error) {
            android.util.Log.w("nicoid-playlist", "Cannot identify active playlist folder", error);
            return null;
        }
    }

    public static void playlistUrlMenu(Activity activity, Menu menu, Object page) {
        String folder = pageFolder(page);
        if (folder == null || menu == null || activity == null || activity.isFinishing()) return;
        MenuItem add = menu.add(language(activity, "動画URLから追加", "Add video from URL"));
        add.setShowAsAction(MenuItem.SHOW_AS_ACTION_NEVER);
        add.setOnMenuItemClickListener(item -> {
            showUrlDialog(activity, page, folder);
            return true;
        });
    }

    private static void showUrlDialog(Activity activity, Object page, String folder) {
        if (activity.isFinishing() || activity.isDestroyed()) return;
        LinearLayout container = new LinearLayout(activity);
        container.setOrientation(LinearLayout.VERTICAL);
        container.setPadding(dp(activity, 24), dp(activity, 14), dp(activity, 24), 0);
        EditText input = new EditText(activity);
        input.setSingleLine(true);
        input.setTextSize(15);
        input.setInputType(InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_VARIATION_URI);
        input.setHint("https://sp.nicovideo.jp/watch/sm...");
        container.addView(input, new LinearLayout.LayoutParams(-1, -2));
        AlertDialog dialog = new AlertDialog.Builder(activity)
            .setTitle(language(activity, "動画URLを追加", "Add video URL"))
            .setView(container)
            .setPositiveButton(language(activity, "追加", "Add"), null)
            .setNegativeButton(language(activity, "キャンセル", "Cancel"), null)
            .create();
        dialog.setOnShowListener(d -> dialog.getButton(AlertDialog.BUTTON_POSITIVE).setOnClickListener(v -> {
            String original = input.getText().toString();
            String video = PlaylistUrlParser.videoId(original);
            if (video == null) {
                input.setError(language(activity, "ニコニコ動画のURLまたは動画IDを入力してください",
                    "Enter a NicoNico video URL or video ID"));
                return;
            }
            dialog.getButton(AlertDialog.BUTTON_POSITIVE).setEnabled(false);
            dialog.dismiss();
            enqueueVideo(activity, page, folder, video);
        }));
        dialog.show();
    }

    private static final class Metadata {
        String title, owner = "", image = "";
        Metadata(String video) { title = video; }
    }

    /** The public metadata endpoint is fixed; no user-supplied host is contacted. */
    private static Metadata metadata(String id) {
        Metadata result = new Metadata(id);
        HttpURLConnection connection = null;
        try {
            URL endpoint = new URL("https://ext.nicovideo.jp/api/getthumbinfo/" + id);
            connection = (HttpURLConnection) endpoint.openConnection();
            connection.setConnectTimeout(3000);
            connection.setReadTimeout(3000);
            connection.setInstanceFollowRedirects(false);
            connection.setRequestProperty("User-Agent", "nicoid-Re/1.10.3");
            if (connection.getResponseCode() != 200) return result;
            XmlPullParser parser = android.util.Xml.newPullParser();
            java.io.InputStream stream = connection.getInputStream();
            try {
                parser.setInput(stream, "UTF-8");
                int event;
                while ((event = parser.next()) != XmlPullParser.END_DOCUMENT) {
                    if (event != XmlPullParser.START_TAG) continue;
                    String key = parser.getName();
                    if ("title".equals(key)) result.title = parser.nextText();
                    else if ("thumbnail_url".equals(key)) result.image = parser.nextText();
                    else if ("user_nickname".equals(key)) result.owner = parser.nextText();
                }
            } finally {
                stream.close();
            }
        } catch (Exception error) {
            android.util.Log.i("nicoid-playlist", "Video metadata unavailable; adding the ID", error);
        } finally {
            if (connection != null) connection.disconnect();
        }
        if (result.title == null || result.title.trim().isEmpty()) result.title = id;
        return result;
    }

    private static void enqueueVideo(Activity activity, Object page, String folder, String videoId) {
        WeakReference<Activity> weak = new WeakReference<>(activity);
        Context app = activity.getApplicationContext();
        new Thread(() -> {
            Metadata meta = metadata(videoId);
            try {
                Class<?> playlists = Class.forName("e.e.a.LocalPlaylists");
                Class<?> editType = Class.forName("e.e.a.LocalPlaylists$Edit");
                java.util.concurrent.atomic.AtomicBoolean duplicate = new java.util.concurrent.atomic.AtomicBoolean(false);
                Object edit = Proxy.newProxyInstance(editType.getClassLoader(),
                    new Class<?>[] { editType }, (proxy, method, arguments) -> {
                        if (!"apply".equals(method.getName())) return null;
                        Object data = arguments[0];
                        JSONArray videos = (JSONArray) data.getClass().getField("videos").get(data);
                        for (int i = 0; i < videos.length(); i++) {
                            JSONObject old = videos.optJSONObject(i);
                            if (old != null && folder.equals(old.optString("folder")) &&
                                    videoId.equals(old.optString("videoId"))) {
                                duplicate.set(true);
                                return null;
                            }
                        }
                        Method add = data.getClass().getMethod("add", String.class, String.class,
                            String.class, String.class, String.class);
                        add.invoke(data, folder, PlaylistUrlParser.canonicalUrl(videoId),
                            meta.title, meta.owner, meta.image);
                        return null;
                    });
                Consumer<Boolean> callback = success -> {
                    Activity current = weak.get();
                    if (current == null || current.isFinishing() || current.isDestroyed()) return;
                    current.runOnUiThread(() -> {
                        if (success) {
                            try {
                                if (folder.equals(pageFolder(page))) {
                                    Method render = page.getClass().getDeclaredMethod("render");
                                    render.setAccessible(true);
                                    render.invoke(page);
                                }
                            } catch (Exception error) {
                                android.util.Log.w("nicoid-playlist", "Unable to refresh playlist after URL add", error);
                            }
                        }
                        Toast.makeText(current,
                            success ? (duplicate.get()
                                ? language(current, "追加済みの動画です", "Video already added")
                                : language(current, "動画を追加しました", "Video added"))
                                : language(current, "動画を追加できませんでした", "Unable to add video"),
                            Toast.LENGTH_SHORT).show();
                    });
                };
                Method change = playlists.getDeclaredMethod("change", Context.class, editType, Consumer.class);
                change.setAccessible(true);
                change.invoke(null, app, edit, callback);
            } catch (Exception error) {
                android.util.Log.e("nicoid-playlist", "Unable to add video from URL", error);
                Activity current = weak.get();
                if (current != null && !current.isFinishing() && !current.isDestroyed()) {
                    current.runOnUiThread(() -> Toast.makeText(current,
                        language(current, "動画を追加できませんでした", "Unable to add video"),
                        Toast.LENGTH_SHORT).show());
                }
            }
        }, "nicoid-playlist-url").start();
    }
}
