package app.morphe.extension.chmate;

import android.app.Activity;

import android.content.Context;
import android.widget.Button;
import android.widget.LinearLayout;
import java.io.File;
import java.lang.reflect.Field;
import java.util.*;

/** Sorting only: never changes archive files or native open/delete targets. */
public final class ThreadArchiveOrder {
    private static final String PREFS="haiagaru.thread-archive-order";
    private static final String[] LABELS={"標準の並び順", "スレ作成日時：新しい順", "スレ作成日時：古い順",
            "保存ファイル更新日時：新しい順", "保存ファイル更新日時：古い順"};
    static int mode(Context c){int m=c.getSharedPreferences(PREFS,0).getInt("sort",0);return m>=0&&m<LABELS.length?m:0;}
    static int compareFiles(File a,File b,int mode){
        return ThreadArchiveSort.compare(a,b,mode);
    }
    private static File file(Object row)throws Exception {
        File fallback=null;
        for(Class<?> type=row.getClass();type!=null&&type!=Object.class;type=type.getSuperclass())
            for(Field f:type.getDeclaredFields())if(f.getType()==File.class){
                f.setAccessible(true);File candidate=(File)f.get(row);
                if(candidate!=null){
                    if(ThreadArchiveSort.created(candidate)>0)return candidate;
                    if(fallback==null)fallback=candidate;
                }
            }
        if(fallback!=null)return fallback;
        throw new IllegalArgumentException("Archive file field missing");
    }
    public static int compare(Object a,Object b){
        Context c=Haiagaru.applicationContextForExtension();
        if(c==null)return 0;
        try{return compareFiles(file(a),file(b),mode(c));}catch(Exception e){return 0;}
    }
    public static boolean enabled(){Context c=Haiagaru.applicationContextForExtension();return c!=null&&mode(c)!=0;}
    @SuppressWarnings({"rawtypes","unchecked"})
    public static void sort(Object object){
        if(!enabled() || !(object instanceof List))return;
        Collections.sort((List)object,(a,b)->compare(a,b));
    }
    public static void addSettings(LinearLayout root,Activity a){
        Button b=new Button(a);b.setText("スレッドアーカイブ一覧の並び順");root.addView(b);
        b.setOnClickListener(v->new HaiagaruDialog.Builder(a).setTitle("スレッドアーカイブ一覧の並び順")
                .setSingleChoiceItems(LABELS,mode(a),(d,which)->{
                    a.getSharedPreferences(PREFS,0).edit().putInt("sort",which).apply();d.dismiss();
                    new HaiagaruDialog.Builder(a).setMessage("並び順を保存しました。アーカイブ一覧を開き直すと反映します。\n作成日時不明は末尾に表示します。保存ファイル更新日時は復元・コピー等で変わる場合があります。")
                            .setPositiveButton("OK",null).show();
                }).setNegativeButton("キャンセル",null).show());
    }
}
