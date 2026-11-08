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

import java.lang.ref.WeakReference;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
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

    private static void enqueueVideo(Activity activity, Object page, String folder, String videoId) {
        WeakReference<Activity> weak = new WeakReference<>(activity);
        Context app = activity.getApplicationContext();
        new Thread(() -> {
            Dev120.Metadata meta = Dev120.fetch(videoId);
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
                                meta.merge(old);
                                duplicate.set(true);
                                return null;
                            }
                        }
                        Method add = data.getClass().getMethod("add", String.class, String.class,
                            String.class, String.class, String.class);
                        add.invoke(data, folder, PlaylistUrlParser.canonicalUrl(videoId),
                            meta.title, meta.owner, meta.image);
                        // Store the same post date and counters used by normal list rows.
                        for (int j = videos.length() - 1; j >= 0; j--) {
                            JSONObject saved = videos.optJSONObject(j);
                            if (saved != null && folder.equals(saved.optString("folder")) &&
                                    videoId.equals(saved.optString("videoId"))) {
                                meta.merge(saved);
                                break;
                            }
                        }
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
