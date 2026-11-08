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

    /** Add the device-local action without disturbing the existing information menu. */
    private static final int INFO_PLAYLIST_ITEM = 18160;

    public static void infoMenu(Activity activity, Menu menu) {
        if (activity == null || menu == null || activity.isFinishing()
                || !"com.sauzask.nicoid.NicoidVideoInfoActivity".equals(activity.getClass().getName())) return;
        MenuItem current = menu.findItem(INFO_PLAYLIST_ITEM);
        if (current == null) {
            String language = activity.getResources().getConfiguration().locale.getLanguage();
            String label = "ja".equals(language) ? "プレイリストに追加"
                : "zh".equals(language) ? "加入播放清單" : "Add to playlist";
            MenuItem after = watchLaterItem(menu);
            current = menu.add(Menu.NONE, INFO_PLAYLIST_ITEM,
                after == null ? Menu.NONE : after.getOrder(), label);
            current.setShowAsAction(MenuItem.SHOW_AS_ACTION_NEVER);
            current.setOnMenuItemClickListener(item -> infoSelected(activity, item));
        }
        placeAfter(menu, watchLaterItem(menu), current);
    }

    private static MenuItem watchLaterItem(Menu menu) {
        for (int index = 0; index < menu.size(); index++) {
            MenuItem item = menu.getItem(index);
            if (item == null || item.getTitle() == null) continue;
            String value = item.getTitle().toString();
            String normalized = value.toLowerCase(java.util.Locale.ROOT);
            if (value.contains("とりあえずマイリスト")
                    || normalized.contains("watch later")
                    || value.contains("稍後觀看")) return item;
        }
        return null;
    }

    // The Activity's Menu can be an AndroidX wrapper, not the MenuBuilder itself.
    // Search the actual backend for its ordered item list, validating both IDs
    // before changing anything. This preserves native menu item instances/listeners.
    private static void placeAfter(Menu menu, MenuItem reference, MenuItem added) {
        if (reference == null || added == null || reference == added) return;
        Object backend = menu;
        for (int depth = 0; depth < 6 && backend != null; depth++) {
            if (reorder(backend, reference, added)) return;
            backend = wrappedMenu(backend);
        }
        android.util.Log.w("nicoid-menu", "Playlist action could not be placed next to watch-later item");
    }

    @SuppressWarnings({"rawtypes", "unchecked"})
    private static boolean reorder(Object backend, MenuItem reference, MenuItem added) {
        for (Class<?> type = backend.getClass(); type != null; type = type.getSuperclass()) {
            try {
                Field field = type.getDeclaredField("mItems");
                field.setAccessible(true);
                Object value = field.get(backend);
                if (!(value instanceof java.util.List)) continue;
                java.util.List items = (java.util.List) value;
                int first = locate(items, reference), second = locate(items, added);
                if (first < 0 || second < 0) continue;
                if (second == first + 1) return true;
                Object action = items.remove(second);
                first = locate(items, reference);
                items.add(first + 1, action);
                Method changed = backend.getClass().getMethod("onItemsChanged", boolean.class);
                changed.invoke(backend, true);
                return true;
            } catch (NoSuchFieldException missing) {
                // Parent classes may own the storage.
            } catch (ReflectiveOperationException | RuntimeException error) {
                android.util.Log.w("nicoid-menu", "Unable to reorder overflow item", error);
            }
        }
        return false;
    }

    private static int locate(java.util.List<?> items, MenuItem desired) {
        for (int index = 0; index < items.size(); index++) {
            Object item = items.get(index);
            if (item == desired) return index;
            if (!(item instanceof MenuItem)) continue;
            MenuItem candidate = (MenuItem) item;
            if (desired.getItemId() != 0 && desired.getItemId() == candidate.getItemId()) return index;
            if (desired.getItemId() == 0 && candidate.getItemId() == 0
                    && desired.getTitle() != null
                    && desired.getTitle().equals(candidate.getTitle())) return index;
        }
        return -1;
    }

    private static Object wrappedMenu(Object wrapper) {
        for (Class<?> type = wrapper.getClass(); type != null; type = type.getSuperclass()) {
            for (Field field : type.getDeclaredFields()) {
                if (java.lang.reflect.Modifier.isStatic(field.getModifiers())) continue;
                if (!"mWrappedObject".equals(field.getName())
                        && !"mMenu".equals(field.getName())
                        && !Menu.class.isAssignableFrom(field.getType())) continue;
                try {
                    field.setAccessible(true);
                    Object item = field.get(wrapper);
                    if (item instanceof Menu && item != wrapper) return item;
                } catch (ReflectiveOperationException | RuntimeException ignored) {
                    // The next wrapper field or parent class may be accessible.
                }
            }
        }
        return null;
    }

    /** Handles the same action even if the platform routes selection to the Activity. */
    public static boolean infoSelected(Activity activity, MenuItem item) {
        if (item == null || item.getItemId() != INFO_PLAYLIST_ITEM) return false;
        if (activity == null || activity.isFinishing() || activity.isDestroyed()) return true;
        try {
            Field videoField = activity.getClass().getDeclaredField("E");
            Field titleField = activity.getClass().getDeclaredField("F");
            videoField.setAccessible(true);
            titleField.setAccessible(true);
            String id = (String) videoField.get(activity);
            String title = (String) titleField.get(activity);
            if (id == null || !id.matches("(?:sm|nm|so|ss)?[0-9]+"))
                throw new IllegalArgumentException("Invalid video identifier");
            Method add = Class.forName("e.e.a.LocalPlaylists").getMethod("add",
                Context.class, String.class, String.class, String.class, String.class);
            add.invoke(null, activity, "https://www.nicovideo.jp/watch/" + id,
                title == null ? "" : title, "", "");
        } catch (Exception error) {
            android.util.Log.w("nicoid-playlist", "Unable to open device playlist registration", error);
            Toast.makeText(activity, language(activity, "プレイリスト登録を開始できませんでした",
                "Unable to open playlist registration"), Toast.LENGTH_SHORT).show();
        }
        return true;
    }
}
