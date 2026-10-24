package app.morphe.extension.chmate;

import android.content.Context;
import android.view.Menu;
import java.lang.reflect.Field;
import java.util.List;
import java.util.HashSet;
import org.json.JSONObject;
import org.json.JSONArray;

/** Stable IDs shared by the native customization catalog and response actions. */
public final class ResponseMenuSettings {
    private static final int TOOLS=0x7e484a09;
    private static final ThreadLocal<Boolean> BUILD_TOOLS=new ThreadLocal<>();
    private static final java.util.Map<android.view.MenuItem,Runnable> TOOL_ACTIONS=new java.util.WeakHashMap<>();
    static void addTools(Menu menu,java.util.function.Consumer<Menu> fill){
        Context context=Haiagaru.applicationContextForExtension();
        if(Boolean.TRUE.equals(BUILD_TOOLS.get())||context==null||menu.findItem(TOOLS)!=null||!FeatureSwitches.enabled("responseExtraTools",false))return;
        android.app.Activity activity=Haiagaru.toolbarActivity(null);if(activity==null)return;
        Menu tools=new android.widget.PopupMenu(activity,new android.view.View(activity)).getMenu();
        BUILD_TOOLS.set(true);try{fill.accept(tools);}finally{BUILD_TOOLS.remove();}
        if(tools.size()==0)return;
        Runnable open=()->{String[] titles=new String[tools.size()];for(int i=0;i<titles.length;i++)titles[i]=tools.getItem(i).getTitle().toString();
            new HaiagaruDialog.Builder(activity).setTitle("追加ツール").setItems(titles,(dialog,index)->tools.performIdentifierAction(tools.getItem(index).getItemId(),0)).setNegativeButton("閉じる",null).show();};
        android.view.MenuItem item=menu.add(Menu.NONE,TOOLS,menu.size(),"追加ツール");TOOL_ACTIONS.put(item,open);item.setOnMenuItemClickListener(v->{open.run();return true;});
    }
    static boolean handleTools(Object item){if(!(item instanceof android.view.MenuItem)||((android.view.MenuItem)item).getItemId()!=TOOLS)return false;Runnable action=TOOL_ACTIONS.get(item);if(action!=null)action.run();return true;}
    private ResponseMenuSettings() {}
    static final int[] IDS = {0x7e484b01, 0x7e484a01, 0x7e484a03, 75, 76, 0x7e000077, 0x7e000078, 0x7e000079};
    static final String[] NAMES={"投稿者を強調","レスを保存","保存済みレスを見る","ﾜｯﾁｮｲで検索","ﾜｯﾁｮｲ下4桁をNG登録","ﾜｯﾁｮｲ下4桁で検索","ﾜｯﾁｮｲ上4桁で検索","ﾜｯﾁｮｲ上4桁をNG登録"};
    static boolean defaultVisible(int id){for(int action:IDS)if(action==id)return !FeatureSwitches.enabled(MinimalSetup.ACTIVE,false)&&(id==75||id==76);return true;}
    private static int icon(int id) {
        if(id==75)return wacchoiSearchIcon();
        if(id==0x7e484a01)return ResponseArchive.archiveIcon(true);
        if(id==0x7e484a03)return ResponseArchive.archiveIcon(false);
        return android.R.drawable.ic_menu_more;
    }
    static int wacchoiSearchIcon(){
        Context context=Haiagaru.applicationContextForExtension();
        int icon=context==null?0:context.getResources().getIdentifier("haiagaru_wacchoi_search","drawable",context.getPackageName());
        return icon!=0?icon:android.R.drawable.ic_menu_search;
    }
    public static Object catalog(Object model) {
        try {
            Context context=Haiagaru.applicationContextForExtension();
            String version=context.getPackageManager().getPackageInfo(context.getPackageName(),0).versionName;
            boolean legacy=version.equals("0.8.10.191 dev");
            List<?> source=null;
            if(model instanceof List)source=(List<?>)model;
            else for(Field f:model.getClass().getDeclaredFields())if(List.class.isAssignableFrom(f.getType())) {f.setAccessible(true);source=(List<?>)f.get(model);break;}
            if(source==null||source.isEmpty())return model;
            @SuppressWarnings("unchecked") List<Object> list=(List<Object>)source;
            Class<?> spec=list.get(0).getClass();
            Field id=spec.getDeclaredField(legacy?"c":"a");id.setAccessible(true);
            Field title=spec.getDeclaredField("b");title.setAccessible(true);
            Field summary=spec.getDeclaredField(legacy?"e":"d");summary.setAccessible(true);
            HashSet<Integer> seen=new HashSet<>();
            java.util.Iterator<Object> iterator=list.iterator();
            while(iterator.hasNext()) {
                Object item=iterator.next();int key=id.getInt(item);
                if(!seen.add(key)){iterator.remove();continue;}
                if(key>=70&&key<=74){int text=context.getResources().getIdentifier("haiagaru_response_share_"+(key-70),"string",context.getPackageName());title.setInt(item,text);summary.setInt(item,text);}
            }
            for(int i=0;i<IDS.length;i++)if(seen.add(IDS[i])) {
                int text=context.getResources().getIdentifier("haiagaru_response_action_"+i,"string",context.getPackageName());
                list.add(spec.getConstructor(int.class,int.class,int.class,int.class,boolean.class).newInstance(IDS[i],icon(IDS[i]),text,text,defaultVisible(IDS[i])));
            }
        }catch(Exception error){android.util.Log.w("Haiagaru","Response toolbar catalog",error);}
        return model;
    }
    public static void catalog226(Object builder) {
        try {
            Context context = Haiagaru.applicationContextForExtension();
            Field field = builder.getClass().getDeclaredField("a"); field.setAccessible(true);
            @SuppressWarnings("unchecked") List<Object> list = (List<Object>) field.get(builder);
            Class<?> spec = Class.forName("jp.syoboi.a2chMate.feature.toolbar.ToolbarButtonSpec", false, builder.getClass().getClassLoader());
            Field id = spec.getDeclaredField("c"); id.setAccessible(true);
            Field title = spec.getDeclaredField("b"); title.setAccessible(true);
            Field summary = spec.getDeclaredField("e"); summary.setAccessible(true);
            HashSet<Integer> seen = new HashSet<>();
            java.util.Iterator<Object> rows = list.iterator();
            while(rows.hasNext()) {
                Object row=rows.next(); int key=id.getInt(row);
                if(!seen.add(key)) { rows.remove(); continue; }
                // These are five separate stock share destinations, not duplicate actions.
                if(key>=70 && key<=74) {
                    int text=context.getResources().getIdentifier("haiagaru_response_share_"+(key-70),"string",context.getPackageName());
                    title.setInt(row,text); summary.setInt(row,text);
                }
            }
            for(int i=0;i<IDS.length;i++) if(seen.add(IDS[i])) {
                int text=context.getResources().getIdentifier("haiagaru_response_action_"+i,"string",context.getPackageName());
                list.add(spec.getConstructor(int.class,int.class,int.class,int.class,boolean.class)
                        .newInstance(IDS[i],icon(IDS[i]),text,text,defaultVisible(IDS[i])));
            }
        } catch(Exception error) { android.util.Log.w("Haiagaru","Response toolbar catalog",error); }
    }
    static boolean visible(int id) {
        Context context = Haiagaru.applicationContextForExtension();
        if((id==0x7e484a01||id==0x7e484a03)&&!FeatureSwitches.enabled("responseArchiveEnabled",true))return false;
        String key=longPressKey(id);
        if(context!=null){
            android.content.SharedPreferences prefs=context.getSharedPreferences("haiagaru_response_actions",0);
            // Older Wacchoi toggles wrote both the name-menu key and visibility.
            // Those coupled overrides must not force an item into the body menu.
            int mode=visibilityMode(prefs,id);
            if(mode==2)return false;
            if(mode==1)return true;
        }
        if(Boolean.TRUE.equals(BUILD_TOOLS.get()))return true;
        JSONObject settings = savedSettings();
        if (settings == null) return defaultVisible(id);
        try {
            JSONArray rows = settings.optJSONArray("buttons");
            if (rows != null) for (int i = 0; i < rows.length(); i++) {
                JSONObject row = rows.optJSONObject(i);
                if (row != null && rowId(row) == id)
                    return row.optBoolean("visible", defaultVisible(id));
            }
        } catch (RuntimeException error) {
            android.util.Log.w("Haiagaru", "Response toolbar visibility", error);
        }
        return defaultVisible(id);
    }
    private static String longPressKey(int id){
        return id==75?"wacchoiLongPressSearch":id==76?"wacchoiLongPressSuffixNg":id==0x7e000077?"wacchoiLongPressSuffixSearch":
                id==0x7e000078?"wacchoiLongPressPrefixSearch":id==0x7e000079?"wacchoiLongPressPrefixNg":null;
    }
    private static String visibilityKey(int id){return longPressKey(id)==null?"visibility."+id:"responseVisibility."+id;}
    private static int visibilityMode(android.content.SharedPreferences prefs,int id){
        String key=longPressKey(id);
        // 76 never had a coupled name-menu toggle: its old visibility remains
        // a legitimate body-menu preference even after adding the new toggle.
        return prefs.getInt(visibilityKey(id),id!=76&&key!=null&&prefs.contains(key)?0:prefs.getInt("visibility."+id,0));
    }
    static boolean nameMenuVisible(int id){
        Context context=Haiagaru.applicationContextForExtension();String key=longPressKey(id);
        if(context!=null&&key!=null){android.content.SharedPreferences prefs=context.getSharedPreferences("haiagaru_response_actions",0);
            if(prefs.contains(key))return prefs.getBoolean(key,true);}
        return id==76?defaultVisible(id):visible(id);
    }
    static void storeVisibility(android.content.SharedPreferences prefs,int id,int mode){
        prefs.edit().putInt(visibilityKey(id),mode).apply();
    }
    static void addWacchoiSearchSetting(android.widget.LinearLayout layout, android.app.Activity activity) {
        addWacchoiLongPressToggle(layout, activity, "ワッチョイ長押しに「ワッチョイ検索」を表示",
                "wacchoiLongPressSearch", 75);
        addWacchoiLongPressToggle(layout, activity, "ワッチョイ長押しに「下4桁で検索」を表示",
                "wacchoiLongPressSuffixSearch", 0x7e000077);
        addWacchoiLongPressToggle(layout, activity, "ワッチョイ長押しに「上4桁で検索」を表示",
                "wacchoiLongPressPrefixSearch", 0x7e000078);
        addWacchoiLongPressToggle(layout, activity, "ワッチョイ長押しに「下4桁をNG登録」を表示",
                "wacchoiLongPressSuffixNg", 76);
        addWacchoiLongPressToggle(layout, activity, "ワッチョイ長押しに「上4桁をNG登録」を表示",
                "wacchoiLongPressPrefixNg", 0x7e000079);
        android.widget.TextView help = new android.widget.TextView(activity);
        help.setText("ワッチョイ部分の長押しだけに適用します。レス本文の長押し・ツールバーの表示設定とは独立しています。変更後にメニューを開き直してください。");
        layout.addView(help);
    }
    private static void addWacchoiLongPressToggle(android.widget.LinearLayout layout,
            android.app.Activity activity, String label, String key, int itemId) {
        android.widget.Switch toggle = new android.widget.Switch(activity);
        toggle.setText(label);
        toggle.setChecked(nameMenuVisible(itemId));
        toggle.setOnCheckedChangeListener((button, checked) -> activity
                .getSharedPreferences("haiagaru_response_actions", 0).edit()
                .putBoolean(key, checked).apply());
        layout.addView(toggle);
    }
    static void addSettings(android.widget.LinearLayout layout,android.app.Activity activity){
        android.widget.Switch extra=new android.widget.Switch(activity);extra.setText("レス長押しに「追加ツール」を表示");extra.setChecked(FeatureSwitches.enabled("responseExtraTools",false));
        extra.setOnCheckedChangeListener((button,on)->activity.getSharedPreferences(WacchoiSearchOptions.PREFS,0).edit().putBoolean("responseExtraTools",on).apply());layout.addView(extra);
        android.widget.Button button=new android.widget.Button(activity);button.setText("レス長押し・ツールバー項目を個別設定");layout.addView(button);
        button.setOnClickListener(v->{android.widget.LinearLayout panel=new android.widget.LinearLayout(activity);panel.setOrientation(1);
            android.widget.TextView help=new android.widget.TextView(activity);help.setText("項目ごとに「標準のツールバー設定に従う／常に表示／常に非表示」を指定します。既存の配置順は変更しません。画面を開き直すと反映します。\n「追加ツール」をオンにすると、ツールバーの表示設定とは別に、選んだレスで利用できるHaiagaruの操作をまとめて開けます。");panel.addView(help);
            android.content.SharedPreferences prefs=activity.getSharedPreferences("haiagaru_response_actions",0);
            for(int i=0;i<IDS.length;i++){final int id=IDS[i];final String name=NAMES[i];android.widget.Button row=new android.widget.Button(activity);Runnable update=()->{int mode=visibilityMode(prefs,id);row.setText(name+"："+(mode==1?"常に表示":mode==2?"常に非表示":"標準設定"));};update.run();panel.addView(row);
                row.setOnClickListener(w->new HaiagaruDialog.Builder(activity).setTitle(name).setSingleChoiceItems(new String[]{"標準のツールバー設定に従う","常に表示","常に非表示"},visibilityMode(prefs,id),(d,n)->{storeVisibility(prefs,id,n);update.run();d.dismiss();}).setNegativeButton("キャンセル",null).show());
            }
            android.widget.ScrollView scroll=new android.widget.ScrollView(activity);scroll.addView(panel);new HaiagaruDialog.Builder(activity).setTitle("レスメニューの項目別設定").setView(scroll).setPositiveButton("閉じる",null).show();
        });
    }

    /**
     * Native response actions are created before Haiagaru's actions. Supplying the
     * saved catalog index as MenuItem order lets Android interleave those later
     * additions at the position chosen in ChMate's toolbar settings.
     */
    static int order(int id, int fallback) {
        JSONObject settings = savedSettings();
        if (settings == null) return fallback;
        try {
            JSONArray rows = settings.optJSONArray("buttons");
            if (rows != null) for (int i = 0; i < rows.length(); i++) {
                JSONObject row = rows.optJSONObject(i);
                if (row == null || rowId(row) != id) continue;
                // ChMate normally persists order by array position. Some newer
                // settings writers also retain an explicit slot alongside it;
                // prefer that value so all added actions follow drag-reordering.
                if (row.has("position")) return Math.max(0, row.optInt("position", i));
                if (row.has("order")) return Math.max(0, row.optInt("order", i));
                return i;
            }
        } catch (RuntimeException error) {
            android.util.Log.w("Haiagaru", "Response toolbar order", error);
        }
        return fallback;
    }

    private static int rowId(JSONObject row) {
        Object raw = row.opt("id");
        if (raw instanceof Number) return ((Number) raw).intValue();
        if (raw instanceof String) {
            String value = ((String) raw).trim();
            try { return value.startsWith("0x") || value.startsWith("0X")
                    ? (int) Long.parseLong(value.substring(2), 16) : Integer.parseInt(value); }
            catch (NumberFormatException ignored) { }
        }
        return Integer.MIN_VALUE;
    }

    private static JSONObject savedSettings() {
        Context context=Haiagaru.applicationContextForExtension();
        if(context==null)return null;
        try {
            String saved=context.getSharedPreferences("resMenuDialog",0).getString("toolbarSettings","");
            return saved.isEmpty() ? null : new JSONObject(saved);
        } catch(Exception error) {
            android.util.Log.w("Haiagaru","Response toolbar settings",error);
            return null;
        }
    }
    public static void prepare(Object object) {
        if(!(object instanceof Menu))return;
        Menu menu=(Menu)object;
        menu.removeItem(TOOLS);
        // Native catalog entries are placeholders; bind fresh per-response callbacks below.
        for(int id:IDS)menu.removeItem(id);
    }
}
