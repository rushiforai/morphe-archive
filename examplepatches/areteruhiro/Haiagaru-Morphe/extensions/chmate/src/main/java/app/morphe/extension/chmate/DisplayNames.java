package app.morphe.extension.chmate;

import android.app.Activity;
import android.content.Context;
import android.content.SharedPreferences;
import android.widget.EditText;
import java.io.File;
import java.io.FileInputStream;
import java.io.ByteArrayOutputStream;
import org.json.JSONArray;
import org.json.JSONObject;

/** User-defined labels, persisted separately from native keyword records. */
public final class DisplayNames {
    static final String PREFS = "haiagaru.display-names";
    private DisplayNames() {}

    static SharedPreferences prefs(Context context) {
        return context.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
    }

    private static String string(Object value, String field) throws ReflectiveOperationException {
        return (String) NativeFields.find(value.getClass(), field).get(value);
    }

    public static String keyword(Object value) {
        try {
            String field = value.getClass().getName().equals("o.onAdCollapsed") ? "keyword"
                    : NativeFields.find(value.getClass(), "b").getType() == String.class ? "b" : "d";
            String original = string(value, field);
            Context context = Haiagaru.applicationContextForExtension();
            if (context == null) return original;
            String idField = field.equals("keyword") ? "id" : field.equals("b") ? "c" : "b";
            long id = NativeFields.find(value.getClass(), idField).getLong(value);
            return prefs(context).getString("keyword:" + id, original);
        } catch (ReflectiveOperationException error) {
            android.util.Log.w("Haiagaru", "Keyword display name unavailable", error);
            return "";
        }
    }

    static String nativeThreadTitle(Object fragment) {
        try {
            android.os.Bundle args = (android.os.Bundle) fragment.getClass().getMethod("getArguments").invoke(fragment);
            if (args == null) return "";
            String title = args.getString("threadTitle");
            if (title != null) return title;
            Object packed = args.get("args");
            if (packed != null) for (java.lang.reflect.Field field : packed.getClass().getDeclaredFields()) {
                if (field.getType() == String.class) {
                    field.setAccessible(true);
                    Object value = field.get(packed);
                    if (value != null) return (String) value;
                }
            }
        } catch (ReflectiveOperationException ignored) {}
        return "";
    }

    static void showKeywords(Activity activity) {
        try {
            File file = activity.getFileStreamPath("keyword_group_list.json");
            JSONObject root = new JSONObject();
            if (file.exists()) try (FileInputStream input = new FileInputStream(file)) {
                ByteArrayOutputStream bytes = new ByteArrayOutputStream();
                byte[] buffer = new byte[4096];
                int count;
                while ((count = input.read(buffer)) != -1) bytes.write(buffer, 0, count);
                root = new JSONObject(bytes.toString("UTF-8"));
            }
            JSONArray items = root.optJSONArray("items");
            if (items == null || items.length() == 0) {
                new HaiagaruDialog.Builder(activity).setTitle("キーワードの表示名")
                        .setMessage("ChMateのキーワード設定で検索条件を登録すると、ここで表示名を付けられます。")
                        .setPositiveButton("閉じる", null).show();
                return;
            }
            String[] labels = new String[items.length()];
            for (int i = 0; i < labels.length; i++) {
                JSONObject item = items.getJSONObject(i);
                String query = item.getString("keyword");
                String alias = prefs(activity).getString("keyword:" + item.getLong("id"), "");
                labels[i] = alias.isEmpty() ? query : alias + "\n" + query;
            }
            new HaiagaruDialog.Builder(activity).setTitle("キーワードの表示名")
                    .setItems(labels, (dialog, index) -> {
                        JSONObject item = items.optJSONObject(index);
                        if (item != null) edit(activity, "キーワードの表示名",
                                "keyword:" + item.optLong("id"), item.optString("keyword"));
                    }).setNegativeButton("閉じる", null).show();
        } catch (Exception error) {
            android.util.Log.w("Haiagaru", "Cannot read keyword labels", error);
            android.widget.Toast.makeText(activity, "キーワードを読み込めませんでした", 0).show();
        }
    }

    private static void edit(Activity activity, String title, String key, String original) {
        EditText input = new EditText(activity);
        input.setSingleLine(true);
        input.setHint("表示名（空欄で元の表示に戻す）");
        input.setText(prefs(activity).getString(key, ""));
        new HaiagaruDialog.Builder(activity).setTitle(title).setMessage("元の表示\n" + original)
                .setView(input).setNegativeButton("キャンセル", null)
                .setNeutralButton("元の表示に戻す", (dialog, which) -> save(activity, key, ""))
                .setPositiveButton("保存", (dialog, which) -> save(activity, key, input.getText().toString())).show();
    }

    static void save(Activity activity, String key, String name) {
        SharedPreferences.Editor editor = prefs(activity).edit();
        if (name.trim().isEmpty()) editor.remove(key);
        else editor.putString(key, name);
        editor.apply();
        Haiagaru.refreshBoardListAfterReadSortChange();
        ThreadListThumbnail.refresh();
        android.widget.Toast.makeText(activity, "表示名を保存しました", 0).show();
    }
}
