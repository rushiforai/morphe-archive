package app.morphe.extension.chmate;

import android.app.*;
import android.content.*;
import android.util.AtomicFile;
import android.view.ViewGroup;
import android.widget.*;
import org.json.JSONObject;
import java.io.*;
import java.lang.reflect.*;
import java.nio.charset.StandardCharsets;
import java.util.*;
import java.util.concurrent.*;

/** Separate URL metadata; native DAT/IDX files and local routing stay unchanged. */
public final class ArchiveOrigins {
    private static final ExecutorService WORK = Executors.newSingleThreadExecutor();
    private static final Map<String,String> LIVE = Collections.synchronizedMap(new LinkedHashMap<String,String>(128,.75f,true) {
        protected boolean removeEldestEntry(Map.Entry<String,String> e) { return size() > 4096; }
    });
    private ArchiveOrigins() { }
    public static String nativeUrlMethod() { return ""; } // Bound by verified BBSUrlInfo method structure.
    public static void onModel(Object model) {
        try { model.getClass().getMethod(nativeUrlMethod()).invoke(model); } catch (Exception ignored) { }
    }
    public static String observe(Object model, String url) {
        try {
            String key = ArchiveOriginPaths.threadKey(url); if (key == null) return url;
            for (Method method : model.getClass().getDeclaredMethods()) {
                String type = method.getReturnType().getName();
                if (!(type.endsWith(".BoardID") || type.endsWith("$BoardID"))) continue;
                Object board;
                method.setAccessible(true);
                if (method.getParameterTypes().length == 0 && !Modifier.isStatic(method.getModifiers())) board = method.invoke(model);
                else if (Modifier.isStatic(method.getModifiers()) && Arrays.equals(method.getParameterTypes(), new Class<?>[]{model.getClass()})) board = method.invoke(null, model);
                else continue;
                if (board != null) { LIVE.put(board.toString() + "_" + key + ".dat", url); break; }
            }
        } catch (Exception ignored) { }
        return url;
    }
    static File directory(Context c) { return new File(c.getFilesDir(), "haiagaru-archive-origins"); }
    static File archiveRoot(Context c) throws IOException { return new File(HaiagaruSyncSnapshot.externalRoot(c), "archive"); }
    public static void copied(File source, File destination) {
        try {
            Context c = Haiagaru.applicationContextForExtension();
            if (c == null || source == null || destination == null || !source.getName().endsWith(".dat") || !destination.isFile()) return;
            String relative = ArchiveOriginPaths.relative(archiveRoot(c), destination);
            String url = LIVE.get(source.getName());
            if (url != null) WORK.execute(() -> { try { write(c, relative, url, "captured"); } catch(Exception e) { report(e); } });
        } catch (Exception ignored) { }
    }
    static void flush() throws IOException {
        try { WORK.submit(() -> {}).get(30, TimeUnit.SECONDS); }
        catch (Exception e) { if (e instanceof InterruptedException) Thread.currentThread().interrupt(); throw new IOException("アーカイブ元URL情報の保存完了を待てませんでした", e); }
    }
    static void write(Context c, String relative, String url, String kind) throws Exception {
        if (ArchiveOriginPaths.threadKey(url) == null) throw new IOException("スレのHTTP(S) URLを入力してください");
        // Validate against the current installation root; stored paths are relative and portable.
        ArchiveOriginPaths.relative(archiveRoot(c), new File(archiveRoot(c), relative));
        File dir = directory(c); if (!dir.isDirectory() && !dir.mkdirs()) throw new IOException("元URL情報を保存できません");
        AtomicFile file = new AtomicFile(new File(dir, ArchiveOriginPaths.hash(relative)));
        byte[] bytes = new JSONObject().put("version",1).put("path",relative).put("url",url).put("kind",kind).toString().getBytes(StandardCharsets.UTF_8);
        FileOutputStream stream = null;
        try { stream = file.startWrite(); stream.write(bytes); file.finishWrite(stream); }
        catch (Exception e) { if (stream != null) file.failWrite(stream); throw e; }
    }
    static JSONObject read(Context c, String relative) throws Exception {
        AtomicFile file = new AtomicFile(new File(directory(c), ArchiveOriginPaths.hash(relative)));
        if (file.getBaseFile().isFile() || new File(file.getBaseFile().getPath()+".bak").isFile()) {
            try (InputStream input = file.openRead(); ByteArrayOutputStream bytes = new ByteArrayOutputStream()) {
                byte[] buffer = new byte[4096]; int n;
                while ((n=input.read(buffer)) != -1) { if (bytes.size()+n>32768) throw new IOException("元URL情報が大きすぎます"); bytes.write(buffer,0,n); }
                JSONObject value = new JSONObject(new String(bytes.toByteArray(),StandardCharsets.UTF_8));
                if (value.getInt("version") != 1 || !relative.equals(value.getString("path")) || ArchiveOriginPaths.threadKey(value.getString("url")) == null)
                    throw new IOException("元URL情報が不正です");
                return value;
            }
        }
        String rebuilt = ArchiveOriginPaths.reconstruct(relative);
        return rebuilt == null ? null : new JSONObject().put("url",rebuilt).put("kind","reconstructed");
    }
    private interface Job { void run() throws Exception; }
    private static void work(Activity a, Job job) {
        WORK.execute(() -> { try { job.run(); } catch (Exception e) { report(e); ui(a, () -> Toast.makeText(a,"アーカイブの元URLを処理できませんでした",Toast.LENGTH_LONG).show()); } });
    }
    private static void ui(Activity a, Runnable r) { a.runOnUiThread(() -> { if (!a.isFinishing() && !a.isDestroyed()) r.run(); }); }
    public static void addSettings(LinearLayout root, Activity a) {
        ThreadArchiveOrder.addSettings(root,a);
        NativeArchiveFolderImport.addButton(root,a);
        Button button = new Button(a); button.setText("アーカイブの元スレURLを確認"); button.setOnClickListener(v -> show(a)); root.addView(button);
    }
    public static void show(Activity a) { work(a, () -> browse(a, archiveRoot(a), 0)); }
    private static void browse(Activity a, File dir, int offset) throws Exception {
        File root = archiveRoot(a).getCanonicalFile(), current = dir.getCanonicalFile();
        if (!current.equals(root) && !current.getPath().startsWith(root.getPath()+File.separator)) throw new IOException("保存領域外です");
        File[] listed = current.listFiles(file -> file.isDirectory() || file.getName().endsWith(".dat"));
        if (listed == null) listed = new File[0];
        int sort=ThreadArchiveOrder.mode(a);
        Arrays.sort(listed, sort==0?Comparator.comparing(File::getName):(x,y)->ThreadArchiveOrder.compareFiles(x,y,sort));
        File[] files = listed; int end = Math.min(files.length, offset+100);
        ArrayList<String> labels = new ArrayList<>(); ArrayList<File> choices = new ArrayList<>();
        if (!current.equals(root)) { labels.add("↑ 一つ上へ"); choices.add(current.getParentFile()); }
        for (int i=offset;i<end;i++) { labels.add((files[i].isDirectory()?"📁 ":"")+files[i].getName()); choices.add(files[i]); }
        if (offset>0) { labels.add("前の100件"); choices.add(null); }
        if (end<files.length) { labels.add("次の100件"); choices.add(null); }
        ui(a, () -> new HaiagaruDialog.Builder(a).setTitle(current.equals(root)?"元URLを確認するアーカイブを選択":current.getName())
                .setItems(labels.isEmpty()?new String[]{"アーカイブはありません"}:labels.toArray(new String[0]), (d,p) -> {
                    if (choices.isEmpty()) return; File file=choices.get(p);
                    if (file==null) work(a, () -> browse(a,current,labels.get(p).startsWith("前")?Math.max(0,offset-100):end));
                    else if (file.isDirectory()) work(a, () -> browse(a,file,0));
                    else detail(a,file);
                }).setNegativeButton("閉じる",null).show());
    }
    private static void detail(Activity a, File file) {
        work(a, () -> {
            String relative=ArchiveOriginPaths.relative(archiveRoot(a),file); JSONObject value=read(a,relative);
            String url=value==null?null:value.getString("url");
            String kind=value==null?"":value.optString("kind");
            ui(a, () -> {
                TextView text=new TextView(a); text.setTextIsSelectable(true); text.setPadding(24,16,24,16);
                text.setText((url==null?"元URLの記録がありません。保存情報だけでは元のサーバーを特定できません。":
                        "reconstructed".equals(kind)?"保存名から復元したURL（HTTPSを使用。保存時のURLと異なる可能性があります）\n\n"+url:
                        "manual".equals(kind)?"手動登録した元スレURL\n\n"+url:"保存時の元スレURL\n\n"+url)+"\n\n保存先（変更しません）\n"+file.toURI());
                ScrollView scroll=new ScrollView(a); scroll.addView(text);
                HaiagaruDialog.Builder builder=new HaiagaruDialog.Builder(a).setTitle("アーカイブの元スレURL").setView(scroll)
                        .setNegativeButton("閉じる",null).setNeutralButton("元URLを登録・修正",(d,p)->edit(a,file,relative,url));
                if(url!=null) builder.setPositiveButton("元URLをコピー",(d,p)-> {
                    ClipboardHistory.setPrimaryClip((ClipboardManager)a.getSystemService(Context.CLIPBOARD_SERVICE),ClipData.newPlainText("元スレURL",url));
                    Toast.makeText(a,"元スレURLをコピーしました",Toast.LENGTH_SHORT).show();
                }); builder.show();
            });
        });
    }
    private static void edit(Activity a, File file, String relative, String current) {
        EditText input=new EditText(a); input.setInputType(android.text.InputType.TYPE_CLASS_TEXT|android.text.InputType.TYPE_TEXT_VARIATION_URI);
        input.setText(current==null?"":current); input.setHint("https://…/test/read.cgi/板名/スレ番号/");
        HaiagaruDialog dialog=new HaiagaruDialog.Builder(a).setTitle("元URLを登録（端末内のみ）").setView(input).setPositiveButton("保存",null).setNegativeButton("キャンセル",null).create();
        dialog.setOnShowListener(v->dialog.getButton(-1).setOnClickListener(w->{
            String url=input.getText().toString().trim(); if(ArchiveOriginPaths.threadKey(url)==null){input.setError("スレのHTTP(S) URLを入力してください");return;}
            work(a,()->{write(a,relative,url,"manual");ui(a,()->{dialog.dismiss();detail(a,file);});});
        }));dialog.show();
    }
    private static void report(Exception e) { android.util.Log.w("Haiagaru","Archive original URL operation failed",e); }
}
