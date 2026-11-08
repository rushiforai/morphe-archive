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

    /**
     * Some menu builds obfuscate their backing fields. Identify the actual
     * item lists by their contents, and account for nested menu wrappers.
     */
    private static void placeAfter(Menu menu, MenuItem reference, MenuItem added) {
        if (reference == null || added == null || reference == added) return;
        java.util.Set<Object> visited = java.util.Collections.newSetFromMap(
            new java.util.IdentityHashMap<Object, Boolean>());
        java.util.ArrayDeque<Object> pending = new java.util.ArrayDeque<>();
        pending.add(menu);
        boolean moved = false;
        for (int depth = 0; depth < 24 && !pending.isEmpty(); depth++) {
            Object backend = pending.removeFirst();
            if (!visited.add(backend)) continue;
            boolean adjusted = false;
            for (Class<?> type = backend.getClass(); type != null; type = type.getSuperclass()) {
                for (Field field : type.getDeclaredFields()) {
                    if (java.lang.reflect.Modifier.isStatic(field.getModifiers())) continue;
                    try {
                        field.setAccessible(true);
                        Object data = field.get(backend);
                        if (data instanceof java.util.List) {
                            if (moveItem((java.util.List<?>) data, reference, added))
                                adjusted = true;
                        } else if (data instanceof Menu && data != backend && !visited.contains(data)) {
                            pending.addLast(data);
                        }
                    } catch (ReflectiveOperationException | RuntimeException ignored) {
                        // Some platform fields are inaccessible; inspect other fields.
                    }
                }
            }
            if (adjusted) {
                moved = true;
                try {
                    Method refreshed = backend.getClass().getMethod("onItemsChanged", boolean.class);
                    refreshed.invoke(backend, true);
                } catch (ReflectiveOperationException | RuntimeException ignored) {
                    // Storage was already reordered.
                }
            }
        }
        if (!moved && !isAfter(menu, reference, added))
            android.util.Log.w("nicoid-menu", "Unable to move local playlist item after watch later");
    }

    @SuppressWarnings({"unchecked", "rawtypes"})
    private static boolean moveItem(java.util.List<?> raw, MenuItem reference, MenuItem added) {
        int before = itemIndex(raw, reference);
        int after = itemIndex(raw, added);
        if (before < 0 || after < 0 || after == before + 1) return false;
        java.util.List items = (java.util.List) raw;
        Object item = items.remove(after);
        before = itemIndex(items, reference);
        if (before < 0) return false;
        items.add(before + 1, item);
        return true;
    }

    private static int itemIndex(java.util.List<?> items, MenuItem expected) {
        for (int i = 0; i < items.size(); i++) {
            Object value = items.get(i);
            if (value == expected) return i;
            if (!(value instanceof MenuItem)) continue;
            MenuItem item = (MenuItem) value;
            if (expected.getItemId() != 0 && item.getItemId() == expected.getItemId()) return i;
            if (item.getTitle() != null && expected.getTitle() != null
                    && item.getTitle().toString().contentEquals(expected.getTitle())) return i;
        }
        return -1;
    }

    private static boolean isAfter(Menu menu, MenuItem reference, MenuItem added) {
        for (int i = 0; i + 1 < menu.size(); i++) {
            if (menu.getItem(i) == reference && menu.getItem(i + 1) == added) return true;
        }
        return false;
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
