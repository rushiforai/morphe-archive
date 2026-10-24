package app.morphe.extension.chmate;

import android.app.Activity;

import android.content.ClipData;
import android.content.ClipboardManager;
import android.content.Context;
import android.content.Intent;
import android.os.Handler;
import android.os.Looper;
import android.text.Html;
import android.text.InputFilter;
import android.util.AtomicFile;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;
import android.widget.Toast;
import org.json.JSONObject;
import java.io.*;
import java.lang.reflect.*;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.util.*;
import java.util.concurrent.Executors;
import java.util.concurrent.ExecutorService;

/** Separate response snapshots; native whole-thread archives and DATs are never modified. */
public final class ResponseArchive {
    private static final int ITEM = 0x7e484a01, SWITCHER = 0x7e484a02, VIEW_ARCHIVE = 0x7e484a03;
    private static final ThreadLocal<Object> ACTIVE_DIALOG = new ThreadLocal<>();
    private static final String EXTRA = "haiagaru.response.archive";
    private static final String SORT_PREFS = "haiagaru-response-archive";
    private static final String[] SORT_LABELS = {"保存日時：降順（新しい順）", "保存日時：昇順（古い順）",
            "投稿日時：降順（新しい順）", "投稿日時：昇順（古い順）"};
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final ExecutorService IO = Executors.newSingleThreadExecutor();
    private ResponseArchive() { }

    static int archiveIcon(boolean save) {
        Context context = Haiagaru.applicationContextForExtension();
        int id = context == null ? 0 : context.getResources().getIdentifier(
                save ? "haiagaru_response_save" : "haiagaru_response_history", "drawable", context.getPackageName());
        return id != 0 ? id : (save ? android.R.drawable.ic_menu_save : android.R.drawable.ic_menu_recent_history);
    }

    public static void appendLegacy(Object fragment, Object menu, Object response) {
        appendViewMenu(menu);
        try { append(fragment, menu, response, ResponseArchiveEntry.field(fragment, "W")); }
        catch (Exception e) { report(e); }
    }

    public static void appendDialog(Object dialog, Object menu) {
        ResponseMenuSettings.prepare(menu);
        appendViewMenu(menu);
        try {
            Object parent = dialog.getClass().getMethod("getParentFragment").invoke(dialog);
            if (isLegacyParent(parent)) {
                Object selection = ResponseArchiveEntry.field(parent, "v");
                WacchoiLongPressMenu.appendLegacyForResponse(parent, menu, ResponseArchiveEntry.field(selection, "c"));
                append(parent, menu, ResponseArchiveEntry.field(selection, "c"), ResponseArchiveEntry.field(parent, "W"));
                return;
            }
            Object selection = ResponseArchiveEntry.field(parent, "i");
            append(parent, menu, ResponseArchiveEntry.field(selection, "b"), ResponseArchiveEntry.field(parent, "E"));
        } catch (Exception e) { report(e); }
    }

    private static boolean isLegacyParent(Object parent) {
        for (Class<?> type = parent == null ? null : parent.getClass(); type != null; type = type.getSuperclass())
            if ("o.pa".equals(type.getName())) return true;
        return false;
    }

    /** 242's ordinary icon menu has a separate selected-response model from its sheet. */
    public static void appendDialog242(Object dialog, Object menu) {
        ResponseMenuSettings.prepare(menu);
        appendViewMenu(menu);
        try {
            Object parent = dialog.getClass().getMethod("getParentFragment").invoke(dialog);
            Object response = ResponseArchiveEntry.field(ResponseArchiveEntry.field(parent, "o"), "c");
            Object board = ResponseArchiveEntry.field(ResponseArchiveEntry.field(parent, "r"), "b");
            WacchoiLongPressMenu.appendDialogActions(dialog,menu);
            append(parent, menu, response, board);
            if (menu instanceof Menu) {
                Menu nativeMenu = (Menu) menu;
                MenuItem save = nativeMenu.findItem(ITEM), highlight = nativeMenu.findItem(0x7e484b01);
                if (save != null) save.setTitle("レスを保存");
                if (highlight != null) highlight.setTitle("投稿者を強調");
            }
        } catch (Exception error) { report(error); }
    }

    /** 191's ordinary response menu is separate from its link/name popups. */
    public static void captureDialog(Object dialog) { ACTIVE_DIALOG.set(dialog); }

    public static void appendCapturedDialog(Object menu) {
        Object dialog = ACTIVE_DIALOG.get();
        ACTIVE_DIALOG.remove();
        if (dialog != null) appendDialog(dialog, menu);
    }

    private static void appendViewMenu(Object object) {
        if (!(object instanceof Menu)) return;
        Menu menu = (Menu) object;
        if (ResponseMenuSettings.visible(VIEW_ARCHIVE) && menu.findItem(VIEW_ARCHIVE) == null)
            menu.add(Menu.NONE, VIEW_ARCHIVE, ResponseMenuSettings.order(VIEW_ARCHIVE, menu.size()), "保存済みレスを見る")
                    .setIcon(archiveIcon(false))
                    .setOnMenuItemClickListener(ResponseArchive::handle);
    }

    private static ResponseArchiveEntry snapshot(Object response, Object board) throws Exception {
        Activity activity = Haiagaru.toolbarActivity(null);
        return ResponseArchiveEntry.snapshot(response, board, activity == null ? null : String.valueOf(activity.getTitle()));
    }

    private static void append(Object owner, Object menuObject, Object response, Object board) throws Exception {
        PosterHighlight.append(menuObject, response, board);
        appendViewMenu(menuObject);
        if (!(menuObject instanceof Menu) || response == null || board == null) return;
        Menu menu = (Menu) menuObject;
        ResponseMenuSettings.addTools(menu,tools->{try{append(owner,tools,response,board);WacchoiLongPressMenu.appendToolsForResponse(owner,tools,response,board);}catch(Exception error){report(error);}});
        if (!ResponseMenuSettings.visible(ITEM) || menu.findItem(ITEM) != null) return;
        ResponseArchiveEntry entry = snapshot(response, board);
        menu.add(Menu.NONE, ITEM, ResponseMenuSettings.order(ITEM, menu.size()), "このレスをアーカイブに保存")
                .setIcon(archiveIcon(true))
                .setIntent(new Intent().putExtra(EXTRA, json(entry).toString()))
                .setOnMenuItemClickListener(ResponseArchive::handle);
    }

    public static boolean handle(Object object) {
        if(ResponseMenuSettings.handleTools(object))return true;
        if(WacchoiLongPressMenu.handlePrefixNg(object))return true;
        if(WacchoiLongPressMenu.handleSuffixNg(object))return true;
        if (PosterHighlight.handle(object)) return true;
        if (!(object instanceof MenuItem)) return false;
        int id = ((MenuItem) object).getItemId();
        if (id != ITEM && id != VIEW_ARCHIVE) return false;
        Activity activity = Haiagaru.toolbarActivity(null);
        if (id == VIEW_ARCHIVE) {
            showList(activity);
            return true;
        }
        try {
            MenuItem item = (MenuItem) object;
            ResponseArchiveEntry entry = decode(new JSONObject(item.getIntent().getStringExtra(EXTRA)));
            if (activity != null) confirm(activity, entry);
        } catch (Exception e) { failure(activity, e); }
        return true;
    }

    /** 242's response-body sheet passes its exact target as the third argument. */
    public static void appendSheet(Object model, Object builder, Object response) {
        try {
            appendSheetAction(builder, "保存済みレスを見る", archiveIcon(false),
                    () -> showList(Haiagaru.toolbarActivity(null)));
        } catch (Exception e) { report(e); }
        try {
            Object flow = ResponseArchiveEntry.field(model, "af");
            Method get = flow.getClass().getMethod("d"); get.setAccessible(true);
            Object board = get.invoke(flow);
            PosterHighlight.appendSheet(builder, response, board);
            ResponseArchiveEntry entry = snapshot(response, board);
            appendSheetAction(builder, "このレスをアーカイブに保存", archiveIcon(true), () -> {
                Activity a = Haiagaru.toolbarActivity(null);
                if (a != null) confirm(a, entry);
            });
        } catch (Exception e) { report(e); }
    }

    static void appendSheetAction(Object builder, String title, int icon, Runnable action) throws Exception {
            int actionId=title.equals("保存済みレスを見る")?VIEW_ARCHIVE:title.equals("このレスをアーカイブに保存")||title.equals("レスを保存")?ITEM:title.equals("投稿者を強調")?0x7e484b01:0;
            if(actionId!=0&&!ResponseMenuSettings.visible(actionId))return;
            for (Method method : builder.getClass().getDeclaredMethods()) {
                Class<?>[] p = method.getParameterTypes();
                if (Modifier.isStatic(method.getModifiers()) || p.length != 6 || p[0] != String.class
                        || p[1] != String.class || p[2] != boolean.class || p[3] != boolean.class
                        || p[4] != Integer.class || !p[5].isInterface()) continue;
                Object callback = Proxy.newProxyInstance(p[5].getClassLoader(), new Class<?>[]{p[5]}, (proxy, m, args) -> {
                    if (m.getDeclaringClass() == Object.class) {
                        if ("hashCode".equals(m.getName())) return System.identityHashCode(proxy);
                        if ("equals".equals(m.getName())) return proxy == args[0];
                        return "HaiagaruResponseArchive";
                    }
                    if ("invoke".equals(m.getName()) && m.getParameterTypes().length == 0) {
                        action.run();
                    }
                    return null;
                });
                method.setAccessible(true);
                method.invoke(builder, title, null, true, false, Integer.valueOf(icon), callback);
                return;
            }
            throw new NoSuchMethodException("Response menu builder action");
    }

    private static void confirm(Activity a, ResponseArchiveEntry entry) {
        if(!FeatureSwitches.enabled("responseArchiveEnabled",true))return;
        if (a.isFinishing()) return;
        chooseCollection(a, entry);
    }

    private static void confirmSave(Activity a, ResponseArchiveEntry entry, Collection collection) {
        if (a.isFinishing()) return;
        new HaiagaruDialog.Builder(a).setTitle("「" + collection.title + "」に保存")
                .setMessage("選んだレスの名前・日時・本文・URLを端末内に保存します。画像・動画ファイルは含みません。\n同じURLのレスは上書きします。")
                .setNegativeButton("キャンセル", null).setPositiveButton("保存", (d, w) -> IO.execute(() -> {
                    if(!FeatureSwitches.enabled("responseArchiveEnabled",true))return;
                    try {
                        saveToCollection(a, collection.id, entry);
                        MAIN.post(() -> toast(a, "「" + collection.title + "」に保存しました"));
                    }
                    catch (Exception e) { MAIN.post(() -> failure(a, e)); }
                })).show();
    }

    private static File directory(Context context) throws IOException {
        File dir = new File(context.getFilesDir(), "haiagaru-response-archive");
        if (!dir.isDirectory() && !dir.mkdirs()) throw new IOException("Cannot create response archive");
        return dir;
    }

    static File file(Context c, String url) throws Exception {
        return fileIn(directory(c), url);
    }

    private static File fileIn(File dir, String url) throws Exception {
        byte[] hash = MessageDigest.getInstance("SHA-256").digest(url.getBytes(StandardCharsets.UTF_8));
        StringBuilder key = new StringBuilder();
        for (byte b : hash) key.append(String.format(Locale.ROOT, "%02x", b & 255));
        return new File(dir, key + ".json");
    }

    static JSONObject json(ResponseArchiveEntry e) throws Exception {
        return new JSONObject().put("version", 1).put("url", e.url).put("title", e.title)
                .put("number", e.number).put("name", e.name).put("date", e.date).put("body", e.body).put("mail", e.mail)
                .put("savedAt", System.currentTimeMillis());
    }

    static ResponseArchiveEntry decode(JSONObject j) throws Exception {
        if (j.getInt("version") != 1) throw new IOException("Unknown response archive version");
        return new ResponseArchiveEntry(j.getString("url"), j.getString("title"), j.getInt("number"),
                j.getString("name"), j.getString("date"), j.getString("body"), j.optString("mail", ""));
    }

    static void save(Context context, ResponseArchiveEntry entry) throws Exception {
        writeJson(file(context, entry.url), json(entry));
    }

    private static void writeJson(File file, JSONObject value) throws Exception {
        AtomicFile atomic = new AtomicFile(file);
        FileOutputStream out = null;
        try {
            out = atomic.startWrite();
            out.write(value.toString().getBytes(StandardCharsets.UTF_8));
            atomic.finishWrite(out);
        } catch (Exception e) { if (out != null) atomic.failWrite(out); throw e; }
    }

    static ResponseArchiveEntry read(File file) throws Exception {
        return decode(readJson(file, 8000000));
    }

    private static JSONObject readJson(File file, int limit) throws Exception {
        try (InputStream in = new AtomicFile(file).openRead(); ByteArrayOutputStream out = new ByteArrayOutputStream()) {
            byte[] buffer = new byte[8192]; int count;
            while ((count = in.read(buffer)) != -1) {
                if (out.size() + count > limit) throw new IOException("Response archive too large");
                out.write(buffer, 0, count);
            }
            return new JSONObject(new String(out.toByteArray(), StandardCharsets.UTF_8));
        }
    }

    static final class Collection {
        final String id, title;
        final long created;
        Collection(String id, String title, long created) { this.id = id; this.title = title; this.created = created; }
    }

    private static File collectionRoot(Context c) throws IOException {
        File root = new File(directory(c), "threads");
        if (!root.isDirectory() && !root.mkdirs()) throw new IOException("Cannot create archive threads");
        return root;
    }

    private static File collectionDirectory(Context c, String id) throws IOException {
        if (id == null || !id.matches("[0-9a-f]{8}(?:-[0-9a-f]{4}){3}-[0-9a-f]{12}"))
            throw new IOException("Invalid archive thread ID");
        File root = collectionRoot(c).getCanonicalFile(), dir = new File(root, id).getCanonicalFile();
        if (!root.equals(dir.getParentFile())) throw new IOException("Archive thread outside root");
        return dir;
    }

    static Collection createCollection(Context c, String title) throws Exception {
        title = collectionTitle(title);
        Collection collection = new Collection(UUID.randomUUID().toString(), title, System.currentTimeMillis());
        File dir = collectionDirectory(c, collection.id);
        if (!dir.mkdir()) throw new IOException("Cannot create archive thread");
        writeCollection(dir, collection);
        return collection;
    }

    private static String collectionTitle(String title) {
        if (title == null || title.trim().isEmpty() || title.trim().length() > 200)
            throw new IllegalArgumentException("保存用スレの名前を1～200文字で入力してください");
        return title.trim();
    }

    private static void writeCollection(File dir, Collection collection) throws Exception {
        writeJson(new File(dir, "collection.json"), new JSONObject().put("version", 1)
                .put("title", collection.title).put("created", collection.created));
    }

    static Collection readCollection(Context c, String id) throws Exception {
        JSONObject value = readJson(new File(collectionDirectory(c, id), "collection.json"), 16384);
        if (value.getInt("version") != 1) throw new IOException("Unknown archive thread version");
        return new Collection(id, collectionTitle(value.getString("title")), value.getLong("created"));
    }

    static List<Collection> collections(Context c) throws Exception {
        ArrayList<Collection> result = new ArrayList<>();
        File[] dirs = collectionRoot(c).listFiles();
        if (dirs == null) throw new IOException("Cannot list archive threads");
        for (File dir : dirs) if (dir.isDirectory()) {
            try { result.add(readCollection(c, dir.getName())); }
            catch (Exception e) { report(e); }
        }
        Collections.sort(result, (x, y) -> Long.compare(y.created, x.created));
        return result;
    }

    static void saveToCollection(Context c, String id, ResponseArchiveEntry entry) throws Exception {
        readCollection(c, id); // Do not silently recreate a missing/restored-invalid destination.
        writeJson(fileIn(collectionDirectory(c, id), entry.url), json(entry));
    }

    private static File[] archiveFiles(File dir) throws IOException {
        File[] files = dir.listFiles((ignored, name) -> name.matches("[0-9a-f]{64}\\.json(?:\\.bak)?"));
        if (files == null) throw new IOException("Cannot list response archive");
        LinkedHashSet<File> unique = new LinkedHashSet<>();
        for (File f : files) unique.add(f.getName().endsWith(".bak")
                ? new File(f.getParentFile(), f.getName().substring(0, f.getName().length() - 4)) : f);
        File[] result = unique.toArray(new File[0]);
        Arrays.sort(result, (x, y) -> Long.compare(y.lastModified(), x.lastModified()));
        return result;
    }

    private static int sortMode(Context context) {
        int mode = context.getSharedPreferences(SORT_PREFS, 0).getInt("sort", 0);
        return mode >= 0 && mode < SORT_LABELS.length ? mode : 0;
    }

    static File[] sortedArchiveFiles(Context context, File directory) throws IOException {
        File[] files = archiveFiles(directory);
        int mode = sortMode(context);
        Map<File, long[]> keys = new HashMap<>();
        for (File file : files) {
            File backup = new File(file.getPath() + ".bak");
            long saved = backup.exists() ? backup.lastModified() : file.lastModified();
            long posted = ResponseArchiveOrder.UNKNOWN;
            // Stream just the date metadata. Do not retain every archived response body in memory.
            try (android.util.JsonReader reader = new android.util.JsonReader(new InputStreamReader(
                    new AtomicFile(file).openRead(), StandardCharsets.UTF_8))) {
                reader.beginObject();
                while (reader.hasNext()) {
                    String key = reader.nextName();
                    if ("savedAt".equals(key)) {
                        long value = reader.nextLong(); if (value > 0) saved = value;
                    } else if ("date".equals(key) && mode >= 2) posted = ResponseArchiveOrder.postedAt(plain(reader.nextString()));
                    else reader.skipValue();
                }
                reader.endObject();
            } catch (Exception error) { report(error); }
            keys.put(file, new long[]{saved, posted});
        }
        Arrays.sort(files, (a, b) -> {
            long[] x = keys.get(a), y = keys.get(b);
            return ResponseArchiveOrder.compare(x[0], x[1], a.getName(), y[0], y[1], b.getName(), mode);
        });
        return files;
    }

    private static void showSort(Activity a, Collection collection, int offset) {
        HaiagaruDialog.Builder chooser = new HaiagaruDialog.Builder(a).setTitle("レスの並び順")
                .setSingleChoiceItems(SORT_LABELS, sortMode(a), (dialog, which) -> {
                    a.getSharedPreferences(SORT_PREFS, 0).edit().putInt("sort", which).apply();
                    dialog.dismiss();
                    returnToList(a, collection, 0);
                }).setNegativeButton("戻る", (d, w) -> returnToList(a, collection, offset));
        if (collection != null) chooser.setNeutralButton("名前を変更", (d, w) -> editCollection(a, collection, null));
        chooser.show();
    }

    private static boolean deleteTree(File file) {
        if (file == null || !file.exists()) return true;
        File[] children = file.listFiles();
        if (children != null) for (File child : children) if (!deleteTree(child)) return false;
        return file.delete();
    }

    private static void manageCollections(Activity a, int offset) {
        if (a == null || a.isFinishing()) return;
        IO.execute(() -> {
            try {
                List<Collection> all = collections(a);
                int end = Math.min(all.size(), offset + 100);
                List<Collection> page = new ArrayList<>(all.subList(offset, end));
                ArrayList<String> labels = new ArrayList<>();
                for (Collection item : page) labels.add(item.title);
                boolean hasNext = end < all.size(), hasPrevious = offset > 0;
                MAIN.post(() -> {
                    if (a.isFinishing() || a.isDestroyed()) return;
                    boolean[] selected = new boolean[page.size()];
                    LinearLayout content = new LinearLayout(a); content.setOrientation(LinearLayout.VERTICAL);
                    ScrollView choices = new ScrollView(a); LinearLayout choiceList = new LinearLayout(a); choiceList.setOrientation(LinearLayout.VERTICAL);
                    choices.addView(choiceList);
                    int pad = (int) (12 * a.getResources().getDisplayMetrics().density);
                    for (int i = 0; i < page.size(); i++) {
                        final int index = i;
                        android.widget.CheckBox box = new android.widget.CheckBox(a); box.setText(labels.get(i));
                        box.setPadding(pad, pad / 2, pad, pad / 2); box.setOnCheckedChangeListener((button, checked) -> selected[index] = checked);
                        choiceList.addView(box);
                    }
                    content.addView(choices, new LinearLayout.LayoutParams(-1, 0, 1));
                    LinearLayout actions = new LinearLayout(a); actions.setOrientation(LinearLayout.HORIZONTAL);
                    Button allDelete = new Button(a); allDelete.setText("全て削除");
                    Button rename = new Button(a); rename.setText("名前を変更");
                    actions.addView(allDelete, new LinearLayout.LayoutParams(0, -2, 1));
                    actions.addView(rename, new LinearLayout.LayoutParams(0, -2, 1));
                    if (hasPrevious) { Button previous = new Button(a); previous.setText("前の100件"); previous.setOnClickListener(v -> manageCollections(a, Math.max(0, offset - 100))); actions.addView(previous, new LinearLayout.LayoutParams(0, -2, 1)); }
                    if (hasNext) { Button next = new Button(a); next.setText("次の100件"); next.setOnClickListener(v -> manageCollections(a, end)); actions.addView(next, new LinearLayout.LayoutParams(0, -2, 1)); }
                    content.addView(actions);
                    HaiagaruDialog dialog = new HaiagaruDialog.Builder(a).setTitle("保存用スレを管理（" + all.size() + "件）")
                            .setView(content).setNegativeButton("閉じる", null).setPositiveButton("選択を削除", null).create();
                    dialog.setOnShowListener(ignored -> {
                        dialog.getButton(-1).setOnClickListener(v -> {
                            ArrayList<Collection> targets = new ArrayList<>();
                            for (int i = 0; i < selected.length; i++) if (selected[i]) targets.add(page.get(i));
                            if (targets.isEmpty()) { toast(a, "削除する保存用スレを選択してください"); return; }
                            confirmDeleteCollections(a, targets, false, () -> { dialog.dismiss(); manageCollections(a, offset); });
                        });
                        rename.setOnClickListener(v -> {
                            int chosen = -1;
                            for (int i = 0; i < selected.length; i++) if (selected[i]) {
                                if (chosen >= 0) { toast(a, "名前を変更する保存用スレを1つだけ選択してください"); return; }
                                chosen = i;
                            }
                            if (chosen < 0) { toast(a, "名前を変更する保存用スレを選択してください"); return; }
                            dialog.dismiss();
                            editCollection(a, page.get(chosen), null);
                        });
                        allDelete.setOnClickListener(v -> confirmDeleteCollections(a, all, true, () -> { dialog.dismiss(); manageCollections(a, 0); }));
                    });
                    dialog.show();
                });
            } catch (Exception e) { MAIN.post(() -> failure(a, e)); }
        });
    }

    private static void confirmDeleteCollections(Activity a, List<Collection> targets, boolean all, Runnable done) {
        if (targets.isEmpty()) { toast(a, "削除する保存用スレはありません"); return; }
        String message = all
                ? "保存用スレ " + targets.size() + "件と、各スレ内の保存レスを全て削除します。この操作は取り消せません。"
                : "選択した保存用スレ " + targets.size() + "件と、その中の保存レスを削除します。この操作は取り消せません。";
        new HaiagaruDialog.Builder(a).setTitle("保存用スレを削除")
                .setMessage(message).setNegativeButton("キャンセル", null)
                .setPositiveButton("削除", (d, w) -> IO.execute(() -> {
                    try {
                        for (Collection target : targets) {
                            File dir = collectionDirectory(a, target.id);
                            if (!deleteTree(dir)) throw new IOException("Cannot delete archive thread " + target.id);
                        }
                        MAIN.post(() -> { toast(a, "保存用スレを削除しました"); done.run(); });
                    } catch (Exception e) { MAIN.post(() -> failure(a, e)); }
                })).show();
    }

    private static void manageResponses(Activity a, Collection collection, int offset) {
        if (a == null || a.isFinishing()) return;
        IO.execute(() -> {
            try {
                File[] files = sortedArchiveFiles(a, collection == null ? directory(a) : collectionDirectory(a, collection.id));
                int end = Math.min(files.length, offset + 100);
                ArrayList<ResponseArchiveEntry> rows = new ArrayList<>();
                for (int i = offset; i < end; i++) try {
                    ResponseArchiveEntry e = read(files[i]);
                    rows.add(new ResponseArchiveEntry(e.url, e.title, e.number, e.name, e.date, "", e.mail));
                } catch (Exception error) { report(error); }
                ArrayList<String> labels = new ArrayList<>();
                for (ResponseArchiveEntry e : rows) labels.add(e.title + "\nレス " + e.number + "  " + plain(e.name) + "\n" + plain(e.date));
                boolean hasNext = end < files.length, hasPrevious = offset > 0;
                MAIN.post(() -> {
                    if (a.isFinishing() || a.isDestroyed()) return;
                    boolean[] selected = new boolean[rows.size()];
                    LinearLayout content = new LinearLayout(a); content.setOrientation(LinearLayout.VERTICAL);
                    ScrollView choices = new ScrollView(a); LinearLayout choiceList = new LinearLayout(a); choiceList.setOrientation(LinearLayout.VERTICAL);
                    choices.addView(choiceList);
                    int pad = (int) (12 * a.getResources().getDisplayMetrics().density);
                    for (int i = 0; i < rows.size(); i++) {
                        final int index = i;
                        android.widget.CheckBox box = new android.widget.CheckBox(a); box.setText(labels.get(i));
                        box.setPadding(pad, pad / 2, pad, pad / 2); box.setOnCheckedChangeListener((button, checked) -> selected[index] = checked);
                        choiceList.addView(box);
                    }
                    content.addView(choices, new LinearLayout.LayoutParams(-1, 0, 1));
                    LinearLayout actions = new LinearLayout(a); actions.setOrientation(LinearLayout.HORIZONTAL);
                    Button allDelete = new Button(a); allDelete.setText("全て削除");
                    Button sort = new Button(a); sort.setText("並び順"); sort.setOnClickListener(v -> showSort(a, collection, offset));
                    actions.addView(allDelete, new LinearLayout.LayoutParams(0, -2, 1));
                    actions.addView(sort, new LinearLayout.LayoutParams(0, -2, 1));
                    if (hasPrevious) { Button previous = new Button(a); previous.setText("前の100件"); previous.setOnClickListener(v -> manageResponses(a, collection, Math.max(0, offset - 100))); actions.addView(previous, new LinearLayout.LayoutParams(0, -2, 1)); }
                    if (hasNext) { Button next = new Button(a); next.setText("次の100件"); next.setOnClickListener(v -> manageResponses(a, collection, end)); actions.addView(next, new LinearLayout.LayoutParams(0, -2, 1)); }
                    content.addView(actions);
                    HaiagaruDialog dialog = new HaiagaruDialog.Builder(a).setTitle("保存したレスを管理（" + files.length + "件）")
                            .setView(content).setNegativeButton("閉じる", null).setPositiveButton("選択を削除", null).create();
                    dialog.setOnShowListener(ignored -> dialog.getButton(-1).setOnClickListener(v -> {
                        ArrayList<File> targets = new ArrayList<>();
                        for (int i = 0; i < selected.length; i++) if (selected[i]) {
                            try { targets.add(fileIn(collection == null ? directory(a) : collectionDirectory(a, collection.id), rows.get(i).url)); }
                            catch (Exception error) { failure(a, error); return; }
                        }
                        if (targets.isEmpty()) { toast(a, "削除するレスを選択してください"); return; }
                        confirmDeleteResponses(a, targets, false, () -> { dialog.dismiss(); manageResponses(a, collection, offset); });
                    }));
                    dialog.show();
                    allDelete.setOnClickListener(v -> confirmDeleteResponses(a, Arrays.asList(files), true, () -> {
                        dialog.dismiss(); manageResponses(a, collection, 0);
                    }));
                });
            } catch (Exception e) { MAIN.post(() -> failure(a, e)); }
        });
    }

    private static void confirmDeleteResponses(Activity a, List<File> targets, boolean all, Runnable done) {
        if (targets.isEmpty()) { toast(a, "削除する保存レスはありません"); return; }
        new HaiagaruDialog.Builder(a).setTitle("保存したレスを削除")
                .setMessage((all ? "この一覧の保存レスを全て削除します。" : "選択した保存レス " + targets.size() + "件を削除します。")
                        + " 元のスレやスレ単位のアーカイブは削除されません。この操作は取り消せません。")
                .setNegativeButton("キャンセル", null).setPositiveButton("削除", (d, w) -> IO.execute(() -> {
                    try {
                        for (File target : targets) if (target.exists()) {
                            new AtomicFile(target).delete();
                            if (target.exists()) throw new IOException("Cannot delete response archive " + target.getName());
                        }
                        MAIN.post(() -> { toast(a, "保存レスを削除しました"); done.run(); });
                    } catch (Exception e) { MAIN.post(() -> failure(a, e)); }
                })).show();
    }

    public static void showList(Activity a) { chooseCollection(a, null); }

    private static void chooseCollection(Activity a, ResponseArchiveEntry entry) { chooseCollection(a, entry, 0); }
    private static void chooseCollection(Activity a, ResponseArchiveEntry entry, int offset) {
        if (a == null || a.isFinishing()) return;
        IO.execute(() -> {
            try {
                List<Collection> stored = collections(a);
                int end = Math.min(stored.size(), offset + 100);
                List<Collection> page = new ArrayList<>(stored.subList(offset, end));
                ArrayList<String> labels = new ArrayList<>();
                for (Collection collection : page) labels.add(collection.title);
                int create = labels.size(); labels.add("＋ 新しい保存用スレを作成");
                int manage = labels.size(); if (entry == null) labels.add("保存用スレを管理（編集・削除）");
                int legacy = labels.size(); if (entry == null) labels.add("従来の保存レスを見る");
                int manageLegacy = labels.size(); if (entry == null) labels.add("従来の保存レスを管理・削除");
                int managePage = labels.size(); if (entry == null) labels.add("保存用スレのレスを管理・削除");
                int feature = labels.size(); if (entry == null) labels.add("レス保存機能：" +
                        (FeatureSwitches.enabled("responseArchiveEnabled", true) ? "オン（タップでオフ）" : "オフ（タップでオン）"));
                int next = labels.size(); if (end < stored.size()) labels.add("次の100件");
                MAIN.post(() -> {
                    if (a.isFinishing() || a.isDestroyed()) return;
                    new HaiagaruDialog.Builder(a).setTitle(entry == null ? "保存用スレ" : "保存先のスレを選択")
                            .setItems(labels.toArray(new String[0]), (d, which) -> {
                                if (which < page.size()) {
                                    if (entry == null) showCollection(a, page.get(which), 0);
                                    else confirmSave(a, entry, page.get(which));
                                } else if (which == create) editCollection(a, null, entry);
                                else if (entry == null && which == manage) manageCollections(a, 0);
                                else if (entry == null && which == legacy) showLegacyList(a, 0);
                                else if (entry == null && which == manageLegacy) manageResponses(a, null, 0);
                                else if (entry == null && which == managePage) {
                                    if (page.isEmpty()) toast(a, "管理する保存用スレがありません");
                                    else chooseManageCollection(a, page, 0);
                                }
                                else if (entry == null && which == feature) {
                                    a.getSharedPreferences(WacchoiSearchOptions.PREFS, 0).edit().putBoolean("responseArchiveEnabled",
                                            !FeatureSwitches.enabled("responseArchiveEnabled", true)).apply();
                                    chooseCollection(a, null, offset);
                                }
                                else if (which == next) chooseCollection(a, entry, end);
                            }).setNegativeButton("閉じる", null).show();
                });
            } catch (Exception e) { MAIN.post(() -> failure(a, e)); }
        });
    }

    private static void chooseManageCollection(Activity a, List<Collection> page, int offset) {
        ArrayList<String> labels = new ArrayList<>();
        for (Collection item : page) labels.add(item.title);
        new HaiagaruDialog.Builder(a).setTitle("レスを管理する保存用スレ")
                .setItems(labels.toArray(new String[0]), (d, which) -> manageResponses(a, page.get(which), 0))
                .setNegativeButton("戻る", (d, w) -> chooseCollection(a, null, offset)).show();
    }

    private static void editCollection(Activity a, Collection existing, ResponseArchiveEntry entry) {
        EditText input = new EditText(a); input.setSingleLine(true);
        input.setFilters(new InputFilter[]{new InputFilter.LengthFilter(200)});
        input.setHint("保存用スレの名前");
        String initial = existing != null ? existing.title : entry == null ? "" : entry.title;
        input.setText(initial.substring(0, Math.min(initial.length(), 200)));
        HaiagaruDialog dialog = new HaiagaruDialog.Builder(a).setTitle(existing == null ? "保存用スレを作成" : "名前を変更")
                .setView(input).setNegativeButton("キャンセル", null).setPositiveButton("保存", null).create();
        dialog.setOnShowListener(ignored -> dialog.getButton(-1).setOnClickListener(v -> {
            final String title;
            try { title = collectionTitle(input.getText().toString()); }
            catch (IllegalArgumentException e) { input.setError(e.getMessage()); return; }
            dialog.getButton(-1).setEnabled(false);
            IO.execute(() -> {
                try {
                    Collection saved;
                    if (existing == null) saved = createCollection(a, title);
                    else {
                        Collection current = readCollection(a, existing.id);
                        saved = new Collection(current.id, title, current.created);
                        writeCollection(collectionDirectory(a, saved.id), saved);
                    }
                    MAIN.post(() -> {
                        dialog.dismiss();
                        if (a.isFinishing() || a.isDestroyed()) return;
                        if (entry == null) showCollection(a, saved, 0); else confirmSave(a, entry, saved);
                    });
                } catch (Exception e) { MAIN.post(() -> { dialog.getButton(-1).setEnabled(true); failure(a, e); }); }
            });
        }));
        dialog.show();
    }

    private static void showCollection(Activity a, Collection collection, int offset) {
        if (a == null || a.isFinishing()) return;
        IO.execute(() -> {
            try {
                Collection current = readCollection(a, collection.id);
                File[] files = sortedArchiveFiles(a, collectionDirectory(a, current.id));
                int end = Math.min(files.length, offset + 10);
                ArrayList<ResponseArchiveEntry> rows = new ArrayList<>();
                for (int i = offset; i < end; i++) {
                    try { rows.add(read(files[i])); } catch (Exception e) { report(e); }
                }
                ArrayList<String> previews = new ArrayList<>();
                for (ResponseArchiveEntry row : rows) {
                    String body = plain(row.body);
                    previews.add(row.number + " " + plain(row.name) + "\n" + plain(row.date) + "\n"
                            + row.title + "\n\n" + body.substring(0, Math.min(body.length(), 20000))
                            + (body.length() > 20000 ? "\n［タップで全文］" : "") + "\n\n" + row.url);
                }
                MAIN.post(() -> {
                    if (a.isFinishing() || a.isDestroyed()) return;
                    ScrollView scroll = new ScrollView(a);
                    LinearLayout posts = new LinearLayout(a); posts.setOrientation(LinearLayout.VERTICAL);
                    scroll.addView(posts);
                    int pad = (int) (12 * a.getResources().getDisplayMetrics().density);
                    for (ResponseArchiveEntry row : rows) {
                        TextView text = new TextView(a); text.setPadding(pad, pad, pad, pad);
                        text.setText(previews.get(rows.indexOf(row)));
                        posts.addView(text);
                        View line = new View(a); line.setBackgroundColor(0x55777777);
                        posts.addView(line, new LinearLayout.LayoutParams(-1, Math.max(1, pad / 12)));
                        text.setOnClickListener(v -> detail(a, row, current, offset));
                    }
                    if (rows.isEmpty()) {
                        TextView empty = new TextView(a); empty.setPadding(pad, pad, pad, pad);
                        empty.setText("保存したレスはありません。レス長押しからこのスレを選んで保存してください。");
                        posts.addView(empty);
                    }
                    HaiagaruDialog viewer = new HaiagaruDialog.Builder(a).setTitle(current.title + "（" + files.length + "レス）")
                            .setView(scroll).setNegativeButton("スレ一覧", (d, w) -> showList(a))
                            .setNeutralButton("管理・並び順", (d, w) -> showCollectionManagement(a, current, offset))
                            .setPositiveButton(end < files.length ? "次の10件" : offset > 0 ? "先頭へ" : "閉じる",
                                    (d, w) -> { if (end < files.length || offset > 0) showCollection(a, current, end < files.length ? end : 0); })
                            .create();
                    viewer.setOnShowListener(ignored -> {
                        // A post opens its detail viewer without leaving stacked collection dialogs.
                        for (int i = 0; i < posts.getChildCount(); i++) {
                            View child = posts.getChildAt(i);
                            if (child instanceof TextView && child.hasOnClickListeners()) {
                                final int index = i / 2;
                                child.setOnClickListener(v -> { viewer.dismiss(); detail(a, rows.get(index), current, offset); });
                            }
                        }
                    });
                    viewer.show();
                });
            } catch (Exception e) { MAIN.post(() -> failure(a, e)); }
        });
    }

    private static void showCollectionManagement(Activity a, Collection collection, int offset) {
        new HaiagaruDialog.Builder(a).setTitle(collection.title).setItems(new String[]{"この保存用スレのレスを管理・削除", "保存用スレの名前を変更", "並び順を変更", "保存用スレを削除"}, (d, which) -> {
            if (which == 0) manageResponses(a, collection, 0);
            else if (which == 1) editCollection(a, collection, null);
            else if (which == 2) showSort(a, collection, offset);
            else confirmDeleteCollections(a, Collections.singletonList(collection), false, () -> showList(a));
        }).setNegativeButton("戻る", (d, w) -> showCollection(a, collection, offset)).show();
    }

    private static void showLegacyList(Activity a, int offset) {
        if (a == null || a.isFinishing()) return;
        IO.execute(() -> {
            try {
                File[] files = sortedArchiveFiles(a, directory(a));
                ArrayList<ResponseArchiveEntry> rows = new ArrayList<>();
                int end = Math.min(files.length, offset + 100), skipped = 0;
                for (int i = offset; i < end; i++) {
                    try {
                        ResponseArchiveEntry e = read(files[i]);
                        // Keep only lightweight labels while the list is open.
                        rows.add(new ResponseArchiveEntry(e.url, e.title, e.number, e.name, e.date, ""));
                    } catch (Exception e) { skipped++; report(e); }
                }
                final int bad = skipped;
                ArrayList<String> labels = new ArrayList<>();
                for (ResponseArchiveEntry e : rows) labels.add(e.title + "\nレス " + e.number + "  " + plain(e.name) + "\n" + plain(e.date));
                boolean more = end < files.length;
                if (more) labels.add("次の100件を表示");
                if (offset > 0) labels.add("先頭に戻る");
                MAIN.post(() -> {
                    if (a.isFinishing() || a.isDestroyed()) return;
                    new HaiagaruDialog.Builder(a).setTitle("レスのアーカイブ（" + files.length + "件）")
                            .setItems(labels.toArray(new String[0]), (d, which) -> {
                                if (which < rows.size()) loadDetail(a, rows.get(which));
                                else showLegacyList(a, more && which == rows.size() ? end : 0);
                            }).setMessage(labels.isEmpty() ? "保存したレスはありません。レス本文を長押しして保存できます。" : null)
                            .setNeutralButton("管理・並び順", (d, w) -> showLegacyManagement(a, offset))
                            .setNegativeButton("閉じる", null).show();
                    if (bad > 0) toast(a, "読み込めない保存レスを" + bad + "件スキップしました");
                });
            } catch (Exception e) { MAIN.post(() -> failure(a, e)); }
        });
    }

    private static void showLegacyManagement(Activity a, int offset) {
        new HaiagaruDialog.Builder(a).setTitle("保存レスの管理")
                .setItems(new String[]{"保存レスを選択して削除", "全て削除", "並び順を変更"}, (d, which) -> {
                    if (which == 0 || which == 1) manageResponses(a, null, 0);
                    else showSort(a, null, offset);
                }).setNegativeButton("戻る", (d, w) -> showLegacyList(a, offset)).show();
    }

    @SuppressWarnings("deprecation")
    private static String plain(String html) { return Html.fromHtml(html).toString(); }

    static String copyText(ResponseArchiveEntry entry) {
        String mail = plain(entry.mail).trim();
        return entry.number + " " + plain(entry.name).trim() + (mail.isEmpty() ? "" : " " + mail) + " " + plain(entry.date).trim()
                + "\n\n" + plain(entry.body).trim();
    }

    private static void loadDetail(Activity a, ResponseArchiveEntry row) {
        IO.execute(() -> {
            try {
                ResponseArchiveEntry entry = read(file(a, row.url));
                MAIN.post(() -> { if (!a.isFinishing() && !a.isDestroyed()) detail(a, entry, null, 0); });
            } catch (Exception e) { MAIN.post(() -> failure(a, e)); }
        });
    }

    private static void detail(Activity a, ResponseArchiveEntry e, Collection collection, int offset) {
        ScrollView scroll = new ScrollView(a);
        TextView text = new TextView(a);
        int pad = (int) (16 * a.getResources().getDisplayMetrics().density);
        text.setPadding(pad, pad, pad, pad); text.setTextIsSelectable(true);
        // No WebView, image getter or automatic URL fetch: offline viewing only.
        text.setText(e.number + " " + plain(e.name) + "\n" + plain(e.date) + "\n\n" + plain(e.body) + "\n\n" + e.url);
        LinearLayout contents = new LinearLayout(a); contents.setOrientation(LinearLayout.VERTICAL);
        Button copy = new Button(a); copy.setText("ヘッダー＋本文をコピー");
        copy.setOnClickListener(v -> {
            ClipboardManager clipboard = (ClipboardManager) a.getSystemService(Context.CLIPBOARD_SERVICE);
            if (clipboard != null) {
                ClipboardHistory.setPrimaryClip(clipboard, ClipData.newPlainText("保存レス", copyText(e)));
                toast(a, "ヘッダーと本文をコピーしました");
            }
        });
        contents.addView(copy, new LinearLayout.LayoutParams(-1, -2));
        contents.addView(text);
        scroll.addView(contents);
        new HaiagaruDialog.Builder(a).setTitle(e.title).setView(scroll)
                .setNegativeButton("一覧へ", (d, w) -> returnToList(a, collection, offset))
                .setPositiveButton("URLをコピー", (d, w) -> {
                    ClipboardManager c = (ClipboardManager) a.getSystemService(Context.CLIPBOARD_SERVICE);
                    if (c != null) c.setPrimaryClip(ClipData.newPlainText("レスURL", e.url));
                    returnToList(a, collection, offset);
                }).setNeutralButton("削除", (d, w) -> new HaiagaruDialog.Builder(a)
                        .setMessage("この保存レスだけを削除しますか？ 元のスレやスレ単位のアーカイブは削除しません。")
                        .setNegativeButton("キャンセル", (x, y) -> detail(a, e, collection, offset))
                        .setPositiveButton("削除", (x, y) -> IO.execute(() -> {
                            try {
                                File saved = collection == null ? file(a, e.url) : fileIn(collectionDirectory(a, collection.id), e.url);
                                new AtomicFile(saved).delete();
                                MAIN.post(() -> returnToList(a, collection, 0));
                            }
                            catch (Exception error) { MAIN.post(() -> failure(a, error)); }
                        })).show()).show();
    }

    private static void returnToList(Activity a, Collection collection, int offset) {
        if (collection == null) showLegacyList(a, offset); else showCollection(a, collection, offset);
    }

    /** A separate entry above the native archive list, without replacing its thread content. */
    public static void onActivityResumed(Activity a) {
        if (!a.getClass().getName().equals("jp.syoboi.a2chMate.activity.ArchiveListActivity")) return;
        a.getWindow().getDecorView().post(() -> {
            ViewGroup content = a.findViewById(android.R.id.content);
            if (content == null || content.findViewById(SWITCHER) != null || content.getChildCount() != 1) return;
            View nativeList = content.getChildAt(0);
            ViewGroup.LayoutParams original = nativeList.getLayoutParams();
            LinearLayout container = new LinearLayout(a); container.setOrientation(LinearLayout.VERTICAL);
            Button button = new Button(a); button.setId(SWITCHER); button.setText("レスのアーカイブを開く");
            button.setOnClickListener(v -> showList(a));
            content.removeView(nativeList);
            container.addView(button, new LinearLayout.LayoutParams(-1, -2));
            ArchiveOrigins.addSettings(container, a);
            container.addView(nativeList, new LinearLayout.LayoutParams(-1, 0, 1));
            content.addView(container, original);
            // Only inset the injected controls. The native list keeps its own inset handling.
            container.setOnApplyWindowInsetsListener((view, insets) -> {
                updateArchiveButtonInsets(container, button, insets);
                return insets;
            });
            container.addOnLayoutChangeListener((v, l, t, r, b, ol, ot, or, ob) -> {
                if (android.os.Build.VERSION.SDK_INT >= 23)
                    updateArchiveButtonInsets(container, button, container.getRootWindowInsets());
            });
            container.requestApplyInsets();
        });
    }

    @SuppressWarnings("deprecation")
    private static void updateArchiveButtonInsets(View container, Button button, android.view.WindowInsets insets) {
        if (insets == null) return;
        int top = insets.getSystemWindowInsetTop();
        if (android.os.Build.VERSION.SDK_INT >= 28 && insets.getDisplayCutout() != null)
            top = Math.max(top, insets.getDisplayCutout().getSafeInsetTop());
        int[] position = new int[2]; container.getLocationInWindow(position);
        int margin = Math.max(0, top - position[1]);
        LinearLayout.LayoutParams params = (LinearLayout.LayoutParams) button.getLayoutParams();
        if (params.topMargin != margin) {
            params.topMargin = margin;
            button.setLayoutParams(params);
        }
    }

    private static void toast(Activity a, String text) { if (a != null && !a.isDestroyed()) Toast.makeText(a, text, Toast.LENGTH_LONG).show(); }
    private static void failure(Activity a, Exception e) { report(e); toast(a, "レスのアーカイブを処理できませんでした"); }
    private static void report(Exception e) { android.util.Log.w("Haiagaru", "Response archive operation failed", e); }
}
