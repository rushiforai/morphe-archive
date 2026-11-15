package app.morphe.extension.chmate;

import android.app.Activity;
import android.content.*;
import android.view.*;
import android.widget.*;
import java.util.*;
import org.json.*;

/** Display-only HOME ordering. Never rewrites bookmarks, stars or read positions. */
public final class HomeThreadOrder {
    public static final int DRAG_TAG=0x48690135;
    public interface DragOrder { boolean move(int from,int to); void togglePin(int position); boolean pinned(int position); }
    static final String PREFS="haiagaru.home-thread-order";
    private static final int MENU=0x48690133;
    private static final Map<Integer,List<?>> latest=new HashMap<>();
    private static final Map<Object,Integer> modes=new WeakHashMap<>();
    private static final ThreadLocal<Integer> sortingMode=new ThreadLocal<>();
    public static void selected(Object owner,int mode){
        synchronized(modes){modes.put(owner,Math.abs(mode));}
        sortingMode.set(Math.abs(mode));
    }
    static int logicalMode(int mode){
        Integer selected=sortingMode.get();
        return Math.abs(mode)==102&&selected!=null&&(selected==108||selected==109)?selected:Math.abs(mode);
    }
    static int mode(Object fragment){
        if(fragment==null)return 0;
        try{
            String name=fragment.getClass().getName();
            boolean middle=name.equals("jp.syoboi.a2chMate.fragment.HomeFragment");
            if(middle||name.equals("jp.syoboi.a2chMate.ui.home.HomeFragment")){
                Object model=fragment.getClass().getMethod(middle?"i":"m").invoke(fragment);
                Object flow=NativeFields.find(model.getClass(),middle?"s":"o").get(model);
                java.lang.reflect.Method read=flow.getClass().getMethod(middle?"c":"d");read.setAccessible(true);
                return Math.abs(((Number)read.invoke(flow)).intValue());
            }
        }catch(Exception ignored){}

        synchronized(modes){Integer value=modes.get(fragment);if(value!=null)return value;}
        try{Object model=fragment.getClass().getMethod("m").invoke(fragment);synchronized(modes){Integer value=modes.get(model);if(value!=null)return value;}}catch(Exception ignored){}
        return 0;
    }
    private static SharedPreferences prefs(){return Haiagaru.applicationContextForExtension().getSharedPreferences(PREFS,0);}
    private static boolean target(int mode){int m=Math.abs(mode);return m==100||m==101||m==102||m==103||m==107||m==108||m==109;}
    static String key(Object row){
        if(row==null)return null;String type=row.getClass().getName(),board,id;
        if(type.equals("o.onAdDisplayed$setIcon")){board="g";id="h";}
        else if(type.equals("o.Yy2$open")){board="b";id="g";}
        else if(type.equals("o.getAvailabilityStatus$r8lambdawJ5MHcSJed_CjC7r4OWD0UxyJsQ")){board="e";id="b";}
        else {
            String field=type.equals("o.onAdDisplayed$IconCompatParcelizer")?"a":type.equals("o.Yy2$RemoteActionCompatParcelizer")?"d":type.equals("o.getAvailabilityStatus$ComponentActivity")?"a":null;
            if(field==null)return null;
            try{Object value=NativeFields.find(row.getClass(),field).get(row);return value==null?null:"board\n"+value;}catch(Exception unavailable){return null;}
        }
        try{Object b=NativeFields.find(row.getClass(),board).get(row);long thread=NativeFields.find(row.getClass(),id).getLong(row);return b==null||thread<=0?null:b.toString()+"\n"+thread;}catch(Exception unavailable){return null;}
    }
    static List<?> apply(List<?> source,int mode){
        if(source==null||!target(mode)||Haiagaru.applicationContextForExtension()==null)return source;
        synchronized(latest){latest.put(mode,new ArrayList<>(source));}
        Map<String,Integer> ranks=new HashMap<>();try{JSONArray order=new JSONArray(prefs().getString("order:"+Math.abs(mode),"[]"));for(int i=0;i<order.length();i++)ranks.put(order.getString(i),i);}catch(JSONException ignored){}
        Set<String> pinned=prefs().getStringSet("pins:"+Math.abs(mode),Collections.emptySet());if(ranks.isEmpty()&&pinned.isEmpty())return source;
        ArrayList<Object> movable=new ArrayList<>();
        Map<Object,String> keys=new IdentityHashMap<>();
        for(Object row:source){String key=key(row);if(key!=null){movable.add(row);keys.put(row,key);}}
        if(movable.isEmpty())return source;
        movable.sort(Comparator.comparingInt((Object row)->pinned.contains(keys.get(row))?0:1)
                .thenComparingInt(row->ranks.getOrDefault(keys.get(row),Integer.MAX_VALUE)));

        // Keep native action rows (including the "板一覧へ" row) at their
        // original slots. Only omit group headings that would now mislabel rows.
        ArrayList<Object> result=new ArrayList<>(source.size());
        Iterator<Object> sorted=movable.iterator();
        for(Object row:source){
            if(keys.containsKey(row))result.add(sorted.next());
            else if(!HiddenDroppedThreads.timeHeading(row))result.add(row);
        }
        return result;
    }
    public static void menu(Object fragment,Menu menu){
        if(menu==null)return;MenuItem item=menu.findItem(MENU);if(item==null){item=menu.add(Menu.NONE,MENU,Menu.NONE,"並び替える");item.setShowAsAction(MenuItem.SHOW_AS_ACTION_NEVER);item.setOnMenuItemClickListener(v->{show(Haiagaru.toolbarActivity(fragment),mode(fragment));return true;});}item.setVisible(target(mode(fragment)));
    }
    static void show(Activity activity,final int mode){
        if(activity==null||activity.isFinishing())return;List<?> source;synchronized(latest){source=latest.get(mode);}
        if(source==null){Toast.makeText(activity,"HOMEの対象タブを表示してから開いてください",Toast.LENGTH_LONG).show();return;}
        List<?> sorted=apply(source,mode);ArrayList<Object> rows=new ArrayList<>();HashSet<String> seen=new HashSet<>();for(Object row:sorted){String key=key(row);if(key!=null&&seen.add(key))rows.add(row);}
        if(rows.isEmpty()){Toast.makeText(activity,mode==107?"並び替える板がありません":"並び替えるスレがありません",Toast.LENGTH_LONG).show();return;}
        ArrayList<String> order=new ArrayList<>();for(Object row:rows)order.add(key(row));Map<String,String> titles=new HashMap<>();for(Object row:rows){String key=key(row);try{String type=row.getClass().getName();titles.put(key,String.valueOf(NativeFields.find(row.getClass(),type.equals("o.onAdDisplayed$setIcon")?"e":type.equals("o.Yy2$open")?"k":type.equals("o.getAvailabilityStatus$r8lambdawJ5MHcSJed_CjC7r4OWD0UxyJsQ")?"m":type.equals("o.Yy2$RemoteActionCompatParcelizer")?"e":type.equals("o.getAvailabilityStatus$ComponentActivity")?"d":"e").get(row)));}catch(Exception ignored){titles.put(key,key);}}Set<String> pinned=new HashSet<>(prefs().getStringSet("pins:"+Math.abs(mode),Collections.emptySet()));
        LinearLayout box=new LinearLayout(activity);box.setOrientation(1);TextView help=new TextView(activity);help.setText("右のつまみを上下へドラッグして並び替えます。ピンのボタンでピン留めできます。ピン留めした項目は先頭へ表示します。変更は保存で確定します。");box.addView(help);
        ListView list=new ListView(activity);box.addView(list,new LinearLayout.LayoutParams(-1,(int)(420*activity.getResources().getDisplayMetrics().density)));
        Runnable refresh=()->{ArrayList<String> labels=new ArrayList<>();for(String key:order){String title=titles.get(key);labels.add((pinned.contains(key)?"📌 ":"")+title);}list.setAdapter(new ArrayAdapter<>(activity,android.R.layout.simple_list_item_1,labels));};
        HaiagaruDialog dialog=new HaiagaruDialog.Builder(activity).setTitle(mode==107?"HOMEの板を並び替える":"HOMEのスレを並び替える").setView(box).setNegativeButton("キャンセル",null).setNeutralButton("標準の並び替えに戻す",(d,w)->{prefs().edit().remove("order:"+Math.abs(mode)).remove("pins:"+Math.abs(mode)).apply();BrowsingHistory.refreshVisible(activity);}).setPositiveButton("保存",(d,w)->{prefs().edit().putString("order:"+Math.abs(mode),new JSONArray(order).toString()).putStringSet("pins:"+Math.abs(mode),pinned).apply();BrowsingHistory.refreshVisible(activity);}).create();
        list.setTag(DRAG_TAG,new DragOrder(){
            public boolean move(int from,int to){
                if(from<0||to<0||from>=order.size()||to>=order.size()||from==to)return false;
                if(pinned(from)!=pinned(to))return false;
                order.add(to,order.remove(from));refresh.run();dialog.refresh();return true;
            }
            public boolean pinned(int position){return position>=0&&position<order.size()&&pinned.contains(order.get(position));}
            public void togglePin(int position){if(position<0||position>=order.size())return;String key=order.get(position);if(!pinned.remove(key))pinned.add(key);order.sort(Comparator.comparingInt(k->pinned.contains(k)?0:1));refresh.run();dialog.refresh();}
        });
        list.setOnItemLongClickListener((parent,view,position,id)->{String key=order.get(position);new HaiagaruDialog.Builder(activity).setTitle("位置を変更").setItems(new String[]{"一つ上へ","一つ下へ",pinned.contains(key)?"ピン留めを解除":"ピン留め"},(d,action)->{int at=order.indexOf(key);if(action==0&&at>0)Collections.swap(order,at,at-1);if(action==1&&at<order.size()-1)Collections.swap(order,at,at+1);if(action==2){if(!pinned.remove(key))pinned.add(key);}order.sort(Comparator.comparingInt(k->pinned.contains(k)?0:1));refresh.run();dialog.refresh();}).setNegativeButton("閉じる",null).show();return true;});refresh.run();dialog.show();
    }
    public static boolean click(Object fragment,int action){
        if(action!=MENU)return false;
        Activity activity=Haiagaru.toolbarActivity(fragment);
        if(activity!=null)show(activity,mode(fragment));
        return true;
    }
    private HomeThreadOrder(){}
}
