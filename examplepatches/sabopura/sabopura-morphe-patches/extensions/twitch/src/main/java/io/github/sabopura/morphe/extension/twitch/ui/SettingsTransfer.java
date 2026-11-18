package io.github.sabopura.morphe.extension.twitch.ui;

import android.content.ClipData;
import android.content.ClipboardManager;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.text.InputType;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.ViewGroup;
import android.widget.EditText;
import android.widget.LinearLayout;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;

import static io.github.sabopura.morphe.extension.twitch.ui.Text.label;

/**
 * Moves the settings between installs as text. A patched app signed with another key, or installed as
 * a separate app, starts empty; the text goes through the share sheet or the clipboard, so the patch
 * needs no storage permission and writes no file.
 */
final class SettingsTransfer {
    private static final String FORMAT = "sabopura-twitch-settings";
    private static final int VERSION = 1, MAX_CHARS = 512 * 1024;
    /** Not settings: what the patch counted, and which hints this install has already shown. */
    private static final String[] LEFT_OUT = {"stat_", "hint_"};

    private SettingsTransfer() {
    }

    // ---- text ----

    /** Every kept value of every store, with its type, since JSON alone cannot tell an int from a long. */
    static String encode(Map<String, Map<String, ?>> stores) throws JSONException {
        JSONObject root = new JSONObject().put("format", FORMAT).put("version", VERSION);
        JSONObject out = new JSONObject();
        for (Map.Entry<String, Map<String, ?>> store : stores.entrySet()) {
            JSONObject values = new JSONObject();
            for (Map.Entry<String, Object> entry : new TreeMap<String, Object>(store.getValue()).entrySet()) {
                JSONArray typed = typed(entry.getValue());
                if (typed != null && kept(entry.getKey())) values.put(entry.getKey(), typed);
            }
            out.put(store.getKey(), values);
        }
        return root.put("stores", out).toString();
    }

    /** The stores named in {@code known}, with typed values. Anything that is not our text is refused. */
    static Map<String, Map<String, Object>> decode(String text, Set<String> known) {
        if (text == null || text.length() > MAX_CHARS) throw new IllegalArgumentException("size");
        try {
            JSONObject root = new JSONObject(text.trim());
            if (!FORMAT.equals(root.optString("format")) || root.optInt("version") != VERSION)
                throw new IllegalArgumentException("format");
            JSONObject stores = root.getJSONObject("stores");
            Map<String, Map<String, Object>> found = new LinkedHashMap<>();
            for (Iterator<String> names = stores.keys(); names.hasNext(); ) {
                String name = names.next();
                if (!known.contains(name)) continue;
                JSONObject values = stores.getJSONObject(name);
                Map<String, Object> store = new LinkedHashMap<>();
                for (Iterator<String> keys = values.keys(); keys.hasNext(); ) {
                    String key = keys.next();
                    Object value = value(values.getJSONArray(key));
                    if (value != null && kept(key)) store.put(key, value);
                }
                found.put(name, store);
            }
            if (found.isEmpty()) throw new IllegalArgumentException("empty");
            return found;
        } catch (JSONException e) {
            throw new IllegalArgumentException("json");
        }
    }

    static boolean kept(String key) {
        for (String prefix : LEFT_OUT) if (key.startsWith(prefix)) return false;
        return true;
    }

    private static JSONArray typed(Object value) throws JSONException {
        if (value instanceof Boolean) return new JSONArray().put("b").put(value);
        if (value instanceof Integer) return new JSONArray().put("i").put(value);
        if (value instanceof Long) return new JSONArray().put("l").put(value);
        if (value instanceof Float) return new JSONArray().put("f").put((double) (Float) value);
        if (value instanceof String) return new JSONArray().put("s").put(value);
        if (value instanceof Set) return new JSONArray().put("ss").put(new JSONArray((Set<?>) value));
        return null;
    }

    private static Object value(JSONArray typed) throws JSONException {
        switch (typed.getString(0)) {
            case "b":
                return typed.getBoolean(1);
            case "i":
                return typed.getInt(1);
            case "l":
                return typed.getLong(1);
            case "f":
                return (float) typed.getDouble(1);
            case "s":
                return typed.getString(1);
            case "ss":
                Set<String> set = new HashSet<>();
                JSONArray items = typed.getJSONArray(1);
                for (int i = 0; i < items.length(); i++) set.add(items.getString(i));
                return set;
            default:
                return null;
        }
    }

    // ---- stores ----

    private static String exportText(Catalog.Env env) throws JSONException {
        Map<String, Map<String, ?>> stores = new LinkedHashMap<>();
        for (Catalog.Store store : Catalog.Store.values()) stores.put(store.name(), env.prefs(store).getAll());
        return encode(stores);
    }

    /**
     * Replaces the settings with the ones in {@code text}; returns how many values it wrote. A value of
     * a type the patch does not expect is written too: reads go through SafePreferences, which answers
     * the default for it, and judging it here against what happens to be stored now could throw away a
     * good value because a bad one was stored before.
     */
    @SuppressWarnings("unchecked")
    private static int importText(Catalog.Env env, String text) {
        Set<String> names = new HashSet<>();
        for (Catalog.Store store : Catalog.Store.values()) names.add(store.name());
        Map<String, Map<String, Object>> stores = decode(text, names);
        int written = 0;
        for (Map.Entry<String, Map<String, Object>> entry : stores.entrySet()) {
            SharedPreferences prefs = env.prefs(Catalog.Store.valueOf(entry.getKey()));
            SharedPreferences.Editor editor = prefs.edit();
            // A setting the text does not mention goes back to its default, as it was when the text was made.
            for (String key : prefs.getAll().keySet()) if (kept(key)) editor.remove(key);
            for (Map.Entry<String, Object> value : entry.getValue().entrySet()) {
                Object v = value.getValue();
                // A proxy sees what is watched, so only the built-in ones travel in shared text.
                if (Catalog.ProxyItem.KEY.equals(value.getKey()) && !Catalog.ProxyItem.preset(String.valueOf(v))) continue;
                if (v instanceof Boolean) editor.putBoolean(value.getKey(), (Boolean) v);
                else if (v instanceof Integer) editor.putInt(value.getKey(), (Integer) v);
                else if (v instanceof Long) editor.putLong(value.getKey(), (Long) v);
                else if (v instanceof Float) editor.putFloat(value.getKey(), (Float) v);
                else if (v instanceof String) editor.putString(value.getKey(), (String) v);
                else editor.putStringSet(value.getKey(), (Set<String>) v);
                written++;
            }
            editor.apply();
        }
        return written;
    }

    // ---- screens ----

    static void showExport(Catalog.Env env) {
        Context context = env.context();
        Ui ui = env.ui();
        String text;
        try {
            text = exportText(env);
        } catch (JSONException | RuntimeException e) {
            Notice.show(context, label("書き出せませんでした", "Could not export the settings"));
            return;
        }
        LinearLayout buttons = new LinearLayout(context);
        buttons.setGravity(Gravity.CENTER_VERTICAL);
        android.app.Dialog[] dialog = new android.app.Dialog[1];
        buttons.addView(ui.button(context, label("共有", "Share"), true, () -> {
            dialog[0].dismiss();
            try {
                context.startActivity(Intent.createChooser(new Intent(Intent.ACTION_SEND).setType("text/plain")
                        .putExtra(Intent.EXTRA_SUBJECT, FORMAT + ".json").putExtra(Intent.EXTRA_TEXT, text),
                        label("設定の書き出し", "Export settings")));
            } catch (RuntimeException e) {
                Notice.show(context, label("共有できるアプリがありません", "No app to share with"));
            }
        }));
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        lp.leftMargin = Ui.dp(context, 10);
        buttons.addView(ui.button(context, label("コピー", "Copy"), false, () -> {
            dialog[0].dismiss();
            ClipboardManager clipboard = (ClipboardManager) context.getSystemService(Context.CLIPBOARD_SERVICE);
            if (clipboard != null) clipboard.setPrimaryClip(ClipData.newPlainText(FORMAT, text));
            Notice.show(context, label("設定をコピーしました", "Settings copied"));
        }), lp);
        dialog[0] = ui.modal(context, label("設定を書き出す", "Export settings"),
                label("今の設定を文字にします。メモやクラウドなど好きな場所に残して、入れ直したあとや別の端末で「設定を読み込む」に貼り付けてください。NGワードや非表示ユーザーの一覧も含まれます。",
                        "Turns the current settings into text. Keep it anywhere you like, then paste it into Import settings after a reinstall or on another device. It includes your word and user lists."),
                buttons, null, (Runnable) null, label("閉じる", "Close"));
        Ui.show(dialog[0], context);
    }

    static void showImport(Catalog.Env env) {
        Context context = env.context();
        Ui ui = env.ui();
        EditText input = new EditText(context);
        input.setInputType(InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_FLAG_MULTI_LINE
                | InputType.TYPE_TEXT_FLAG_NO_SUGGESTIONS);
        input.setMinLines(3);
        input.setMaxLines(6);
        input.setGravity(Gravity.TOP | Gravity.START);
        input.setTextColor(ui.text);
        input.setHintTextColor(ui.secondary);
        input.setHint(label("書き出した文字をここに貼り付け", "Paste the exported text here"));
        input.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13);
        input.setPadding(Ui.dp(context, 14), Ui.dp(context, 12), Ui.dp(context, 14), Ui.dp(context, 12));
        input.setBackground(ui.field(context));
        LinearLayout content = new LinearLayout(context);
        content.setOrientation(LinearLayout.VERTICAL);
        content.addView(input, Ui.matchWidth());
        LinearLayout.LayoutParams pasteLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        pasteLp.topMargin = Ui.dp(context, 10);
        content.addView(ui.button(context, label("クリップボードから貼り付け", "Paste from clipboard"), false, () -> {
            ClipboardManager clipboard = (ClipboardManager) context.getSystemService(Context.CLIPBOARD_SERVICE);
            ClipData clip = clipboard == null ? null : clipboard.getPrimaryClip();
            CharSequence pasted = clip == null || clip.getItemCount() == 0 ? null : clip.getItemAt(0).coerceToText(context);
            if (pasted != null) input.setText(pasted);
        }), pasteLp);
        Ui.show(ui.modal(context, label("設定を読み込む", "Import settings"),
                label("今の設定は、貼り付けた設定に置き換わります。累計の記録は変わりません。",
                        "The pasted settings replace the current ones. The lifetime totals stay as they are."),
                content, label("読み込む", "Import"), () -> {
                    int written;
                    try {
                        written = importText(env, input.getText().toString());
                    } catch (RuntimeException e) {
                        input.setError(label("このパッチで書き出した設定ではありません", "This is not text exported by this patch"));
                        return false;
                    }
                    for (Catalog.Store store : Catalog.Store.values()) env.changed(store);
                    env.rebuild();
                    Notice.show(context, label(written + " 項目を読み込みました", "Imported " + written + " values"));
                    return true;
                }, label("キャンセル", "Cancel")), context);
    }
}
