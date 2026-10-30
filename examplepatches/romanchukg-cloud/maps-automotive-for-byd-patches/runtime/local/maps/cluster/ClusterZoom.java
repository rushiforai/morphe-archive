// SPDX-License-Identifier: GPL-3.0-only
package local.maps.cluster;

import android.app.Activity;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import android.view.Display;
import android.view.View;
import java.lang.ref.WeakReference;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.Arrays;
import java.util.Locale;
import java.util.concurrent.Future;
import java.util.concurrent.atomic.AtomicBoolean;

/** Native static-camera zoom, restricted to the independently identified instrument cluster. */
public final class ClusterZoom {
    private static final String MAIN="com.google.android.maps.MapsActivity";
    /** 26.10 xay cached camera states; the names swapped roles against 26.09 xcl (A was navigation, B static). */
    static final String NAVIGATION_STATE="z",STATIC_STATE="A";
    private static final String CLUSTER="com.google.android.apps.gmm.car.embedded.auxiliarymap.EmbeddedClusterActivity";
    private static final Object LOCK=new Object();
    private static volatile ClusterZoomPolicy policy=new ClusterZoomPolicy();
    private static final Handler ui=new Handler(Looper.getMainLooper());
    private static WeakReference<Activity> mainOwner=new WeakReference<>(null),clusterOwner=new WeakReference<>(null);
    private static WeakReference<View> clusterView=new WeakReference<>(null);
    private static volatile Binding mainBinding,clusterBinding;
    private static NativeAccess access;
    private static boolean shown,presentationVisible,rendererReady;
    private static volatile boolean failed,manualRequested,available;
    private static volatile Session held;
    private static volatile ClusterZoomTrace.Snapshot diagnostic=ClusterZoomTrace.EMPTY;
    private static volatile String writerResult="not_requested";
    private static String stage="not_prepared",firstReason="",errorClass="none",savedReason="not_prepared",savedError="none";
    private static String mainBindReason="main_binding_missing",mainBindError="none",clusterBindReason="cluster_binding_missing",clusterBindError="none";
    private static WeakReference<Object> diagnosticXcl=new WeakReference<>(null);
    private static final class GateFailure extends IllegalStateException { final String reason;GateFailure(String reason){this.reason=reason;} }
    private static void enter(String value){stage=value;}
    private static boolean genericReason(String value){return value.equals("not_prepared")||value.equals("root_not_ready")||value.equals("renderer_not_ready");}
    private static void note(String reason,String error){if(firstReason.isEmpty()||genericReason(firstReason)&&!genericReason(reason)){firstReason=reason;errorClass=error;}}
    private static GateFailure gate(String reason){note(reason,"none");return new GateFailure(reason);}
    private static boolean reject(String reason){note(reason,"none");return false;}
    private static void capture(Throwable error){if(error instanceof GateFailure)note(((GateFailure)error).reason,"none");else {Throwable shown=error instanceof java.lang.reflect.InvocationTargetException&&error.getCause()!=null?error.getCause():error;note(stage+"_exception",ClusterZoomTrace.token(shown.getClass().getSimpleName()));}}
    static ClusterZoomTrace.Snapshot diagnosticSnapshot(){return diagnostic;}
    static String diagnosticWriter(){return writerResult;}
    static boolean manualStep(int direction){
        ClusterZoomTrace.init();prepare();boolean before=ready();
        if(before)step(direction);else{writerResult="skipped_not_ready";publishDiagnostic();}
        ClusterZoomTrace.record(diagnostic,"manual",0,0,direction,WheelServiceSetup.enabled(),before,true,true,false,false,writerResult,android.os.SystemClock.uptimeMillis());return before;
    }
    private static final ThreadLocal<Session> ownCall=new ThreadLocal<>();
    private static final AtomicBoolean cameraRefreshPending=new AtomicBoolean();
    private ClusterZoom(){}
    private static boolean allowed(){return manualRequested||WheelServiceSetup.enabled();}
    /** Input filter uses only cached state and our volatile guidance snapshot. */
    static boolean ready(){return available&&allowed()&&ClusterHost.zoomProfileReady()&&BydGuidance.sourceKnownForZoom();}
    static void prepare(){
        if(Looper.myLooper()!=Looper.getMainLooper()){ui.post(ClusterZoom::prepare);return;}
        synchronized(LOCK){
            manualRequested=true;Activity main=mainOwner.get(),cluster=clusterOwner.get();View root=clusterView.get();boolean visible=presentationVisible;
            if(main!=null&&mainBinding==null)mainCreated(main);
            if(cluster!=null&&root!=null){if(clusterBinding==null||failed)attach(cluster,root);visibility(cluster,visible);}
        }
    }
    static String description(){
        synchronized(LOCK){
            if(!ClusterHost.zoomProfileReady())return "Cluster zoom: "+ClusterHost.projectionStatus();
            if(!BydGuidance.sourceKnownForZoom())return "Cluster zoom: the guidance source is not verified yet. ["+savedReason+"]";
            if(!ready())return "Cluster zoom: this native camera mode is not ready or supported. ["+savedReason+"]";
            Session session=held;
            if(session!=null)synchronized(session){if(session.valid&&session.policy.manual())return String.format(Locale.US,"Cluster zoom: %.1f (held until reset or map recreation).",session.policy.chosen());}
            return "Cluster zoom: automatic. Wheel buttons change only the instrument cluster map.";
        }
    }
    static void mainCreated(Activity activity){
        if(activity==null||!MAIN.equals(activity.getClass().getName()))return;
        synchronized(LOCK){
            available=false;if(mainOwner.get()!=activity){release(true);mainBinding=null;}mainOwner=new WeakReference<>(activity);
            if(!allowed()){mainBinding=null;return;}
            try{enter("main_delegate");Object delegate=field(activity,"Z");requireType(delegate,"fsb");enter("main_binding");mainBinding=Binding.read(field(delegate,"aC"));enter("native_schema");access=NativeAccess.forLoader(activity.getClassLoader());mainBindReason="none";mainBindError="none";reevaluate();}
            catch(Exception|LinkageError error){capture(error);mainBindReason=firstReason;mainBindError=errorClass;mainBinding=null;}
        }
    }
    static void mainDestroyed(Activity activity){synchronized(LOCK){if(mainOwner.get()==activity){release(true);available=false;mainBinding=null;mainOwner=new WeakReference<>(null);}}}
    static void attach(Activity activity,View root){
        synchronized(LOCK){
            release(true);available=false;failed=false;shown=false;rendererReady=false;clusterBinding=null;clusterOwner=new WeakReference<>(activity);clusterView=new WeakReference<>(root);
            if(!allowed())return;
            try{
                if(activity==null||!CLUSTER.equals(activity.getClass().getName()))return;
                enter("cluster_delegate");Object delegate=field(activity,"s");requireType(delegate,"gcw");enter("cluster_binding");clusterBinding=Binding.read(field(delegate,"m"));enter("native_schema");access=NativeAccess.forLoader(activity.getClassLoader());clusterBindReason="none";clusterBindError="none";
                if(!ClusterZoomPolicy.valid(access.zoom(access.current(clusterBinding))))throw new IllegalStateException("Camera not ready");rendererReady=access.ready(clusterBinding,root);
            }catch(Exception|LinkageError error){capture(error);clusterBindReason=firstReason;clusterBindError=errorClass;fail(error);}
        }
    }
    static void visibility(Activity activity,boolean visible){
        synchronized(LOCK){
            if(clusterOwner.get()!=activity)return;firstReason="";errorClass="none";enter("visibility");
            try { presentationVisible=visible;
            if(!allowed()){release(true);available=false;shown=false;failed=false;rendererReady=false;mainBinding=null;clusterBinding=null;return;}
            Activity main=mainOwner.get();if((mainBinding==null||failed)&&main!=null)mainCreated(main);
            if(clusterBinding==null||failed)attach(activity,clusterView.get());
            try{if(mainBinding!=null&&clusterBinding!=null&&!liveIsolated()){release(false);mainCreated(main);attach(activity,clusterView.get());}}
            catch(Exception|LinkageError error){fail(error);}
            shown=visible&&surfaceReady();try{rendererReady=shown&&clusterBinding!=null&&access!=null&&access.ready(clusterBinding,clusterView.get());}catch(Exception|LinkageError error){fail(error);}
            if(!shown||!rendererReady||!BydGuidance.sourceKnownForZoom())release(true);reevaluate();
            } finally { publishDiagnostic(); }
        }
    }
    static void detach(){synchronized(LOCK){release(true);available=false;shown=false;presentationVisible=false;failed=false;rendererReady=false;clusterBinding=null;clusterOwner=new WeakReference<>(null);clusterView=new WeakReference<>(null);}}
    static void reset(){if(Looper.myLooper()!=Looper.getMainLooper()){ui.post(ClusterZoom::reset);return;}synchronized(LOCK){release(true);reevaluate();}}
    static void step(final int direction){
        if(direction!=1&&direction!=-1)return;if(Looper.myLooper()!=Looper.getMainLooper()){ui.post(()->step(direction));return;}
        synchronized(LOCK){
            writerResult="not_requested";
            try {
            if(!ready()||!surfaceReady()){writerResult="skipped_not_ready";release(true);available=false;return;}
            try{
                if(!liveIsolated()||!access.ready(clusterBinding,clusterView.get()))throw new IllegalStateException("Camera ownership changed");
                Owners owners=access.owners(mainBinding,clusterBinding);boolean navigation=navigation(owners.cluster);Object state=navigation?navigationState(owners.cluster):staticState(owners.cluster);
                Object camera=access.current(clusterBinding);float current=access.zoom(camera);float lower=access.limit(clusterBinding,camera,ClusterZoomPolicy.MIN),upper=access.limit(clusterBinding,camera,ClusterZoomPolicy.MAX);
                if(!ClusterZoomPolicy.valid(current)||!ClusterZoomPolicy.bounds(lower,upper))throw new IllegalStateException("Invalid native zoom");
                Session session=held;if(session!=null&&!session.owners.same(owners)){release(false);throw new IllegalStateException("Native owner changed");}
                if(session!=null&&session.navigation!=navigation){release(false);session=null;}
                if(session==null){session=navigation?new Session(owners,zoomOverride(owners.cluster)):new Session(owners,staticZoom(state));held=session;policy=session.policy;}
                final float selected;
                synchronized(session){if(!session.valid||!session.policy.step(direction,current,lower,upper)){writerResult="at_limit";return;}selected=session.policy.chosen();}
                if(navigation)setNavigationZoom(session,Float.valueOf(selected));else {Object changed=copyStaticZoom(state,selected);setNativeState(session,changed);}
            }catch(Exception|LinkageError error){writerResult="rejected";fail(error);}
            } finally { publishDiagnostic(); }
        }
    }
    /** One pinned xcl.d entry. This callback never acquires LOCK or calls JNI. */
    public static Object adjustState(Object owner,Object incoming){
        Session session=held;
        // Stock d() carries xcl.d overrides into B. Restore only our scalar in the
        // Java packet before its original JNI read; this entry never writes JNI.
        if(session!=null&&session.navigation&&ownCall.get()!=session&&session.owners.cluster.xcl.get()==owner){
            releaseNavigationPacket(session,owner);return incoming;
        }
        if(session==null||session.navigation||!available||!allowed()||!ClusterHost.zoomProfileReady()||ownCall.get()==session||session.owners.cluster.xcl.get()!=owner)return incoming;
        try{
            // Native state writes on an unknown thread are left untouched, never redirected.
            if(Looper.myLooper()!=Looper.getMainLooper()||!BydGuidance.sourceKnownForZoom()||!surfaceReady()||!liveIsolated())throw new IllegalStateException("Static camera scope lost");
            if(!session.owners.same(access.owners(mainBinding,clusterBinding)))throw new IllegalStateException("Native owner changed");
            staticState(session.owners.cluster);double proposed=staticZoom(incoming);Object camera=access.current(clusterBinding);
            float lower=access.limit(clusterBinding,camera,ClusterZoomPolicy.MIN),upper=access.limit(clusterBinding,camera,ClusterZoomPolicy.MAX);
            if(!ClusterZoomPolicy.bounds(lower,upper))throw new IllegalStateException("Invalid native zoom limits");
            synchronized(session){
                if(held!=session||!session.valid||!session.policy.manual())return incoming;
                // A native refresh may echo the already held state. Never turn that into feedback.
                if(Math.abs(proposed-session.policy.chosen())>.00001)session.baseline=proposed;
                float selected=session.policy.apply((float)proposed,lower,upper);
                return Math.abs(proposed-selected)<=.00001?incoming:copyStaticZoom(incoming,selected);
            }
        }catch(Exception|LinkageError error){invalidate(session);return incoming;}
    }
    private static void releaseNavigationPacket(Session session,Object owner){
        if(Looper.myLooper()!=Looper.getMainLooper()){invalidate(session);return;}
        restoreNavigationPacket(session,owner);
        synchronized(session){session.valid=false;session.policy.reset();if(held==session)held=null;}
    }
    private static void restoreNavigationPacket(Session session,Object owner){
        try{
            if(Looper.myLooper()!=Looper.getMainLooper()||!liveIsolated()||!session.owners.same(access.owners(mainBinding,clusterBinding)))throw new IllegalStateException("Navigation packet scope lost");
            navigationState(session.owners.cluster);Object current=field(owner,"c");requireType(current,"agvh");
            synchronized(session){
                if(held!=session||!session.valid||!session.policy.manual())return;
                Float actual=zoomOverride(session.owners.cluster);
                // Never roll a newer foreign override back to our remembered baseline.
                if(actual!=null&&Float.compare(actual.floatValue(),session.policy.chosen())==0){
                    Object changed=copyNavigationOverride(current,session.navigationBaseline);
                    if(!liveIsolated()||field(owner,"c")!=current||!session.owners.same(access.owners(mainBinding,clusterBinding))||!navigation(session.owners.cluster))throw new IllegalStateException("Navigation packet changed");
                    declaredField(owner.getClass(),"c").set(owner,changed);
                }
            }
        }catch(Exception|LinkageError ignored){} // No JNI; foreign, disposed or unvalidated packets stay untouched.
    }
    private static Object cloneNavigationOverride(Object original,int flags,double zoom)throws ReflectiveOperationException{
        Object builder=invoke(original,"cF");invoke(builder,"bI");Object mutable=field(builder,"b");requireType(mutable,"agvh");if(mutable==original)throw new IllegalStateException("Mutable navigation override");
        declaredField(mutable.getClass(),"b").setInt(mutable,flags);declaredField(mutable.getClass(),"c").setDouble(mutable,zoom);return invoke(builder,"bE");
    }
    private static Object copyNavigationOverride(Object original,Float selected)throws ReflectiveOperationException{
        requireType(original,"agvh");int flags=(Integer)field(original,"b");double previous=(Double)field(original,"c");
        if(selected!=null&&(!ClusterZoomPolicy.valid(selected.floatValue())||selected<ClusterZoomPolicy.MIN||selected>ClusterZoomPolicy.MAX))throw new IllegalStateException("Invalid navigation baseline");
        Object changed=cloneNavigationOverride(original,selected==null?flags&~1:flags|1,selected==null?0d:selected.doubleValue());
        Object roundTrip=cloneNavigationOverride(changed,flags,previous);
        if(!Arrays.equals((byte[])invoke(original,"cy"),(byte[])invoke(roundTrip,"cy")))throw new IllegalStateException("Navigation override copy changed other fields");return changed;
    }
    /** Exact xcl.n first-argument hook. The native tilt and reason arguments are untouched. */
    public static Float adjustNavigationZoom(Object owner,Float incoming){
        Session session=held;
        if(session==null||!session.navigation||ownCall.get()==session||session.owners.cluster.xcl.get()!=owner)return incoming;
        if(!available||!allowed()){
            Float released=incoming;
            if(Looper.myLooper()==Looper.getMainLooper()&&(!BydGuidance.sourceKnownForZoom()||!surfaceReady()))released=releaseNavigationEcho(session,owner,incoming);
            invalidate(session);return released;
        }
        boolean cleanupOwnedEcho=false;
        try{
            if(Looper.myLooper()!=Looper.getMainLooper())throw new IllegalStateException("Navigation camera thread lost");
            if(!BydGuidance.sourceKnownForZoom()||!surfaceReady()){cleanupOwnedEcho=true;throw new IllegalStateException("Navigation camera source or surface lost");}
            if(!liveIsolated())throw new IllegalStateException("Navigation camera owner scope lost");
            if(!session.owners.same(access.owners(mainBinding,clusterBinding)))throw new IllegalStateException("Native owner changed");
            navigationState(session.owners.cluster);
            if(incoming!=null&&!ClusterZoomPolicy.valid(incoming.floatValue()))throw new IllegalStateException("Invalid navigation override");
            synchronized(session){
                if(held!=session||!session.valid||!session.policy.manual())return incoming;
                float selected=session.policy.chosen();
                // A tilt-only native call echoes the existing zoom. It is not a foreign baseline.
                if(incoming==null||Float.compare(incoming.floatValue(),selected)!=0)session.navigationBaseline=incoming;
                return Float.valueOf(selected);
            }
        }catch(Exception|LinkageError error){
            Float released=cleanupOwnedEcho?releaseNavigationEcho(session,owner,incoming):incoming;
            invalidate(session);return released;
        }
    }
    /** Release only an echo of our exact stored scalar; original n retains its tilt/reason/JNI. */
    private static Float releaseNavigationEcho(Session session,Object owner,Float incoming){
        try{
            if(Looper.myLooper()!=Looper.getMainLooper()||incoming==null||session.owners.cluster.xcl.get()!=owner||!liveIsolated()||!session.owners.same(access.owners(mainBinding,clusterBinding)))return incoming;
            navigationState(session.owners.cluster);Float actual=zoomOverride(session.owners.cluster);
            synchronized(session){
                if(held!=session||!session.valid||!session.policy.manual()||actual==null)return incoming;
                float selected=session.policy.chosen();
                if(Float.compare(incoming.floatValue(),selected)!=0||Float.compare(actual.floatValue(),selected)!=0)return incoming;
                return session.navigationBaseline;
            }
        }catch(Exception|LinkageError ignored){return incoming;}
    }
    /** Pinned d/e packet completion. Never locks or calls JNI on the native entry stack. */
    public static void cameraChanged(Object owner){
        if(owner==null||diagnosticXcl.get()!=owner)return;
        if(Looper.myLooper()!=Looper.getMainLooper())available=false;
        // A normal supported A/B switch retains its last cached readiness for one UI turn.
        // Every queued wheel writer independently validates the current family and full scope.
        if(cameraRefreshPending.compareAndSet(false,true)){
            WeakReference<Object> expected=new WeakReference<>(owner);
            ui.post(()->{cameraRefreshPending.set(false);Object value=expected.get();if(value!=null)refreshCameraChanged(value);});
        }
    }
    private static void refreshCameraChanged(Object owner){
        if(Looper.myLooper()!=Looper.getMainLooper()||diagnosticXcl.get()!=owner)return;
        synchronized(LOCK){
            if(diagnosticXcl.get()!=owner)return;
            firstReason="";errorClass="none";enter("camera_changed");
            try{
                if(access==null||!allowed()||!shown||!surfaceReady()||!liveIsolated()||!BydGuidance.sourceKnownForZoom()){release(false);available=false;return;}
                Owners owners=access.owners(mainBinding,clusterBinding);
                if(owners.cluster.xcl.get()!=owner){release(false);available=false;return;}
                boolean nav=navigation(owners.cluster);if(nav)navigationState(owners.cluster);else staticState(owners.cluster);
                Session session=held;if(session!=null&&(!session.owners.same(owners)||session.navigation!=nav))release(false);
                rendererReady=access.ready(clusterBinding,clusterView.get());failed=false;reevaluate();
            }catch(Exception|LinkageError error){fail(error);}
            finally{publishDiagnostic();}
        }
    }
    /** Explicit pointer-slider refresh through the stock NAV update, never static d(). */
    static boolean refreshNavigationViewport(Object viewportManager){
        if(Looper.myLooper()!=Looper.getMainLooper()||viewportManager==null)return false;
        prepare(); // Access only: this never opts in to the accessibility wheel service.
        synchronized(LOCK){
            try{
                if(access==null||!shown||!BydGuidance.sourceKnownForZoom()||!surfaceReady()||!liveIsolated()||!access.ready(clusterBinding,clusterView.get()))return false;
                Owners owners=access.owners(mainBinding,clusterBinding);Object owner=owners.cluster.xcl.get();navigationState(owners.cluster);
                if(field(owner,"m")!=viewportManager)return false;
                Object jni=owners.cluster.jni.get();if(jni==null)return false;
                synchronized(jni){
                    if(!BydGuidance.sourceKnownForZoom()||!surfaceReady()||!liveIsolated()||!owners.same(access.owners(mainBinding,clusterBinding)))return false;
                    navigationState(owners.cluster);if(field(owner,"m")!=viewportManager)return false;
                    Method update=owner.getClass().getDeclaredMethod("q");update.setAccessible(true);
                    Object response=update.invoke(owner);if(response==null)return false;writerResult="native_nav_viewport_invoked";return true;
                }
            }catch(Exception|LinkageError error){capture(error);return false;}
            finally{publishDiagnostic();}
        }
    }
    private static void invalidate(Session session){synchronized(session){session.valid=false;}if(held==session){held=null;available=false;failed=true;}}
    /** Caller holds only the app lock. No session lock is held while entering native/JNI. */
    private static void release(boolean restore){
        Session session=held;if(session!=null&&session.navigation&&Looper.myLooper()==Looper.getMainLooper())restoreNavigationPacket(session,session.owners.cluster.xcl.get());
        held=null;if(session==null){policy.reset();return;}
        double baseline;Float navigationBaseline;synchronized(session){baseline=session.baseline;navigationBaseline=session.navigationBaseline;session.valid=false;session.policy.reset();}
        if(!restore||Looper.myLooper()!=Looper.getMainLooper()||!BydGuidance.sourceKnownForZoom()||access==null)return;
        try{
            if(!surfaceReady()||!liveIsolated()||!session.owners.same(access.owners(mainBinding,clusterBinding)))return;
            if(session.navigation)setNavigationZoom(session,navigationBaseline);else {Object current=staticState(session.owners.cluster);setNativeState(session,copyStaticZoom(current,baseline));}
        }catch(Exception|LinkageError ignored){} // Unknown/disposed/familyA owners receive no writes.
    }
    private static void setNativeState(Session session,Object state)throws ReflectiveOperationException{
        Object jni=session.owners.cluster.jni.get();if(jni==null)throw new IllegalStateException("Native map closed");
        synchronized(jni){
            if(!BydGuidance.sourceKnownForZoom()||!surfaceReady()||!liveIsolated()||!session.owners.same(access.owners(mainBinding,clusterBinding)))throw new IllegalStateException("Native owner changed");
            staticState(session.owners.cluster);ownCall.set(session);
            try{Object response=session.owners.cluster.xcl.get().getClass().getMethod("d",Class.forName("agvg",false,access.loader)).invoke(session.owners.cluster.xcl.get(),state);
                // Optional can contain an empty protobuf; actual camera is validated on-device separately.
                if(response==null)throw new IllegalStateException("Missing native camera response");writerResult="native_invoked";
            }finally{ownCall.remove();}
        }
    }
    private static void setNavigationZoom(Session session,Float selected)throws ReflectiveOperationException{
        Object jni=session.owners.cluster.jni.get();if(jni==null)throw new IllegalStateException("Native map closed");
        if(selected!=null&&(!ClusterZoomPolicy.valid(selected.floatValue())||selected.floatValue()<ClusterZoomPolicy.MIN||selected.floatValue()>ClusterZoomPolicy.MAX))throw new IllegalStateException("Invalid navigation override");
        synchronized(jni){
            if(!BydGuidance.sourceKnownForZoom()||!surfaceReady()||!liveIsolated()||!session.owners.same(access.owners(mainBinding,clusterBinding)))throw new IllegalStateException("Native owner changed");
            navigationState(session.owners.cluster);copyNavigationOverride(field(session.owners.cluster.xcl.get(),"c"),selected);
            if(!BydGuidance.sourceKnownForZoom()||!surfaceReady()||!liveIsolated()||!session.owners.same(access.owners(mainBinding,clusterBinding)))throw new IllegalStateException("Native owner changed during copy");
            navigationState(session.owners.cluster);ownCall.set(session);
            try{
                // Original i() preserves the CURRENT tilt override and calls n(zoom,tilt,5).
                Object response=session.owners.cluster.xcl.get().getClass().getMethod("i",Float.class).invoke(session.owners.cluster.xcl.get(),selected);
                if(response==null)throw new IllegalStateException("Missing native navigation response");writerResult="native_nav_invoked";
            }finally{ownCall.remove();}
        }
    }
    private static boolean navigation(NativeOwner owner)throws ReflectiveOperationException{
        Object xcl=owner.xcl.get();if(xcl==null)throw gate("cluster_xcl_missing");Object value=field(xcl,"B");if(!(value instanceof Boolean))throw gate("camera_family_type");return Boolean.TRUE.equals(value);
    }
    private static Object navigationState(NativeOwner owner)throws ReflectiveOperationException{
        enter("cluster_navigation_camera");if(!navigation(owner))throw gate("not_navigation_family");
        Object optional=field(owner.xcl.get(),NAVIGATION_STATE);if(!Boolean.TRUE.equals(invoke(optional,"isPresent")))throw gate("navigation_state_missing");
        Object state=invoke(optional,"get");requireType(state,"agwh");int mode=(Integer)field(state,"b");
        if(mode==3)requireType(field(state,"c"),"agvu");else if(mode==6)requireType(field(state,"c"),"agvk");else throw gate("navigation_case_unsupported");return state;
    }
    private static Float zoomOverride(NativeOwner owner)throws ReflectiveOperationException{
        Object state=field(owner.xcl.get(),"c");requireType(state,"agvh");int flags=(Integer)field(state,"b");
        Object value=invoke(owner.xcl.get(),"k");if((flags&1)==0){if(value!=null)throw gate("navigation_override_schema");return null;}
        double raw=(Double)field(state,"c");if(!(value instanceof Float)||Double.isNaN(raw)||Double.isInfinite(raw)||raw<ClusterZoomPolicy.MIN||raw>ClusterZoomPolicy.MAX||Double.compare(raw,((Float)value).doubleValue())!=0)throw gate("navigation_override_invalid");return (Float)value;
    }
    private static Object staticState(NativeOwner owner)throws ReflectiveOperationException{
        Object xcl=owner.xcl.get();enter("cluster_camera_family");if(xcl==null)throw gate("cluster_xcl_missing");if(Boolean.TRUE.equals(field(xcl,"B")))throw gate("family_a");
        Object optional=field(xcl,STATIC_STATE);if(!Boolean.TRUE.equals(invoke(optional,"isPresent")))throw gate("camera_state_missing");Object state=invoke(optional,"get");staticZoom(state);return state;
    }
    private static double staticZoom(Object state)throws ReflectiveOperationException{
        requireType(state,"agvg");if((Integer)field(state,"b")!=8)throw gate("case_not8");Object payload=field(state,"c");requireType(payload,"agwj");
        if((((Integer)field(payload,"b"))&4)==0)throw gate("zoom_field_missing");double zoom=(Double)field(payload,"e");if(zoom<ClusterZoomPolicy.MIN||zoom>ClusterZoomPolicy.MAX||!ClusterZoomPolicy.valid((float)zoom)||Double.isNaN(zoom)||Double.isInfinite(zoom))throw new IllegalStateException("Invalid static zoom");return zoom;
    }
    private static Object cloneZoom(Object state,double selected)throws ReflectiveOperationException{
        Object payload=field(state,"c"),builder=invoke(payload,"cF");invoke(builder,"bI");Object copy=field(builder,"b");requireType(copy,"agwj");if(copy==payload)throw new IllegalStateException("Mutable native input");declaredField(copy.getClass(),"e").setDouble(copy,selected);Object changed=invoke(builder,"bE");
        Object outer=invoke(state,"cF");invoke(outer,"bI");Object mutable=field(outer,"b");requireType(mutable,"agvg");if(mutable==state)throw new IllegalStateException("Mutable native state");declaredField(mutable.getClass(),"c").set(mutable,changed);return invoke(outer,"bE");
    }
    private static Object copyStaticZoom(Object original,double selected)throws ReflectiveOperationException{
        double previous=staticZoom(original);if(selected<ClusterZoomPolicy.MIN||selected>ClusterZoomPolicy.MAX||!ClusterZoomPolicy.valid((float)selected)||Double.isNaN(selected)||Double.isInfinite(selected))throw new IllegalStateException("Invalid selected zoom");
        Object changed=cloneZoom(original,selected),roundTrip=cloneZoom(changed,previous);
        // Native protobuf builders must retain every other known/unknown field exactly.
        if(!Arrays.equals((byte[])invoke(original,"cy"),(byte[])invoke(roundTrip,"cy")))throw new IllegalStateException("Native state copy changed other fields");return changed;
    }
    private static Object invoke(Object owner,String name)throws ReflectiveOperationException{return owner.getClass().getMethod(name).invoke(owner);}
    private static Field declaredField(Class<?> owner,String name)throws ReflectiveOperationException{Field field=owner.getDeclaredField(name);field.setAccessible(true);return field;}
    private static boolean surfaceReady(){
        Activity a=clusterOwner.get();View view=clusterView.get();
        if(a==null)return reject("cluster_activity_missing");if(a.isFinishing())return reject("cluster_activity_finishing");if(a.isDestroyed())return reject("cluster_activity_destroyed");if(view==null)return reject("root_missing");
        if(!view.isAttachedToWindow())return reject("root_detached");if(!view.isShown())return reject("root_not_shown");if(view.getWidth()<=0||view.getHeight()<=0)return reject("root_zero_size");
        Display display=view.getDisplay();if(display==null)return reject("root_display_missing");if(display.getDisplayId()==Display.DEFAULT_DISPLAY)return reject("root_display_main");if(display.getState()==Display.STATE_OFF)return reject("root_display_off");return true;
    }
    private static boolean isolated(){return mainOwner.get()!=null&&mainBinding!=null&&clusterBinding!=null&&ClusterZoomPolicy.isolated(mainBinding.manager.get(),mainBinding.dispatcher.get(),mainBinding.legacy.get(),mainBinding.modern.get(),clusterBinding.manager.get(),clusterBinding.dispatcher.get(),clusterBinding.legacy.get(),clusterBinding.modern.get());}
    private static boolean liveIsolated()throws ReflectiveOperationException{if(!isolated())return false;Activity main=mainOwner.get(),cluster=clusterOwner.get();if(main==null||cluster==null||main.isFinishing()||main.isDestroyed()||cluster.isFinishing()||cluster.isDestroyed())return false;return field(field(main,"Z"),"aC")==mainBinding.manager.get()&&field(field(cluster,"s"),"m")==clusterBinding.manager.get()&&mainBinding.live()&&clusterBinding.live();}
    private static void reevaluate(){
        available=false;
        if(failed){note(savedReason,savedError);return;}if(!shown){if(firstReason.isEmpty())note("root_not_ready","none");return;}if(!rendererReady){note("renderer_not_ready","none");return;}
        if(access==null){note("native_schema_missing","none");return;}if(!isolated()){note(mainBinding==null?mainBindReason:clusterBinding==null?clusterBindReason:"main_cluster_binding_shared",mainBinding==null?mainBindError:clusterBindError);return;}
        if(!BydGuidance.sourceKnownForZoom()){note("source_unknown","none");return;}
        try{Owners owners=access.owners(mainBinding,clusterBinding);if(navigation(owners.cluster)){navigationState(owners.cluster);zoomOverride(owners.cluster);}else staticState(owners.cluster);available=surfaceReady()&&liveIsolated();if(!available)note("owner_lifecycle_changed","none");}catch(Exception|LinkageError unavailable){capture(unavailable);}
    }
    private static void fail(Throwable error){capture(error);savedReason=firstReason;savedError=errorClass;available=false;failed=true;rendererReady=false;release(false);Log.w("MapsClusterZoom","Native cluster zoom unavailable: "+error.getClass().getSimpleName());}
    private static String life(Activity a){return a==null?"missing":a.isDestroyed()?"destroyed":a.isFinishing()?"finishing":"alive";}
    private static void viewFields(StringBuilder out,String prefix,View view){
        Display d=view==null?null:view.getDisplay();int id=d==null?-1:d.getDisplayId();
        out.append(' ').append(prefix).append("_id=").append(id).append(' ').append(prefix).append("_name=").append(ClusterZoomTrace.displayName(d==null?null:d.getName(),id)).append(' ').append(prefix).append("_state=").append(d==null?-1:d.getState());
        out.append(' ').append(prefix).append("_attached=").append(view!=null&&view.isAttachedToWindow()).append(' ').append(prefix).append("_shown=").append(view!=null&&view.isShown()).append(' ').append(prefix).append("_w=").append(view==null?0:view.getWidth()).append(' ').append(prefix).append("_h=").append(view==null?0:view.getHeight());
    }
    /** UI-owned cached snapshot. Diagnostic read failures never change readiness or native behavior. */
    private static void publishDiagnostic(){
        if(Looper.myLooper()!=Looper.getMainLooper())return;
        try{
            if(available&&BydGuidance.sourceKnownForZoom()){savedReason="ready";savedError="none";}else if(!firstReason.isEmpty()){savedReason=firstReason;savedError=errorClass;}
            StringBuilder out=new StringBuilder("source=").append(BydGuidance.sourceKnownForZoom()?"known":"unknown").append(" bind_main=").append(mainBinding==null?"missing":"present").append(" bind_cluster=").append(clusterBinding==null?"missing":"present");
            View renderer=null;String family="unknown";int cameraCase=-1;
            for(int n=0;n<2;n++){
                Binding binding=n==0?mainBinding:clusterBinding;String backend="unknown";
                if(binding!=null&&access!=null)try{boolean modern=Boolean.TRUE.equals(access.modern.invoke(binding.dispatcher.get()));backend=modern?"modern":"legacy";if(n==1){if(modern)renderer=(View)access.modernView.invoke(binding.modern.get());else renderer=(View)access.nativeView.invoke(access.legacyContainerView.invoke(provider(field(binding.legacy.get(),"c"))));}}catch(Exception|LinkageError ignored){}
                out.append(n==0?" backend_main=":" backend_cluster=").append(backend);
            }
            Object xcl=diagnosticXcl.get();if(xcl!=null&&clusterBinding!=null)try{if(field(xcl,"E")==clusterBinding.dispatcher.get()){family=Boolean.TRUE.equals(field(xcl,"B"))?"a":"b";Object optional=field(xcl,family.equals("a")?NAVIGATION_STATE:STATIC_STATE);if(Boolean.TRUE.equals(invoke(optional,"isPresent")))cameraCase=(Integer)field(invoke(optional,"get"),"b");}}catch(Exception|LinkageError ignored){}
            out.append(" family=").append(family).append(" case=").append(cameraCase);viewFields(out,"root",clusterView.get());viewFields(out,"renderer",renderer);
            out.append(" activity_main=").append(life(mainOwner.get())).append(" activity_cluster=").append(life(clusterOwner.get())).append(" stage=").append(ClusterZoomTrace.token(stage)).append(" reason=").append(ClusterZoomTrace.token(savedReason)).append(" error=").append(ClusterZoomTrace.token(savedError)).append(" ready=").append(ready());diagnostic=new ClusterZoomTrace.Snapshot(out.toString());
        }catch(Exception|LinkageError ignored){}
    }
    private static Object field(Object object,String name)throws ReflectiveOperationException{if(object==null)throw new IllegalStateException("Missing camera owner");for(Class<?> type=object.getClass();type!=null;type=type.getSuperclass())try{return declaredField(type,name).get(object);}catch(NoSuchFieldException ignored){}throw new NoSuchFieldException(name);}
    private static Object provider(Object value)throws ReflectiveOperationException{return value.getClass().getMethod("b").invoke(value);}
    private static void requireType(Object object,String name){if(object==null||!name.equals(object.getClass().getName()))throw new IllegalStateException("Unexpected native camera schema");}
    private static final class Session{
        final Owners owners;final ClusterZoomPolicy policy=new ClusterZoomPolicy();final boolean navigation;boolean valid=true;double baseline;Float navigationBaseline;
        Session(Owners owners,double baseline){this.owners=owners;this.baseline=baseline;navigation=false;}
        Session(Owners owners,Float baseline){this.owners=owners;navigationBaseline=baseline;navigation=true;}
    }
    private static final class NativeOwner{
        final WeakReference<Object> xci,xcl,jni;final Long handle;
        NativeOwner(Object provider,Object owner,Object nativeMap,Long handle){xci=new WeakReference<>(provider);xcl=new WeakReference<>(owner);jni=new WeakReference<>(nativeMap);this.handle=handle;}
        boolean same(NativeOwner other){return xci.get()!=null&&xci.get()==other.xci.get()&&xcl.get()!=null&&xcl.get()==other.xcl.get()&&jni.get()!=null&&jni.get()==other.jni.get()&&handle.equals(other.handle);}
    }
    private static final class Owners{
        final NativeOwner main,cluster;Owners(NativeOwner main,NativeOwner cluster){this.main=main;this.cluster=cluster;}
        boolean same(Owners other){return main.same(other.main)&&cluster.same(other.cluster);}
    }
    private static final class Binding{
        final WeakReference<Object> manager,dispatcher,legacy,modern;
        Binding(Object m,Object d,Object old,Object newer){manager=new WeakReference<>(m);dispatcher=new WeakReference<>(d);legacy=new WeakReference<>(old);modern=new WeakReference<>(newer);}
        boolean live()throws ReflectiveOperationException{Object d=dispatcher.get();return d!=null&&manager.get()!=null&&field(manager.get(),"at")==d&&provider(field(d,"c"))==legacy.get()&&legacy.get()!=null&&provider(field(d,"e"))==modern.get()&&modern.get()!=null;}
        static Binding read(Object manager)throws ReflectiveOperationException{requireType(manager,"ier");Object d=field(manager,"at");requireType(d,"uip");Object old=provider(field(d,"c"));requireType(old,"ugc");Object newer=provider(field(d,"e"));if(newer==null)throw new IllegalStateException("Missing map backend");return new Binding(manager,d,old,newer);}
    }
    /** Exact original 26.10 native schema; constructors copy every field except requested zoom. */
    private static final class NativeAccess {
        final Class<?> cameraType,updateType;
        final Constructor<?> copyCamera,newUpdate;
        final Field zoom,builderZoom,updateCamera,duration,interpolator,legacyStarted,legacyFuture,dispatcherActive,rendererInitialized,rendererInput,cameraPoint,legacyLimit,modernBridge,modernController,modernLimit;
        final Method build,dispatch,modern,currentLegacy,modernMap,modernPose,toCamera,legacyMap,legacyContainerView,nativeView,modernView,legacyTransform,limitLegacy,limitModern;
        private final ClassLoader loader;
        private NativeAccess(ClassLoader loader)throws ReflectiveOperationException{
            this.loader=loader;
            cameraType=Class.forName("utm",false,loader);Class<?> builder=Class.forName("utj",false,loader);
            updateType=Class.forName("use",false,loader);Class<?> update=Class.forName("usd",false,loader),callback=Class.forName("utd",false,loader);
            copyCamera=builder.getConstructor(cameraType);newUpdate=updateType.getConstructor(cameraType);
            zoom=cameraType.getField("q");builderZoom=builder.getField("e");build=builder.getMethod("a");
            updateCamera=declaredField(updateType,"c");duration=declaredField(update,"a");interpolator=declaredField(update,"b");
            Class<?> dispatcher=Class.forName("uip",false,loader);dispatch=dispatcher.getMethod("c",update,callback);modern=dispatcher.getMethod("h");dispatcherActive=declaredField(dispatcher,"h");
            Class<?> legacy=Class.forName("ugc",false,loader);currentLegacy=legacy.getMethod("d");legacyStarted=declaredField(legacy,"i");legacyFuture=declaredField(legacy,"e");legacyMap=legacy.getMethod("b");
            Class<?> renderer=Class.forName("uzn",false,loader);rendererInitialized=declaredField(renderer,"S");rendererInput=declaredField(renderer,"i");
            legacyContainerView=Class.forName("ugb",false,loader).getMethod("e");nativeView=Class.forName("wbq",false,loader).getMethod("a");
            modernView=Class.forName("unz",false,loader).getMethod("b");
            modernMap=Class.forName("unz",false,loader).getMethod("e");
            modernPose=Class.forName("uok",false,loader).getMethod("c");
            toCamera=cameraType.getMethod("b",Class.forName("uom",false,loader));
            Class<?> point=Class.forName("uhl",false,loader);
            cameraPoint=cameraType.getField("m");legacyTransform=Class.forName("ugb",false,loader).getMethod("c");
            legacyLimit=declaredField(Class.forName("usv",false,loader),"b");limitLegacy=Class.forName("uso",false,loader).getMethod("b",float.class,point);
            modernBridge=declaredField(dispatcher,"d");modernController=declaredField(Class.forName("usj",false,loader),"c");
            modernLimit=declaredField(Class.forName("ujf",false,loader),"r");limitModern=Class.forName("vwh",false,loader).getMethod("b",float.class,point);
        }
        private NativeOwner nativeOwner(Binding binding,String role)throws ReflectiveOperationException{
            enter(role+"_backend");Object dispatcher=binding.dispatcher.get();if(!Boolean.TRUE.equals(modern.invoke(dispatcher)))throw gate(role+"_legacy_backend");enter(role+"_frame_owner");
            Object bridge=provider(field(dispatcher,"d"));requireType(bridge,"usj");Object managerBridge=provider(field(binding.manager.get(),"D"));
            Object transform=legacyTransform.invoke(provider(field(binding.legacy.get(),"c"))),consumer=field(transform,"d");requireType(consumer,"vwq");Object frameBridge=invoke(consumer,"e");
            if(bridge!=managerBridge||bridge!=frameBridge)throw gate(role+"_frame_owner_mismatch");
            enter(role+"_zoom_provider");Object controller=field(bridge,"c");requireType(controller,"ujf");Object state=provider(field(controller,"d"));requireType(state,"uiq");Object nativeProvider=java.lang.reflect.Array.get(field(state,"a"),1);if(nativeProvider==null||!nativeProvider.getClass().getName().equals("xav"))throw gate(role+"_zoom_provider_not_xci");enter(role+"_xcl_owner");
            Object owner=field(nativeProvider,"b");requireType(owner,"xay");Object jni=field(nativeProvider,"c");requireType(jni,"com.google.android.libraries.geo.navcore.ui.camera.jni.CameraControllerJni");
            if(field(owner,"w")!=nativeProvider||field(owner,"E")!=dispatcher||field(owner,"k")!=jni)throw gate(role+"_xcl_owner_mismatch");
            enter(role+"_native_handle");Method getHandle=Class.forName("abih",false,loader).getMethod("mV");getHandle.setAccessible(true);Object handle=getHandle.invoke(field(jni,"a"));if(!(handle instanceof Long))throw gate(role+"_native_handle_type");if(((Long)handle)==0L)throw gate(role+"_native_handle_zero");if(role.equals("cluster"))diagnosticXcl=new WeakReference<>(owner);
            return new NativeOwner(nativeProvider,owner,jni,(Long)handle);
        }
        Owners owners(Binding main,Binding cluster)throws ReflectiveOperationException{
            NativeOwner first=nativeOwner(main,"main"),second=nativeOwner(cluster,"cluster");
            if(first.xci.get()==second.xci.get()||first.xcl.get()==second.xcl.get()||first.jni.get()==second.jni.get()||first.handle.equals(second.handle))throw gate("main_cluster_native_shared");
            return new Owners(first,second);
        }
        static NativeAccess forLoader(ClassLoader loader)throws ReflectiveOperationException{return access!=null&&access.loader==loader?access:new NativeAccess(loader);}
        private static Field declaredField(Class<?> owner,String name)throws ReflectiveOperationException{Field field=owner.getDeclaredField(name);field.setAccessible(true);return field;}
        boolean ready(Binding binding,View root)throws ReflectiveOperationException{
            enter("cluster_renderer");if(root==null||root.getDisplay()==null)return reject("root_display_missing");
            Object dispatcher=binding.dispatcher.get();if(dispatcher==null)return reject("cluster_dispatcher_missing");
            Object view;
            if(Boolean.TRUE.equals(modern.invoke(dispatcher))){
                Object active=dispatcherActive.get(dispatcher);
                if(!(active instanceof AtomicBoolean)||!((AtomicBoolean)active).get())return reject("renderer_inactive");
                Object engine=binding.modern.get();if(engine==null)return reject("renderer_backend_missing");
                view=modernView.invoke(engine);
            }else{
                Object legacy=binding.legacy.get();if(legacy==null||!legacyStarted.getBoolean(legacy))return reject("legacy_renderer_not_started");
                Object pending=legacyFuture.get(legacy);
                if(!(pending instanceof Future)||!((Future<?>)pending).isDone()||((Future<?>)pending).isCancelled())return reject("legacy_renderer_pending");
                try{((Future<?>)pending).get();}catch(Exception unavailable){capture(unavailable);return false;}
                Object renderer=legacyMap.invoke(legacy);
                if(!rendererInitialized.getDeclaringClass().isInstance(renderer)||!rendererInitialized.getBoolean(renderer)||rendererInput.get(renderer)==null)return reject("legacy_renderer_inactive");
                Object container=provider(field(legacy,"c"));view=nativeView.invoke(legacyContainerView.invoke(container));
            }
            if(!(view instanceof View))return reject("renderer_view_missing");
            View map=(View)view;Display display=map.getDisplay();
            if(!map.isAttachedToWindow())return reject("renderer_detached");if(!map.isShown())return reject("renderer_not_shown");if(map.getWidth()<=0||map.getHeight()<=0)return reject("renderer_zero_size");
            if(display==null)return reject("renderer_display_missing");if(display.getDisplayId()!=root.getDisplay().getDisplayId())return reject("root_display_mismatch");if(display.getState()==Display.STATE_OFF)return reject("renderer_display_off");return true;
        }
        Object current(Binding binding)throws ReflectiveOperationException{
            Object dispatcher=binding.dispatcher.get();if(dispatcher==null)throw new IllegalStateException("Camera detached");
            Object camera;
            if(Boolean.TRUE.equals(modern.invoke(dispatcher))){
                Object engine=binding.modern.get();if(engine==null)throw new IllegalStateException("Map detached");
                camera=toCamera.invoke(null,modernPose.invoke(modernMap.invoke(engine)));
            }else{Object old=binding.legacy.get();if(old==null)throw new IllegalStateException("Map detached");camera=currentLegacy.invoke(old);}
            if(!cameraType.isInstance(camera))throw new IllegalStateException("Unexpected camera pose");
            return camera;
        }
        /** Same pure native limit used by the selected renderer; never writes its policy. */
        float limit(Binding binding,Object camera,float requested)throws ReflectiveOperationException{
            Object dispatcher=binding.dispatcher.get();if(dispatcher==null)throw new IllegalStateException("Camera detached");
            Object constraint;Method clamp;
            if(Boolean.TRUE.equals(modern.invoke(dispatcher))){
                Object bridge=provider(modernBridge.get(dispatcher));
                Object controller=modernController.get(bridge);
                constraint=provider(modernLimit.get(controller));clamp=limitModern;
            }else{
                Object legacy=binding.legacy.get();if(legacy==null)throw new IllegalStateException("Map detached");
                Object container=provider(field(legacy,"c"));
                constraint=legacyLimit.get(legacyTransform.invoke(container));clamp=limitLegacy;
            }
            return ((Number)clamp.invoke(constraint,requested,cameraPoint.get(camera))).floatValue();
        }
        float zoom(Object camera)throws IllegalAccessException{return zoom.getFloat(camera);}
        Object update(Object camera,float selected,Object original)throws ReflectiveOperationException{
            Object builder=copyCamera.newInstance(camera);builderZoom.setFloat(builder,selected);
            Object result=newUpdate.newInstance(build.invoke(builder));
            if(original!=null){duration.setInt(result,duration.getInt(original));interpolator.set(result,interpolator.get(original));}
            return result;
        }
    }
}
