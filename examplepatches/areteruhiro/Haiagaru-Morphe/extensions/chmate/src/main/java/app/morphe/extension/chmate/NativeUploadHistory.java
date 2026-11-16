package app.morphe.extension.chmate;

import android.app.Activity;

import android.app.ProgressDialog;
import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import android.view.Menu;
import android.view.MenuItem;
import android.widget.BaseAdapter;
import android.widget.Toast;
import java.lang.reflect.*;
import java.text.DateFormat;
import java.util.*;
import java.util.concurrent.FutureTask;
import java.util.concurrent.atomic.AtomicBoolean;

/** Actions in ChMate's own upload history. Does not require the Imgur login patch. */
public final class NativeUploadHistory {
    private static final int SORT = 0x7e484901, DELETE = 0x7e484902, MANAGE = 0x7e484903;
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final AtomicBoolean BUSY = new AtomicBoolean();
    private static final ThreadLocal<String> TITLE = new ThreadLocal<>();
    private NativeUploadHistory() { }

    private static boolean newest() {
        Activity a = Haiagaru.toolbarActivity(null);
        return a != null && a.getSharedPreferences("haiagaru_upload_history", 0)
                .getBoolean("newestFirst", false);
    }

    public static String title(String original) {
        String label = TITLE.get();
        return label == null ? original : label;
    }

    /** Only called with native display copies, never the service's persisted list. */
    public static void sort(List<?> rows) {
        if (rows != null && newest()) {
            Collections.sort((List<Object>) rows, (a, b) -> Long.compare(time(b), time(a)));
        }
    }

    public static void sortAdapter(Object adapter) {
        try { sort((List<?>) get(adapter, "c")); }
        catch (Exception e) { report(e); }
    }

    public static void addMenu(Object owner, Menu menu) {
        if (menu.findItem(SORT) != null) { menu.findItem(SORT).setChecked(newest()); return; }
        menu.add(0, SORT, 100, "新しい順（降順）").setCheckable(true).setChecked(newest())
                .setOnMenuItemClickListener(item -> handle(owner, item));
        menu.add(0, DELETE, 101, "サーバーから一括削除…")
                .setOnMenuItemClickListener(item -> handle(owner, item));
        menu.add(0, MANAGE, 102, "imgbox／imgpileのサーバー削除・管理…")
                .setOnMenuItemClickListener(item -> handle(owner, item));
    }

    public static boolean handle(Object owner, MenuItem item) {
        if (item.getItemId() == MANAGE) {
            Activity activity = Haiagaru.toolbarActivity(owner);
            if (activity != null && !activity.isFinishing()) MediaUploadManagement.show(activity, owner);
            return true;
        }
        if (item.getItemId() != SORT && item.getItemId() != DELETE) return false;
        action(owner, item.getItemId() == SORT);
        if (item.getItemId() == SORT) item.setChecked(newest());
        return true;
    }

    private static void action(Object owner, boolean sorting) {
        Activity activity = Haiagaru.toolbarActivity(owner);
        if (activity == null || activity.isDestroyed()) return;
        try {
            if (sorting) {
                activity.getSharedPreferences("haiagaru_upload_history", 0).edit()
                        .putBoolean("newestFirst", !newest()).apply();
                refresh(owner);
            } else choose(activity, owner);
        } catch (Exception e) {
            report(e);
            Toast.makeText(activity, "アップロード履歴を操作できませんでした", Toast.LENGTH_LONG).show();
        }
    }

    /** Compose uses its native overflow renderer and text composable, not a second toolbar. */
    public static void composeMenu(Object model, Object composer) {
        try {
            boolean v242 = model.getClass().getName().contains("UploadListViewModel");
            Class<?> textOwner = Class.forName(v242 ? "o.zzbjz" : "o.kUGNk");
            Method text = null;
            for (Method m : textOwner.getDeclaredMethods()) {
                if (m.getName().equals(v242 ? "e" : "b") && m.getParameterTypes().length == 2) text = m;
            }
            if (text == null) throw new NoSuchMethodException("native upload menu text");
            text.setAccessible(true);
            Class<?> renderer = Class.forName(v242 ? "o.getWrapperDetectionLastPing" : "o.convertBooleanToFlag");
            Method render = null;
            for (Method m : renderer.getDeclaredMethods()) {
                if (Modifier.isStatic(m.getModifiers()) && m.getName().equals("d")
                        && m.getParameterTypes().length == 12) render = m;
            }
            if (render == null) throw new NoSuchMethodException("native upload menu row");
            render.setAccessible(true);
            Object unit = unit(v242);
            final Method textMethod = text;
            for (int i = 0; i < 3; i++) {
                final boolean managing = i == 2;
                final boolean sorting = i == 0;
                String label = managing ? "imgbox／imgpileのサーバー削除・管理…"
                        : sorting ? (newest() ? "✓ 新しい順（降順）" : "新しい順（降順）") : "サーバーから一括削除…";
                Object title = proxy(render.getParameterTypes()[0], (p, m, args) -> {
                    TITLE.set(label);
                    try { return textMethod.invoke(null, args[0], args[1]); }
                    finally { TITLE.remove(); }
                });
                Object click = proxy(render.getParameterTypes()[1], (p, m, args) -> {
                    // Match native overflow dismissal before displaying Android selection/confirmation.
                    model.getClass().getDeclaredMethod("c").invoke(model);
                    if (managing) {
                        Activity activity = Haiagaru.toolbarActivity(model);
                        if (activity != null && !activity.isFinishing()) MediaUploadManagement.show(activity, model);
                    } else action(model, sorting);
                    return unit;
                });
                render.invoke(null, title, click, null, null, null, false,
                        null, null, null, composer, 6, 508);
            }
        } catch (Exception e) { report(e); }
    }

    private static Object proxy(Class<?> type, InvocationHandler callback) {
        return Proxy.newProxyInstance(type.getClassLoader(), new Class<?>[]{type}, (p, m, args) -> {
            if (m.getDeclaringClass() == Object.class) {
                if (m.getName().equals("hashCode")) return System.identityHashCode(p);
                if (m.getName().equals("equals")) return p == args[0];
                return "HaiagaruUploadMenu";
            }
            return callback.invoke(p, m, args);
        });
    }

    private static Object manager(Object owner) throws Exception {
        String name = owner.getClass().getName();
        return get(owner, name.contains("UploadListViewModel") ? "j" :
                name.equals("o.RFEndCardBackUpLayout2") ? "g" : "s");
    }

    private static List<?> rows(Object owner) throws Exception {
        Object service = manager(owner);
        return (List<?>) get(service, service.getClass().getName().equals("o.onRewardedInterstitialAdLoadFailed") ? "f" : "h");
    }

    private static void refresh(Object owner) throws Exception {
        if (owner.getClass().getName().equals("o.onRewardedInterstitialAdHidden")) {
            ((BaseAdapter) get(owner, "e")).notifyDataSetChanged();
        } else {
            Method method = owner.getClass().getDeclaredMethod(
                    owner.getClass().getName().contains("UploadListViewModel") ? "a" : "c", owner.getClass());
            method.setAccessible(true);
            method.invoke(null, owner);
        }
    }

    private static void choose(Activity activity, Object owner) throws Exception {
        if (BUSY.get()) { Toast.makeText(activity, "一括削除を実行中です", Toast.LENGTH_SHORT).show(); return; }
        List<Object> eligible = new ArrayList<>();
        List<?> nativeRows = rows(owner);
        if (nativeRows != null) for (Object row : nativeRows) {
            if ((((Number) get(row, "flags")).intValue() & 1) == 0 && !string(row, "key").isEmpty()
                    && MediaUploadManagementPolicy.imgur(string(row, "link"))) eligible.add(row);
        }
        sort(eligible);
        if (eligible.isEmpty()) { Toast.makeText(activity, "サーバーから削除できる画像がありません", Toast.LENGTH_LONG).show(); return; }
        String[] labels = new String[eligible.size()];
        boolean[] selected = new boolean[eligible.size()];
        DateFormat date = DateFormat.getDateTimeInstance(DateFormat.SHORT, DateFormat.SHORT);
        for (int i = 0; i < labels.length; i++) labels[i] = date.format(new Date(time(eligible.get(i)))) + "\n" + string(eligible.get(i), "link");
        HaiagaruDialog dialog = new HaiagaruDialog.Builder(activity).setTitle("サーバーから削除する画像を選択")
                .setMultiChoiceItems(labels, selected, (d, which, checked) -> selected[which] = checked)
                .setNeutralButton("全選択／解除", null).setNegativeButton("キャンセル", null)
                .setPositiveButton("確認", null).create();
        // Attach synchronously: an asynchronous OnShow callback can leave the default
        // neutral button dismissing the list briefly after the window becomes visible.
        dialog.show();
        {
            dialog.getButton(-3).setOnClickListener(v -> {
                boolean all = true; for (boolean value : selected) all &= value;
                for (int i = 0; i < selected.length; i++) { selected[i] = !all; dialog.getListView().setItemChecked(i, !all); }
            });
            dialog.getButton(-1).setOnClickListener(v -> {
                List<Object> chosen = new ArrayList<>();
                for (int i = 0; i < selected.length; i++) if (selected[i]) chosen.add(eligible.get(i));
                if (chosen.isEmpty()) { Toast.makeText(activity, "画像を選択してください", Toast.LENGTH_SHORT).show(); return; }
                new HaiagaruDialog.Builder(activity).setTitle("サーバーから" + chosen.size() + "件削除しますか？")
                        .setMessage("削除は取り消せません。履歴は削除済みとして残ります。失敗した画像は変更しません。")
                        .setNegativeButton("キャンセル", null).setPositiveButton("削除", (c, w) -> {
                            dialog.dismiss(); start(activity, owner, chosen);
                        }).show();
            });
        }
    }

    private static void start(Activity activity, Object owner, List<Object> chosen) {
        if (!BUSY.compareAndSet(false, true)) return;
        AtomicBoolean cancel = new AtomicBoolean();
        HaiagaruDialog progress = HaiagaruDialog.progress(activity, "処理を準備しています…");
        progress.setTitle("サーバーから削除中"); progress.setMessage("0 / " + chosen.size());
        progress.setCanceledOnTouchOutside(false);
        progress.setOnCancelListener(d -> cancel.set(true));
        progress.setButton(-2, "中止", (d, w) -> cancel.set(true));
        progress.show();
        new Thread(() -> {
            int success = 0, failed = 0;
            try {
                for (Object row : chosen) {
                    if (cancel.get() || activity.isFinishing() || activity.isDestroyed()) break;
                    boolean deleted;
                    try { deleted = delete(activity.getApplicationContext(), row); }
                    catch (Exception e) { report(e); deleted = false; }
                    if (deleted) {
                        // Persist every confirmed success, including the current request after cancellation.
                        FutureTask<Void> save = new FutureTask<>(() -> { markDeleted(owner, row); return null; });
                        MAIN.post(save); save.get(); success++;
                    } else failed++;
                    final String status = (success + failed) + " / " + chosen.size();
                    MAIN.post(() -> { if (progress.isShowing()) progress.setMessage(status); });
                }
            } catch (Exception e) { report(e); }
            finally {
                final int ok = success, errors = failed;
                MAIN.post(() -> {
                    BUSY.set(false);
                    if (progress.isShowing()) progress.dismiss();
                    if (!activity.isFinishing() && !activity.isDestroyed()) new HaiagaruDialog.Builder(activity)
                            .setTitle("一括削除の結果").setMessage("削除済み: " + ok + "件\n失敗: " + errors
                                    + "件\n未処理: " + (chosen.size() - ok - errors) + "件")
                            .setPositiveButton("OK", null).show();
                });
            }
        }, "Haiagaru-upload-delete").start();
    }

    private static boolean delete(Context context, Object row) throws Exception {
        if (!MediaUploadManagementPolicy.imgur(string(row, "link")) || string(row, "key").isEmpty()) return false;
        String rowType = row.getClass().getName();
        if (rowType.equals("o.onRewardedInterstitialAdDisplayed")) {
            Class<?> type = Class.forName("o.nm");
            Constructor<?> ctor = type.getDeclaredConstructors()[0]; ctor.setAccessible(true);
            FutureTask<Object> create = new FutureTask<>(() -> ctor.newInstance(context, "", string(row, "key"), null));
            MAIN.post(create); Object task = create.get();
            Method execute = type.getDeclaredMethod("a", Object[].class); execute.setAccessible(true);
            Object result = execute.invoke(task, (Object) new Object[0]);
            return result != null && result.getClass().getName().equals("o.r0ExternalSyntheticLambda15");
        }
        boolean v242 = rowType.equals("o.hasResolution");
        Class<?> type = Class.forName(v242
                ? "jp.syoboi.chmate2.feature.screen.uploadlist.UploadListViewModel$IconCompatParcelizer$write"
                : "o.RFEndCardBackUpLayout2$RemoteActionCompatParcelizer$ComponentActivity");
        Constructor<?> ctor = type.getDeclaredConstructors()[0]; ctor.setAccessible(true);
        Object request = ctor.newInstance(context, row, null);
        Method execute = type.getDeclaredMethod("invokeSuspend", Object.class); execute.setAccessible(true);
        return Boolean.TRUE.equals(execute.invoke(request, unit(v242)));
    }

    private static void markDeleted(Object owner, Object row) throws Exception {
        // StateFlow compares lists by equality. Mutating the same row in both lists would
        // suppress the update and leave the on-screen deleted indicator stale.
        List<Object> current = (List<Object>) rows(owner);
        int index = current.indexOf(row);
        if (index < 0) return; // A concurrent native history clear must not resurrect rows.
        Constructor<?> copy = null;
        for (Constructor<?> c : row.getClass().getDeclaredConstructors()) {
            if (c.getParameterTypes().length == 6 && c.getParameterTypes()[0] == String.class) copy = c;
        }
        if (copy == null) throw new NoSuchMethodException("native upload row copy");
        copy.setAccessible(true);
        Object deleted = copy.newInstance(get(row, "target"), get(row, "source"),
                get(row, "link"), get(row, "key"), get(row, "time"), get(row, "setting"));
        field(row.getClass(), "flags").setInt(deleted, ((Number) get(row, "flags")).intValue() | 1);
        current.set(index, deleted);
        Object service = manager(owner);
        String type = service.getClass().getName();
        boolean v191 = type.equals("o.onRewardedInterstitialAdLoadFailed");
        Handler handler = (Handler) get(service, v191 ? "c" : type.equals("o.enB3") ? "a" : "e");
        Runnable writer = (Runnable) get(service, v191 ? "i" : "g");
        handler.removeCallbacks(writer); handler.post(writer);
        refresh(owner);
    }

    static void markExternalDeleted(Object owner, String link) {
        if (owner == null) return;
        try {
            List<?> current = rows(owner);
            if (current == null) return;
            for (Object row : new ArrayList<>(current)) if (link.equals(string(row, "link"))) markDeleted(owner, row);
        } catch (Exception ignored) { /* Private management state remains authoritative; no network retry. */ }
    }

    private static Object unit(boolean v242) throws Exception {
        return Class.forName(v242 ? "o.zzbwq" : "o.Ff11").getField(v242 ? "INSTANCE" : "c").get(null);
    }
    private static Field field(Class<?> type, String name) throws Exception {
        Field f = type.getDeclaredField(name); f.setAccessible(true); return f;
    }
    private static Object get(Object obj, String name) throws Exception { return field(obj.getClass(), name).get(obj); }
    private static String string(Object row, String name) throws Exception { Object v = get(row, name); return v == null ? "" : v.toString(); }
    private static long time(Object row) {
        try { return ((Number) get(row, "time")).longValue(); } catch (Exception e) { return 0; }
    }
    private static void report(Exception e) {
        // Never log deletion keys, authentication values, or network response bodies.
        android.util.Log.w("HaiagaruUploadHistory", "Upload history: " + e.getClass().getSimpleName());
    }
}
