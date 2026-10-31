package app.morphe.extension.chmate;

import android.content.Context;
import android.view.View;
import android.widget.*;
import java.lang.reflect.*;
import java.net.URI;
import java.util.*;

/** A display projection: native search order and click targets remain unchanged. */
public final class CachedSearchOrder {
    static final String KEY="cachedSearchCreatedOrder";
    private static final String[] LABELS={"標準の並び順","全板混合：スレ作成日時の新しい順","全板混合：スレ作成日時の古い順",
            "全レス混合：レス投稿日時の新しい順","全レス混合：レス投稿日時の古い順"};
    private static final Map<Object,List<?>> LEGACY=new WeakHashMap<>();
    static int mode(Context c){int n=SettingsProfiles.prefs(c).getInt(KEY,0);return n>=0&&n<LABELS.length?n:0;}
    static long created(String url){
        try{String path=URI.create(url).getPath();String[] pieces=path.split("/");
            for(int i=0;i<pieces.length;i++)if(pieces[i].matches("[0-9]{9,11}"))return Long.parseLong(pieces[i]);
        }catch(RuntimeException ignored){}return 0;
    }
    static String url(Object row)throws Exception{
        String name=row.getClass().getName();
        String field=name.equals("o.mg")?"b":name.equals("o.createFromParcel")?"e":name.equals("o.startResolutionForResult")?"d":null;
        if(field==null)throw new IllegalArgumentException("Unknown native search row");
        Field f=row.getClass().getDeclaredField(field);f.setAccessible(true);return (String)f.get(row);
    }
    static List<?> sorted(List<?> rows,int mode)throws Exception{
        if(mode==0)return rows;
        if(mode==3||mode==4)return CachedResponseOrder.sorted(rows,mode==3);
        IdentityHashMap<Object,Long> dates=new IdentityHashMap<>();
        for(Object row:rows)dates.put(row,created(url(row)));
        ArrayList<Object> copy=new ArrayList<>(rows);
        copy.sort((a,b)->{long x=dates.get(a),y=dates.get(b);if(x==0||y==0)return x==y?0:x==0?1:-1;
            return mode==1?Long.compare(y,x):Long.compare(x,y);});
        return copy;
    }
    public static Object project(Object state){
        Context c=Haiagaru.applicationContextForExtension();if(c==null||mode(c)==0||state==null)return state;
        try{
            String name=state.getClass().getName();boolean middle=name.equals("o.createDirectorydefault$IconCompatParcelizer");
            if(!middle&&!name.equals("o.isAfterLast$IconCompatParcelizer"))return state;
            Field rows=field(state,middle?"c":"b"),query=field(state,middle?"b":"c");
            Constructor<?> constructor=state.getClass().getDeclaredConstructor(query.getType(),List.class,int.class,int.class);
            constructor.setAccessible(true);
            return constructor.newInstance(query.get(state),sorted((List<?>)rows.get(state),mode(c)),
                    field(state,middle?"a":"d").getInt(state),field(state,"e").getInt(state));
        }catch(Exception ignored){return state;}
    }
    private static Field field(Object o,String name)throws Exception{Field f=o.getClass().getDeclaredField(name);f.setAccessible(true);return f;}
    public static void beforeLegacyNotify(Object adapter){
        try{
            List<?> rows=(List<?>)field(adapter,"c").get(adapter);LEGACY.put(adapter,new ArrayList<>(rows));
            applyLegacy(adapter);
        }catch(Exception ignored){}
    }
    @SuppressWarnings({"rawtypes","unchecked"})
    private static void applyLegacy(Object adapter)throws Exception{
        List base=LEGACY.get(adapter);if(base==null)return;
        Context c=Haiagaru.applicationContextForExtension();if(c==null)return;
        List rows=(List)field(adapter,"c").get(adapter);List ordered=sorted(base,mode(c));rows.clear();rows.addAll(ordered);
    }
    static void addControl(LinearLayout root,Object fragment,View nativeView){
        Context context=root.getContext();int[] colors=HaiagaruUi.toolTabHeaderColors(context);
        Spinner order=new Spinner(context);order.setContentDescription("取得済みスレ検索の並び順");
        order.setTag("haiagaru.cachedSearchOrder");
        order.setAdapter(new ArrayAdapter<>(context,android.R.layout.simple_spinner_dropdown_item,LABELS));
        order.setSelection(mode(context));int[] previous={mode(context)};
        LinearLayout line=new LinearLayout(context);line.setGravity(android.view.Gravity.CENTER_VERTICAL);
        TextView label=new TextView(context);label.setText("並び順");label.setTextColor(colors[1]);line.addView(label);
        line.addView(order,new LinearLayout.LayoutParams(0,-2,1));root.addView(line,new LinearLayout.LayoutParams(-1,-2));
        order.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener(){
            public void onNothingSelected(AdapterView<?> parent){}
            public void onItemSelected(AdapterView<?> parent,View view,int position,long id){
                if(previous[0]==position)return;previous[0]=position;
                SettingsProfiles.prefs(context).edit().putInt(KEY,position).apply();
                try{
                    if(fragment.getClass().getName().equals("jp.syoboi.a2chMate.fragment.SearchFragment")){
                        Object adapter=field(fragment,"b").get(fragment);applyLegacy(adapter);((BaseAdapter)adapter).notifyDataSetChanged();
                    }else CachedWacchoiSearch.refreshComposeForm(nativeView);
                }catch(Exception ignored){Toast.makeText(context,"並び順は検索画面を開き直すと反映します",Toast.LENGTH_SHORT).show();}
            }
        });
    }
    private CachedSearchOrder(){}
}
