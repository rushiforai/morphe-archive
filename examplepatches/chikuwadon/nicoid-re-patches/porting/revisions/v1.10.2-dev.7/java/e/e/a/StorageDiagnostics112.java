package e.e.a;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.ContentValues;
import android.content.Context;
import android.net.Uri;
import android.os.Build;
import android.os.Environment;
import android.os.Handler;
import android.os.Looper;
import android.preference.Preference;
import android.preference.PreferenceActivity;
import android.preference.PreferenceGroup;
import android.provider.MediaStore;
import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Comparator;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.TreeMap;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/** Dev build only. Read-only, metadata-only size inventory, never exports file bodies or credentials. */
public final class StorageDiagnostics112 {
    private static final ExecutorService WORK = Executors.newSingleThreadExecutor(r -> {
        Thread t = new Thread(r, "nicoid-storage-diagnostic");
        t.setPriority(Thread.MIN_PRIORITY);
        return t;
    });
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final int MAX_ENTRIES = 200000;
    private StorageDiagnostics112() {}

    public static void install(PreferenceActivity activity) {
        try {
            Class<?> v = Class.forName("e.e.a.PatchVersion237");
            String version = String.valueOf(v.getMethod("value").invoke(null));
            if (!version.contains("-dev.")) return;
        } catch (Exception ignored) { return; }
        if (activity.findPreference("nicoid_storage_diagnostic") != null) return;
        Preference group = activity.findPreference("nicoid_debug_category");
        if (!(group instanceof PreferenceGroup)) return;
        Preference p = new Preference(activity);
        p.setKey("nicoid_storage_diagnostic");
        p.setTitle(Dev112.tr(activity, "ストレージ診断", "Storage diagnostics", "儲存空間診斷"));
        p.setSummary(Dev112.tr(activity,
                "アプリ内のフォルダ別容量とファイル数を調査し、結果をTXTで保存します。データの内容は出力しません。",
                "Measure folder sizes and file counts, then save a TXT report without file contents.",
                "測量資料夾大小與檔案數，儲存為TXT，不輸出檔案內容。"));
        ((PreferenceGroup)group).addPreference(p);
        p.setOnPreferenceClickListener(option -> { diagnose(activity); return true; });
    }

    static final class Stat {
        long bytes, files, folders, failed;
        void file(long length) { bytes += Math.max(0, length); files++; }
    }
    static final class Top {
        final long size;
        final String group, type;
        Top(long size, String group, String type) { this.size=size; this.group=group; this.type=type; }
    }
    private static String fileType(String name) {
        int dot = name.lastIndexOf('.');
        if (dot < 0 || name.length() - dot > 9) return "[no extension]";
        String suffix = name.substring(dot).toLowerCase(Locale.ROOT);
        return suffix.matches("\\.[a-z0-9]{1,8}") ? suffix : "[other]";
    }
    static final class Inventory {
        final Map<String, Stat> groups = new TreeMap<>();
        final List<Top> top = new ArrayList<>();
        long traversed; boolean truncated;
        void scan(String label, File path) {
            Stat stat = groups.get(label); if (stat == null) { stat = new Stat(); groups.put(label, stat); }
            if (path == null || !path.exists()) return;
            final String base;
            try { base = path.getCanonicalPath(); }
            catch (Exception error) { stat.failed++; return; }
            ArrayDeque<File> todo = new ArrayDeque<>();
            todo.add(path);
            while (!todo.isEmpty()) {
                if (++traversed > MAX_ENTRIES) { truncated=true; break; }
                File entry = todo.removeLast();
                try {
                    String real = entry.getCanonicalPath();
                    if (!real.equals(base) && !real.startsWith(base + File.separator)) { stat.failed++; continue; }
                    if (entry.isFile()) {
                        long size = entry.length(); stat.file(size);
                        if (top.size() < 20 || size > top.get(top.size()-1).size) {
                            top.add(new Top(size,label,fileType(entry.getName())));
                            top.sort((x,y) -> Long.compare(y.size,x.size));
                            if (top.size() > 20) top.remove(top.size()-1);
                        }
                    } else if (entry.isDirectory()) {
                        stat.folders++;
                        File[] children = entry.listFiles();
                        if (children == null) { stat.failed++; continue; }
                        for (File child : children) todo.add(child);
                    }
                } catch (Exception error) { stat.failed++; }
            }
        }
        String report() {
            StringBuilder b = new StringBuilder("nicoid Re / storage diagnostics (metadata only)\n");
            b.append("No file contents, real filenames, credentials or video IDs are exported.\n");
            b.append("System counts app data and cache separately; directory totals may differ from Android Settings.\n\n");
            long total = 0;
            for (Map.Entry<String,Stat> e : groups.entrySet()) {
                Stat s=e.getValue(); total += s.bytes;
                b.append(e.getKey()).append(": ").append(s.bytes).append(" bytes, ")
                        .append(s.files).append(" files, ").append(s.folders).append(" directories")
                        .append(s.failed==0 ? "" : ", unreadable/unsafe="+s.failed).append('\n');
            }
            b.append("\nTotal scanned: ").append(total).append(" bytes\n");
            b.append("Visited entries: ").append(traversed).append('\n');
            if(truncated) b.append("Warning: entry limit reached. Results are incomplete.\n");
            b.append("\nLargest files (only parent category, type, size):\n");
            for (Top t : top) b.append(t.group).append(' ').append(t.type).append(' ').append(t.size).append(" bytes\n");
            return b.toString();
        }
    }
    private static void diagnose(Activity activity) {
        final AlertDialog progress = Dev112.builder(activity)
                .setTitle(Dev112.tr(activity,"ストレージ診断","Storage diagnostics","儲存空間診斷"))
                .setMessage(Dev112.tr(activity,"容量を集計しています…","Counting files…","正在計算檔案…"))
                .setCancelable(false).create();
        Dev112.show(progress);
        Context context = activity.getApplicationContext();
        WORK.execute(() -> {
            Inventory inventory = new Inventory();
            String directory = context.getApplicationInfo().dataDir;
            File data = new File(directory);
            // No direct use of /data/user/0 beyond the app's own assigned data directory.
            for (String part : new String[]{"files","databases","shared_prefs","app_webview","cache","code_cache","no_backup"})
                inventory.scan("internal/"+part, new File(data,part));
            File[] others = data.listFiles();
            if (others != null) for (File item : others) {
                String n = item.getName();
                if (!Arrays.asList("files","databases","shared_prefs","app_webview","cache","code_cache","no_backup").contains(n))
                    inventory.scan("internal/other", item);
            }
            File external = context.getExternalFilesDir(null);
            if (external != null) inventory.scan("external/app_files", external);
            final String report = inventory.report();
            MAIN.post(() -> {
                progress.dismiss();
                if (activity.isFinishing() || activity.isDestroyed()) return;
                String preview=report.length()>5000?report.substring(0,5000)+"\n...":report;
                Dev112.show(Dev112.builder(activity)
                        .setTitle(Dev112.tr(activity,"ストレージ診断結果","Storage scan results","儲存空間診斷結果"))
                        .setMessage(preview)
                        .setNegativeButton(Dev112.tr(activity,"閉じる","Close","關閉"),null)
                        .setPositiveButton(Dev112.tr(activity,"TXTで保存","Save TXT","儲存TXT"),
                                (dialog,which)->WORK.execute(()->save(context,activity,report)))
                        .create());
            });
        });
    }
    private static void save(Context context, Activity activity, String report) {
        String filename="nicoid-re-storage-"+new SimpleDateFormat("yyyyMMdd-HHmmss",Locale.ROOT).format(new Date())+".txt";
        boolean ok=false;
        try {
            if (Build.VERSION.SDK_INT >= 29) {
                ContentValues values=new ContentValues();
                values.put(MediaStore.MediaColumns.DISPLAY_NAME,filename);
                values.put(MediaStore.MediaColumns.MIME_TYPE,"text/plain");
                values.put(MediaStore.MediaColumns.RELATIVE_PATH, Environment.DIRECTORY_DOWNLOADS);
                values.put(MediaStore.MediaColumns.IS_PENDING,1);
                Uri uri=context.getContentResolver().insert(MediaStore.Downloads.EXTERNAL_CONTENT_URI,values);
                if(uri==null) throw new java.io.IOException("Cannot create Downloads document");
                try {
                    try(OutputStream out=context.getContentResolver().openOutputStream(uri)) {
                        if(out==null) throw new java.io.IOException("Cannot open Downloads document");
                        out.write(report.getBytes(StandardCharsets.UTF_8));
                    }
                    ContentValues ready=new ContentValues();ready.put(MediaStore.MediaColumns.IS_PENDING,0);
                    context.getContentResolver().update(uri,ready,null,null); ok=true;
                } finally { if(!ok) context.getContentResolver().delete(uri,null,null); }
            } else {
                File folder=context.getExternalFilesDir(Environment.DIRECTORY_DOCUMENTS);
                if(folder==null || (!folder.isDirectory()&&!folder.mkdirs())) throw new java.io.IOException("No app documents directory");
                try(OutputStream out=new FileOutputStream(new File(folder,filename))) {
                    out.write(report.getBytes(StandardCharsets.UTF_8));
                }
                ok=true;
            }
        } catch(Exception e) { android.util.Log.w("nicoid-storage", "Cannot export storage report",e); }
        final boolean success=ok;
        MAIN.post(()->{
            if (activity.isFinishing()||activity.isDestroyed())return;
            android.widget.Toast.makeText(activity, Dev112.tr(activity,
                    success?"診断結果を保存しました":"診断結果を保存できませんでした",
                    success?"Saved storage report":"Could not save storage report",
                    success?"已儲存診斷結果":"無法儲存診斷結果"), android.widget.Toast.LENGTH_LONG).show();
        });
    }
}
