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
            if(!enabled(original.getContext()))return;
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
        final TextView status;
        final String version;
        final Object flow;
        final java.lang.reflect.Method read,write;
        int selected,generation;
        NativeHistoryTabs standardTabs;
        final View fallbackTabs;
        long nextNativeAttempt;
        NativeTargetHistory.Binding targetBinding;
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
            root=new HistoryLayout(context,this);root.setOrientation(LinearLayout.VERTICAL);
            // findViewWithTag uses the ordinary tag; keep state on a keyed tag.
            root.setTag(Integer.valueOf(TAG));root.setTag(TAG,this);
            android.util.TypedValue color=new android.util.TypedValue();
            if(context.getTheme().resolveAttribute(android.R.attr.colorBackground,color,true))root.setBackgroundColor(color.data|0xff000000);
            android.util.TypedValue highlight=new android.util.TypedValue();
            accent=context.getTheme().resolveAttribute(android.R.attr.colorAccent,highlight,true)?highlight.data:0xff0086b3;
            LinearLayout row=new LinearLayout(context);row.setGravity(Gravity.BOTTOM);
        String[] labels={"スレ","更新対象","板","書き込み","画像"};
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
            status=new TextView(context);status.setGravity(Gravity.CENTER);status.setPadding(16,16,16,16);
            content.addView(status,new FrameLayout.LayoutParams(-1,-1));
            root.addView(content,new LinearLayout.LayoutParams(-1,0,1));
            root.addView(row,new LinearLayout.LayoutParams(-1,-2));
            fallbackTabs=row;
            nativeTabs.setVisibility(View.GONE);
            root.getViewTreeObserver().addOnPreDrawListener(() -> {
                prepareNativeTabs();
                if (selected == 1 && targetBinding != null) {
                    try { targetBinding.ensure(); }
                    catch (Exception unavailable) {
                        android.util.Log.w("Haiagaru", "Target history adapter unavailable", unavailable);
                    }
                }
                if (selected != 1 && nativeContent.getVisibility() == View.VISIBLE) {
                    try {
                        int nativeTab = ((Number)read.invoke(flow)).intValue();
                        int tab = nativeTab == 0 ? 0 : Math.max(2, Math.min(4, nativeTab + 1));
                        if (selected != tab) {
                            selected = tab;
                            updateSelection();
                        }
                    } catch (Exception unavailable) {
                        android.util.Log.w("Haiagaru", "History tab selection unavailable", unavailable);
                    }
                }
                if(standardTabs!=null)try{standardTabs.select(selected);}catch(Exception ignored){}
                return true;
            });
            int nativeSelected=((Number)read.invoke(flow)).intValue();
            selected=nativeSelected==0?0:Math.max(2,Math.min(4,nativeSelected+1));

        }
        void restore(){
            prepareNativeTabs();
            nativeTabs.setVisibility(standardTabs==null?View.GONE:View.VISIBLE);
            ((View)buttons[1].getParent()).setVisibility(enabled(root.getContext())?View.VISIBLE:View.GONE);
            select(selected);
        }
        void updateSelection(){
            if(standardTabs!=null)try{standardTabs.select(selected);}catch(Exception error){android.util.Log.w("Haiagaru","Native history selection unavailable",error);}
            for(int i=0;i<buttons.length;i++){
                buttons[i].setSelected(i==selected);
                buttons[i].setTypeface(null,i==selected?android.graphics.Typeface.BOLD:android.graphics.Typeface.NORMAL);
                buttons[i].setTextColor(i==selected?android.content.res.ColorStateList.valueOf(accent):textColors[i]);
                indicators[i].setBackgroundColor(i==selected?accent:android.graphics.Color.TRANSPARENT);
                buttons[i].setContentDescription(buttons[i].getText()+(i==1?" 更新対象のスレ（"+RefreshTargets.selected(root.getContext()).size()+"）":"")+(i==selected?" 選択中":""));
            }
        }
        void prepareNativeTabs(){
            long now=android.os.SystemClock.uptimeMillis();
            if(standardTabs==null&&now<nextNativeAttempt)return;
            nextNativeAttempt=now+500;
            try{
                boolean targets=enabled(root.getContext());
                if(standardTabs==null){
                    NativeHistoryTabs ready=new NativeHistoryTabs(nativeTabs,this::select);
                    ready.configure(targets);standardTabs=ready;
                    fallbackTabs.setVisibility(View.GONE);nativeTabs.setVisibility(View.VISIBLE);
                    FrameLayout.LayoutParams statusParams=(FrameLayout.LayoutParams)status.getLayoutParams();
                    statusParams.bottomMargin=Math.round(56*root.getResources().getDisplayMetrics().density);
                    status.setLayoutParams(statusParams);
                    nativeContent.setVisibility(View.VISIBLE);
                }else if(standardTabs.targets!=targets)standardTabs.configure(targets);
            }catch(Exception unavailable){/* Native state can arrive asynchronously; retain the usable fallback until ready. */}
        }
        void select(int tab){
            if(tab==1&&!enabled(root.getContext()))tab=0;
            if(targetBinding!=null){
                try{targetBinding.restore();}
                catch(Exception error){android.util.Log.w("Haiagaru","Native history adapter restore unavailable",error);}
                targetBinding=null;
            }
            selected=tab;int request=++generation;
            updateSelection();
            nativeContent.setVisibility(tab==1&&standardTabs==null?View.GONE:View.VISIBLE);
            status.setVisibility(View.GONE);
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
                    List<Object> nativeRows=NativeTargetHistory.load(root.getContext().getApplicationContext(),version,loaded);
                    root.post(()->{
                        if(generation!=request)return;
                        try{
                            targetBinding=NativeTargetHistory.show(popup,version,root.getContext(),nativeRows);
                            nativeContent.setVisibility(nativeRows.isEmpty()&&standardTabs==null?View.GONE:View.VISIBLE);
                            status.setText(loaded.isEmpty()
                                    ?"登録はありません。スレタイトルの「更新対象に含む」で追加できます。"
                                    :"対象スレの保存情報が見つかりません。スレを一度開いてください。");
                            status.setVisibility(nativeRows.isEmpty()?View.VISIBLE:View.GONE);
                        }catch(Exception error){
                            status.setText("更新対象の表示を準備できませんでした");
                            status.setVisibility(View.VISIBLE);
                            android.util.Log.w("Haiagaru","Native target history unavailable",error);
                        }
                    });
                }catch(Exception error){root.post(()->{if(generation==request){status.setText("更新対象の一覧を読み込めませんでした");status.setVisibility(View.VISIBLE);}});android.util.Log.w("Haiagaru","Refresh history unavailable",error);}
            });
        }
    }
    static int adjacentTab(int selected, boolean forward, boolean targetsEnabled) {
        int next = selected;
        do { next = (next + (forward ? 1 : 4)) % 5; }
        while (next == 1 && !targetsEnabled);
        return next;
    }

    private static final class HistoryLayout extends LinearLayout {
        private final Tabs tabs;
        private final int slop;
        private float downX, downY;
        private boolean swiping;
        HistoryLayout(Context context, Tabs tabs) {
            super(context);
            this.tabs = tabs;
            slop = android.view.ViewConfiguration.get(context).getScaledTouchSlop() * 2;
        }
        @Override public boolean dispatchTouchEvent(android.view.MotionEvent event) {
            int action = event.getActionMasked();
            if (action == android.view.MotionEvent.ACTION_DOWN) {
                downX = event.getX(); downY = event.getY(); swiping = false;
            }
            float dx = event.getX() - downX, dy = event.getY() - downY;
            if (action == android.view.MotionEvent.ACTION_MOVE && !swiping
                    && Math.abs(dx) > slop && Math.abs(dx) > Math.abs(dy) * 1.5f) {
                swiping = true;
                android.view.MotionEvent cancel = android.view.MotionEvent.obtain(event);
                cancel.setAction(android.view.MotionEvent.ACTION_CANCEL);
                super.dispatchTouchEvent(cancel);
                cancel.recycle();
            }
            if (swiping) {
                if (action == android.view.MotionEvent.ACTION_UP) {
                    tabs.select(adjacentTab(tabs.selected, dx < 0, enabled(getContext())));
                    swiping = false;
                } else if (action == android.view.MotionEvent.ACTION_CANCEL) swiping = false;
                return true;
            }
            return super.dispatchTouchEvent(event);
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
                int unread=0;
                try(Cursor row=db.rawQuery("SELECT bookmarks.title, boards.title, boards.server, MAX(0, MAX(bookmarks.res_count, bookmarks.server_res_count) - bookmarks.read_count) FROM bookmarks LEFT JOIN boards ON boards.name=bookmarks.name WHERE bookmarks.name=? AND bookmarks.created=? LIMIT 1",new String[]{parts[0],parts[1]})){
                    if(row.moveToFirst()){
                        if(!row.isNull(0)&&!row.getString(0).isEmpty())title=row.getString(0);
                        if(!row.isNull(1)&&!row.getString(1).isEmpty())boardTitle=row.getString(1);
                        server=row.getString(2);
                        unread=row.getInt(3);
                    }
                }
                String url=null;try{url=url(context,version,parts[0],id,server);}catch(Exception unavailable){/* Keep registration visible. */}
                result.add(new Entry(key,title+"（新着"+unread+"件）"+"\n"+boardTitle+(url==null?"（保存情報を確認できません）":""),url));
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
