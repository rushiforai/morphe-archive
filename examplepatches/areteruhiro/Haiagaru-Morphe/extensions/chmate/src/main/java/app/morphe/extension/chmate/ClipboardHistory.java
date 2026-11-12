package app.morphe.extension.chmate;

import android.app.Activity;

import android.content.ClipData;
import android.content.ClipboardManager;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;
import android.os.Build;
import android.widget.*;
import android.view.Menu;
import android.view.MenuItem;
import java.util.ArrayList;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/** Only explicitly copied in-app text; never reads or monitors the system clipboard. */
public final class ClipboardHistory {
    private static final int MENU_ID = 0x48690078;
    private static final String PREFS = "haiagaru-clipboard";
    private static final ExecutorService WORK = Executors.newSingleThreadExecutor();
    private static final java.util.WeakHashMap<MenuItem, java.lang.ref.WeakReference<Activity>> OWNERS = new java.util.WeakHashMap<>();
    private static Store store;
    private ClipboardHistory() { }

    private static synchronized Store store(Context context) {
        if (store == null) store = new Store(context.getApplicationContext());
        return store;
    }
    static final class Store extends SQLiteOpenHelper {
        Store(Context context) { super(context, "haiagaru-clipboard.db", null, 1); }
        public void onCreate(SQLiteDatabase db) {
            db.execSQL("CREATE TABLE clips (id INTEGER PRIMARY KEY, body TEXT NOT NULL UNIQUE, category TEXT NOT NULL DEFAULT '', copied INTEGER NOT NULL)");
            db.execSQL("CREATE TABLE categories (name TEXT PRIMARY KEY)");
        }
        public void onUpgrade(SQLiteDatabase db, int from, int to) { }
    }
    private static void save(Context context, String text) {
        SQLiteDatabase db = store(context).getWritableDatabase();
        db.beginTransaction();
        try {
            // UPDATE instead of REPLACE preserves the user's classification on repeated copies.
            android.content.ContentValues values = new android.content.ContentValues();
            long latest = android.database.DatabaseUtils.longForQuery(db, "SELECT coalesce(max(copied),0) FROM clips", null);
            values.put("copied", Math.max(System.currentTimeMillis(), latest + 1));
            if (db.update("clips", values, "body=?", new String[]{text}) == 0) {
                values.put("body", text); db.insertOrThrow("clips", null, values);
            }
            db.execSQL("DELETE FROM clips WHERE id NOT IN (SELECT id FROM clips ORDER BY copied DESC,id DESC LIMIT 100)");
            db.setTransactionSuccessful();
        } finally { db.endTransaction(); }
    }
    public static void setPrimaryClip(ClipboardManager manager, ClipData clip) {
        clip=SiteNativeBoards.exportedClip(clip);
        // Preserve the original copy operation and exceptions; recording failure never breaks copying.
        manager.setPrimaryClip(clip);
        try {
            Context context = Haiagaru.applicationContextForExtension();
            if (context == null || !context.getSharedPreferences(PREFS, 0).getBoolean("enabled", false)
                    || clip == null || clip.getItemCount() != 1) return;
            if (Build.VERSION.SDK_INT >= 24 && clip.getDescription().getExtras() != null
                    && clip.getDescription().getExtras().getBoolean("android.content.extra.IS_SENSITIVE", false)) return;
            ClipData.Item item = clip.getItemAt(0);
            if (item.getUri() != null || item.getIntent() != null || item.getText() == null) return;
            String text = item.getText().toString();
            if (text.trim().isEmpty() || text.length() > 10000) return;
            WORK.execute(() -> {
                try {
                    if (context.getSharedPreferences(PREFS, 0).getBoolean("enabled", false)) save(context, text);
                } catch (Exception ignored) { }
            });
        } catch (Exception ignored) { }
    }
    private interface Job { void run() throws Exception; }
    private static void work(Activity activity, Job job) {
        WORK.execute(() -> {
            try { job.run(); }
            catch (Exception ignored) { activity.runOnUiThread(() -> {
                if (!activity.isFinishing()) Toast.makeText(activity, "コピー履歴の処理に失敗しました", Toast.LENGTH_SHORT).show();
            }); }
        });
    }
    private static void ui(Activity a, Runnable action) {
        a.runOnUiThread(() -> { if (!a.isFinishing() && !a.isDestroyed()) action.run(); });
    }
    public static void addSettings(LinearLayout layout, Activity activity) {
        Button open = new Button(activity); open.setText("コピー履歴・分類");
        open.setOnClickListener(v -> show(activity)); layout.addView(open);
    }
    public static void show(Activity activity) { showList(activity, null, ""); }
    private static void showList(Activity activity, String category, String query) {
        work(activity, () -> {
            ArrayList<Long> ids = new ArrayList<>(); ArrayList<String> labels = new ArrayList<>();
            String where = category == null ? "" : "category=?";
            ArrayList<String> args = new ArrayList<>(); if (category != null) args.add(category);
            if (!query.isEmpty()) { where += where.isEmpty() ? "instr(body,?)>0" : " AND instr(body,?)>0"; args.add(query); }
            try (Cursor cursor = store(activity).getReadableDatabase().query("clips", null,
                    where.isEmpty() ? null : where, args.toArray(new String[0]), null, null, "copied DESC,id DESC", "100")) {
                while (cursor.moveToNext()) {
                    ids.add(cursor.getLong(cursor.getColumnIndexOrThrow("id")));
                    String body = cursor.getString(cursor.getColumnIndexOrThrow("body"));
                    String cat = cursor.getString(cursor.getColumnIndexOrThrow("category"));
                    labels.add("[" + (cat.isEmpty() ? "未分類" : cat) + "] " + body.substring(0, Math.min(100, body.length())));
                }
            }
            ui(activity, () -> {
                LinearLayout root = new LinearLayout(activity); root.setOrientation(LinearLayout.VERTICAL); root.setPadding(20, 8, 20, 8);
                CheckBox enabled = new CheckBox(activity); enabled.setText("ChMate内のコピーを記録（初期オフ）");
                enabled.setChecked(activity.getSharedPreferences(PREFS, 0).getBoolean("enabled", false));
                enabled.setOnCheckedChangeListener((v, checked) -> activity.getSharedPreferences(PREFS, 0).edit().putBoolean("enabled", checked).apply()); root.addView(enabled);
                TextView note = new TextView(activity);
                note.setText("最新100件・1件10000文字まで。端末内に保存します。個人情報も記録されるためご注意ください。他アプリ・画像・機密指定のコピーは収集しません。オフにしても保存済み履歴は残ります。"); root.addView(note);
                EditText search = new EditText(activity); search.setSingleLine(true); search.setHint("本文を検索"); search.setText(query); root.addView(search);
                Button find = new Button(activity); find.setText("検索"); root.addView(find);
                Button filter = new Button(activity); filter.setText("分類: " + (category == null ? "すべて" : category.isEmpty() ? "未分類" : category)); root.addView(filter);
                ListView list = new ListView(activity); list.setAdapter(new ArrayAdapter<>(activity, android.R.layout.simple_list_item_1, labels));
                root.addView(list, new LinearLayout.LayoutParams(-1, 0, 1));
                TextView empty = new TextView(activity); empty.setText(labels.isEmpty() ? "コピー履歴はありません" : "項目をタップ: 詳細・再コピー・分類・削除"); root.addView(empty);
                HaiagaruDialog dialog = new HaiagaruDialog.Builder(activity).setTitle("コピー履歴")
                        .setView(root).setPositiveButton("閉じる", null).setNeutralButton("分類を管理", null).setNegativeButton("全消去", null).create();
                dialog.setOnShowListener(v -> {
                    dialog.getWindow().setLayout(-1, (int)(activity.getResources().getDisplayMetrics().heightPixels * .85));
                    dialog.getButton(-3).setOnClickListener(w -> categories(activity, null, () -> { dialog.dismiss(); show(activity); }));
                    dialog.getButton(-2).setOnClickListener(w -> new HaiagaruDialog.Builder(activity).setMessage("コピー履歴を全消去しますか？元に戻せません。分類名は残ります。")
                            .setNegativeButton("キャンセル", null).setPositiveButton("全消去", (d, which) -> work(activity, () -> {
                                store(activity).getWritableDatabase().delete("clips", null, null); ui(activity, () -> { dialog.dismiss(); show(activity); });
                            })).show());
                });
                find.setOnClickListener(v -> { dialog.dismiss(); showList(activity, category, search.getText().toString()); });
                filter.setOnClickListener(v -> chooseCategory(activity, true, value -> { dialog.dismiss(); showList(activity, value, query); }));
                list.setOnItemClickListener((parent, view, position, id) -> details(activity, ids.get(position), () -> { dialog.dismiss(); showList(activity, category, query); }));
                dialog.show();
            });
        });
    }
    private interface Selected { void select(String category); }
    private static void chooseCategory(Activity a, boolean all, Selected selected) {
        work(a, () -> {
            ArrayList<String> names = names(a);
            ArrayList<String> labels = new ArrayList<>(); if (all) labels.add("すべて"); labels.add("未分類"); labels.addAll(names);
            ui(a, () -> new HaiagaruDialog.Builder(a).setTitle("分類を選択").setItems(labels.toArray(new String[0]),
                    (d, p) -> selected.select(all && p == 0 ? null : p == (all ? 1 : 0) ? "" : names.get(p - (all ? 2 : 1))))
                    .setNegativeButton("キャンセル", null).show());
        });
    }
    private static ArrayList<String> names(Context context) {
        ArrayList<String> names = new ArrayList<>();
        try (Cursor c = store(context).getReadableDatabase().rawQuery("SELECT name FROM categories ORDER BY name", null)) { while(c.moveToNext()) names.add(c.getString(0)); }
        return names;
    }
    private static void details(Activity a, long id, Runnable refresh) {
        work(a, () -> {
            String text;
            try (Cursor c = store(a).getReadableDatabase().rawQuery("SELECT body FROM clips WHERE id=?", new String[]{Long.toString(id)})) {
                if (!c.moveToFirst()) return; text = c.getString(0);
            }
            ui(a, () -> new HaiagaruDialog.Builder(a).setTitle("コピー履歴の操作")
                    .setItems(new String[]{"全文を見る", "再コピー", "分類を変更", "削除"}, (d, p) -> {
                        if (p == 0) { TextView body = new TextView(a); body.setText(text); body.setTextIsSelectable(true);
                            ScrollView scroll = new ScrollView(a); scroll.addView(body); new HaiagaruDialog.Builder(a).setTitle("コピーした本文").setView(scroll).setPositiveButton("閉じる", null).show(); }
                        if (p == 1) { ((ClipboardManager)a.getSystemService(Context.CLIPBOARD_SERVICE)).setPrimaryClip(ClipData.newPlainText("コピー履歴", text)); Toast.makeText(a, "コピーしました", Toast.LENGTH_SHORT).show(); }
                        if (p == 2) chooseCategory(a, false, category -> work(a, () -> {
                            android.content.ContentValues values = new android.content.ContentValues(); values.put("category", category);
                            store(a).getWritableDatabase().update("clips", values, "id=?", new String[]{Long.toString(id)}); ui(a, refresh);
                        }));
                        if (p == 3) new HaiagaruDialog.Builder(a).setMessage("この履歴を削除しますか？").setNegativeButton("キャンセル", null).setPositiveButton("削除", (x, y) -> work(a, () -> {
                            store(a).getWritableDatabase().delete("clips", "id=?", new String[]{Long.toString(id)}); ui(a, refresh);
                        })).show();
                    }).setNegativeButton("閉じる", null).show());
        });
    }
    private static void categories(Activity a, String unused, Runnable refresh) {
        work(a, () -> {
            ArrayList<String> names = names(a); ArrayList<String> choices = new ArrayList<>(); choices.add("新しい分類を作成"); choices.addAll(names);
            ui(a, () -> new HaiagaruDialog.Builder(a).setTitle("分類の管理").setItems(choices.toArray(new String[0]), (d, p) -> {
                if (p == 0) editCategory(a, null, refresh);
                else { String name = names.get(p-1); new HaiagaruDialog.Builder(a).setTitle(name).setItems(new String[]{"名前を変更", "削除（履歴は未分類へ）"}, (x, y) -> {
                    if (y == 0) editCategory(a, name, refresh);
                    else new HaiagaruDialog.Builder(a).setMessage("分類を削除し、含まれる履歴を未分類に戻しますか？").setNegativeButton("キャンセル", null)
                        .setPositiveButton("削除", (q, r) -> changeCategory(a, name, null, refresh)).show();
                }).show(); }
            }).setNegativeButton("閉じる", null).show());
        });
    }
    private static void editCategory(Activity a, String old, Runnable refresh) {
        EditText input = new EditText(a); input.setSingleLine(true); if (old != null) input.setText(old);
        HaiagaruDialog dialog = new HaiagaruDialog.Builder(a).setTitle(old == null ? "分類を作成" : "分類名を変更").setView(input)
                .setNegativeButton("キャンセル", null).setPositiveButton("保存", null).create();
        dialog.setOnShowListener(v -> dialog.getButton(-1).setOnClickListener(w -> {
            String name = input.getText().toString().trim();
            if (name.isEmpty() || name.length() > 40 || name.equals("未分類") || name.equals("すべて")) { input.setError("1〜40文字で、未分類・すべて以外を指定してください"); return; }
            work(a, () -> {
                if (!name.equals(old) && names(a).contains(name)) { ui(a, () -> input.setError("同じ分類名があります")); return; }
                changeCategoryNow(a, old, name); ui(a, () -> { dialog.dismiss(); refresh.run(); });
            });
        })); dialog.show();
    }
    private static void changeCategory(Activity a, String old, String name, Runnable refresh) {
        work(a, () -> { changeCategoryNow(a, old, name); ui(a, refresh); });
    }
    private static void changeCategoryNow(Context a, String old, String name) {
        SQLiteDatabase db = store(a).getWritableDatabase(); db.beginTransaction();
        try {
            if (old != null) {
                android.content.ContentValues values = new android.content.ContentValues(); values.put("category", name == null ? "" : name);
                db.update("clips", values, "category=?", new String[]{old}); db.delete("categories", "name=?", new String[]{old});
            }
            if (name != null) { android.content.ContentValues values = new android.content.ContentValues(); values.put("name", name); db.insertOrThrow("categories", null, values); }
            db.setTransactionSuccessful();
        } finally { db.endTransaction(); }
    }
    private static Activity activity(Object owner) {
        if (owner instanceof Activity) return (Activity)owner;
        try { return (Activity)owner.getClass().getMethod("getActivity").invoke(owner); } catch (Exception ignored) { return null; }
    }
    public static void addPostingMenu(Object owner, Menu menu) {
        Activity a = activity(owner);
        if (!Haiagaru.preparePostingMenu(a, menu, MENU_ID, "showClipboardHistoryMenu")) return;
        MenuItem item = menu.add(Menu.NONE, MENU_ID, Menu.NONE, "コピー履歴・分類"); item.setShowAsAction(MenuItem.SHOW_AS_ACTION_NEVER);
        OWNERS.put(item, new java.lang.ref.WeakReference<>(a)); item.setOnMenuItemClickListener(i -> handlePostingMenu(owner, i));
    }
    public static boolean handlePostingMenu(Object owner, MenuItem item) {
        Activity a = activity(owner); if (a == null || a.isFinishing() || item == null || item.getItemId() != MENU_ID) return false;
        show(a); return true;
    }
    public static boolean handlePostingActivityMenu(MenuItem item) {
        java.lang.ref.WeakReference<Activity> ref = OWNERS.get(item); return ref != null && handlePostingMenu(ref.get(), item);
    }
}
