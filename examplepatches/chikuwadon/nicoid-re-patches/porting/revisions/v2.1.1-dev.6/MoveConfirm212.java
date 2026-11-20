package e.e.a;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.preference.PreferenceManager;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Set;
import java.util.function.Consumer;
import org.json.JSONArray;
import org.json.JSONObject;

/** Confirmation wrapper that preserves existing native/playlist mutation paths. */
public final class MoveConfirm212 {
    private MoveConfirm212() {}

    private static Object field(Object owner, String name) throws Exception {
        Field f = owner.getClass().getDeclaredField(name);
        f.setAccessible(true);
        return f.get(owner);
    }

    private static Context dialogContext(Activity activity) {
        try {
            Method method = Class.forName("e.e.a.PlaybackSession")
                    .getDeclaredMethod("dialogContext", Context.class);
            method.setAccessible(true);
            return (Context) method.invoke(null, activity);
        } catch (Exception ignored) {
            return activity;
        }
    }

    private static AlertDialog.Builder dialog(Context context) {
        try {
            Method method = Class.forName("e.e.a.UiDialogs")
                    .getDeclaredMethod("builder", Context.class);
            method.setAccessible(true);
            return (AlertDialog.Builder) method.invoke(null, context);
        } catch (Exception ignored) {
            return new AlertDialog.Builder(context);
        }
    }

    private static String tr(Context context, String ja, String en, String zh) {
        String lang = context.getResources().getConfiguration().locale.getLanguage();
        return "ja".equals(lang) ? ja : "zh".equals(lang) ? zh : en;
    }

    private static String localFolderName(Activity activity, String destination) {
        if (destination.isEmpty()) {
            return tr(activity, "未分類の動画", "Unfiled videos", "未分類影片");
        }
        try {
            String json = PreferenceManager.getDefaultSharedPreferences(activity)
                    .getString("nicoid_local_playlists_v1", "{}");
            JSONArray folders = new JSONObject(json).optJSONArray("folders");
            if (folders != null) for (int i = 0; i < folders.length(); i++) {
                JSONObject f = folders.optJSONObject(i);
                if (f != null && destination.equals(f.optString("id")))
                    return f.optString("name", destination);
            }
        } catch (Exception ignored) { }
        return destination;
    }

    public static Consumer<String> wrapLocal(Object page, Consumer<String> original) {
        return destination -> {
            if (page == null || original == null || destination == null) return;
            try {
                Activity activity = (Activity) field(page, "a");
                if (activity.isFinishing() || activity.isDestroyed()) return;
                @SuppressWarnings("unchecked")
                Set<String> selected = (Set<String>) field(page, "selected");
                int count = selected.size();
                if (count == 0) return;
                Context c = dialogContext(activity);
                String folderName = localFolderName(activity, destination);
                dialog(c)
                        .setTitle(tr(c, "選択した動画を移動しますか？",
                                "Move selected videos?", "移動所選影片？"))
                        .setMessage(tr(c, "移動する動画：", "Videos: ", "影片數：") + count
                                + "\n" + tr(c, "移動先：", "Destination: ", "目的地：") + folderName)
                        .setNegativeButton(tr(c, "キャンセル", "Cancel", "取消"), null)
                        .setPositiveButton(tr(c, "移動", "Move", "移動"),
                                (d, w) -> original.accept(destination))
                        .show();
            } catch (Exception e) {
                android.util.Log.w("nicoid-bulk", "Local move confirmation failed", e);
            }
        };
    }

    /**
     * Native mylist destination selection is implemented in the original APK,
     * outside our reviewed MPP. Confirm before invoking its original picker:
     * do not replace the server-side operation or access unverified endpoints.
     */
    public static void confirmNative(Object fragment, Runnable openPicker) {
        if (fragment == null || openPicker == null) return;
        try {
            Activity activity = (Activity) fragment.getClass().getField("o0").get(fragment);
            if (activity.isFinishing() || activity.isDestroyed()) return;
            @SuppressWarnings("unchecked")
            ArrayList<Object> rows = (ArrayList<Object>) fragment.getClass()
                    .getField("a0").get(fragment);
            int count = 0;
            for (Object row : rows) {
                Object selected = row.getClass().getMethod("a", String.class)
                        .invoke(row, "isselect");
                if (Boolean.TRUE.equals(selected)) count++;
            }
            if (count == 0) return;
            Context c = dialogContext(activity);
            dialog(c)
                    .setTitle(tr(c, "動画を移動しますか？",
                            "Move selected videos?", "移動影片？"))
                    .setMessage(tr(c, "選択した動画：", "Selected videos: ", "已選影片：") + count
                            + "\n" + tr(c, "続けて移動先を選択します",
                            "Choose the destination next", "接著選擇目的地"))
                    .setNegativeButton(tr(c, "キャンセル", "Cancel", "取消"), null)
                    .setPositiveButton(tr(c, "移動先を選択", "Choose destination", "選擇目的地"),
                            (d, w) -> openPicker.run())
                    .show();
        } catch (Exception e) {
            android.util.Log.w("nicoid-bulk", "Native move confirmation failed", e);
            // Fail closed rather than silently moving without confirmation.
        }
    }
}
