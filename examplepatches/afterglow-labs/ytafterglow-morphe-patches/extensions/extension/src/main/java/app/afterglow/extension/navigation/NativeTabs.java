package app.afterglow.extension.navigation;

import android.app.Activity;
import android.content.Intent;
import android.view.View;
import android.widget.LinearLayout;

import app.afterglow.extension.Afterglow;
import app.afterglow.extension.destinations.AiHomeRouter;
import app.afterglow.extension.diagnostics.DebugLog;
import app.afterglow.extension.i18n.L10n;
import app.afterglow.extension.settings.AfterglowPrefs;
import app.afterglow.extension.settings.LiteMode;
import app.afterglow.extension.settings.TabStore;
import app.afterglow.extension.ui.AfterglowActivity;

import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.WeakHashMap;

/** Afterglow composes native pivot items; YouTube retains their renderers, listeners and navigation. */
public final class NativeTabs {
    private static final String PIVOT="com.google.android.libraries.youtube.rendering.ui.pivotbar.PivotBar";
    private static final List<String> LITE_TABS=Arrays.asList("FEwhat_to_watch","FEsubscriptions","FElibrary",NativeTabPolicy.CONTROL_CENTER);
    private static final Map<NativeTabHost,State> states=new WeakHashMap<>();
    private static final Map<View,String> identifiers=new WeakHashMap<>();
    private static final Map<View,WeakReference<NativeTabHost>> hosts=new WeakHashMap<>();
    private static final Map<String,WeakReference<View>> routes=new LinkedHashMap<>();
    private static final Map<Activity,Boolean> startupHandled=new WeakHashMap<>();
    private static final class State {
        List<?> source=Collections.emptyList(),prepared=Collections.emptyList();String signature="";
        NativeTabPolicy.Plan plan=NativeTabPolicy.plan(Collections.emptyList(),Collections.emptyList(),false,false,"","");
        boolean rebuilding;
    }
    private NativeTabs() {}
    static boolean enabled(){return Gate.installed(Gate.TAB_BAR);}
    /** Replaced with the verified Lnaz/Lavcl factory calls at patch time. */
    public static Object buildNative(String browseId,String title,int iconType){return null;}

    public static List<?> compose(NativeTabHost host,List<?> original) {
        if(!enabled()||host==null||original==null||original.size()>32)return original;
        try {
            synchronized(states) {
                State state=states.computeIfAbsent(host,key->new State());
                if(!original.equals(state.prepared)){state.source=new ArrayList<>(original);state.signature="";}
                String signature=signature();
                if(signature.equals(state.signature)&&original.equals(state.prepared))return original;
                Map<String,Object> available=new LinkedHashMap<>();
                for(Object item:state.source){String id=id(item);if(!id.isEmpty())available.putIfAbsent(id,item);}
                List<String> active=active();
                for(String id:active)if(!available.containsKey(id)&&canBuild(id)) {
                    Object item=buildNative(id,title(id),icon(id));if(item!=null&&id.equals(id(item)))available.put(id,item);
                }
                boolean two=!LiteMode.enabled()&&AfterglowPrefs.getBool("twoRowTabBar");
                NativeTabPolicy.Plan plan=NativeTabPolicy.plan(active,new ArrayList<>(available.keySet()),two,
                    AfterglowPrefs.getBool("centeredAnchorTabBar"),AfterglowPrefs.getString("anchorLeftTab"),AfterglowPrefs.getString("anchorRightTab"));
                if(plan.top.isEmpty())return original;
                if(!LiteMode.enabled()) {
                    Map<String,Integer> extras=new LinkedHashMap<>();
                    for(int i=0;i<state.source.size();i++) {
                        String id=id(state.source.get(i));
                        if(id.equals(NativeTabProto.COMPAT_SEARCH)||id.equals(NativeTabProto.COMPAT_SETTINGS))extras.putIfAbsent(id,i);
                    }
                    plan=NativeTabPolicy.withExtras(plan,extras);
                }
                List<Object> result=new ArrayList<>();for(String id:plan.ordered)result.add(available.get(id));
                state.prepared=result;state.plan=plan;state.signature=signature;
                DebugLog.write("tabs","native="+plan.top.size()+" bonus="+plan.bonus.size()+" anchors="+plan.anchored());return result;
            }
        }catch(Throwable e){Afterglow.error("NativeTabs.compose",e);return original;}
    }
    /** Called before the native renderer consumes the controller's current item list. */
    public static void prepare(NativeTabHost host) {
        if(host==null)return;
        try{List<?> current=host.afterglow_tabItems(),replacement=compose(host,current);if(replacement!=current&&!replacement.equals(current))host.afterglow_replaceTabs(replacement);}
        catch(Throwable e){Afterglow.error("NativeTabs.prepare",e);}
    }
    /** Called after native rendering, including the lazy image/avatar binding pass. */
    public static void bind(NativeTabHost host) {
        if(host==null)return;
        try {
            View root=host.afterglow_tabRoot();if(root==null)return;
            List<?> items=host.afterglow_tabItems(),views=host.afterglow_tabViews();
            if(items==null||views==null||items.size()!=views.size()||items.size()>32){DebugLog.write("tabs","native binding deferred: unequal model/view counts");return;}
            synchronized(hosts){hosts.put(root,new WeakReference<>(host));}
            for(int i=0;i<items.size();i++)if(views.get(i) instanceof View)bindItem(items.get(i),(View)views.get(i));
            root.requestLayout();maybeStart(root);
        }catch(Throwable e){Afterglow.error("NativeTabs.bind",e);}
    }
    /** Exact item/view callback; also covers an avatar bound after the main native pass. */
    public static void bindItem(Object item,View view) {
        if(view==null)return;String id=id(item);if(id.isEmpty())return;
        synchronized(identifiers){identifiers.put(view,id);}synchronized(routes){routes.put(id,new WeakReference<>(view));}
        if(id.equals("FEwhat_to_watch"))AiHomeRouter.captureHome(view);
        if(enabled()&&id.equals(NativeTabPolicy.CONTROL_CENTER))view.setOnClickListener(v->openControlCenter(v));
    }
    public static LinearLayout createRow(View host,LinearLayout original) {
        if(!enabled()||host==null||!PIVOT.equals(host.getClass().getName()))return original;
        try{return new NativeTabRow(host);}catch(Throwable error){Afterglow.error("NativeTabs.createRow",error);return original;}
    }
    static String identifier(View child){synchronized(identifiers){String id=identifiers.get(child);return id==null?"":id;}}
    static NativeTabPolicy.Plan plan(View root) {
        synchronized(hosts){WeakReference<NativeTabHost> ref=hosts.get(root);NativeTabHost host=ref==null?null:ref.get();synchronized(states){State state=states.get(host);return state==null?null:state.plan;}}
    }
    static void refresh(View root) {
        if(!enabled())return;
        NativeTabHost host;synchronized(hosts){WeakReference<NativeTabHost> ref=hosts.get(root);host=ref==null?null:ref.get();}
        if(host==null)return;
        synchronized(states){State state=states.get(host);if(state==null||state.rebuilding||signature().equals(state.signature))return;state.rebuilding=true;}
        try{host.afterglow_rebuildTabs();}catch(Throwable e){Afterglow.error("NativeTabs.refresh",e);}finally{synchronized(states){State state=states.get(host);if(state!=null)state.rebuilding=false;}}
    }
    public static boolean openTab(String tabId) {
        String id=NativeTabPolicy.canonical(tabId);View view;
        synchronized(routes){WeakReference<View> ref=routes.get(id);view=ref==null?null:ref.get();}
        return valid(view)&&view.isEnabled()&&view.getVisibility()==View.VISIBLE&&view.performClick();
    }
    public static List<String> availableTabs() {
        List<String> result=new ArrayList<>();synchronized(routes){for(Map.Entry<String,WeakReference<View>> e:routes.entrySet())if(valid(e.getValue().get()))result.add(e.getKey());}return Collections.unmodifiableList(result);
    }
    /** Picker choices with a verified factory or an actual supplied native command. */
    public static List<String> supportedTabs() {
        if(!enabled())return Collections.emptyList();
        List<String> supplied=new ArrayList<>();
        synchronized(states){for(State state:states.values())for(Object item:state.source){String id=id(item);if(!id.isEmpty()&&!supplied.contains(id))supplied.add(id);}}
        List<String> result=new ArrayList<>();
        for(String id:TabStore.ALLOWED_TABS)if(canBuild(id)||supplied.contains(id))result.add(id);
        return Collections.unmodifiableList(result);
    }
    private static boolean valid(View view) {
        Activity activity=Afterglow.mainActivity();return view!=null&&view.isAttachedToWindow()&&activity!=null&&!activity.isFinishing()&&!activity.isDestroyed()&&activity.getWindow()!=null&&view.getRootView()==activity.getWindow().getDecorView().getRootView();
    }
    private static void openControlCenter(View view) {
        try {Intent intent=new Intent(view.getContext(),AfterglowActivity.class).putExtra(AfterglowActivity.EXTRA_DESTINATION,"controlCenter");view.getContext().startActivity(intent);}
        catch(Throwable e){Afterglow.error("NativeTabs.controlCenter",e);}
    }
    private static void maybeStart(View root) {
        if(!enabled()||!Gate.installed(Gate.STARTUP)||LiteMode.enabled())return;
        Activity activity=Afterglow.mainActivity();if(activity==null||activity.getIntent()==null||!Intent.ACTION_MAIN.equals(activity.getIntent().getAction()))return;
        if(!NativeTabPolicy.CONTROL_CENTER.equals(TabStore.currentStartupTab()))return;
        synchronized(startupHandled){if(startupHandled.containsKey(activity))return;}
        root.post(()->{
            synchronized(startupHandled){if(startupHandled.containsKey(activity))return;}
            if(valid(root)&&openTab(NativeTabPolicy.CONTROL_CENTER))synchronized(startupHandled){startupHandled.put(activity,true);}
        });
    }
    private static List<String> active(){return LiteMode.enabled()?new ArrayList<>(LITE_TABS):TabStore.currentActiveTabs();}
    private static String signature(){return active()+"|"+LiteMode.enabled()+"|"+AfterglowPrefs.getBool("twoRowTabBar")+"|"+AfterglowPrefs.getBool("centeredAnchorTabBar")+"|"+AfterglowPrefs.getString("anchorLeftTab")+"|"+AfterglowPrefs.getString("anchorRightTab");}
    private static boolean canBuild(String id) {
        // Shorts/Create require their supplied native commands. Hype is used only when supplied.
        switch(id){case "FEwhat_to_watch":case "FEsubscriptions":case "FElibrary":case "FEhistory":case "VLWL":case "FEpost_home":case "FEconnections_inbox":case NativeTabPolicy.CONTROL_CENTER:return true;default:return false;}
    }
    private static String title(String id) {
        switch(id){case "FEwhat_to_watch":return L10n.get(id,"Home");case "FEsubscriptions":return L10n.get(id,"Subscriptions");case "FElibrary":return L10n.get(id,"Library");case "FEhistory":return L10n.get(id,"History");case "VLWL":return L10n.get(id,"Watch Later");case "FEpost_home":return "Posts";case "FEconnections_inbox":return L10n.get(id,"Messages");case NativeTabPolicy.CONTROL_CENTER:return "Afterglow";default:return id;}
    }
    private static int icon(String id) {
        // Lklp maps enum 746 to ic_yt_post_24. CREATE_POST (390) exists in the proto
        // enum but has no drawable entry in this client and renders a blank pivot icon.
        switch(id){case "FEwhat_to_watch":return 406;case "FEsubscriptions":return 408;case "FElibrary":return 483;case "FEhistory":return 2;case "VLWL":return 3;case "FEpost_home":return 746;case "FEconnections_inbox":return 377;case NativeTabPolicy.CONTROL_CENTER:return 945;default:return 65;}
    }
    static String id(Object item) {
        if(!(item instanceof NativeTabItem))return "";
        try{return NativeTabProto.identifier(((NativeTabItem)item).afterglow_tabProto());}catch(Throwable ignored){return "";}
    }
}
