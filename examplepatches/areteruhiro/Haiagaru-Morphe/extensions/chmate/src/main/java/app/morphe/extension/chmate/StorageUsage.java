package app.morphe.extension.chmate;

import android.app.Activity;
import android.content.Context;
import android.widget.*;
import java.io.File;
import java.util.*;

/** Read-only application data accounting. Never follows a path outside its root. */
public final class StorageUsage {
    static void addButton(LinearLayout root,Activity activity){Button media=new Button(activity);media.setText("保存画像・動画を選択・検索・再生");media.setOnClickListener(v->StorageMediaActivity.open(activity));root.addView(media);Button b=new Button(activity);b.setText("保存容量の内訳を確認");b.setOnClickListener(v->show(activity));root.addView(b);}
    public static void show(Activity activity){
        LinearLayout list=new LinearLayout(activity);list.setOrientation(LinearLayout.VERTICAL);
        int pad=(int)(16*activity.getResources().getDisplayMetrics().density);list.setPadding(pad,pad,pad,pad);
        TextView heading=new TextView(activity);list.addView(heading);ScrollView scroll=new ScrollView(activity);scroll.addView(list);
        HaiagaruDialog dialog=new HaiagaruDialog.Builder(activity).setTitle("保存容量の内訳").setView(scroll).setPositiveButton("閉じる",null).show();
        Context c=activity.getApplicationContext();Runnable[] refresh=new Runnable[1];
        refresh[0]=()->{heading.setText("保存容量を集計中…");new Thread(()->{
            List<Entry> entries=scan(c);long sum=0;for(Entry e:entries)sum+=e.bytes;final long total=sum;
            activity.runOnUiThread(()->{if(!dialog.isShowing()||activity.isFinishing())return;
                list.removeViews(1,list.getChildCount()-1);
                heading.setText("計 "+android.text.format.Formatter.formatFileSize(c,total)
                    +"\n項目を押すとファイル一覧を表示します。削除できるのはキャッシュです。設定・メモ・NG・取得済みスレ本文はここでは削除しません。\nアプリ本体・共有ダウンロードは含みません。通信量ではなく保存容量です。集計は最大20万項目の概算で、端末設定とは差が出る場合があります。\n");
                for(Entry e:entries){Button row=new Button(activity);row.setAllCaps(false);row.setText(e.label+"\n"+android.text.format.Formatter.formatFileSize(c,e.bytes));row.setOnClickListener(v->details(activity,e.file,e.label,refresh[0]));list.addView(row);}
            });
        },"Haiagaru-storage-size").start();};refresh[0].run();
    }
    private static List<Entry> scan(Context context){
        List<Entry> rows=new ArrayList<>();Set<String> seen=new HashSet<>();int[] budget={200000};
        collect(rows,new File(context.getApplicationInfo().dataDir),"内部データ",seen,budget);
        File[] files=context.getExternalFilesDirs(null);if(files!=null)for(int i=0;i<files.length;i++)if(files[i]!=null)collect(rows,files[i],"外部保存"+(i==0?"":" "+(i+1)),seen,budget);
        File[] caches=context.getExternalCacheDirs();if(caches!=null)for(int i=0;i<caches.length;i++)if(caches[i]!=null)collect(rows,caches[i],"外部キャッシュ"+(i==0?"":" "+(i+1)),seen,budget);
        rows.sort((a,b)->Long.compare(b.bytes,a.bytes));return rows;
    }
    private static void details(Activity activity,File file,String label,Runnable refresh){
        if(activity.isFinishing())return;
        Toast.makeText(activity,"ファイル情報を集計中…",Toast.LENGTH_SHORT).show();
        new Thread(()->{List<Entry> children=new ArrayList<>();Set<String> seen=new HashSet<>();int[] budget={200000};
            try{File[] items=file.listFiles();if(items!=null)for(File child:items){if(children.size()>=2000||budget[0]<=0)break;children.add(new Entry(child.getName(),size(child,file.getCanonicalPath(),seen,budget),child));}}catch(Exception ignored){}
            children.sort((a,b)->Long.compare(b.bytes,a.bytes));
            activity.runOnUiThread(()->{if(activity.isFinishing())return;
                HaiagaruDialog.Builder builder=new HaiagaruDialog.Builder(activity).setTitle(label).setNegativeButton("戻る",null);
                if(file.isDirectory()){
                    String[] names=new String[children.size()];for(int i=0;i<names.length;i++){Entry e=children.get(i);names[i]=e.label+(e.file.isDirectory()?" /":"")+" — "+android.text.format.Formatter.formatFileSize(activity,e.bytes);}
                    builder.setItems(names,(d,which)->{Entry e=children.get(which);details(activity,e.file,e.label,refresh);});
                }else builder.setMessage(file.getName()+"\n"+android.text.format.Formatter.formatFileSize(activity,file.length()));
                if(deletionAllowed(activity,file))builder.setNeutralButton("削除…",(d,w)->new HaiagaruDialog.Builder(activity)
                    .setTitle("このキャッシュを削除しますか？").setMessage(label+"\nフォルダの場合は中のファイルも削除します。次回表示時に再取得の通信が発生します。接続先から消えた画像等は再取得できません。")
                    .setNegativeButton("キャンセル",null).setPositiveButton("削除",(confirm,button)->new Thread(()->{
                        int count=deleteCache(activity.getApplicationContext(),file);
                        activity.runOnUiThread(()->{if(!activity.isFinishing()){Toast.makeText(activity,count<0?"削除できない項目がありました":count+"項目を削除しました",Toast.LENGTH_LONG).show();refresh.run();}});
                    },"Haiagaru-storage-delete").start()).show());
                builder.show();
            });
        },"Haiagaru-storage-details").start();
    }
    static boolean deletionAllowed(Context context,File file){
        List<File> roots=new ArrayList<>();roots.add(context.getCacheDir());File[] caches=context.getExternalCacheDirs();if(caches!=null)Collections.addAll(roots,caches);
        File[] files=context.getExternalFilesDirs(null);if(files!=null)for(File root:files)if(root!=null)roots.add(new File(root,"2chMate/media"));
        try{String path=file.getCanonicalPath();for(File root:roots)if(root!=null&&path.startsWith(root.getCanonicalPath()+File.separator))return true;}catch(Exception ignored){}return false;
    }
    static int deleteCache(Context context,File file){
        if(!deletionAllowed(context,file))return -1;
        try{
            String base=file.getCanonicalPath();ArrayDeque<File> pending=new ArrayDeque<>(),order=new ArrayDeque<>();Set<String> seen=new HashSet<>();pending.push(file);
            while(!pending.isEmpty()){
                File next=pending.pop();String path=next.getCanonicalPath();
                if(!path.equals(base)&&!path.startsWith(base+File.separator))return -1;
                // Do not traverse a symbolic link, including one pointing back into this directory.
                File parent=next.getParentFile();boolean link=parent!=null&&!new File(parent.getCanonicalFile(),next.getName()).getAbsolutePath().equals(path);
                if(link){order.push(next);continue;}
                if(!seen.add(path))continue;if(seen.size()>200000)return -1;order.push(next);
                File[] children=next.listFiles();if(children!=null)for(File child:children)pending.push(child);
            }
            int total=0;while(!order.isEmpty()){File next=order.pop();if(next.exists()&&!next.delete())return -1;total++;}return total;
        }catch(Exception ignored){return -1;}
    }
    static String report(Context context){
        List<Entry> rows=new ArrayList<>();Set<String> seen=new HashSet<>();int[] budget={200000};
        File internal=new File(context.getApplicationInfo().dataDir);collect(rows,internal,"内部データ",seen,budget);
        File[] external=context.getExternalFilesDirs(null);if(external!=null)for(int i=0;i<external.length;i++)if(external[i]!=null)collect(rows,external[i],"外部保存"+(i==0?"":" "+(i+1)),seen,budget);
        File[] caches=context.getExternalCacheDirs();if(caches!=null)for(int i=0;i<caches.length;i++)if(caches[i]!=null)collect(rows,caches[i],"外部キャッシュ"+(i==0?"":" "+(i+1)),seen,budget);
        rows.sort((a,b)->Long.compare(b.bytes,a.bytes));long total=0;StringBuilder out=new StringBuilder();
        for(Entry row:rows){total+=row.bytes;out.append(row.label).append("：").append(android.text.format.Formatter.formatFileSize(context,row.bytes)).append('\n');}
        return "計 "+android.text.format.Formatter.formatFileSize(context,total)+"\n\n"+out
            +"\n画像・GIF・動画のキャッシュ、WebViewのページや画像、スレ本文、設定、メモ、ログなどを含みます。動画を開いていなくても増えます。アプリ本体・共有ダウンロードフォルダは含みません。これは通信量ではありません。端末設定とは計算方式や更新時刻による差があります。データは削除しません。"
            +(budget[0]<=0?"\n件数上限に達したため一部のみの概算です。":"");
    }
    private static void collect(List<Entry> out,File root,String label,Set<String> seen,int[] budget){
        try{String base=root.getCanonicalPath();if(!seen.add(base))return;File[] children=root.listFiles();if(children==null)return;
            for(File child:children){
                if(budget[0]<=0)break;
                if(!child.getCanonicalPath().startsWith(base+File.separator))continue;
                if(child.isDirectory()&&(child.getName().equals("cache")||child.getName().equals("2chMate")||child.getName().equals("media")))collect(out,child,label+" / "+friendly(child.getName()),seen,budget);
                else out.add(new Entry(label+" / "+friendly(child.getName()),size(child,base,seen,budget),child));
            }
        }catch(Exception ignored){}
    }
    private static long size(File file,String root,Set<String> seen,int[] budget){
        if(--budget[0]<0)return 0;
        try{String path=file.getCanonicalPath();if(!path.equals(root)&&!path.startsWith(root+File.separator)||!seen.add(path))return 0;
            if(file.isFile())return file.length();long total=0;File[] children=file.listFiles();if(children!=null)for(File child:children){if(budget[0]<=0)break;total+=size(child,root,seen,budget);}return total;
        }catch(Exception ignored){return 0;}
    }
    private static String friendly(String name){
        switch(name){case "full":return "原寸画像・動画";case "thumb":return "サムネイル";case "media":return "画像・動画";case "WebView":case "app_webview":return "WebView（Webページ・画像等）";case "dat":return "取得済みスレ本文";case "databases":return "データベース";case "shared_prefs":return "設定";case "cache":return "キャッシュ";case "2chMate":return "ChMate保存データ";case "files":return "設定・メモ・ログ等";default:return name;}
    }
    private static final class Entry{final String label;final long bytes;final File file;Entry(String label,long bytes,File file){this.label=label;this.bytes=bytes;this.file=file;}}
    private StorageUsage(){}
}
