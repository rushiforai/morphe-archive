package app.morphe.extension.chmate;

import android.app.Activity;
import android.os.Bundle;
import android.view.View;
import android.widget.Toast;
import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import java.util.WeakHashMap;

/** Existing-rule operations use the native store and preserve all unrelated metadata. */
public final class ExistingNgActions {
    private static final WeakHashMap<Object, Boolean> offered = new WeakHashMap<>();

    public static void resumed(Object fragment) {
        try {
            View view = (View) fragment.getClass().getMethod("getView").invoke(fragment);
            if (view == null || offered.containsKey(fragment)) return;
            offered.put(fragment, true);
            // Run after the native editor has attached its view/composition.
            view.post(() -> offerNative(fragment, view));
        } catch (ReflectiveOperationException | RuntimeException error) {
            android.util.Log.w("Haiagaru", "Existing NG editor actions unavailable", error);
        }
    }

    private static void offerNative(Object fragment, View view) {
        try {
            if (!(Boolean) fragment.getClass().getMethod("isResumed").invoke(fragment)
                    || fragment.getClass().getMethod("getView").invoke(fragment) != view) return;
            Activity activity = Haiagaru.toolbarActivity(fragment);
            if (activity == null || activity.isFinishing() || activity.isDestroyed()) return;
            Bundle args = (Bundle) fragment.getClass().getMethod("getArguments").invoke(fragment);
            if (args == null) return;
            Object item = args.get("item"), category = args.get("type");
            Object packed = args.get("args");
            if (packed != null) for (Field field : packed.getClass().getDeclaredFields()) {
                if (Modifier.isStatic(field.getModifiers())) continue;
                field.setAccessible(true);
                if (field.getType().getName().equals("jp.syoboi.a2chMate.ng.NGWord$Item")) item = field.get(packed);
                if (field.getType().isEnum()) category = field.get(packed);
            }
            if (item == null || !(category instanceof Enum<?>)) return;
            NativeNgStore store = new NativeNgStore(activity, ((Enum<?>) category).name());
            NativeNgStore.Entry requested = new NativeNgStore.Entry(item);
            NativeNgStore.Entry target = find(store.entries(), requested.pattern, requested.board, requested.flags);
            if (target == null) return;
            String type = fragment.getClass().getName();
            String dismiss = type.equals("o.MaxFullscreenAdImplExternalSyntheticLambda4") ? "dismiss"
                    : type.equals("o.unsharedCopy") ? "a" : "e";
            java.lang.reflect.Method close = fragment.getClass().getMethod(dismiss);
            show(activity, store, target, () -> {
                try { close.invoke(fragment); }
                catch (ReflectiveOperationException error) { throw new IllegalStateException(error); }
            });
        } catch (ReflectiveOperationException | RuntimeException error) {
            android.util.Log.w("Haiagaru", "Existing NG actions unavailable", error);
        }
    }

    static NativeNgStore.Entry find(List<NativeNgStore.Entry> entries, String pattern, String board, short flags) {
        NativeNgStore.Entry found = null;
        for (NativeNgStore.Entry entry : entries) if (entry.pattern.equals(pattern)
                && Objects.equals(entry.board, board) && entry.flags == flags) return entry;
        for (NativeNgStore.Entry entry : entries) {
            // Compare the condition itself, never evaluate a regex against a candidate.
            if (!entry.pattern.equals(pattern) || !Objects.equals(entry.board, board)
                    || (entry.flags & 0x70) != (flags & 0x70)) continue;
            if (found != null) return null; // Ambiguous variants require the native editor.
            found = entry;
        }
        return found;
    }

    static void show(Activity activity, NativeNgStore store, NativeNgStore.Entry target, Runnable completed) {
        String[] actions = {"NGを削除する", "有効にする", "無効にする", "登録画面に戻る"};
        new HaiagaruDialog.Builder(activity)
                .setTitle("登録済みNG（" + ((target.flags & 4) == 0 ? "有効" : "無効") + "）")
                .setItems(actions, (dialog, which) -> {
                    if (which == 3) return;
                    if (which == 0) {
                        new HaiagaruDialog.Builder(activity).setTitle("このNGを削除しますか？")
                                .setMessage(target.pattern + "\n対象板: " + (target.board == null ? "すべての板" : target.board))
                                .setNegativeButton("キャンセル", null)
                                .setPositiveButton("削除", (d, w) -> apply(activity, store, target, which, completed)).show();
                    } else apply(activity, store, target, which, completed);
                }).setNegativeButton("キャンセル", null).show();
    }

    static void change(NativeNgStore store, NativeNgStore.Entry target, int action) throws ReflectiveOperationException {
        if (action < 0 || action > 2) throw new IllegalArgumentException("Unknown NG action");
        List<NativeNgStore.Entry> before = store.entries();
        NativeNgStore.Entry current = null;
        for (NativeNgStore.Entry entry : before) if (entry.same(target)) { current = entry; break; }
        if (current == null) throw new IllegalStateException("NGが変更されました。画面を開き直してください");
        if ((action == 1 && (current.flags & 4) == 0)
                || (action == 2 && (current.flags & 4) != 0)) return;
        List<Object> after = new ArrayList<>();
        for (NativeNgStore.Entry entry : before) {
            if (entry != current) after.add(entry.nativeItem);
            else if (action != 0) after.add(store.item(entry.pattern,
                    (short) (action == 1 ? entry.flags & ~4 : entry.flags | 4), entry.timestamp, entry.board));
        }
        store.replace(before, after);
        PersonalNgSubmissions.changed();
    }

    private static void apply(Activity activity, NativeNgStore store, NativeNgStore.Entry target,
                              int action, Runnable completed) {
        try {
            change(store, target, action);
            completed.run();
            Toast.makeText(activity, action == 0 ? "NGを削除しました" : action == 1 ? "NGを有効にしました" : "NGを無効にしました", Toast.LENGTH_SHORT).show();
        } catch (ReflectiveOperationException | RuntimeException error) {
            android.util.Log.w("Haiagaru", "Existing NG operation failed", error);
            Toast.makeText(activity, "操作できませんでした。NG画面を開き直してください", Toast.LENGTH_LONG).show();
        }
    }

    private ExistingNgActions() {}
}
