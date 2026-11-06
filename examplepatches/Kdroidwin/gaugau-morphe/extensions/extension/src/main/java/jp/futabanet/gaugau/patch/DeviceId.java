package jp.futabanet.gaugau.patch;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.content.SharedPreferences;
import android.text.InputType;
import android.text.InputFilter;
import android.widget.EditText;
import android.widget.Toast;

import java.util.UUID;

/** Stores a user-controlled, app-local identifier instead of reading Android ID. */
public final class DeviceId {
    private static final String PREFS = "gaugau_patch_privacy";
    private static final String KEY = "device_id";

    private DeviceId() { }

    public static String getId(Context context) {
        SharedPreferences preferences = context.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
        String value = preferences.getString(KEY, null);
        if (value == null || value.trim().isEmpty()) {
            value = UUID.randomUUID().toString();
            preferences.edit().putString(KEY, value).apply();
        }
        return value;
    }

    /** Called by the GauGau settings row added by the patch. */
    public static void showEditor(Activity activity) {
        final EditText input = new EditText(activity);
        input.setSingleLine(true);
        input.setInputType(InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_FLAG_NO_SUGGESTIONS);
        input.setFilters(new InputFilter[]{new InputFilter.LengthFilter(128)});
        input.setText(getId(activity));
        input.setSelection(input.length());
        new AlertDialog.Builder(activity)
                .setTitle("アプリ内ID")
                .setMessage("この端末で使うアプリ内IDを入力してください。空欄で保存すると新しい仮IDを作成します。")
                .setView(input)
                .setNegativeButton("キャンセル", null)
                .setNeutralButton("新しい仮ID", (dialog, which) -> {
                    String generated = UUID.randomUUID().toString();
                    save(activity, generated);
                    Toast.makeText(activity, "新しいIDを保存しました。反映にはアプリの再起動が必要です。", Toast.LENGTH_LONG).show();
                })
                .setPositiveButton("保存", (dialog, which) -> {
                    String value = input.getText().toString().trim();
                    if (value.isEmpty()) value = UUID.randomUUID().toString();
                    save(activity, value);
                    Toast.makeText(activity, "IDを保存しました。反映にはアプリの再起動が必要です。", Toast.LENGTH_LONG).show();
                })
                .show();
    }

    private static void save(Context context, String value) {
        context.getSharedPreferences(PREFS, Context.MODE_PRIVATE).edit().putString(KEY, value).apply();
        context.getSharedPreferences("app", Context.MODE_PRIVATE)
                .edit()
                .putBoolean("is_registered", false)
                .apply();
    }
}
