package e.e.a;
import android.app.*;
import android.content.*;
import android.os.*;
import android.preference.*;
import java.io.*;
import java.util.*;
import java.util.concurrent.*;
import java.util.regex.*;

/** Opt-in cleanup of the *old* app-private video cache, never the current SAF location. */
public final class LegacyCacheCleanup113 {
    static final String KEY="nicoid_old_cache_delete";
    private static final Pattern VIDEO=Pattern.compile("^((?:sm|so|nm|ss)[0-9]+)(?:[._].*)?$");
    private static final Handler MAIN=new Handler(Looper.getMainLooper());
    private static final ExecutorService WORK=Executors.newSingleThreadExecutor(r->new Thread(r,"nicoid-legacy-cache-clean"));
    private LegacyCacheCleanup113(){}

    static String tr(Context c,String ja,String en,String zh){return Dev112.tr(c,ja,en,zh);}
    static PreferenceGroup findParent(PreferenceGroup group,Preference child){
        if(group==null||child==null)return null;
        for(int i=0;i<group.getPreferenceCount();i++){
            Preference p=group.getPreference(i);
            if(p==child)return group;
            if(p instanceof PreferenceGroup){
                PreferenceGroup found=findParent((PreferenceGroup)p,child);
                if(found!=null)return found;
            }
        }
        return null;
    }
    public static void install(PreferenceActivity a){
        if(a.findPreference(KEY)!=null)return;
        Preference existing=a.findPreference("cache_all_delete");
        PreferenceGroup group=findParent(a.getPreferenceScreen(),existing);
        if(group==null){
            Preference debug=a.findPreference("nicoid_debug_category");
            if(debug instanceof PreferenceGroup)group=(PreferenceGroup)debug;
        }
        if(group==null)return;
        Preference p=new Preference(a);
        p.setKey(KEY);
        p.setTitle(tr(a,"旧保存先のキャッシュを削除","Delete previous cache location","刪除舊快取位置"));
        p.setSummary(tr(a,"以前のアプリ専用フォルダに残る動画キャッシュを確認して削除します。",
               "Inspect and remove video caches left in the former app-private folder.",
               "檢查並刪除舊應用程式專用資料夾的影片快取。"));
        if(existing!=null&&existing.getOrder()<Integer.MAX_VALUE-1)p.setOrder(existing.getOrder()+1);
        group.addPreference(p);
        p.setOnPreferenceClickListener(item->{inspect(a);return true;});
    }

    // Never infer deletion paths from a preference, URL, or the present Download directory.
    private static File root(Context c)throws IOException{
        File base=c.getExternalFilesDir(null);
        if(base==null)throw new IOException("App files location unavailable");
        File canonicalBase=base.getCanonicalFile();
        File expected=new File(canonicalBase,"nicoid/nicoid_cache");
        File canonicalRoot=expected.getCanonicalFile();
        if(!expected.getPath().equals(canonicalRoot.getPath()))
            throw new IOException("Legacy directory symlink refused");
        return canonicalRoot;
    }
    static final class Snapshot {
        final List<File> files=new ArrayList<>();
        final Set<String> videos=new HashSet<>();
        long bytes;
        void add(File f,java.util.regex.Matcher m){
            files.add(f);bytes+=f.length();videos.add(m.group(1));
        }
    }
    private static Snapshot scan(Context c)throws IOException{
        File dir=root(c);
        Snapshot out=new Snapshot();
        if(!dir.exists())return out;
        if(!dir.isDirectory())throw new IOException("Legacy location is not a directory");
        File[] children=dir.listFiles();
        if(children==null)throw new IOException("Cannot enumerate old cache");
        for(File f:children){
            java.util.regex.Matcher m=VIDEO.matcher(f.getName());
            if(!m.matches()||!f.isFile())continue;
            if(!dir.equals(f.getCanonicalFile().getParentFile()))continue;
            out.add(f,m);
        }
        return out;
    }
    private static String mb(long b){return String.format(Locale.ROOT,"%.2f MB",b/1000000.0);}
    private static boolean busy(){
        try{return Class.forName("com.sauzask.nicoid.NicoidDownloadCache")
            .getField("v").getBoolean(null);}catch(Exception ignored){return false;}
    }
    private static void message(PreferenceActivity a,String body){
        if(a.isFinishing()||a.isDestroyed())return;
        Dev112.show(Dev112.builder(a).setTitle(tr(a,"旧保存先のキャッシュ","Previous cache location","舊快取位置"))
          .setMessage(body).setPositiveButton("OK",null).create());
    }
    private static void inspect(PreferenceActivity a){
        WORK.execute(()->{
            try{
                Snapshot found=scan(a.getApplicationContext());
                MAIN.post(()->confirm(a,found));
            }catch(Exception e){
                MAIN.post(()->message(a,tr(a,"旧保存先を確認できませんでした。",
                  "Cannot inspect the previous cache location.","無法檢查舊快取位置。")));
            }
        });
    }
    private static void confirm(PreferenceActivity a,Snapshot found){
        if(a.isFinishing()||a.isDestroyed())return;
        if(found.files.isEmpty()){
            message(a,tr(a,"削除対象の動画キャッシュはありません。",
              "No old video cache files found.","未找到舊影片快取。"));
            return;
        }
        String body=found.videos.size()+tr(a,"動画"," videos"," 部影片")+" / "
                +found.files.size()+tr(a,"ファイル"," files"," 個檔案")+" / "+mb(found.bytes)
                +"\n\n"+tr(a,
                  "以前のアプリ専用領域にある動画キャッシュだけを削除します。現在のDownloadフォルダ、設定、プレイリストは削除しません。削除後は復元できません。",
                  "Only video caches in the former app-private folder are deleted. The current Downloads folder, settings and playlists are untouched. This cannot be undone.",
                  "只刪除舊應用程式專用資料夾的影片快取，不會刪除目前下載資料夾、設定或播放清單。無法復原。");
        Dev112.show(Dev112.builder(a)
         .setTitle(tr(a,"旧保存先のキャッシュを削除しますか？",
           "Delete previous cache files?","要刪除舊快取嗎？"))
         .setMessage(body)
         .setNegativeButton(tr(a,"キャンセル","Cancel","取消"),null)
         .setPositiveButton(tr(a,"削除","Delete","刪除"),(d,w)->delete(a,found)).create());
    }
    private static void delete(PreferenceActivity a,Snapshot confirmed){
        WORK.execute(()->{
            try{
                if(busy())throw new IOException("Cache acquisition active");
                Snapshot now=scan(a.getApplicationContext());
                if(now.bytes!=confirmed.bytes||now.files.size()!=confirmed.files.size()
                    ||!now.videos.equals(confirmed.videos))
                    throw new IOException("Legacy cache changed after confirmation");
                File dir=root(a.getApplicationContext());
                long freed=0;int deleted=0,failed=0;
                for(File f:now.files){
                    if(!VIDEO.matcher(f.getName()).matches()
                        ||!dir.equals(f.getCanonicalFile().getParentFile())){failed++;continue;}
                    long size=f.length();
                    if(f.delete()){freed+=size;deleted++;}else failed++;
                }
                final int ok=deleted,errors=failed;
                final long bytes=freed;
                MAIN.post(()->message(a,ok+tr(a,"ファイル削除しました。"," files deleted."," 個檔案已刪除。")
                 +" ("+mb(bytes)+")"+(errors>0?"\n"+tr(a,"削除失敗","Failed","失敗")+": "+errors:"")));
            }catch(Exception e){
                MAIN.post(()->message(a,tr(a,
                   "削除を中止しました。取得中の動画がないことを確認し、再度実行してください。",
                   "Deletion stopped. Make sure no cache acquisition is running, then retry.",
                   "刪除已停止。請確認未在下載快取後重試。")));
            }
        });
    }
}
