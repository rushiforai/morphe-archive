package app.morphe.extension.chmate;

import android.app.*;
import android.content.*;
import android.os.*;
import android.view.*;
import android.widget.*;
import java.lang.ref.WeakReference;
import java.io.IOException;
import java.lang.reflect.*;
import java.util.*;
import java.util.concurrent.*;

/** HOME search controls and saved results, rendered and opened by ChMate's original list. */
public final class GlobalSearchHome {
    static final String BACKGROUND="globalSearchBackground",HISTORY="globalSearchHistory",PARTIAL="globalSearchPartial";
    static final String EXTRA="haiagaru.globalSearchResult";
    private static final ExecutorService DISPLAY_IO=Executors.newSingleThreadExecutor(r->{Thread t=new Thread(r,"Haiagaru-search-view");t.setDaemon(true);return t;});
    private static final Map<String,Runnable> REFRESHED=new HashMap<>();
    private static final Map<Activity,String> DISPLAY_QUERY=new WeakHashMap<>();
    private static final Handler MAIN=new Handler(Looper.getMainLooper());
    private static final ThreadLocal<Boolean> BYPASS=new ThreadLocal<>();
    private static final ThreadLocal<Object> OVERRIDE=new ThreadLocal<>();
    private static final Map<Object,String> OPEN_PROVIDERS=Collections.synchronizedMap(new WeakHashMap<>());
    private static final ConcurrentMap<String,String> OPEN_QUERIES=new ConcurrentHashMap<>();
    private static final Map<Object,Action> ACTIONS=Collections.synchronizedMap(new WeakHashMap<>());
    private static final Map<Activity,String> DISPLAYED=new WeakHashMap<>();
    private static final List<WeakReference<Object>> HOMES=new ArrayList<>();
    private static final class Action{final String query,id;Action(String query,String id){this.query=query;this.id=id;}}
    private static final class Type {
        final Class<?> row,kind;final String enumField,queryField;
        Type(ClassLoader loader,String version)throws Exception{
            String name=version.contains("191")?"o.onAdDisplayed$setHasDecor":version.contains("226")?"o.Yy2$value":"o.getAvailabilityStatus$r8lambdavCwjfXDiSGcirCy4I008VOiJ_lw";
            row=loader.loadClass(name);Constructor<?> ctor=row.getConstructors()[0];kind=ctor.getParameterTypes()[1];
            enumField=version.contains("226")?"c":"a";queryField=version.contains("242")?"d":"e";
        }
        Object make(String title,String query,String value)throws Exception{
            Object item=null;for(Object k:kind.getEnumConstants())if(((Enum<?>)k).name().equals(value))item=k;
            if(item==null)throw new IllegalStateException("Unknown native search action");
            return row.getConstructor(String.class,kind,String.class).newInstance(title,item,query);
        }
    }
    static boolean enabled(Context c){return c!=null&&SettingsProfiles.prefs(c).getBoolean(BACKGROUND,true);}
    static boolean history(Context c){return c!=null&&SettingsProfiles.prefs(c).getBoolean(HISTORY,true);}
    static boolean partial(Context c){return c!=null&&SettingsProfiles.prefs(c).getBoolean(PARTIAL,true);}
    static void settings(LinearLayout root,Activity a){
        LiveSettings live=new LiveSettings(SettingsProfiles.prefs(a),()->{});
        String[] keys={BACKGROUND,HISTORY,PARTIAL};
        String[] labels={"全板検索をバックグラウンドで実行して完了を通知","過去の全板検索結果を取得日付きで再表示","検索中に取得できた結果も表示"};
        for(int i=0;i<keys.length;i++){
            LiveSettings.Toggle t=new LiveSettings.Toggle(a);t.setText(labels[i]);t.setChecked(SettingsProfiles.prefs(a).getBoolean(keys[i],true));root.addView(t);live.toggle(t,keys[i]);
        }
        TextView help=new TextView(a);help.setText("通知や保存済みの結果はChMate標準の全板検索結果一覧で開きます。保存済み結果の再表示では再検索しません。バックグラウンド検索をオフにすると従来の検索に戻ります。途中表示がオンの場合は取得済み結果を先に表示し、取得できた板から追加します。保存は最新50件までです。");root.addView(help);
    }
    private static Type type(Context c)throws Exception{return new Type(c.getClassLoader(),c.getPackageManager().getPackageInfo(c.getPackageName(),0).versionName);}
    public static List<?> rows(List<?> input){
        Context c=Haiagaru.applicationContextForExtension();
        input=withoutRegionalBoardDuplicates(c,input);
        if(input==null||!enabled(c))return input;
        try{
            Type t=type(c);ArrayList<Object> out=new ArrayList<>();
            Map<String,Integer> localRows=new HashMap<>(),globalRows=new HashMap<>();
            Map<String,Object> extra=new LinkedHashMap<>();
            for(Object row:input){
                if(!t.row.isInstance(row)){out.add(row);continue;}
                String query=(String)NativeFields.find(t.row,t.queryField).get(row);
                String kind=((Enum<?>)NativeFields.find(t.row,t.enumField).get(row)).name();
                if(!"FF2CH".equals(kind)&&!"LOCAL".equals(kind)){out.add(row);continue;}
                if(query==null||query.trim().isEmpty()){out.add(row);continue;}
                if(ACTIONS.containsKey(row)&&ACTIONS.get(row).id!=null){continue;} // Do not duplicate inserted history controls.
                if("LOCAL".equals(kind)){
                    localRows.putIfAbsent(query,out.size());
                    out.add(t.make("取得済みのスレから検索",query,kind));continue;
                }
                Object global=t.make("全板から「"+query+"」を検索",query,"FF2CH");
                ACTIONS.put(global,new Action(query,null));globalRows.putIfAbsent(query,out.size());out.add(global);
                GlobalTitleSearchService.Job running=GlobalTitleSearchService.running(query);
                if(running!=null){
                    if(partial(c)){
                        Object result=t.make("検索中のスレ一覧を表示（"+GlobalSearchResults.count(running.text)+"件）",query,"FF2CH");
                        ACTIONS.put(result,new Action(query,running.id));extra.put(query,result);
                    }
                }else if(history(c)){
                    String id=GlobalSearchResults.latest(c,query);
                    if(id!=null){Object saved=t.make("過去に取得したスレ一覧を表示（"+GlobalSearchResults.dateLabel(GlobalSearchResults.date(c,query))+"）",query,"FF2CH");
                        ACTIONS.put(saved,new Action(query,id));extra.put(query,saved);}
                }
            }
            if(extra.isEmpty())return out;
            Map<Integer,Object> after=new HashMap<>();
            for(Map.Entry<String,Object> item:extra.entrySet()){
                String query=item.getKey();
                after.put(localRows.getOrDefault(query,globalRows.get(query)),item.getValue());
            }
            ArrayList<Object> ordered=new ArrayList<>(out.size()+extra.size());
            for(int i=0;i<out.size();i++){
                ordered.add(out.get(i));
                Object action=after.get(i);if(action!=null)ordered.add(action);
            }
            return ordered;
        }catch(Exception error){android.util.Log.w("HaiagaruSearch","Native HOME search controls unchanged",error);return input;}
    }

    private static List<?> withoutRegionalBoardDuplicates(Context context, List<?> input) {
        if (context == null || input == null) return input;
        Set<String> seen = new HashSet<>();
        ArrayList<Object> filtered = null;
        SiteBoardGateway gateway = null;
        for (int index = 0; index < input.size(); index++) {
            Object row = input.get(index);
            String identity = null;
            if (row != null && row.getClass().getName().equals("o.onAdDisplayed$IconCompatParcelizer")) {
                try {
                    String id = (String) NativeFields.find(row.getClass(), "a").get(row);
                    String decoded = android.net.Uri.decode(id);
                    if (decoded.startsWith("127.0.0.1:") && decoded.contains("/hb")) {
                        if (gateway == null) gateway = SiteBoardGateway.get(context);
                        String address = gateway.originalUrl("http://" + decoded + "/");
                        identity = SiteBoardProtocol.bakusaiBoardIdentity(address);
                    }
                } catch (Exception ignored) {
                    // Preserve native rows whose board could not be resolved.
                }
            }
            if (identity != null && !seen.add(identity)) {
                if (filtered == null) filtered = new ArrayList<>(input.subList(0, index));
            } else if (filtered != null) {
                filtered.add(row);
            }
        }
        return filtered == null ? input : filtered;
    }
    public static void menu(Object fragment,Menu menu){
        if(menu==null)return;Activity a=Haiagaru.toolbarActivity(fragment);if(a==null)return;
        final int itemId=0x4847387;MenuItem item=menu.findItem(itemId);
        String query=DISPLAY_QUERY.get(a);boolean visible=enabled(a)&&query!=null&&query.equals(filterText(a.getWindow().getDecorView()));
        if(item==null&&visible){item=menu.add(0,itemId,menu.size(),"全板検索を最新に更新");item.setShowAsAction(MenuItem.SHOW_AS_ACTION_NEVER);}
        if(item!=null){item.setVisible(visible);item.setOnMenuItemClickListener(v->{String q=DISPLAY_QUERY.get(a);if(q!=null)start(a,fragment,q);return true;});}
    }
    public static Object overrideRow(Object original){Object replacement=OVERRIDE.get();return replacement==null?original:replacement;}
    public static boolean legacyClick(Object fragment,ListView list,int position){
        if(Boolean.TRUE.equals(BYPASS.get())||list==null||position<0||position>=list.getCount())return false;
        return click(fragment,list.getItemAtPosition(position));
    }
    public static boolean click(Object fragment,Object row){
        if(Boolean.TRUE.equals(BYPASS.get()))return false;
        if(HomeThreadOrder.toggleCategory(fragment,row))return true;
        Activity a=Haiagaru.toolbarActivity(fragment);if(!enabled(a))return false;
        try{
            Type t=type(a);if(!t.row.isInstance(row))return false;
            String kind=((Enum<?>)NativeFields.find(t.row,t.enumField).get(row)).name();if(!"FF2CH".equals(kind)){DISPLAYED.remove(a);DISPLAY_QUERY.remove(a);return false;}
            String query=(String)NativeFields.find(t.row,t.queryField).get(row);
            Action action=ACTIONS.get(row);
            if(action!=null&&action.id!=null){show(a,fragment,action.id);return true;}
            GlobalTitleSearchService.Job running=GlobalTitleSearchService.running(query);
            if(running!=null){if(partial(a))show(a,fragment,running.id);else Toast.makeText(a,"検索中です。完了すると通知します。",0).show();return true;}
            String saved=history(a)?GlobalSearchResults.latest(a,query):null;
            if(saved!=null)show(a,fragment,saved);
            else start(a,fragment,query);
            return true;
        }catch(Exception error){android.util.Log.w("HaiagaruSearch","Cannot start background search",error);return false;}
    }
    private static void start(Activity a,Object fragment,String query){
        // Ask once from the user action; denied permission never silently claims completion delivery.
        if(Build.VERSION.SDK_INT>=33&&a.checkSelfPermission("android.permission.POST_NOTIFICATIONS")!=android.content.pm.PackageManager.PERMISSION_GRANTED){
            a.requestPermissions(new String[]{"android.permission.POST_NOTIFICATIONS"},0x4837);
            Toast.makeText(a,"検索を開始します。通知を許可すると完了をお知らせできます。",1).show();
        }
        GlobalTitleSearchService.launch(a,query);
        if(partial(a)){
            MAIN.postDelayed(()->{GlobalTitleSearchService.Job running=GlobalTitleSearchService.running(query);
                if(running!=null&&!a.isFinishing()&&partial(a))show(a,fragment,running.id);},200);
        }
        Toast.makeText(a,"バックグラウンドで検索します。途中結果と完了は通知から開けます。",1).show();
    }
    static Intent intent(Context c,String id){
        return new Intent().setClassName(c,"jp.syoboi.a2chMate.activity.HomeActivity").setAction("app.haiagaru.SHOW_GLOBAL_SEARCH")
            .setData(android.net.Uri.parse("haiagaru-search://result/"+id)).putExtra(EXTRA,id).addFlags(Intent.FLAG_ACTIVITY_NEW_TASK|Intent.FLAG_ACTIVITY_CLEAR_TOP);
    }
    public static void resumed(Object fragment){
        Activity a=Haiagaru.toolbarActivity(fragment);if(a==null)return;
        HOMES.removeIf(ref->ref.get()==null||ref.get()==fragment);HOMES.add(new WeakReference<>(fragment));
        String id=a.getIntent().getStringExtra(EXTRA);if(id==null)return;
        a.getIntent().removeExtra(EXTRA);show(a,fragment,id);
    }
    public static void received(Activity activity,Intent intent){
        if(intent==null||!intent.hasExtra(EXTRA)||!"app.haiagaru.SHOW_GLOBAL_SEARCH".equals(intent.getAction()))return;
        activity.setIntent(intent);
        // Some native HOME implementations stay resumed when notification brings them forward.
        MAIN.post(()->{
            for(WeakReference<Object> ref:new ArrayList<>(HOMES)){
                Object fragment=ref.get();
                if(fragment==null||Haiagaru.toolbarActivity(fragment)!=activity)continue;
                try{
                    View root=(View)fragment.getClass().getMethod("getView").invoke(fragment);
                    if(root!=null&&root.isShown()){resumed(fragment);break;}
                }catch(Exception ignored){}
            }
        });
    }
    static void refresh(String query){
        if(Looper.myLooper()!=Looper.getMainLooper()){MAIN.post(()->refresh(query));return;}
        Runnable pending=REFRESHED.remove(query);if(pending!=null)MAIN.removeCallbacks(pending);
        Runnable refresh=()->{REFRESHED.remove(query);refreshNow(query);};
        REFRESHED.put(query,refresh);MAIN.postDelayed(refresh,350);
    }
    private static void refreshNow(String query){
        for(WeakReference<Object> ref:new ArrayList<>(HOMES)){
            Object fragment=ref.get();if(fragment==null)continue;Activity a=Haiagaru.toolbarActivity(fragment);
            if(a==null||a.isFinishing()||!partial(a)||!query.equals(DISPLAY_QUERY.get(a)))continue;
            try{View root=(View)fragment.getClass().getMethod("getView").invoke(fragment);if(root==null||!root.isShown())continue;
                String current=filterText(a.getWindow().getDecorView());
                if(current==null||!query.equals(current)){DISPLAYED.remove(a);DISPLAY_QUERY.remove(a);continue;}
            }catch(Exception ignored){continue;}
            String id=DISPLAYED.get(a);GlobalTitleSearchService.Job running=GlobalTitleSearchService.byId(id);
            if(id!=null&&running!=null&&query.equals(running.query))show(a,fragment,id);
        }
    }
    private static void show(Activity a,Object fragment,String id){
        DISPLAY_IO.execute(()->{
            try{
                GlobalSearchResults.Result r=GlobalTitleSearchService.result(a,id);
                if(r==null)throw new IOException("保存済みの結果が見つかりません");
                if(r.partial&&GlobalTitleSearchService.running(r.query)!=null&&!partial(a)){
                    MAIN.post(()->Toast.makeText(a,"途中結果の表示はオフです。完了後に開いてください。",1).show());return;
                }
                String endpoint=SiteBoardGateway.get(a).globalSearchUrl(id);
                MAIN.post(()->{if(!a.isFinishing()&&!a.isDestroyed())try{
                    OPEN_QUERIES.put(r.query,endpoint);DISPLAYED.put(a,id);DISPLAY_QUERY.put(a,r.query);nativeOpen(fragment,r.query);a.invalidateOptionsMenu();
                }catch(Exception e){OPEN_QUERIES.remove(r.query);android.util.Log.w("HaiagaruSearch","Cannot show native search results",e);Toast.makeText(a,"全板検索結果を開けませんでした",1).show();}});
            }catch(Exception e){MAIN.post(()->Toast.makeText(a,e.getMessage(),1).show());}
        });
    }
    static boolean viewing(Object provider){return OPEN_PROVIDERS.remove(provider)!=null;}
    public static String url(Object provider,String query,String original){
        String endpoint=OPEN_QUERIES.remove(query);if(endpoint==null)return original;
        OPEN_PROVIDERS.put(provider,endpoint);return endpoint;
    }
    private static void nativeOpen(Object fragment,String query)throws Exception{
        Activity a=Haiagaru.toolbarActivity(fragment);Type type=type(a);Object row=type.make("全板から「"+query+"」を検索",query,"FF2CH");
        BYPASS.set(true);OVERRIDE.set(row);
        try{
            filter(a.getWindow().getDecorView(),query);
            if(fragment.getClass().getName().equals("jp.syoboi.a2chMate.ui.home.HomeFragment")){
                Method dispatch=fragment.getClass().getDeclaredMethod("d",type.row.getSuperclass());dispatch.setAccessible(true);dispatch.invoke(fragment,row);
            }else{
                boolean old=fragment.getClass().getName().equals("o.r8lambdaTb_p0z6z2AqSZIga1YhmAVmiTPk");
                View root=(View)fragment.getClass().getMethod("getView").invoke(fragment);
                View list=FilterPosition.findListForBinding(root);
                Method dispatch=fragment.getClass().getDeclaredMethod(old?"Wx_":"a",ListView.class,View.class,int.class,long.class);
                dispatch.setAccessible(true);dispatch.invoke(fragment,list,null,0,0L);
            }
        }finally{OVERRIDE.remove();BYPASS.remove();}
    }
    private static String filterText(View root){
        try{Object value=root.getClass().getMethod("haiagaruGlobalSearchQuery").invoke(root);return value instanceof String?(String)value:null;
        }catch(Exception ignored){}
        if(root instanceof ViewGroup){ViewGroup g=(ViewGroup)root;for(int i=0;i<g.getChildCount();i++){String found=filterText(g.getChildAt(i));if(found!=null)return found;}}
        return null;
    }
    private static EditText input(View root){
        if(root instanceof EditText)return (EditText)root;
        if(root instanceof ViewGroup){ViewGroup group=(ViewGroup)root;for(int i=0;i<group.getChildCount();i++){EditText text=input(group.getChildAt(i));if(text!=null)return text;}}
        return null;
    }
    private static boolean filter(View root,String query){
        try{Method method=root.getClass().getMethod("setFilter",CharSequence.class);
            // Open the original search input and dispatch its TextWatcher. setFilter alone
            // only paints the toolbar and does not change the HOME model's search query.
            for(Method show:root.getClass().getDeclaredMethods())if(show.getReturnType()==void.class&&Arrays.equals(show.getParameterTypes(),new Class<?>[]{boolean.class,boolean.class})){show.setAccessible(true);show.invoke(root,true,false);break;}
            EditText edit=input(root);if(edit!=null&&!query.contentEquals(edit.getText()))edit.setText(query);
            method.invoke(root,query);return true;
        }catch(ReflectiveOperationException ignored){}
        if(root instanceof ViewGroup){ViewGroup group=(ViewGroup)root;for(int i=0;i<group.getChildCount();i++)if(filter(group.getChildAt(i),query))return true;}
        return false;
    }
    private GlobalSearchHome(){}
}
