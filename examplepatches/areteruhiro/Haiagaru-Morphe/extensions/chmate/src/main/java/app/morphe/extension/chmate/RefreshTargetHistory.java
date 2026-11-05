package app.morphe.extension.chmate;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.net.Uri;
import android.view.View;
import android.view.Gravity;
import android.widget.*;
import java.util.*;
import java.util.concurrent.*;

/** Refresh registrations alongside the four stock history tabs. */
public final class RefreshTargetHistory {
    static final String VISIBLE_KEY="showRefreshTargetsInHistoryPopup";
    static boolean enabled(Context context){return RefreshTargets.prefs(context).getBoolean(VISIBLE_KEY,false);}
    private static final int TAG=0x48690e11;
    private static final ExecutorService IO=Executors.newSingleThreadExecutor();
    static final class Entry {
        final String key,label,url;
        Entry(String key,String label,String url){this.key=key;this.label=label;this.url=url;}
    }
    public static void attach(PopupWindow popup){
        View original=popup.getContentView();if(original==null)return;
        try{
            View existing=original.findViewWithTag(Integer.valueOf(TAG));
            if(existing!=null){((Tabs)existing.getTag(TAG)).restore();return;}
            if(original.isAttachedToWindow())return;
            Tabs tabs=new Tabs(popup,original);
            popup.setContentView(tabs.root);tabs.restore();
        }catch(Exception error){android.util.Log.w("Haiagaru","Refresh history entry unavailable",error);}
    }
    private static final class Tabs {
        final PopupWindow popup;
        final View nativeContent,nativeTabs;
        final LinearLayout root;
        final TextView[] buttons=new TextView[5];
        final View[] indicators=new View[5];
        final android.content.res.ColorStateList[] textColors=new android.content.res.ColorStateList[5];
        final int accent;
        final FrameLayout content;
        final ListView list;
        final TextView status;
        final String version;
        final Object flow;
        final java.lang.reflect.Method read,write;
        int selected,generation;
        List<Entry> entries=Collections.emptyList();
        Tabs(PopupWindow popup,View original)throws Exception{
            this.popup=popup;nativeContent=original;
            Context context=original.getContext();
            version=context.getPackageManager().getPackageInfo(context.getPackageName(),0).versionName;
            boolean old=version.contains("191"),middle=version.contains("226");
            // Fixed native fields and public observable interfaces; no class scan.
            Class<?> type=popup.getClass();
            nativeTabs=(View)NativeFields.find(type,old?"o":middle?"r":"h").get(popup);
            flow=NativeFields.find(type,old?"g":middle?"a":"b").get(popup);
            Class<?> observable=Class.forName(old?"o.Converterc":middle?"o.zzbc":"o.zzcpf",false,context.getClassLoader());
            read=observable.getMethod(old?"b":middle?"c":"d");
            write=observable.getMethod(old?"a":middle?"e":"b",Object.class);
            root=new LinearLayout(context);root.setOrientation(LinearLayout.VERTICAL);
            // findViewWithTag uses the ordinary tag; keep state on a keyed tag.
            root.setTag(Integer.valueOf(TAG));root.setTag(TAG,this);
            android.util.TypedValue color=new android.util.TypedValue();
            if(context.getTheme().resolveAttribute(android.R.attr.colorBackground,color,true))root.setBackgroundColor(color.data|0xff000000);
            android.util.TypedValue highlight=new android.util.TypedValue();
            accent=context.getTheme().resolveAttribute(android.R.attr.colorAccent,highlight,true)?highlight.data:0xff0086b3;
            LinearLayout row=new LinearLayout(context);row.setGravity(Gravity.BOTTOM);
            String[] labels={"スレ","対象","板","書き込み","画像"};
            for(int i=0;i<buttons.length;i++){
                final int tab=i;
                TextView button=new TextView(context);buttons[i]=button;
                textColors[i]=button.getTextColors();
                button.setText(labels[i]);button.setTextSize(12);button.setGravity(Gravity.CENTER);
                button.setMinHeight(Math.round(48*context.getResources().getDisplayMetrics().density));
                button.setFocusable(true);button.setClickable(true);
                android.util.TypedValue selectable=new android.util.TypedValue();
                if(context.getTheme().resolveAttribute(android.R.attr.selectableItemBackground,selectable,true))button.setBackgroundResource(selectable.resourceId);
                button.setOnClickListener(v->select(tab));
                LinearLayout cell=new LinearLayout(context);cell.setOrientation(LinearLayout.VERTICAL);
                cell.addView(button,new LinearLayout.LayoutParams(-1,-2));
                View indicator=new View(context);indicators[i]=indicator;
                indicator.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
                cell.addView(indicator,new LinearLayout.LayoutParams(-1,Math.max(1,Math.round(3*context.getResources().getDisplayMetrics().density))));
                row.addView(cell,new LinearLayout.LayoutParams(0,-2,1));
            }
            content=new FrameLayout(context);content.addView(original,new FrameLayout.LayoutParams(-1,-1));
            list=new ListView(context);content.addView(list,new FrameLayout.LayoutParams(-1,-1));
            status=new TextView(context);status.setGravity(Gravity.CENTER);status.setPadding(16,16,16,16);
            content.addView(status,new FrameLayout.LayoutParams(-1,-1));
            root.addView(content,new LinearLayout.LayoutParams(-1,0,1));
            root.addView(row,new LinearLayout.LayoutParams(-1,-2));
            nativeTabs.setVisibility(View.GONE);
            int nativeSelected=((Number)read.invoke(flow)).intValue();
            selected=nativeSelected==0?0:Math.max(2,Math.min(4,nativeSelected+1));
            list.setOnItemClickListener((parent,view,index,id)->{
                if(index<0||index>=entries.size())return;
                Activity activity=Haiagaru.toolbarActivity(null);if(activity==null)return;
                String url=entries.get(index).url;
                if(url==null){Toast.makeText(context,"保存された板情報を取得できませんでした",Toast.LENGTH_LONG).show();return;}
                popup.dismiss();
                activity.startActivity(new Intent(Intent.ACTION_VIEW,Uri.parse(url)).setClassName(activity,"jp.syoboi.a2chMate.activity.ResListActivity"));
            });
        }
        void restore(){
            nativeTabs.setVisibility(View.GONE);
            ((View)buttons[1].getParent()).setVisibility(enabled(root.getContext())?View.VISIBLE:View.GONE);
            select(selected);
        }
        void select(int tab){
            if(tab==1&&!enabled(root.getContext()))tab=0;
            selected=tab;int request=++generation;
            for(int i=0;i<buttons.length;i++){
                buttons[i].setSelected(i==tab);
                buttons[i].setTypeface(null,i==tab?android.graphics.Typeface.BOLD:android.graphics.Typeface.NORMAL);
                buttons[i].setTextColor(i==tab?android.content.res.ColorStateList.valueOf(accent):textColors[i]);
                indicators[i].setBackgroundColor(i==tab?accent:android.graphics.Color.TRANSPARENT);
                buttons[i].setContentDescription(buttons[i].getText()+(i==1?" 更新対象のスレ（"+RefreshTargets.selected(root.getContext()).size()+"）":"")+(i==tab?" 選択中":""));
            }
            nativeContent.setVisibility(tab==1?View.GONE:View.VISIBLE);
            list.setVisibility(View.GONE);status.setVisibility(View.GONE);
            if(tab!=1){
                try{write.invoke(flow,Integer.valueOf(tab==0?0:tab-1));}
                catch(Exception error){android.util.Log.w("Haiagaru","Native history tab unavailable",error);}
                return;
            }
            status.setText("読み込み中…");status.setVisibility(View.VISIBLE);
            Set<String> keys=RefreshTargets.selected(root.getContext());
            IO.execute(()->{
                try{
                    List<Entry> loaded=keys.isEmpty()?Collections.emptyList():load(root.getContext().getApplicationContext(),keys);
                    root.post(()->{
                        if(generation!=request)return;
                        entries=loaded;String[] labels=new String[loaded.size()];for(int i=0;i<labels.length;i++)labels[i]=loaded.get(i).label;
                        list.setAdapter(new ArrayAdapter<>(root.getContext(),android.R.layout.simple_list_item_1,labels));
                        list.setVisibility(loaded.isEmpty()?View.GONE:View.VISIBLE);
                        status.setText("登録はありません。スレタイトルの「更新対象に含む」で追加できます。");
                        status.setVisibility(loaded.isEmpty()?View.VISIBLE:View.GONE);
                    });
                }catch(Exception error){root.post(()->{if(generation==request){status.setText("更新対象の一覧を読み込めませんでした");status.setVisibility(View.VISIBLE);}});android.util.Log.w("Haiagaru","Refresh history unavailable",error);}
            });
        }
    }
    static List<Entry> load(Context context,Set<String> keys)throws Exception{
        ArrayList<Entry> result=new ArrayList<>();
        String version=context.getPackageManager().getPackageInfo(context.getPackageName(),0).versionName;
        try(SQLiteDatabase db=SQLiteDatabase.openDatabase(context.getDatabasePath("roidon.sqlite").getAbsolutePath(),null,SQLiteDatabase.OPEN_READONLY)){
            for(String key:keys){
                String[] parts=key.split("\\n",-1);if(parts.length!=2)continue;
                long id;try{id=Long.parseLong(parts[1]);if(id<=0)continue;}catch(NumberFormatException invalid){continue;}
                String title=parts[1],boardTitle=parts[0],server=null;
                try(Cursor row=db.rawQuery("SELECT bookmarks.title, boards.title, boards.server FROM bookmarks LEFT JOIN boards ON boards.name=bookmarks.name WHERE bookmarks.name=? AND bookmarks.created=? LIMIT 1",new String[]{parts[0],parts[1]})){
                    if(row.moveToFirst()){
                        if(!row.isNull(0)&&!row.getString(0).isEmpty())title=row.getString(0);
                        if(!row.isNull(1)&&!row.getString(1).isEmpty())boardTitle=row.getString(1);
                        server=row.getString(2);
                    }
                }
                String url=null;try{url=url(context,version,parts[0],id,server);}catch(Exception unavailable){/* Keep registration visible. */}
                result.add(new Entry(key,title+"\n"+boardTitle+(url==null?"（保存情報を確認できません）":""),url));
            }
        }
        java.text.Collator order=java.text.Collator.getInstance(Locale.JAPANESE);
        result.sort((a,b)->{int n=order.compare(a.label,b.label);return n==0?a.key.compareTo(b.key):n;});return result;
    }
    private static String url(Context context,String version,String key,long id,String server)throws Exception{
        boolean old=version.contains("191"),middle=version.contains("226");
        ClassLoader loader=context.getClassLoader();
        Class<?> boardType=Class.forName(old?"jp.syoboi.a2chMate.client.BBSUrlInfo$BoardID":"jp.syoboi.a2chMate.client.BoardID",false,loader);
        Object board;
        if(old)board=boardType.getConstructor(String.class).newInstance(key);
        else if(middle)board=boardType.getMethod("b",String.class).invoke(null,key);
        else{
            Class<?> companion=Class.forName("jp.syoboi.a2chMate.client.BoardID$RemoteActionCompatParcelizer",false,loader);
            board=companion.getMethod("c",String.class).invoke(null,key);
        }
        if(server==null||server.isEmpty())server=(String)NativeFields.find(boardType,old?"a":middle?"d":"c").get(board);
        if(server==null||server.isEmpty())return null;
        Class<?> infoType=Class.forName("jp.syoboi.a2chMate.client.BBSUrlInfo",false,loader);
        String path=(String)NativeFields.find(boardType,old?"d":middle?"b":"d").get(board);
        int kind;
        if(old)kind=((Number)infoType.getMethod("e",String.class).invoke(null,server)).intValue();
        else if(middle)kind=((Number)infoType.getMethod("d",String.class).invoke(null,server)).intValue();
        else{
            kind=((Number)infoType.getMethod("c",String.class).invoke(null,server)).intValue();
        }
        Object info=infoType.getConstructor(String.class,String.class,Long.class,int.class,Integer.class,String.class).newInstance(server,path,Long.valueOf(id),kind,null,null);
        String url=(String)infoType.getMethod(old?"d":middle?"e":"c",int.class).invoke(info,1);
        Uri uri=Uri.parse(url);return ("http".equals(uri.getScheme())||"https".equals(uri.getScheme()))&&uri.getHost()!=null?url:null;
    }
    static void show(Activity activity){
        Set<String> keys=RefreshTargets.selected(activity);
        if(keys.isEmpty()){
            new HaiagaruDialog.Builder(activity).setTitle("更新対象のスレ").setMessage("登録はありません。スレタイトルのメニューで「更新対象に含む」をオンにすると、ここに並びます。").setPositiveButton("閉じる",null).show();return;
        }
        IO.execute(()->{
            try{
                List<Entry> entries=load(activity.getApplicationContext(),keys);
                activity.runOnUiThread(()->{
                    if(activity.isFinishing()||activity.isDestroyed())return;
                    String[] labels=new String[entries.size()];for(int i=0;i<labels.length;i++)labels[i]=entries.get(i).label;
                    new HaiagaruDialog.Builder(activity).setTitle("更新対象のスレ（"+entries.size()+"）").setItems(labels,(dialog,index)->{
                        String url=entries.get(index).url;
                        if(url==null){Toast.makeText(activity,"保存された板情報を取得できませんでした",Toast.LENGTH_LONG).show();return;}
                        activity.startActivity(new Intent(Intent.ACTION_VIEW,Uri.parse(url)).setClassName(activity,"jp.syoboi.a2chMate.activity.ResListActivity"));
                    }).setNegativeButton("閉じる",null).show();
                });
            }catch(Exception error){activity.runOnUiThread(()->{if(!activity.isFinishing())Toast.makeText(activity,"更新対象の一覧を読み込めませんでした",Toast.LENGTH_LONG).show();});android.util.Log.w("Haiagaru","Refresh history unavailable",error);}
        });
    }
    private RefreshTargetHistory(){}
}
