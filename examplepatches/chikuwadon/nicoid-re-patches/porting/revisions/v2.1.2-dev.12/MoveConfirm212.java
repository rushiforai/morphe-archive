package e.e.a;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.preference.PreferenceManager;
import android.widget.Toast;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.HashSet;
import java.util.Objects;
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

    private static boolean sameSelection(Object page, Object folder, Set<?> selected) throws Exception {
        return Objects.equals(folder, field(page, "folder")) && selected.equals(field(page, "selected"));
    }

    private static boolean canConfirm(Activity activity, Object page, Object folder, Set<?> selected)
            throws Exception {
        if (activity == null || activity.isFinishing() || activity.isDestroyed()) return false;
        if (sameSelection(page, folder, selected)) return true;
        Toast.makeText(activity, tr(activity, "選択が変更されました。選び直してください",
                "Selection changed. Select the videos again.", "選擇已變更，請重新選取影片。"),
                Toast.LENGTH_SHORT).show();
        return false;
    }

    public static Consumer<String> wrapLocal(Object page, Consumer<String> original) {
        try {
            Activity activity = (Activity) field(page, "a");
            Object folder = field(page, "folder");
            Set<?> selection = new HashSet<>((Set<?>) field(page, "selected"));
            return destination -> {
                if (destination == null || selection.isEmpty()) return;
                try {
                    if (!canConfirm(activity, page, folder, selection)) return;
                    Context c = dialogContext(activity);
                    String folderName = localFolderName(activity, destination);
                    dialog(c)
                            .setTitle(tr(c, "選択した動画を移動しますか？",
                                    "Move selected videos?", "移動所選影片？"))
                            .setMessage(tr(c, "移動する動画：", "Videos: ", "影片數：") + selection.size()
                                    + "\n" + tr(c, "移動先：", "Destination: ", "目的地：") + folderName)
                            .setNegativeButton(tr(c, "キャンセル", "Cancel", "取消"), null)
                            .setPositiveButton(tr(c, "移動", "Move", "移動"), (d, w) -> {
                                try {
                                    if (canConfirm(activity, page, folder, selection)) original.accept(destination);
                                } catch (Exception error) {
                                    android.util.Log.w("nicoid-bulk", "Local move unavailable", error);
                                }
                            }).show();
                } catch (Exception error) {
                    android.util.Log.w("nicoid-bulk", "Local move confirmation failed", error);
                }
            };
        } catch (Exception error) {
            android.util.Log.w("nicoid-bulk", "Unable to snapshot local move selection", error);
            return destination -> { };
        }
    }
}
