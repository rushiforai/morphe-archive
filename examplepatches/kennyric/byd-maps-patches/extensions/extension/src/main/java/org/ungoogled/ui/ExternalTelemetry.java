package org.ungoogled.ui;

import android.app.Activity;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.SharedPreferences;
import android.location.Location;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.Toast;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import nl.johninnl.navigation.alerts.WarningScheduler;
import nl.johninnl.navigation.alerts.WarningPreferences;
import nl.johninnl.navigation.alerts.WarningPassage;
import nl.johninnl.navigation.alerts.WarningEvent;
import nl.johninnl.navigation.alerts.PlaybackGrant;
import nl.johninnl.navigation.alerts.WarningAudioOwner;
import nl.johninnl.navigation.alerts.WarningStatus;
import nl.johninnl.navigation.alerts.WarningProviders;

/** Local navigation observations shared with De-Waze and Flitsmeister, serialized on the UI thread. */
public final class ExternalTelemetry {
    private static nl.johninnl.navigation.startup.NavigationClient startup;
    private static nl.johninnl.navigation.alerts.WarningSession semantic;
    private static MapsWarningSpeaker nativeSpeaker;
    private static WarningScheduler scheduler;
    private static WarningPreferences warningPreferences;
    private static boolean eventAudioManaged;
    private static final nl.johninnl.navigation.alerts.WarningView nativeWarnings=new nl.johninnl.navigation.alerts.WarningView();
    private static final Runnable SEMANTIC_RENDER=ExternalTelemetry::update;
    private static void semanticRender(){MAIN.removeCallbacks(SEMANTIC_RENDER);MAIN.post(SEMANTIC_RENDER);}
    private ExternalTelemetry() {}
    static final String ACTION="nl.johninnl.navigation.NAVIGATION_STATE";
    static final String REQUEST="nl.johninnl.navigation.NAVIGATION_STATE_REQUEST";
    static final String KEY_SOURCE="external_navigation_source", KEY_WIDGET="external_navigation_widget";
    static final String LEGACY="waze_bridge";
    static final String[] SOURCES={"",LEGACY,TelemetryStore.WAZE,TelemetryStore.FLITSMEISTER};
    static final String[] LABELS={"Off · Google Maps", "Waze · Share alerts with Maps", "De-Waze · navigation data", "Flitsmeister · navigation data"};
    private static final Handler MAIN=new Handler(Looper.getMainLooper());
    private static TelemetryStore store=new TelemetryStore();
    private static final RoadWarningEngine warnings=new RoadWarningEngine();
    private static Context app;
    private static String source="",publisherSession="",warning="",legacyWarning="";
    private static final nl.johninnl.navigation.alerts.PointPillGate POINT_PILLS=new nl.johninnl.navigation.alerts.PointPillGate();
    private static boolean registered,navigating,phoneNavigating;
    private static Location fix;
    private static long fixAt=-1,nativeSpeedAt=-1,nativeLimitAt=-1;
    private static Double nativeSpeed,nativeLimit;
    private static WeakReference<Activity> foreground=new WeakReference<>(null);
    private static CompactSpeedView widget;
    private static final java.util.Set<Object> carSessions=java.util.Collections.newSetFromMap(new java.util.WeakHashMap<>());
    private static final java.util.Set<Object> carNavigation=java.util.Collections.newSetFromMap(new java.util.WeakHashMap<>());
    private static final Map<Object,WeakReference<ViewGroup>> carRoots=new java.util.WeakHashMap<>();
    private static final Map<Object,int[]> carViewportSizes=new java.util.WeakHashMap<>();
    private static final Map<Object,CompactSpeedView> carWidgets=new java.util.WeakHashMap<>();
    private static final Map<Object,CarLayout> carLayouts=new java.util.WeakHashMap<>();
    private static final class CarLayout implements android.view.ViewTreeObserver.OnPreDrawListener {
        final WeakReference<Object> owner;
        final WeakReference<ViewGroup> root;
        final CarSpeedPlacement speed=new CarSpeedPlacement();
        CarLayout(Object owner,ViewGroup root){this.owner=new WeakReference<>(owner);this.root=new WeakReference<>(root);root.getViewTreeObserver().addOnPreDrawListener(this);}
        @Override public boolean onPreDraw(){Object key=owner.get();if(key!=null)layoutCar(key);return true;}
        void close(){ViewGroup view=root.get();if(view!=null&&view.getViewTreeObserver().isAlive())view.getViewTreeObserver().removeOnPreDrawListener(this);speed.restore();}
    }
    private static void removeCarSurface(Object owner){
        CarLayout layout=carLayouts.remove(owner);if(layout!=null)layout.close();
        removeCarWidget(owner);carRoots.remove(owner);carViewportSizes.remove(owner);
    }
    private static boolean carActive(){return !carSessions.isEmpty();}
    /** Called only by an actual resumed native projection session; independent of its surface. */
    public static void carSession(Context context,Object owner,boolean visible){
        if(context==null||owner==null)return;
        Runnable change=()->{if(visible)carSessions.add(owner);else{carSessions.remove(owner);removeCarSurface(owner);}refresh(context);};
        if(Looper.myLooper()==Looper.getMainLooper())change.run();else MAIN.post(change);
    }
    /** Native GUIDING is independent of phone camera updates and transient surface loss. */
    public static void carNavigation(Context context,Object owner,boolean active){
        if(context==null||owner==null)return;
        Runnable change=()->{
            if(active)carNavigation.add(owner);else carNavigation.remove(owner);
            navigating=phoneNavigating||!carNavigation.isEmpty();
            WazeAlerts.carNavigation(!carNavigation.isEmpty());
            refresh(context);
        };
        if(Looper.myLooper()==Looper.getMainLooper())change.run();else MAIN.post(change);
    }
    /** The original Maps Presentation supplies this real host-bound decor, never a phone mirror. */
    public static void carSurface(Object owner,ViewGroup root){carSurface(owner,root,root==null?0:root.getWidth(),root==null?0:root.getHeight());}
    public static void carSurface(Object owner,ViewGroup root,int width,int height){carSurface(owner,root,new android.graphics.Rect(0,0,width,height));}
    public static void carSurface(Object owner,ViewGroup root,android.graphics.Rect area){
        final android.graphics.Rect viewport=area==null?new android.graphics.Rect():new android.graphics.Rect(area);
        if(owner==null)return;Runnable change=()->{
            WeakReference<ViewGroup> old=carRoots.get(owner);
            if(old==null||old.get()!=root)removeCarSurface(owner);
            if(root!=null){
                Shapes.hostedCarSurface(root);carRoots.put(owner,new WeakReference<>(root));
                carViewportSizes.put(owner,new int[]{viewport.left,viewport.top,viewport.right,viewport.bottom});
                if(!carLayouts.containsKey(owner))carLayouts.put(owner,new CarLayout(owner,root));
            }
            renderCar();
        };if(Looper.myLooper()==Looper.getMainLooper())change.run();else MAIN.post(change);
    }
    private static void removeCarWidget(Object owner){CompactSpeedView value=carWidgets.remove(owner);if(value!=null&&value.getParent() instanceof ViewGroup)((ViewGroup)value.getParent()).removeView(value);}
    /** One warning selection and pill presentation for the phone and every car surface. */
    private static final class Pills {
        final TelemetryStore.View info;final List<WarningEvent> events;final String message;final java.util.Map<String,nl.johninnl.navigation.alerts.WarningGeometry> geometry;
        /** Maps currently shows its own speed card, which the speed pill replaces. */
        final boolean speed;
        Pills(TelemetryStore.View info,List<WarningEvent> events,String message,java.util.Map<String,nl.johninnl.navigation.alerts.WarningGeometry> geometry,boolean speed){this.info=info;this.events=events;this.message=message;this.geometry=geometry;this.speed=speed;}
        boolean empty(){return !info.zoneActive&&message.isEmpty()&&events.isEmpty()&&!speed;}
        void bind(CompactSpeedView value,android.widget.TextView number,boolean dark){
            value.carTypeface(number==null?null:number.getTypeface());value.carGeometry(geometry);
            Float mps=speedMps();
            value.bindCar(info,limitKmh(),PowerSaving.miles(),dark,message,events,speed,mps==null?null:mps*3.6);
        }
    }
    /** Maps decides when its speed card shows (navigation, its own setting); the pill follows it. */
    static boolean nativeSpeedShown(View card){
        if(card==null||!card.isAttachedToWindow()||card.getWidth()<=0||card.getHeight()<=0)return false;
        for(View node=card;node!=null;node=parentView(node))if(node.getVisibility()!=View.VISIBLE)return false;
        return true;
    }
    private static Pills pills(){return pills(false);}
    /** The provider warnings the pills show now; the map pins (WarningPins) take exactly this selection. */
    private static List<WarningEvent> pillEvents(long now){
        return nativeWarnings.carEvents(now,event->{
            if(warningPreferences!=null&&!warningPreferences.enabled(event))return false;
            if(!nl.johninnl.navigation.alerts.WarningGeometry.pointDisplay(event))return true;
            return POINT_PILLS.visible(event.warningId,MapsGuidanceCoordinator.relevance(event,fix,now,navigating),MapsGuidanceCoordinator.displayGeometry(event,fix,now,navigating)!=null,now);
        });
    }
    private static Pills pills(boolean speed){
        TelemetryStore.View info=view();
        long now=SystemClock.elapsedRealtime();
        List<WarningEvent> nativeEvents=pillEvents(now);
        List<WarningEvent> events=new ArrayList<>();for(WarningEvent event:nativeEvents)if(!info.zoneActive||!nl.johninnl.navigation.alerts.CarWarningPills.zoneEvent(event))events.add(event);
        java.util.Map<String,nl.johninnl.navigation.alerts.WarningGeometry> geometry=new java.util.HashMap<>();
        for(WarningEvent event:events)geometry.put(event.warningId,MapsGuidanceCoordinator.displayGeometry(event,fix,now,navigating));
        // Withheld provider warnings must not resurface through the untyped legacy text.
        boolean provider=!nativeWarnings.carMessages(now,event->warningPreferences==null||warningPreferences.enabled(event)).isEmpty();
        return new Pills(info,events,nativeEvents.isEmpty()&&!provider?legacyWarning:"",geometry,speed);
    }
    private static void renderCar(){
        for(Object owner:new ArrayList<>(carRoots.keySet())){
            ViewGroup root=carRoots.get(owner).get();
            if(root==null||!carSessions.contains(owner)){removeCarSurface(owner);continue;}
            layoutCar(owner);
            if(!modern()||app==null||!widgetEnabled(app)){removeCarWidget(owner);continue;}
            int[] bounds=carViewportSizes.get(owner);
            if(bounds!=null&&(bounds[2]<=bounds[0]||bounds[3]<=bounds[1])){removeCarWidget(owner);continue;}
            Pills pills=pills(nativeSpeedShown(carSpeedBadge(root)));
            if(pills.empty()){removeCarWidget(owner);continue;}
            CompactSpeedView value=carWidgets.get(owner);if(value==null){value=new CompactSpeedView(root.getContext());carWidgets.put(owner,value);root.addView(value);}
            boolean dark=(root.getResources().getConfiguration().uiMode&android.content.res.Configuration.UI_MODE_NIGHT_MASK)==android.content.res.Configuration.UI_MODE_NIGHT_YES;
            pills.bind(value,largestNativeText(carSpeedBadge(root)),dark);
            layoutCar(owner);
        }
    }

    /** Layout callbacks and native speed animations must not wait for another provider packet. */
    private static void layoutCar(Object owner){
        CarLayout state=carLayouts.get(owner);if(state==null)return;
        ViewGroup root=state.root.get();if(root==null||!carSessions.contains(owner))return;
        int[] bounds=carViewportSizes.get(owner);
        android.graphics.Rect viewport=bounds==null?new android.graphics.Rect():new android.graphics.Rect(bounds[0],bounds[1],bounds[2],bounds[3]);
        if(!viewport.intersect(0,0,root.getWidth(),root.getHeight()))viewport.setEmpty();
        CompactSpeedView value=carWidgets.get(owner);
        // While the speed pill shows, Maps' card keeps its layout slot but is not drawn.
        android.graphics.Rect speed=state.speed.place(root,carSpeedBadge(root),viewport,value!=null&&value.showsSpeed());
        if(value==null)return;
        int margin=Math.round(16*root.getResources().getDisplayMetrics().density);
        android.graphics.Rect area=carInfoArea(viewport,speed,occupiedCarView(root,"map_buttons_view_branding_watermark_container"),margin);
        int width=Math.max(0,area.width()-2*margin),height=Math.max(0,area.height()-2*margin);
        value.measure(View.MeasureSpec.makeMeasureSpec(width,View.MeasureSpec.AT_MOST),View.MeasureSpec.makeMeasureSpec(height,View.MeasureSpec.AT_MOST));
        if(value.getMeasuredWidth()<=0||value.getMeasuredHeight()<=0){value.setVisibility(View.INVISIBLE);return;}
        value.setVisibility(View.VISIBLE);
        int left=area.right-value.getMeasuredWidth()-margin,top=area.bottom-value.getMeasuredHeight()-margin;
        ViewGroup.LayoutParams previous=value.getLayoutParams();
        FrameLayout.LayoutParams old=previous instanceof FrameLayout.LayoutParams?(FrameLayout.LayoutParams)previous:null;
        if(old==null||old.leftMargin!=left||old.topMargin!=top||old.width!=value.getMeasuredWidth()||old.height!=value.getMeasuredHeight()){
            FrameLayout.LayoutParams layout=new FrameLayout.LayoutParams(value.getMeasuredWidth(),value.getMeasuredHeight(),Gravity.TOP|Gravity.LEFT);
            layout.leftMargin=left;layout.topMargin=top;value.setLayoutParams(layout);
        }
        // Pre-draw runs after this traversal's normal child layout. Updating
        // LayoutParams alone would draw one stale frame beneath the new cover.
        if(value.getLeft()!=left||value.getTop()!=top||value.getRight()!=left+value.getMeasuredWidth()||value.getBottom()!=top+value.getMeasuredHeight())
            value.layout(left,top,left+value.getMeasuredWidth(),top+value.getMeasuredHeight());
        if(root.indexOfChild(value)!=root.getChildCount()-1)value.bringToFront();
    }

    static android.graphics.Rect carInfoArea(ViewGroup root,android.graphics.Rect viewport){
        return carInfoArea(viewport,occupiedCarView(root,carSpeedBadge(root)),
            occupiedCarView(root,"map_buttons_view_branding_watermark_container"),Math.round(16*root.getResources().getDisplayMetrics().density));
    }
    private static View carSpeedBadge(ViewGroup root){
        View wrapper=namedCarView(root,"map_buttons_view_speed_limit");
        if(wrapper==null)return null;
        return carSpeedCard(wrapper,namedCarView(wrapper,"speedometer"),namedCarView(wrapper,"speed_limit"));
    }
    static View carSpeedCard(View wrapper,View speed,View limit){
        // Stop at their shared card, before Maps' larger watermark container.
        for(View candidate=speed;candidate!=null&&candidate!=wrapper;candidate=parentView(candidate)){
            for(View child=limit;child!=null;child=parentView(child)){
                if(candidate==child)return candidate;
                if(child==wrapper)break;
            }
        }
        return wrapper;
    }
    private static View parentView(View view){return view.getParent() instanceof View?(View)view.getParent():null;}
    static android.graphics.Rect carInfoArea(android.graphics.Rect viewport,android.graphics.Rect speed,android.graphics.Rect watermark,int margin){
        android.graphics.Rect result=new android.graphics.Rect(viewport);
        if(speed!=null&&android.graphics.Rect.intersects(speed,viewport)){
            result.bottom=Math.min(result.bottom,speed.top);
            // renderCar subtracts its margin: the resulting pill ends exactly at the native badge's right edge.
            result.right=Math.min(result.right,speed.right+margin);
        }
        if(watermark!=null&&android.graphics.Rect.intersects(watermark,viewport))result.bottom=Math.min(result.bottom,watermark.top);
        return result;
    }
    private static android.graphics.Rect occupiedCarView(ViewGroup root,String name){
        return occupiedCarView(root,namedCarView(root,name));
    }
    static android.graphics.Rect occupiedCarView(ViewGroup root,View view){
        if(view==null||view.getVisibility()!=View.VISIBLE||view.getWidth()<=0||view.getHeight()<=0)return null;
        android.graphics.Rect bounds=new android.graphics.Rect();if(!view.getGlobalVisibleRect(bounds))return null;
        int[] origin=new int[2];root.getLocationOnScreen(origin);bounds.offset(-origin[0],-origin[1]);return bounds;
    }
    private static android.widget.TextView largestNativeText(View view){
        android.widget.TextView largest=view instanceof android.widget.TextView?(android.widget.TextView)view:null;
        if(view instanceof ViewGroup){ViewGroup group=(ViewGroup)view;for(int i=0;i<group.getChildCount();i++){
            android.widget.TextView candidate=largestNativeText(group.getChildAt(i));
            if(candidate!=null&&(largest==null||candidate.getTextSize()>largest.getTextSize()))largest=candidate;
        }}
        return largest;
    }
    private static View namedCarView(View view,String name){
        // Generated ids (package byte 0) have no entry name; asking would log an error every frame.
        if(view.getId()!=View.NO_ID&&(view.getId()>>>24)!=0){try{if(name.equals(view.getResources().getResourceEntryName(view.getId())))return view;}catch(android.content.res.Resources.NotFoundException ignored){}}
        if(view instanceof ViewGroup){ViewGroup group=(ViewGroup)view;for(int i=0;i<group.getChildCount();i++){View found=namedCarView(group.getChildAt(i),name);if(found!=null)return found;}}
        return null;
    }
    /** What the map pins were last drawn from: the WARNINGS_V1 pin list, or the telemetry reports' signature. */
    private static Object pinState="";
    /** Read by Maps' label thread (WazeAlerts.mapItems); written on the main thread in update(). */
    private static volatile boolean warningPinMode;
    private static volatile List<WarningPins.Pin> warningPins=java.util.Collections.emptyList();
    /** The selected provider sends WARNINGS_V1: its pins follow the pills, not the telemetry report list. */
    static boolean warningPinMode(){return warningPinMode;}
    static List<WarningPins.Pin> warningPins(){return warningPins;}

    private static SharedPreferences prefs(Context c){return c.getSharedPreferences(Shapes.PREFS,Context.MODE_PRIVATE);}
    static String source(Context c){return prefs(c).getString(KEY_SOURCE,prefs(c).getBoolean(WazeAlerts.KEY_ON,false)?LEGACY:"");}
    static int sourceIndex(Context c){String value=source(c);for(int i=0;i<SOURCES.length;i++)if(SOURCES[i].equals(value))return i;return 0;}
    static boolean suppressNativeFlock(){return modern()&&store.suppressNativeFlock(SystemClock.elapsedRealtime());}
    static boolean legacy(){return LEGACY.equals(source);}
    static boolean modern(){return TelemetryStore.supported(source);}
    static boolean widgetEnabled(Context c){return prefs(c).getBoolean(KEY_WIDGET,true);}
    static boolean nativeMetricsEnabled(){return modern()&&app!=null&&widgetEnabled(app);}
    static void setWidget(Context c,boolean enabled){prefs(c).edit().putBoolean(KEY_WIDGET,enabled).apply();refresh(c);}
    static void select(Context c,String value){
        boolean allowed=false;for(String candidate:SOURCES)if(candidate.equals(value))allowed=true;
        if(!allowed)value="";
        prefs(c).edit().putString(KEY_SOURCE,value).putBoolean(WazeAlerts.KEY_ON,!value.isEmpty()).commit();
        refresh(c);WazeAlerts.refresh(c);SavedOnMap.refresh();
    }
    static void refresh(Context context){
        if(app!=context.getApplicationContext()&&startup!=null){startup.close();startup=null;if(semantic!=null){semantic.close();semantic=null;}if(nativeSpeaker!=null){nativeSpeaker.close();nativeSpeaker=null;}}
        app=context.getApplicationContext();
        String next=source(context);
        boolean changed=!next.equals(source);
        if(changed){source=next;warningPreferences=new WarningPreferences(prefs(app),true,WarningProviders.supported(source)?source:WarningProviders.FLITSMEISTER);store=new TelemetryStore();store.select(source);publisherSession="";warnings.reset();nativeWarnings.clear();eventAudioManaged=false;if(semantic!=null)semantic.resetEventNegotiation();warning="";legacyWarning="";WazeAlerts.resetSource();}
        if(startup==null){
            nativeSpeaker=new MapsWarningSpeaker(app);
            warningPreferences=new WarningPreferences(prefs(app),true,WarningProviders.supported(source)?source:WarningProviders.FLITSMEISTER);
            final MapsWarningSpeaker speaker=nativeSpeaker;
            scheduler=new WarningScheduler(new WarningScheduler.Policy(){
                public boolean active(){return warningPreferences.reviewed()&&WarningProviders.supported(source)&&(navigating||carActive()||foreground.get()!=null||startup!=null&&startup.activeSession());}
                public WarningAudioOwner.Mode mode(){return warningPreferences.mode();}
                public boolean projected(){return carActive();}
                public boolean enabled(WarningEvent event){return warningPreferences.enabled(event);}
                public boolean passed(WarningEvent event,long now){return MapsGuidanceCoordinator.passed(event,fix,now);}
                public nl.johninnl.navigation.alerts.WarningPassage.Relevance relevance(WarningEvent event,long now){return MapsGuidanceCoordinator.relevance(event,fix,now,navigating);}
            },new WarningScheduler.Speaker(){
                public void prepare(String language){speaker.prepare(language);}
                public void prepare(String language,WarningAudioOwner.Mode mode){speaker.prepare(language,mode);}
                public boolean ready(String language,WarningAudioOwner.Mode mode){return speaker.isReady(language,mode);}
                public WarningAudioOwner.Mode effective(WarningAudioOwner.Mode mode){return speaker.effectiveMode(mode);}
                public String defaultLanguage(){return WarningScheduler.systemLanguage();}
                public boolean speak(WarningEvent event,PlaybackGrant grant,long deadline,WarningScheduler.Callback callback){return speaker.speak(event,grant,deadline,new MapsWarningSpeaker.Listener(){public void started(PlaybackGrant value){callback.started(value);}public void finished(PlaybackGrant value,PlaybackGrant.Outcome outcome,boolean quiet){callback.finished(value,outcome,quiet);}});}
                public void cancel(PlaybackGrant grant){speaker.cancel(grant);}
            },new WarningScheduler.Observer(){
                public void changed(String value){if(value.equals("READY")||value.equals("USER_MUTED")||value.equals("STARTED"))eventAudioManaged=true;semanticRender();}
                public void outcome(WarningEvent event,PlaybackGrant.Outcome value){}
            });
            semantic=new nl.johninnl.navigation.alerts.WarningSession(app,new nl.johninnl.navigation.alerts.WarningConnection.Listener(){
                public void snapshot(nl.johninnl.navigation.alerts.WarningConnection.Snapshot value){nl.johninnl.navigation.alerts.WarningSession current=semantic;if(current!=null&&current.consume(value.providerSession,()->{nativeWarnings.snapshot(value);scheduler.connected(current.connection(),value);}))semanticRender();}
                public void events(java.util.List<nl.johninnl.navigation.alerts.WarningEvent> values){for(WarningEvent value:values)if(value.operation==WarningEvent.Operation.ANNOUNCE)MapsWarningSpeaker.prefetch(app,value);nl.johninnl.navigation.alerts.WarningSession current=semantic;if(!values.isEmpty()&&current!=null&&current.consume(values.get(0).providerSession,()->{nativeWarnings.events(values);scheduler.events(current.connection(),values);}))semanticRender();}
                public void ownerRevoked(long epoch){scheduler.revoked(epoch);}
                public void disconnected(String reason){nativeWarnings.clear();scheduler.disconnected();semanticRender();}
            });
            startup=new nl.johninnl.navigation.startup.NavigationClient(app,semantic);
        }
        startup.select(source,navigating||carActive());
        if(modern()&&!registered){
            IntentFilter filter=new IntentFilter(ACTION);
            if(Build.VERSION.SDK_INT>=33)app.registerReceiver(RECEIVER,filter,Context.RECEIVER_EXPORTED);else app.registerReceiver(RECEIVER,filter);
            registered=true;request();MAIN.removeCallbacks(TICK);MAIN.post(TICK);
        }else if(!modern()&&registered){app.unregisterReceiver(RECEIVER);registered=false;MAIN.removeCallbacks(TICK);removeWidget();}
        if(changed&&registered)request();
        update();
    }
    private static final BroadcastReceiver RECEIVER=new BroadcastReceiver(){
        @Override public void onReceive(Context c,Intent intent){
            if(!ACTION.equals(intent.getAction()))return;
            try{
                Bundle extras=intent.getExtras();if(extras==null)return;
                String sender=Build.VERSION.SDK_INT>=34?getSentFromPackage():intent.getStringExtra("source_package");
                if(Build.VERSION.SDK_INT>=34&&(sender==null||!TelemetryStore.supported(sender)||getSentFromUid()!=c.getPackageManager().getApplicationInfo(sender,0).uid))return;
                Map<String,Object> values=new HashMap<>();for(String key:extras.keySet())values.put(key,extras.get(key));
                if(store.accept(values,sender,SystemClock.elapsedRealtime())){
                    if(source.equals(sender)){
                        String session=intent.getStringExtra("publisher_session_id");
                        if(!session.equals(publisherSession)){publisherSession=session;warnings.reset();}
                    }
                    update();
                }
            }catch(Exception ignored){ /* Reject malformed extras and unknown framework senders. */ }
        }
    };
    static void request(){
        if(app==null||!modern())return;
        app.sendBroadcast(new Intent(REQUEST).setPackage(source).putExtra("from",app.getPackageName()).addFlags(Intent.FLAG_RECEIVER_FOREGROUND));
    }
    static TelemetryStore.View view(){return store.view(SystemClock.elapsedRealtime());}
    static Float speedMps(){Double external=view().currentKmh;if(external!=null)return (float)(external/3.6);if(freshNative(nativeSpeedAt,5000)&&nativeSpeed!=null)return nativeSpeed.floatValue()/3.6f;return null;}
    static Double limitKmh(){Double external=view().limitKmh;if(external!=null)return external;if(freshNative(nativeLimitAt,30000))return nativeLimit;return SpeedAlerts.heldNativeLimitKmh();}
    private static boolean freshNative(long at,long age){long now=SystemClock.elapsedRealtime();return at>=0&&now>=at&&now-at<=age;}
    static void nativeSpeedMps(float speed) {
        nativeSpeedAt=SystemClock.elapsedRealtime();
        nativeSpeed=Float.isFinite(speed)&&speed>=0&&speed<=500/3.6?speed*3.6:null;
    }
    static void nativeSpeed(int speed,boolean kmh){nativeSpeedAt=SystemClock.elapsedRealtime();nativeSpeed=speed>=0&&speed*(kmh?1:1.609344)<=500?speed*(kmh?1.0:1.609344):null;}
    static void nativeLimit(int limit,boolean kmh){nativeLimitAt=SystemClock.elapsedRealtime();nativeLimit=limit>0&&limit*(kmh?1:1.609344)<=500?limit*(kmh?1.0:1.609344):null;}
    static void nativeSpeedometer(int speed,int limit,boolean kmh){nativeSpeed(speed,kmh);nativeLimit(limit,kmh);}

    static void fix(Location value){
        if(value==null)return;long now=SystemClock.elapsedRealtime(),at=value.getElapsedRealtimeNanos()/1000000;
        if(at<0||at<fixAt||at>now||now-at>10000||!Double.isFinite(value.getLatitude())||Math.abs(value.getLatitude())>90||!Double.isFinite(value.getLongitude())||Math.abs(value.getLongitude())>180||(value.hasAccuracy()&&value.getAccuracy()>50))return;
        fix=new Location(value);fixAt=at;
        // A native GPS speed is a fallback only; never infer stationary zero from a missing speed.
        if(value.hasSpeed()&&Float.isFinite(value.getSpeed())&&value.getSpeed()>=0&&value.getSpeed()*3.6<=500){nativeSpeed=value.getSpeed()*3.6;nativeSpeedAt=at;}
        update();
    }
    static void navigating(boolean active){phoneNavigating=active;navigating=active||!carNavigation.isEmpty();if(startup!=null)startup.select(source,navigating||carActive());update();}
    static String provider(){return WarningProviders.supported(source)?WarningProviders.displayName(source):LEGACY.equals(source)?"Waze":"Google Maps";}
    static String status(){
        if(!modern())return LEGACY.equals(source)?WazeAlerts.legacyStatus():"Off · Google Maps";
        TelemetryStore.View v=view();
        boolean dutch=app!=null&&app.getResources().getConfiguration().getLocales().get(0).getLanguage().equals("nl");
        String out=nl.johninnl.navigation.startup.NavigationHealth.warnings(provider(),
            semantic==null?"off":semantic.state(),semantic!=null&&semantic.advertisesEvents(source),
            semantic!=null&&semantic.captureComplete(),startup==null?"off":startup.state(),dutch)
            +"\n"+nl.johninnl.navigation.startup.NavigationHealth.service(provider(),startup==null?"off":startup.state(),dutch)
            +"\n"+nl.johninnl.navigation.startup.NavigationHealth.data(provider(),"Google Maps",v.external,v.currentKmh==null||v.limitKmh==null,dutch);
        if(WarningProviders.supported(source)&&warningPreferences!=null)out+="\n"+warningAudioStatus();
        if(v.zoneActive)out+="\n"+(v.averageKmh==null?"Observed partial average pending":String.format(Locale.getDefault(),"Observed partial average %.0f km/h",v.averageKmh))+String.format(Locale.getDefault()," · %s%.0f%% · %s remaining",v.progressEstimated?"≈":"",v.progressPercent,distance(v.remainingMeters,PowerSaving.miles()));
        else if(v.approachDistanceMeters!=null)out+="\nAverage-speed zone "+(v.approachEstimated?"≈":"")+distance(v.approachDistanceMeters,PowerSaving.miles())+" ahead";
        return out;
    }
    static String distance(double meters,boolean imperial){
        if(imperial){double miles=meters/1609.344;return miles>=.1?String.format(Locale.getDefault(),"%.1f mi",miles):Math.round(meters*3.28084)+" ft";}
        return meters>=1000?String.format(Locale.getDefault(),"%.1f km",meters/1000):Math.round(meters)+" m";
    }
    static String compactWarning(){return warning;}
    static String compactCarWarning(){
        String messages=nativeWarnings.carMessages(SystemClock.elapsedRealtime(),event->warningPreferences==null||warningPreferences.enabled(event));
        return messages.isEmpty()?legacyWarning:provider()+"\n"+messages;
    }
    static int kind(String kind){
        switch(kind){case "police":return WazeAlerts.POLICE;case "crash":return WazeAlerts.CRASH;case "hazard":return WazeAlerts.HAZARD;case "jam":return WazeAlerts.JAM;case "closure":return WazeAlerts.CLOSURE;case "camera":case "mobile_camera":return WazeAlerts.CAMERA;case "average_speed_zone":return WazeAlerts.ZONE;case "flock":return WazeAlerts.FLOCK;default:return WazeAlerts.OTHER;}
    }
    static List<WazeAlerts.Alert> mapAlerts(){
        List<WazeAlerts.Alert> out=new ArrayList<>();
        for(TelemetryStore.RoadAlert a:view().alerts)if(Double.isFinite(a.latitude)&&Double.isFinite(a.longitude))out.add(new WazeAlerts.Alert(source+":"+publisherSession+":"+a.kind+":"+a.id,kind(a.kind),a.latitude,a.longitude,a.triggerMeters,a.title,"From "+provider(),true));
        return out;
    }
    private static void update(){
        SpeedAlerts.refreshNativeWidgets();
        if(!modern()){render();return;}
        if(startup!=null)startup.select(source,navigating||carActive());
        TelemetryStore.View v=view();RoadWarningEngine.Fix position=fix==null?null:new RoadWarningEngine.Fix(fix.getLatitude(),fix.getLongitude(),fix.hasBearing()?fix.getBearing():Double.NaN,fix.hasSpeed()?fix.getSpeed():Double.NaN,fixAt);
        // A kind disabled for map pins is disabled for warnings too.
        RoadWarningEngine.Warning ahead=warnings.update(filteredView(v),position,SystemClock.elapsedRealtime());
        warning=ahead==null?"":(ahead.estimated?"≈":"")+distance(ahead.distanceMeters,PowerSaving.miles())+" · "+warningLabel(ahead.kind);
        legacyWarning=warning;
        nl.johninnl.navigation.alerts.WarningEvent nativeWarning=nativeWarnings.current(SystemClock.elapsedRealtime(),event->warningPreferences==null||warningPreferences.enabled(event));
        if(nativeWarning!=null)warning=provider()+"\n"+nativeWarnings.messages(SystemClock.elapsedRealtime(),event->warningPreferences==null||warningPreferences.enabled(event));
        if(semantic!=null&&semantic.advertisesEvents(source))eventAudioManaged=true;
        boolean legacyAudio=!eventAudioManaged;
        if(ahead!=null&&legacyAudio&&WazeAlerts.CHIME&&(navigating||carActive()||foreground.get()!=null)&&warnings.shouldSpeak(ahead,SystemClock.elapsedRealtime())){
            Chime.alert();if(app!=null)Toast.makeText(app,warningLabel(ahead.kind)+" "+(ahead.estimated?"≈":"")+distance(ahead.distanceMeters,PowerSaving.miles())+" ahead",Toast.LENGTH_LONG).show();
        }
        if(navigating||carActive()||foreground.get()!=null)SpeedAlerts.onTelemetry();
        updatePins(v);
        render();
    }
    /** Maps draws its pins again only when what they show changed; SavedOnMap bounds the rate. */
    private static void updatePins(TelemetryStore.View v){
        boolean pinMode=semantic!=null&&semantic.advertisesEvents(source);
        Object next;
        if(pinMode){
            long now=SystemClock.elapsedRealtime();
            boolean dutch=app!=null&&app.getResources().getConfiguration().getLocales().get(0).getLanguage().equals("nl");
            // By key: the pills may swap two equally near warnings; the map must not redraw for that.
            List<WarningEvent> mapEvents=new ArrayList<>(pillEvents(now));
            mapEvents.addAll(nativeWarnings.mapFeatures(now,event->warningPreferences==null||warningPreferences.enabled(event)));
            List<WarningPins.Pin> pins=WazeAlerts.MAP?WarningPins.byKey(WarningPins.select(mapEvents,now,dutch)):java.util.Collections.emptyList();
            warningPins=pins;next=pins;
        }else{
            warningPins=java.util.Collections.emptyList();
            StringBuilder signature=new StringBuilder(source).append(':').append(publisherSession).append(':').append(suppressNativeFlock());
            for(TelemetryStore.RoadAlert a:v.alerts)signature.append('|').append(a.id).append(':').append(a.kind).append(':').append(a.latitude).append(':').append(a.longitude).append(':').append(a.title);
            next=signature.toString();
        }
        warningPinMode=pinMode;
        // During navigation the same pins are Google's own incident callouts (IncidentPins).
        IncidentPins.update(navigating,pinMode,WarningPins.incidentPins(warningPins));
        if(!next.equals(pinState)){pinState=next;SavedOnMap.refresh();}
    }
    private static TelemetryStore.View filteredView(TelemetryStore.View original){
        return original.withAlerts(alert->(WazeAlerts.KINDS&(1<<kind(alert.kind)))!=0,(WazeAlerts.KINDS&(1<<WazeAlerts.ZONE))!=0);
    }
    static WarningPreferences warningPreferences(Context context){String selected=source(context);return warningPreferences(context,WarningProviders.supported(selected)?selected:WarningProviders.FLITSMEISTER);}
    static WarningPreferences warningPreferences(Context context,String provider){return new WarningPreferences(prefs(context),true,provider);}
    static void warningChoicesChanged(){if(scheduler!=null)scheduler.refresh();update();}
    static void previewWarning(Activity activity){
        boolean dutch=activity.getResources().getConfiguration().getLocales().get(0).getLanguage().equals("nl");
        boolean parked=!navigating&&!(freshNative(nativeSpeedAt,5000)&&nativeSpeed!=null&&nativeSpeed>1);
        nl.johninnl.navigation.alerts.WarningPreviewDialog.show(activity,parked,dutch,()->{
            if(scheduler==null||semantic==null||semantic.connection()==null||!semantic.connection().supportsPreview())return java.util.concurrent.CompletableFuture.completedFuture("INCOMPATIBLE");
            return scheduler.preview(dutch?"nl":"en");
        });
    }
    static void recoverWarningAudio(Activity activity){
        android.app.PendingIntent action=semantic==null?null:semantic.recoveryAction();
        if(action==null){Toast.makeText(activity,"Connect an updated "+provider()+" patch first",Toast.LENGTH_LONG).show();return;}
        try{action.send();}catch(android.app.PendingIntent.CanceledException error){Toast.makeText(activity,"Recovery is unavailable; reconnect "+provider(),Toast.LENGTH_LONG).show();}
    }
    static String warningAudioStatus(){if(warningPreferences==null||!warningPreferences.reviewed())return "Review warning categories and output";WarningAudioOwner.Mode requested=warningPreferences.mode();return WarningStatus.output(requested,nativeSpeaker==null?requested:nativeSpeaker.effectiveMode(requested),"Google Maps",false)+" · "+WarningStatus.label(scheduler==null?"OFF":scheduler.status(),false);}
    private static String warningLabel(String kind){switch(kind){case "average_speed_zone":return "Average-speed zone";case "mobile_camera":return "Mobile camera";case "camera":return "Speed camera";case "police":return "Police";case "closure":return "Road closure";case "jam":return "Traffic jam";case "flock":return "Flock camera";case "crash":return "Crash";default:return "Hazard";}}
    private static final Runnable TICK=new Runnable(){public void run(){if(!registered)return;update();MAIN.postDelayed(this,1000);}};
    static void resume(Activity activity){
        if(startup!=null)startup.onActivityResumed(activity);
        if(activity.getClass().getName().equals("com.google.android.maps.MapsActivity")){foreground=new WeakReference<>(activity);request();render();}
    }
    static void pause(Activity activity){if(startup!=null)startup.onActivityPaused(activity);if(foreground.get()==activity){foreground.clear();removeWidget();}}
    private static void removeWidget(){
        if(widget!=null&&widget.getParent() instanceof ViewGroup)((ViewGroup)widget.getParent()).removeView(widget);
        widget=null;concealPhoneCard(null);
    }
    /** Left edge that keeps a stack at (left,top,width,height) beside the visible map-button column, or [left]. */
    static int phoneColumnClearance(ViewGroup content,int left,int top,int width,int height,int gap){
        View tiles=Shapes.navTiles;
        if(tiles==null||!tiles.isAttachedToWindow()||tiles.getVisibility()!=View.VISIBLE||tiles.getWidth()<=0)return left;
        int[] at=new int[2],origin=new int[2];tiles.getLocationOnScreen(at);content.getLocationOnScreen(origin);
        android.graphics.Rect column=new android.graphics.Rect(at[0]-origin[0],at[1]-origin[1],at[0]-origin[0]+tiles.getWidth(),at[1]-origin[1]+tiles.getHeight());
        return android.graphics.Rect.intersects(column,new android.graphics.Rect(left,top,left+width,top+height))?column.right+gap:left;
    }
    private static WeakReference<View> concealedCard=new WeakReference<>(null);
    private static float concealedAlpha=1f;
    /** Hide [card] (Maps' phone speed card) under the speed pill; null shows the previous one again. */
    private static void concealPhoneCard(View card){
        View previous=concealedCard.get();
        if(previous!=null&&previous!=card&&previous.getAlpha()==0f)previous.setAlpha(concealedAlpha);
        if(card==null){concealedCard.clear();return;}
        if(previous!=card){concealedAlpha=card.getAlpha();concealedCard=new WeakReference<>(card);}
        else if(card.getAlpha()!=0f)concealedAlpha=card.getAlpha();
        if(card.getAlpha()!=0f)card.setAlpha(0f);
    }
    private static void render(){
        renderCar();
        Activity activity=foreground.get();if(!modern()||activity==null||!widgetEnabled(activity)){removeWidget();return;}
        ViewGroup content=activity.findViewById(android.R.id.content);if(!(content instanceof FrameLayout)){removeWidget();return;}
        View badge=Shapes.findSpeedBadge(content);
        View card=badge==null?null:Shapes.badgeCard(badge,content);
        Pills pills=pills(nativeSpeedShown(card));
        if(pills.empty()){removeWidget();return;}
        if(widget==null){widget=new CompactSpeedView(activity);widget.setOnClickListener(v->activity.startActivity(Screens.intent(activity,CustomizationActivity.class).putExtra(CustomizationActivity.EXTRA_PAGE,CustomizationActivity.PAGE_WAZE)));content.addView(widget);}
        float density=activity.getResources().getDisplayMetrics().density;
        FrameLayout.LayoutParams lp=new FrameLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT,ViewGroup.LayoutParams.WRAP_CONTENT,Gravity.BOTTOM|Gravity.START);
        lp.leftMargin=Math.round(16*density);lp.bottomMargin=Math.round(112*density);
        if(card!=null){
            int[] location=new int[2],origin=new int[2];card.getLocationOnScreen(location);content.getLocationOnScreen(origin);
            lp.leftMargin=Math.max(0,location[0]-origin[0]);
            // The speed pill takes the card's place, bottom-aligned with it; warnings alone stack above it.
            int bottom=content.getHeight()-(location[1]-origin[1]);
            lp.bottomMargin=pills.speed?Math.max(0,bottom-card.getHeight()):Math.max(Math.round(24*density),bottom+Math.round(8*density));
        }
        // Warnings stack upward from the speed pill; keep the stack clear of the map-button column above it.
        int stack=Math.round(nl.johninnl.navigation.alerts.CarWarningPills.height(pills.info.zoneActive,pills.events.size()+(pills.message.isEmpty()?0:1),pills.speed)*density);
        int column=phoneColumnClearance(content,lp.leftMargin,content.getHeight()-lp.bottomMargin-stack,Math.round(nl.johninnl.navigation.alerts.CarWarningPills.WIDTH*density),stack,Math.round(8*density));
        if(column>lp.leftMargin)lp.leftMargin=column;
        concealPhoneCard(pills.speed?card:null);
        // The phone uses the same mockup-pack pills as Android Auto, the speed pill in place of Maps' own badge.
        widget.setLayoutParams(lp);pills.bind(widget,badge==null?null:largestNativeText(badge),Shapes.navDarkScheme());widget.bringToFront();
    }
}
