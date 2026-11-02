package app.morphe.extension.chmate;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.net.Uri;
import android.view.View;
import android.widget.*;
import java.lang.reflect.*;

/** Optional tools in the native type-4 tab model; phone navigation is unchanged. */
public final class NativeToolTabs {
    public static final String KEY="nativeToolTabs";
    public static final String HEADER_HEIGHT_KEY="nativeToolTabHeaderHeightDp";
    public static boolean dispatchArchiveBack(Activity activity,android.view.KeyEvent event){
        if(event==null||event.getKeyCode()!=android.view.KeyEvent.KEYCODE_BACK)return false;
        View root=activity.getWindow().peekDecorView();
        return root!=null&&dispatchArchiveBack(root,event);
    }
    private static boolean dispatchArchiveBack(View view,android.view.KeyEvent event){
        if(!view.isShown())return false;
        if(view instanceof NativeToolTabSwipeLayout&&((NativeToolTabSwipeLayout)view).closeArchiveOnBack(event))return true;
        if(view instanceof android.view.ViewGroup){
            android.view.ViewGroup group=(android.view.ViewGroup)view;
            for(int i=group.getChildCount()-1;i>=0;i--)if(dispatchArchiveBack(group.getChildAt(i),event))return true;
        }
        return false;
    }
    static int headerHeightDp(android.content.Context context){
        return Math.max(48,Math.min(80,context.getSharedPreferences(WacchoiSearchOptions.PREFS,0)
                .getInt(HEADER_HEIGHT_KEY,48)));
    }
    public static final String SETTINGS_KEY="nativeToolTabSettings", EDDI_KEY="nativeToolTabEddi";
    public static final String SEARCH_KEY="nativeToolTabSearch", CHECKER_KEY="nativeToolTabChecker", HISSI_KEY="nativeToolTabHissi", FULL_KEY="nativeToolTabWacchoi";
    private static final String PREFIX="haiagaru-tool://";
    private static final String FROM_TABLET="haiagaru.settings.fromTablet";
    private static java.lang.ref.WeakReference<Activity> settingsHost=new java.lang.ref.WeakReference<>(null);
    private static java.lang.ref.WeakReference<Activity> searchHost=new java.lang.ref.WeakReference<>(null);
    private static final java.util.List<java.lang.ref.WeakReference<Activity>> tabletHosts=new java.util.ArrayList<>();
    private static final java.util.concurrent.ConcurrentMap<Integer,PendingManual> manualTabs=new java.util.concurrent.ConcurrentHashMap<>();
    private static final class PendingManual {
        final java.lang.ref.WeakReference<Activity> host;final String tool;
        PendingManual(Activity host,String tool){this.host=new java.lang.ref.WeakReference<>(host);this.tool=tool;}
    }
    private static boolean tablet(Activity activity){
        return activity!=null&&!activity.isFinishing()&&!activity.isDestroyed()
                &&activity.getClass().getName().equals("jp.syoboi.a2chMate.activity.TabletHomeActivity");
    }
    static void created(Activity activity){
        if(!tablet(activity))return;
        synchronized(tabletHosts){tabletHosts.removeIf(ref->!tablet(ref.get())||ref.get()==activity);
            if(tabletHosts.size()>=16)tabletHosts.remove(0);tabletHosts.add(new java.lang.ref.WeakReference<>(activity));}
    }
    static Activity manualHost(Activity screen){
        if(tablet(screen))return screen;
        if(screen==null||screen.isFinishing()||screen.isDestroyed())return null;
        synchronized(tabletHosts){for(int i=tabletHosts.size()-1;i>=0;i--){Activity host=tabletHosts.get(i).get();
            if(tablet(host)&&host.getTaskId()==screen.getTaskId())return host;}}
        Activity host=settingsHost.get();if(tablet(host)&&host.getTaskId()==screen.getTaskId())return host;
        host=searchHost.get();return tablet(host)&&host.getTaskId()==screen.getTaskId()?host:null;
    }
    private NativeToolTabs(){}
    /** Kept unoptimized and changed only after all native wiring is verified by the patch. */
    public static boolean supported(){return false;}
    /** Filled with the original native constructor by the version-specific patch. */
    public static Object stockFragment(){throw new IllegalStateException("Native tab bridge not installed");}
    static boolean enabled(Activity activity){return supported()&&activity.getSharedPreferences(WacchoiSearchOptions.PREFS,0).getBoolean(KEY,false);}
    static boolean selected(Activity activity,String tool){
        String key="settings".equals(tool)?SETTINGS_KEY:"eddi".equals(tool)?EDDI_KEY:"search".equals(tool)?SEARCH_KEY:"checker".equals(tool)?CHECKER_KEY:"hissi".equals(tool)?HISSI_KEY:"wacchoi".equals(tool)?FULL_KEY:null;
        return key!=null&&activity.getSharedPreferences(WacchoiSearchOptions.PREFS,0).getBoolean(key,true);
    }
    static void resumed(Activity activity){
        if(!tablet(activity))return;
        created(activity);searchHost=new java.lang.ref.WeakReference<>(activity);
        PendingManual pending=manualTabs.get(activity.getTaskId());
        if(pending!=null&&pending.host.get()==activity)new android.os.Handler(android.os.Looper.getMainLooper()).post(()->{
            if(manualTabs.remove(activity.getTaskId(),pending)&&!openManual(activity,pending.tool))
                Toast.makeText(activity,"タブを追加できませんでした",Toast.LENGTH_LONG).show();
        });
    }
    static Activity activity(android.content.Context context){
        for(int depth=0;context!=null&&depth<16;depth++){
            if(context instanceof Activity)return (Activity)context;
            if(!(context instanceof android.content.ContextWrapper))break;
            android.content.Context base=((android.content.ContextWrapper)context).getBaseContext();
            if(base==context)break;context=base;
        }
        return null;
    }
    /** Share routing between native ID menus, legacy MenuItems and modern name sheets. */
    static boolean openSearch(android.content.Context context,Intent original){
        Activity host=activity(context);
        if(host==null)return false;
        return openSearch(host,original,false);
    }
    private static boolean openSearch(Activity host,Intent original,boolean resolved){
        if(original==null||original.getComponent()==null)return false;
        Intent launch=new Intent(original);String name=launch.getComponent().getClassName();String tool;
        if(name.equals(HissiWacchoiSearchActivity.class.getName()))
            tool=launch.getBooleanExtra("haiagaru.wacchoi.hissi",false)?"wacchoi":"search";
        else if(name.equals(HissiMenuActivity.class.getName())){
            if(launch.getBooleanExtra("haiagaru.wacchoi.search",false)){
                String query=launch.getStringExtra("haiagaru.wacchoi.query");
                if(query!=null&&query.matches("-[^\\s()（）<>]{4}")){
                    launch.setClass(host,HissiWacchoiSearchActivity.class);tool="search";
                }else{
                    // Let the existing provider selection resolve a full-token request first.
                    if(!resolved)return false;
                    tool="checker";
                }
            }else{
                String uriHost=launch.getData()==null?null:launch.getData().getHost();
                // Archive state has its own serialization and routing; do not consume it here.
                if("eddiarchive3rd.boy.jp".equalsIgnoreCase(uriHost))return false;
                tool=("kyodemo.net".equalsIgnoreCase(uriHost)||"www.kyodemo.net".equalsIgnoreCase(uriHost))?"checker":"hissi";
            }
        }else return false;
        return open(host,tool,launch);
    }
    /** Native ACTION_VIEW intents can bypass our menu callbacks. Only route within their task. */
    static boolean redirectSearch(Activity screen,Bundle state,boolean resolved){
        if(state!=null||screen.isFinishing())return false;
        Activity host=searchHost.get();
        if(host==null||host==screen||host.isFinishing()||host.isDestroyed()||host.getTaskId()!=screen.getTaskId())return false;
        Intent launch=new Intent(screen.getIntent()).setClass(screen,screen.getClass());
        if(!openSearch(host,launch,resolved))return false;
        screen.finish();return true;
    }
    public static boolean open(Activity activity,String tool){
        return open(activity,tool,null);
    }
    public static boolean open(Activity activity,String tool,Intent launch){
        if (("hissi".equals(tool)||"checker".equals(tool))
                && !Haiagaru.dedicatedCheckerViewerAvailable()) return false;
        if(activity==null||!supported())return false;
        // The shared switch selects HOME vs thread pane, not whether tabs exist.
        if(!selected(activity,tool))return false;
        return createTab(activity,tool,launch);
    }
    /** Explicit manual action does not change or depend on automatic routing preferences. */
    static boolean openManual(Activity activity,String tool){return createTab(activity,tool,null);}
    private static boolean createTab(Activity activity,String tool,Intent launch){
        if(!supported()||!tablet(activity)||!java.util.Arrays.asList("settings","eddi","search","checker","hissi","wacchoi").contains(tool))return false;
        boolean home=enabled(activity);
        Bundle args=new Bundle();args.putString("_data",PREFIX+tool+(home?"?pane=home":"?pane=thread"));
        // Native pages compare the URL. Distinct search requests must not select
        // an older tab whose serialized launch/form still contains the previous query.
        if(launch!=null&&!"settings".equals(tool))args.putString("_data",args.getString("_data")+"&request="+java.util.UUID.randomUUID());
        args.putString(Intent.EXTRA_TITLE,"settings".equals(tool)?"Haiagaru設定":"eddi".equals(tool)?"エッヂ過去ログ検索":"search".equals(tool)?"投稿を探す":"checker".equals(tool)?"投稿検索・結果":"hissi".equals(tool)?"必死チェッカーもどき":"ワッチョイ全文検索");
        if(launch!=null)try{args.putString(Intent.EXTRA_TEXT,new org.json.JSONObject().put("launch",launch.toUri(Intent.URI_INTENT_SCHEME)).toString());}catch(org.json.JSONException error){throw new IllegalArgumentException(error);}
        try{
            String version=activity.getPackageManager().getPackageInfo(activity.getPackageName(),0).versionName;
            String pageName,paneName,positionName,methodName;
            Object pane;
            if("0.8.10.191 dev".equals(version)){
                pageName="o.MediationServiceImpldExternalSyntheticLambda0";
                paneName="jp.syoboi.a2chMate.activity.TabletHomeActivity$read";
                positionName="jp.syoboi.a2chMate.activity.TabletHomeActivity$write";methodName="c";
                Field field=activity.getClass().getDeclaredField(home?"k":"I");field.setAccessible(true);pane=field.get(activity);
            }else{
                String panes;
                if("0.8.10.226 dev".equals(version)){
                    pageName="o.Kjv";paneName="o.QWA";positionName="o.fWG";methodName="c";panes="r";
                }else if("0.8.10.242 dev".equals(version)){
                    pageName="o.zzeq";paneName="o.getRemoteCreator";positionName="o.zzfc";methodName="b";panes="w";
                }else return false;
                Field field=activity.getClass().getDeclaredField(panes);field.setAccessible(true);
                Object array=field.get(activity);
                if(array==null||Array.getLength(array)!=2)throw new IllegalStateException("Native tablet panes unavailable");
                pane=Array.get(array,home?0:1);
            }
            ClassLoader loader=activity.getClassLoader();
            Class<?> pageClass=Class.forName(pageName,false,loader),paneClass=Class.forName(paneName,false,loader),positionClass=Class.forName(positionName,false,loader);
            Object page=pageClass.getConstructor(int.class,Bundle.class).newInstance(4,args);
            // 191's original Web opener uses write.a; newer versions use b.
            Field positionField=positionClass.getDeclaredField("0.8.10.191 dev".equals(version)?"a":"b");
            positionField.setAccessible(true);
            Class<?> fragmentClass=Class.forName("0.8.10.191 dev".equals(version)?"o.r8lambdahIGIGCNpKpFqE0lgDli724UCuDM":"androidx.fragment.app.Fragment",false,loader);
            Method opener=activity.getClass().getDeclaredMethod(methodName,pageClass,boolean.class,paneClass,positionClass,boolean.class,fragmentClass);
            opener.setAccessible(true);
            // Native implementation also selects an existing matching tab. Its
            // false return means 'not newly created', not a navigation failure.
            opener.invoke(activity,page,true,pane,positionField.get(null),true,null);return true;
        }catch(Exception error){android.util.Log.e("Haiagaru","Could not open native tool tab",error);}
        return false;
    }
    /** Resolve actual ownership, not today's HOME/thread preference (existing tabs can differ). */
    private static ThreadSelection threadSelection(Activity activity,Object fragment)throws Exception{
        return paneSelection(activity,fragment,false);
    }
    private static ThreadSelection paneSelection(Activity activity,Object fragment,boolean home)throws Exception{
        if(!tablet(activity)||!(fragment instanceof NativeToolFragment)||!marker(arguments(fragment)))return null;
        String version=activity.getPackageManager().getPackageInfo(activity.getPackageName(),0).versionName;
        Class<?> fragmentClass=Class.forName("androidx.fragment.app.Fragment",false,activity.getClassLoader());
        if("0.8.10.191 dev".equals(version)){
            Object pane=tabField(activity,home?"k":"I"),adapter=tabField(pane,"d");
            int index=(Integer)tabCall(adapter,"a",new Class<?>[]{fragmentClass},fragment);
            if(index<0||index!=(Integer)tabField(tabField(pane,"e"),"a"))return null;
            return new ThreadSelection(pane,"d",index,((java.util.List<?>)tabField(adapter,"a")).size(),true);
        }
        boolean v226="0.8.10.226 dev".equals(version);
        if(!v226&&!"0.8.10.242 dev".equals(version))return null;
        Object pane=Array.get(tabField(activity,v226?"r":"w"),home?0:1),model=tabField(pane,v226?"a":"e");
        int index;
        if(v226)index=(Integer)tabCall(model,"d",new Class<?>[]{fragmentClass},fragment);
        else{
            Object page=tabCall(model,"e",new Class<?>[]{fragmentClass},fragment);
            if(page==null)return null;
            index=(Integer)tabCall(model,"d",new Class<?>[]{page.getClass()},page);
        }
        if(index<0)return null;
        Object state=tabCall(tabField(model,v226?"d":"e"),v226?"c":"d",new Class<?>[0]);
        if(index!=(Integer)tabField(state,v226?"a":"b"))return null;
        return new ThreadSelection(model,v226?"c":"e",index,((java.util.List<?>)tabField(state,v226?"b":"a")).size(),false);
    }
    private static Object tabField(Object owner,String name)throws ReflectiveOperationException{
        for(Class<?> type=owner.getClass();type!=null;type=type.getSuperclass())try{
            Field field=type.getDeclaredField(name);field.setAccessible(true);return field.get(owner);
        }catch(NoSuchFieldException ignored){}
        throw new NoSuchFieldException(owner.getClass().getName()+"."+name);
    }
    private static Object tabCall(Object owner,String name,Class<?>[] types,Object...args)throws ReflectiveOperationException{
        Method method=owner.getClass().getMethod(name,types);method.setAccessible(true);return method.invoke(owner,args);
    }
    private static final class ThreadSelection{
        final Object owner;final String select;final int index,count;final boolean relative;
        ThreadSelection(Object owner,String select,int index,int count,boolean relative){this.owner=owner;this.select=select;this.index=index;this.count=count;this.relative=relative;}
    }
    static boolean isSelectedThreadTool(Activity activity,Object fragment){
        try{return threadSelection(activity,fragment)!=null;}
        catch(Exception error){android.util.Log.w("Haiagaru","Could not resolve tool swipe pane",error);return false;}
    }
    /** Reapply 242's native selected-page visibility after returning from another window. */
    static void restoreToolVisibility(View child){
        if(child==null||!child.isAttachedToWindow())return;
        if(android.os.Looper.myLooper()!=android.os.Looper.getMainLooper()){
            child.post(()->restoreToolVisibility(child));return;
        }
        android.content.Context context=child.getContext();
        try{
            if(!"0.8.10.242 dev".equals(context.getPackageManager().getPackageInfo(context.getPackageName(),0).versionName))return;
            android.view.ViewParent parent=child.getParent();
            while(parent!=null&&!(parent instanceof View
                    &&"jp.syoboi.a2chMate.view.EfficientTabContainer".equals(parent.getClass().getName())))
                parent=parent.getParent();
            if(parent==null)return;
            Object adapter=tabField(parent,"e");if(adapter==null)return;
            int current=(Integer)tabField(parent,"c");
            java.util.List<?> pages=(java.util.List<?>)tabField(adapter,"d");
            if(current<0||current>=pages.size())return;
            Object page=pages.get(current);if(!marker(pageArgs(page)))return;
            Object fragment=tabField(page,"d");if(!(fragment instanceof NativeToolFragment))return;
            View selected=(View)fragment.getClass().getMethod("getView").invoke(fragment);
            if(selected==null)return;
            if(selected.getVisibility()!=View.VISIBLE){
                try{
                    Method sync=adapter.getClass().getDeclaredMethod("a",page.getClass());sync.setAccessible(true);sync.invoke(adapter,page);
                }catch(Exception syncError){
                    android.util.Log.w("Haiagaru","Could not resync selected tool page",syncError);
                }
                // The adapter may skip an unchanged current-page index after the
                // Activity's state has been restored. Keep the selected fragment
                // visible even if its siblings were correctly hidden by the pager.
                if(selected.getVisibility()!=View.VISIBLE){
                    selected.setVisibility(View.VISIBLE);
                    android.util.Log.w("Haiagaru","Restored selected tool page visibility: "+tool(pageArgs(page)));
                }
            }
            if(parent instanceof View)((View)parent).requestLayout();
            selected.requestLayout();selected.invalidate();
        }catch(Exception error){android.util.Log.w("Haiagaru","Could not restore selected tool visibility",error);}
    }
    /** Called after touch dispatch; native selection updates both the tab strip and the pager. */
    static boolean moveThreadTool(Activity activity,Object fragment,int offset){
        return moveTool(activity,fragment,offset,false);
    }
    static boolean moveAdjacentTool(Activity activity,Object fragment,int offset){
        return moveTool(activity,fragment,offset,false)||moveTool(activity,fragment,offset,true);
    }
    /** Native New tab creates a blank type-3 page, including native history links. */
    static boolean newBlankTab(Activity activity,Object fragment){
        if(activity==null||activity.isFinishing()||activity.isDestroyed())return false;
        try{
            boolean home;
            if(paneSelection(activity,fragment,false)!=null)home=false;
            else if(paneSelection(activity,fragment,true)!=null)home=true;
            else return false;
            String version=activity.getPackageManager().getPackageInfo(activity.getPackageName(),0).versionName;
            boolean v191="0.8.10.191 dev".equals(version),v226="0.8.10.226 dev".equals(version);
            Object pane=v191?tabField(activity,home?"k":"I"):
                    Array.get(tabField(activity,v226?"r":"w"),home?0:1);
            Class<?> position=Class.forName(v191?"jp.syoboi.a2chMate.activity.TabletHomeActivity$write":
                    v226?"o.fWG":"o.zzfc",false,activity.getClassLoader());
            Field value=position.getDeclaredField(v191?"a":"b");value.setAccessible(true);
            Method opener=activity.getClass().getDeclaredMethod(v191?"d":"b",pane.getClass(),position);
            opener.setAccessible(true);
            opener.invoke(activity,pane,value.get(null));
            return true;
        }catch(Exception error){android.util.Log.w("Haiagaru","Could not create native blank tab",error);return false;}
    }
    static boolean navigateTool(Activity activity,Object fragment,boolean forward){
        if(activity==null||activity.isFinishing()||activity.isDestroyed()
                ||!(fragment instanceof NativeToolFragment))return false;
        try{
            if(paneSelection(activity,fragment,false)==null&&paneSelection(activity,fragment,true)==null)return false;
            if(((NativeToolFragment)fragment).navigateHistory(forward))return true;
            // Back at the tool's root returns to the native previous page through normal close.
            return !forward&&closeCurrentTab(activity,fragment);
        }catch(Exception error){android.util.Log.w("Haiagaru","Could not navigate tool history",error);return false;}
    }
    private static boolean moveTool(Activity activity,Object fragment,int offset,boolean home){
        if(offset!=-1&&offset!=1)return false;
        try{
            ThreadSelection selection=paneSelection(activity,fragment,home);
            if(selection==null||selection.index+offset<0||selection.index+offset>=selection.count)return false;
            tabCall(selection.owner,selection.select,new Class<?>[]{int.class},selection.relative?offset:selection.index+offset);
            return true;
        }catch(Exception error){android.util.Log.w("Haiagaru","Could not select adjacent thread tab",error);return false;}
    }
    /** Native close APIs resolve the owning pane from this exact Fragment. */
    static boolean closeCurrentTab(Activity activity,Object fragment){
        if(activity==null||activity.isFinishing()||activity.isDestroyed()
                ||!activity.getClass().getName().equals("jp.syoboi.a2chMate.activity.TabletHomeActivity")
                ||!(fragment instanceof NativeToolFragment))return false;
        try{
            if(!marker(arguments(fragment)))return false;
            Class<?> nativeFragment=Class.forName("androidx.fragment.app.Fragment",false,activity.getClassLoader());
            String version=activity.getPackageManager().getPackageInfo(activity.getPackageName(),0).versionName;
            if("0.8.10.191 dev".equals(version)){
                // false preserves ChMate's locked-tab confirmation and native selection update.
                activity.getClass().getMethod("e",nativeFragment,boolean.class).invoke(activity,fragment,false);
                return true;
            }
            if("0.8.10.226 dev".equals(version)){
                Object model=tabletModel(activity,"e","o.mc");
                return Boolean.TRUE.equals(model.getClass().getMethod("a",nativeFragment,boolean.class)
                        .invoke(model,fragment,false));
            }
            if("0.8.10.242 dev".equals(version)){
                Object model=tabletModel(activity,"getValue","jp.syoboi.a2chMate.feature.tabletmode.TabletHomeViewModel");
                Object page=model.getClass().getMethod("b",nativeFragment).invoke(model,fragment);
                if(page==null||!marker(pageArgs(page)))return false;
                return Boolean.TRUE.equals(model.getClass().getMethod("d",page.getClass(),boolean.class)
                        .invoke(model,page,false));
            }
        }catch(Exception error){android.util.Log.w("Haiagaru","Could not close native tool tab",error);}
        return false;
    }
    private static Object tabletModel(Activity activity,String getter,String expectedType)throws ReflectiveOperationException{
        Field field=activity.getClass().getDeclaredField("g");field.setAccessible(true);
        Object lazy=field.get(activity);
        if(lazy==null)throw new IllegalStateException("Native tablet model is unavailable");
        Method value=lazy.getClass().getMethod(getter);value.setAccessible(true);
        Object model=value.invoke(lazy);
        if(model==null||!model.getClass().getName().equals(expectedType))
            throw new IllegalStateException("Native tablet model changed");
        return model;
    }
    /** Remember only the tablet that opened this settings Activity, never an unrelated window. */
    public static Intent settingsIntent(Activity activity){
        Activity host=manualHost(activity);
        if(host!=null)settingsHost=new java.lang.ref.WeakReference<>(host);
        return new Intent(activity,HaiagaruSettingsActivity.class).putExtra(FROM_TABLET,host!=null);
    }
    public static void showChooser(Activity activity){
        Activity host=manualHost(activity);
        if(host==null){
            Toast.makeText(activity,"タブレット表示の本体画面からHaiagaru設定を開いてください",Toast.LENGTH_LONG).show();return;
        }
        final Activity target=host;
        java.util.ArrayList<String> tools=new java.util.ArrayList<>(),labels=new java.util.ArrayList<>();
        tools.add("settings");labels.add("Haiagaru設定");
        tools.add("eddi");labels.add("エッヂ過去ログ検索");
        tools.add("search");labels.add("投稿を探す");
        tools.add("checker");labels.add("投稿検索・結果（必死チェッカー／Kyodemo）");
        tools.add("hissi");labels.add("必死チェッカーもどき専用ビュワー");
        tools.add("wacchoi");labels.add("ワッチョイ全文検索");
        new HaiagaruDialog.Builder(activity).setTitle("タブに追加する画面")
            .setItems(labels.toArray(new String[0]),(dialog,index)->{
                String tool=tools.get(index);
                if(activity==target){if(!openManual(target,tool))Toast.makeText(activity,"タブを追加できませんでした",Toast.LENGTH_LONG).show();}
                else{
                    PendingManual pending=new PendingManual(target,tool);manualTabs.put(target.getTaskId(),pending);
                    try{
                        // Resume the owning tablet before mutating its Fragment state.
                        activity.startActivity(new Intent(activity,target.getClass()).addFlags(Intent.FLAG_ACTIVITY_REORDER_TO_FRONT));
                        if(activity instanceof HaiagaruSettingsActivity)activity.finish();
                    }catch(RuntimeException error){manualTabs.remove(target.getTaskId(),pending);android.util.Log.w("Haiagaru","Manual tab resume failed",error);
                        Toast.makeText(activity,"本体のタブレット画面に戻れませんでした",Toast.LENGTH_LONG).show();}
                }
            }).setNegativeButton("キャンセル",null).show();
    }
    private static Bundle pageArgs(Object page)throws ReflectiveOperationException{
        for(Field f:page.getClass().getDeclaredFields())if(f.getType()==Bundle.class){f.setAccessible(true);return (Bundle)f.get(page);}
        return null;
    }
    static boolean marker(Bundle args){return tool(args)!=null;}
    static String tool(Bundle args){
        String value=args==null?null:args.getString("_data");if(value==null)return null;
        Uri uri=Uri.parse(value);if(!"haiagaru-tool".equals(uri.getScheme())||uri.getUserInfo()!=null)return null;
        for(String name:new String[]{"settings","eddi","search","checker","hissi","wacchoi"})if(name.equals(uri.getHost()))return name;
        return null;
    }
    // Several tabs share the Activity state transaction: never retain a full 120KB result per tab.
    static String compactState(String value){
        if(value==null||value.length()<=8192)return value;
        try{
            org.json.JSONObject json=new org.json.JSONObject(value);json.remove("threads");json.remove("resultQuery");
            String compact=json.toString();if(compact.length()<=8192)return compact;
        }catch(org.json.JSONException ignored){}
        return "{\"query\":\"https://eddiarchive3rd.boy.jp/\",\"page\":1,\"scroll\":0,\"expanded\":false}";
    }
    /** Replaces only the native WebView-tab constructor, including restored tabs. */
    public static Object createFragment(Object page){
        try{
            if(marker(pageArgs(page)))return new NativeToolFragment();
            return stockFragment();
        }catch(ReflectiveOperationException error){throw new IllegalStateException("Native tab constructor failed",error);}
    }
    private static Bundle arguments(Object fragment){
        try{return (Bundle)fragment.getClass().getMethod("getArguments").invoke(fragment);}
        catch(Exception error){throw new IllegalStateException("Native tool arguments unavailable",error);}
    }
    static boolean isArchiveFragment(Object fragment){
        return fragment instanceof NativeToolFragment&&"eddi".equals(tool(arguments(fragment)));
    }
    abstract static class Content {
        final View view;
        Content(View view){this.view=view;}
        abstract void save(Bundle state);
        void resume(){}
        void pause(){}
        void close(){}
        boolean navigateHistory(boolean forward){return NativeToolTabHistory.navigate(view,forward);}
    }
    static Content content(Object fragment,Activity activity,Bundle restored){
        Bundle args=arguments(fragment);
        if(!marker(args))throw new IllegalStateException("Not a Haiagaru tool tab");
        if("eddi".equals(tool(args))){
            Bundle state=restored==null?new Bundle():new Bundle(restored);
            if(!state.containsKey(EddiArchiveSearchUi.STATE_KEY)&&args.containsKey(Intent.EXTRA_TEXT))state.putString(EddiArchiveSearchUi.STATE_KEY,args.getString(Intent.EXTRA_TEXT));
            Runnable close=()->{if(!closeCurrentTab(activity,fragment))Toast.makeText(activity,"この画面のタブを閉じられませんでした",Toast.LENGTH_SHORT).show();};
            EddiArchiveSearchUi ui=EddiArchiveSearchUi.embed(activity,Uri.parse("https://eddiarchive3rd.boy.jp/"),url->openThread(activity,url),state,close);
            ui.onStateSaved=value->args.putString(Intent.EXTRA_TEXT,compactState(value));
            Content content=new Content(ToolScreenUi.archive(activity,ui.rootView(),close,true,true)){
                @Override void save(Bundle out){Bundle temporary=new Bundle();ui.saveState(temporary);String value=compactState(temporary.getString(EddiArchiveSearchUi.STATE_KEY));if(value!=null)out.putString(EddiArchiveSearchUi.STATE_KEY,value);}
                @Override void close(){ui.saveState(null);ui.dispose();}
            };
            content.save(new Bundle());return content;
        }
        if("settings".equals(tool(args)))return new SettingsContent(activity,args,restored,fragment);
        return new SearchContent(activity,args,restored,tool(args),fragment);
    }
    private static final class SearchContent extends Content {
        private final Activity activity;private final Bundle args;private final String tool;private final Object fragment;
        private ToolScreenController controller;
        private boolean closed;
        private int renderVersion;
        SearchContent(Activity activity,Bundle args,Bundle restored,String tool,Object fragment){
            super(new FrameLayout(activity));this.activity=activity;this.args=args;this.tool=tool;this.fragment=fragment;
            Intent launch=new Intent();Bundle state=restored;
            try{
                org.json.JSONObject saved=new org.json.JSONObject(args.getString(Intent.EXTRA_TEXT,"{}"));
                if(saved.has("launch"))launch=Intent.parseUri(saved.getString("launch"),Intent.URI_INTENT_SCHEME);
                if(state==null&&saved.has("form")){state=new Bundle();state.putParcelable("haiagaru.searchForm",Intent.parseUri(saved.getString("form"),Intent.URI_INTENT_SCHEME));}
                if(state==null)state=new Bundle();
                if(saved.has("resultsKey"))state.putString("haiagaru.tab.results",saved.getString("resultsKey"));
                state.putInt("haiagaru.tab.listIndex",saved.optInt("listIndex"));state.putInt("haiagaru.tab.listOffset",saved.optInt("listOffset"));
                if(saved.has("url")){state.putString("haiagaru.checker.url",saved.getString("url"));state.putInt("haiagaru.checker.scroll",saved.optInt("scroll"));}
            }catch(Exception error){android.util.Log.w("Haiagaru","Tool tab state could not be restored",error);}
            if("wacchoi".equals(tool))launch.putExtra("haiagaru.wacchoi.hissi",true);
            if("hissi".equals(tool))launch.putExtra("haiagaru.native.hissiViewer",true);
            if(("checker".equals(tool)||"hissi".equals(tool))&&launch.getData()==null&&!launch.getBooleanExtra("haiagaru.wacchoi.search",false)){showAddressForm();return;}
            create(launch,state);
        }
        private void render(View content){
            final int revision=++renderVersion;
            // A form action can replace its own Compose tree. Leave its input
            // coroutine before disposing the old screen, just as for dialogs.
            new android.os.Handler(android.os.Looper.getMainLooper()).post(()->{
                if(closed||revision!=renderVersion||activity.isFinishing()||activity.isDestroyed())return;
                FrameLayout host=(FrameLayout)view;SettingsTabUi.clear(host);host.addView(content,new FrameLayout.LayoutParams(-1,-1));
            });
        }
        private void create(Intent launch,Bundle state){
            if("checker".equals(tool)||"hissi".equals(tool))launch.putExtra("haiagaru.native.hissiViewer",true);
            if(controller!=null){controller.pause();controller.close();}
            controller=("checker".equals(tool)||"hissi".equals(tool))?new HissiMenuController(activity,launch,true,this::closeTab,this::render):
                new HissiWacchoiSearchController(activity,launch,true,this::closeTab,this::render);
            controller.create(state);
        }
        private void closeTab(){
            if(closed)return;
            if(!closeCurrentTab(activity,fragment))Toast.makeText(activity,"この画面のタブを閉じられませんでした",Toast.LENGTH_SHORT).show();
        }
        private void showAddressForm(){
            LinearLayout form=new LinearLayout(activity);form.setOrientation(1);
            EditText address=new EditText(activity);address.setHint("必死チェッカー／Kyodemoの投稿者ページURL");address.setInputType(android.text.InputType.TYPE_CLASS_TEXT|android.text.InputType.TYPE_TEXT_VARIATION_URI);form.addView(address);
            Button open=new Button(activity);open.setText("投稿者ページを開く");form.addView(open);
            open.setOnClickListener(v->{Uri uri=Uri.parse(address.getText().toString().trim());String host=uri.getHost();
                boolean allowedHost="hissi".equals(tool)?"hissi.org".equalsIgnoreCase(host):("hissi.org".equalsIgnoreCase(host)||"www.kyodemo.net".equalsIgnoreCase(host)||"kyodemo.net".equalsIgnoreCase(host));
                if(!("http".equals(uri.getScheme())||"https".equals(uri.getScheme()))||!allowedHost){address.setError("hissi".equals(tool)?"hissi.org のURLを入力してください":"必死チェッカーまたはKyodemoのURLを入力してください");return;}
                create(new Intent(Intent.ACTION_VIEW,uri),null);controller.resume();});
            if("hissi".equals(tool)){
                Button heading=new Button(activity);heading.setText("‹ 必死チェッカー · ChMateビュー");heading.setTextSize(18);heading.setOnClickListener(v->closeTab());form.addView(heading,0);
                render(ToolScreenUi.model(activity,"",form,this::closeTab,false));
            }else{
                Button heading=new Button(activity);heading.setText("‹ 投稿検索・結果");heading.setOnClickListener(v->closeTab());form.addView(heading,0);
                render(ToolScreenUi.model(activity,"",form,this::closeTab,false));
            }
        }
        @Override void resume(){if(controller!=null)controller.resume();}
        @Override void pause(){if(controller!=null)controller.pause();}
        @Override void save(Bundle out){
            if(controller==null)return;
            controller.save(out);
            try{
                org.json.JSONObject snapshot=new org.json.JSONObject().put("launch",controller.getIntent().toUri(Intent.URI_INTENT_SCHEME));
                Intent form=out.getParcelable("haiagaru.searchForm");if(form!=null)snapshot.put("form",form.toUri(Intent.URI_INTENT_SCHEME));
                String resultsKey=out.getString("haiagaru.tab.results");if(ToolTabResults.valid(resultsKey))snapshot.put("resultsKey",resultsKey);
                snapshot.put("listIndex",out.getInt("haiagaru.tab.listIndex")).put("listOffset",out.getInt("haiagaru.tab.listOffset"));
                String url=out.getString("haiagaru.checker.url");if(url!=null)snapshot.put("url",url).put("scroll",out.getInt("haiagaru.checker.scroll"));
                args.putString(Intent.EXTRA_TEXT,snapshot.toString());
            }catch(org.json.JSONException error){android.util.Log.w("Haiagaru","Tool tab state could not be saved",error);}
        }
        @Override void close(){closed=true;renderVersion++;if(controller!=null){controller.pause();controller.close();controller=null;}SettingsTabUi.clear((FrameLayout)view);}
    }
    @SuppressWarnings("deprecation") private static void back(Activity activity){activity.onBackPressed();}
    private static boolean openThread(Activity activity,String url){
        if(!HissiLinkRouting.isThreadUrl(url))return false;
        Intent intent=new Intent(Intent.ACTION_VIEW,Uri.parse(url));intent.setClass(activity,OpenUrlActivity.class);
        if(Haiagaru.archiveThreadStandalone(activity))intent.putExtra("haiagaru.archive.return",true);
        activity.startActivity(intent);return true;
    }
    /** The native widgets retain their normal callbacks; no second Activity owns this tab. */
    private static final class SettingsContent extends Content {
        private static final String SELECTED="haiagaru.native.settings.category";
        final Activity activity;final Bundle args;final LinearLayout root,body;final TextView title;final ScrollView scroll;final FrameLayout categoryHost;final Object fragment;
        String selected;
        final String[] ids={"DISPLAY","SOCIAL","CHECKER","ARCHIVE","POSTING","UPLOAD","MEDIA","NG","HISTORY","BACKUP","GENERAL","ADVANCED","EXPERT"};
        final String[] labels={"画面と操作","リンクカード・X","IDチェッカー","過去ログ・保存レス","書き込む","画像・動画の投稿","画像・動画の表示","NG・ミュート","履歴","バックアップ","基本設定","通信・外部板","エキスパート設定"};
        SettingsContent(Activity activity,Bundle args,Bundle restored,Object fragment){
            super(new LinearLayout(activity));this.activity=activity;this.args=args;this.fragment=fragment;root=(LinearLayout)view;root.setOrientation(1);
            int padding=(int)(12*activity.getResources().getDisplayMetrics().density);root.setPadding(padding,padding,padding,padding);
            LinearLayout bar=new LinearLayout(activity);Button back=new Button(activity);back.setText("戻る");
            back.setOnClickListener(v->{if(selected!=null)show(null);else NativeToolTabs.back(activity);});bar.addView(back);
            title=new TextView(activity);title.setTextSize(20);bar.addView(title,new LinearLayout.LayoutParams(0,-2,1));root.addView(bar);
            scroll=new ScrollView(activity);scroll.setFillViewport(true);body=new LinearLayout(activity);body.setOrientation(1);scroll.addView(body);root.addView(scroll,new LinearLayout.LayoutParams(-1,0,1));
            categoryHost=new FrameLayout(activity);root.addView(categoryHost,new LinearLayout.LayoutParams(-1,0,1));
            show(restored==null?args.getString(Intent.EXTRA_TEXT):restored.getString(SELECTED,args.getString(Intent.EXTRA_TEXT)));
        }
        void show(String category){
            selected=null;for(String id:ids)if(id.equals(category))selected=id;
            body.removeAllViews();title.setText("Haiagaru設定");
            SettingsTabUi.clear(categoryHost);
            scroll.setVisibility(selected==null?View.VISIBLE:View.GONE);
            categoryHost.setVisibility(selected==null?View.GONE:View.VISIBLE);
            if(selected==null){
                for(int i=0;i<ids.length;i++){final String id=ids[i];Button button=new Button(activity);button.setText(labels[i]);button.setOnClickListener(v->show(id));body.addView(button,new LinearLayout.LayoutParams(-1,-2));}
                Button share=new Button(activity);share.setText("設定を共有（.haiagaru）");share.setOnClickListener(v->SettingsProfiles.share(activity));body.addView(share);
                Button load=new Button(activity);load.setText("設定ファイルを読み込む");load.setOnClickListener(v->{try{fragment.getClass().getMethod("openSettingsFile").invoke(fragment);}catch(Exception error){android.util.Log.e("Haiagaru","Settings picker unavailable",error);Toast.makeText(activity,"ファイル選択画面を開けませんでした",Toast.LENGTH_LONG).show();}});body.addView(load);
                TextView help=new TextView(activity);help.setText("追加先はオンでホーム側、オフでスレ側のタブ列です。開いているタブは自動では移動しません。");body.addView(help);
            }else{
                for(int i=0;i<ids.length;i++)if(ids[i].equals(selected))title.setText(labels[i]);
                // Keep Compose's vertical list bounded by the pane, never inside ScrollView.
                categoryHost.addView(SettingsTabUi.category(activity,selected),new FrameLayout.LayoutParams(-1,-1));
            }
            if(selected==null)args.remove(Intent.EXTRA_TEXT);else args.putString(Intent.EXTRA_TEXT,selected);
            scroll.post(()->scroll.scrollTo(0,0));
        }
        @Override void save(Bundle state){if(selected!=null)state.putString(SELECTED,selected);}
        @Override boolean navigateHistory(boolean forward){
            if(!forward&&selected!=null){show(null);return true;}
            return false;
        }
        @Override void close(){SettingsTabUi.clear(categoryHost);Haiagaru.settingsClosed();}
    }
}
