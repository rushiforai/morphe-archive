package app.morphe.extension.chmate;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.content.SharedPreferences;
import android.util.Log;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.EditText;
import android.widget.RadioButton;
import android.widget.Toast;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.List;

/** Persists acquired Edge metadata independently of live subject/DAT availability. */
public final class EdgeReporterHistory {
    private static volatile SharedPreferences cache;
    private static final ThreadLocal<Object> SUBJECT = new ThreadLocal<>();
    public static void pending(Object list) { SUBJECT.set(list); }
    public static void capturePending(Object url) {
        Object list = SUBJECT.get(); SUBJECT.remove();
        if (url instanceof Object[]) {
            for (Object arg : (Object[]) url) if (arg != null && arg.getClass().getName().equals("jp.syoboi.a2chMate.client.BBSUrlInfo")) { capture(arg, list); return; }
        } else capture(url, list);
    }
    private static final ThreadLocal<Boolean> OPENING = new ThreadLocal<>();
    private EdgeReporterHistory() {}
    public static void initialize(Context context) {
        cache = context.getSharedPreferences("haiagaru.edge-reporters", Context.MODE_PRIVATE);
    }
    public static String historyTitle(long thread, Object board, String title) {
        return title(board, thread, title);
    }
    public static String title(Object board, long thread, String title) {
        SharedPreferences prefs = cache;
        if (prefs == null || thread <= 0 || !EdgeReporterId.isBoard(board)) return title;
        String key = Long.toString(thread);
        String suffix = EdgeReporterId.suffix(title);
        if (suffix != null) {
            if (!suffix.equals(prefs.getString(key, null))) prefs.edit().putString(key, suffix).apply();
            return title;
        }
        return EdgeReporterId.restore(title, prefs.getString(key, null));
    }
    public static void capture(Object url, Object result) {
        if (url == null || !(result instanceof List) || cache == null) return;
        // BBSUrlInfo exposes server/name in its diagnostic representation on all supported versions.
        String value = url.toString();
        if (!value.startsWith("{server:bbs.eddibb.cc, name:liveedge, created:")) return;
        SharedPreferences.Editor edit = cache.edit();
        boolean changed = false;
        try {
            for (Object item : (List<?>) result) {
                long thread = 0;
                String title = null;
                for (Field field : item.getClass().getDeclaredFields()) {
                    if (Modifier.isStatic(field.getModifiers())) continue;
                    field.setAccessible(true);
                    if (field.getType() == long.class) thread = field.getLong(item);
                    if (field.getType() == String.class) title = (String) field.get(item);
                }
                String suffix = EdgeReporterId.suffix(title);
                if (thread > 0 && suffix != null && !suffix.equals(cache.getString(Long.toString(thread), null))) {
                    edit.putString(Long.toString(thread), suffix);
                    changed = true;
                }
            }
            if (changed) edit.apply();
        } catch (ReflectiveOperationException error) {
            Log.w("HaiagaruReporter", "Unable to cache subject metadata", error);
        }
    }
    /** Intercepts the stock NGThread entry point; both choices continue into the stock editor. */
    public static boolean choose(Activity activity, String title, Object type, Object board) {
        if (Boolean.TRUE.equals(OPENING.get()) || !(type instanceof Enum)
                || !"THREAD".equals(((Enum<?>) type).name()) || !EdgeReporterId.isBoard(board)) return false;
        String suffix = EdgeReporterId.suffix(title);
        if (suffix == null || activity.isFinishing()) return false;
        String owner = type.getClass().getName().equals("o.addPauseListener") ? "o.getSegmentsokio"
                : type.getClass().getName().equals("o.YHn") ? "o.TTRewardVideoActivity2" : "o.zzawg";
        final Method entry;
        try {
            entry = Class.forName(owner).getDeclaredMethod("e", Class.forName("androidx.fragment.app.FragmentActivity"),
                    String.class, type.getClass(), board.getClass());
        } catch (ReflectiveOperationException error) {
            Log.w("HaiagaruReporter", "NG editor unavailable", error);
            return false;
        }
        new AlertDialog.Builder(activity).setTitle("NGThreadに追加")
                .setItems(new String[]{"記者IDだけをNG  " + suffix, "スレタイでNG"}, (dialog, which) -> {
                    try {
                        OPENING.set(true);
                        entry.invoke(null, activity, which == 0 ? suffix : title, type, board);
                    } catch (ReflectiveOperationException error) {
                        Log.e("HaiagaruReporter", "Unable to open NG editor", error);
                        Toast.makeText(activity, "NG追加画面を開けませんでした", Toast.LENGTH_LONG).show();
                    } finally {
                        OPENING.remove();
                    }
                }).setNegativeButton(android.R.string.cancel, null).show();
        return true;
    }
    /** The 191 editor uses Views; retain its matching-mode controls and normal save action. */
    public static void addLegacyButton(Object fragment, View root) {
        try {
            Object type = fragment.getClass().getField("c").get(fragment);
            if (!(type instanceof Enum) || !"THREAD".equals(((Enum<?>) type).name())) return;
            Object board = fragment.getClass().getField("a").get(fragment);
            if (!EdgeReporterId.isBoard(board)) return;
            Object holder = fragment.getClass().getField("d").get(fragment);
            Object binding = holder.getClass().getField("b").get(holder);
            RadioButton literal = (RadioButton) binding.getClass().getField("l").get(binding);
            EditText input = findInput(root);
            if (input == null || EdgeReporterId.suffix(input.getText().toString()) == null
                    || !(input.getParent() instanceof ViewGroup)) return;
            ViewGroup parent = (ViewGroup) input.getParent();
            Button button = new Button(root.getContext());
            button.setText("記者IDだけをNG");
            button.setOnClickListener(view -> {
                String suffix = EdgeReporterId.suffix(input.getText().toString());
                if (suffix != null) { literal.setChecked(true); input.setText(suffix); input.setSelection(suffix.length()); }
            });
            parent.addView(button, parent.indexOfChild(input) + 1);
        } catch (ReflectiveOperationException error) {
            Log.w("HaiagaruReporter", "Unable to add reporter shortcut", error);
        }
    }
    private static EditText findInput(View view) {
        if (view instanceof EditText) return (EditText) view;
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) {
                EditText result = findInput(group.getChildAt(i));
                if (result != null) return result;
            }
        }
        return null;
    }
}
