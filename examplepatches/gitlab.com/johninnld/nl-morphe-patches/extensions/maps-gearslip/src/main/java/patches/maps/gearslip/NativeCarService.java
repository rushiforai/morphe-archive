package patches.maps.gearslip;

import android.app.Service;
import android.content.Intent;
import android.content.res.Configuration;
import android.graphics.Rect;
import android.os.Binder;
import android.os.Bundle;
import android.os.Handler;
import android.os.IBinder;
import android.os.Looper;
import android.os.Parcel;
import android.os.RemoteException;
import android.util.Log;
import android.view.Surface;
import android.view.inputmethod.EditorInfo;
import java.util.HashMap;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/** Exposes Maps' own car renderer through the Car App Library's stable Binder protocol. */
public final class NativeCarService extends Service {
    private static final String CAR = "androidx.car.app.ICarApp";
    private static final String APP = "androidx.car.app.IAppManager";
    private static final String SURFACE = "androidx.car.app.ISurfaceCallback";
    private static final String APP_HOST = "androidx.car.app.IAppHost";
    private static final String NAVIGATION_HOST="androidx.car.app.navigation.INavigationHost";
    private static final String NAVIGATION_MANAGER="androidx.car.app.navigation.INavigationManager";
    /** DriveDeck's extension service: exact rectangles of its floating pieces (its player). */
    static final String OVERLAY_SERVICE="map_overlays",OVERLAY_HOST="app.drivedeck.IMapOverlayHost",OVERLAY_CALLBACK="app.drivedeck.IMapOverlayCallback";
    static final int MAX_OVERLAYS=16;
    /**
     * Both one-way, and ignored by a host that does not know them. Adapter to host ({@value #OVERLAY_HOST},
     * after 1 register and 2 occupied boxes): one boolean, "Maps' route preview is shown". Host to adapter
     * ({@value #OVERLAY_CALLBACK}, after 1 overlays and 2 gesture start): no arguments, "start guidance",
     * heard only from the session's UID.
     */
    static final int PREVIEW_SHOWN=3,START_GUIDANCE=3;
    private final Handler main = new Handler(Looper.getMainLooper());
    private final Object lock = new Object();
    private final Map<Intent.FilterComparison, Binding> bindings = new HashMap<>();
    private volatile Session active;

    private final class Binding {
        final CarBinder binder = new CarBinder(this);
        boolean bound = true;
        int generation = 1;
        Session session;
    }

    private static final class Session {
        final int uid;
        final Binding binding;
        final int generation;
        volatile boolean closed;
        ProjectionRenderer renderer;
        NativeCarNavigationSession nativeSession;
        IBinder host, appHost,navigationHost,overlayHost;
        NativeGuidance guidance;
        boolean navigating;
        NativeGuidance.Snapshot navigation;
        /** What the host was last told about the route preview; it starts out knowing "not shown". */
        boolean previewSent;
        long lastTripAt=-1;
        final NativeScreenStack screens=new NativeScreenStack();
        Runnable tripUpdate;
        final List<IBinder> stopCallbacks=new ArrayList<>();
        Runnable stopTimeout;
        IBinder.DeathRecipient death;
        Throwable failure;
        volatile NativeKeyboard keyboard;
        Session(int uid, Binding binding) { this.uid = uid; this.binding = binding; this.generation = binding.generation; }
    }

    @Override public IBinder onBind(Intent intent) {
        // Android Auto can bind this component explicitly without an action. The
        // authenticated Binder handshake, rather than Intent metadata, owns access.
        return activateBinding(intent).binder;
    }

    @Override public boolean onUnbind(Intent intent) {
        Session owner = null;
        synchronized (lock) {
            Binding binding = bindings.get(bindingKey(intent));
            if (binding != null) { binding.bound = false; owner = binding.session; }
        }
        release(owner);
        // Android retains the published Binder per Intent.FilterComparison. Reactivate its
        // binding record in onRebind, without allowing old queued cleanup to own a new session.
        return true;
    }

    @Override public void onRebind(Intent intent) {
        activateBinding(intent);
        super.onRebind(intent);
    }

    private static Intent.FilterComparison bindingKey(Intent intent) {
        return new Intent.FilterComparison(intent == null ? new Intent() : new Intent(intent));
    }

    private Binding activateBinding(Intent intent) {
        synchronized (lock) {
            Intent.FilterComparison key = bindingKey(intent);
            Binding binding = bindings.get(key);
            if (binding == null) { binding = new Binding(); bindings.put(key, binding); }
            else if (!binding.bound) { binding.bound = true; binding.generation++; }
            return binding;
        }
    }

    @Override public void onDestroy() {
        release(active);
        synchronized (lock) { for (Binding binding : bindings.values()) binding.bound = false; bindings.clear(); }
        super.onDestroy();
    }

    private Session owned(Binding binding, int callerUid) {
        synchronized (lock) {
            Session session = binding.session;
            if (session == null || active != session || session.closed || !binding.bound ||
                    binding.generation != session.generation || callerUid != session.uid) throw new SecurityException("Host handshake required");
            return session;
        }
    }

    private Session authenticate(Binding binding, int uid, Bundle handshake) throws Exception {
        if (handshake == null || !"androidx.car.app.HandshakeInfo".equals(handshake.getString("tag_class_name"))) {
            throw new IllegalArgumentException("Missing car host handshake");
        }
        String host = CarProtocol.member(handshake, "mHostPackageName").getString("tag_value");
        int api = CarProtocol.member(handshake, "mHostCarAppApiLevel").getInt("tag_value");
        if (!HostPolicy.permits(host, uid, getPackageManager().getPackagesForUid(uid))) {
            throw new SecurityException("Unrecognized car host or caller package mismatch");
        }
        if (api < 5 || api > 7) throw new IllegalArgumentException("Unsupported car API level " + api);
        Session replacement, previous;
        synchronized (lock) {
            if (!binding.bound) throw new SecurityException("Car binding has been released");
            previous = active;
            if (previous != null && !previous.closed && previous.uid != uid) {
                throw new IllegalStateException("Another car host is already connected");
            }
            if (previous != null) {
                previous.closed = true;
                if (previous.binding.session == previous) previous.binding.session = null;
            }
            replacement = new Session(uid, binding);
            replacement.tripUpdate=()->sendTrip(replacement);
            binding.session = replacement;
            active = replacement;
        }
        if (previous != null) main.post(() -> close(previous));
        return replacement;
    }


    private void release(Session session) {
        if (session == null) return;
        synchronized (lock) {
            session.closed = true;
            if (session.binding.session == session) session.binding.session = null;
            if (active == session) active = null;
        }
        main.post(() -> close(session));
    }

    private void close(Session session) {
        main.removeCallbacks(session.tripUpdate);
        if(session.stopTimeout!=null)main.removeCallbacks(session.stopTimeout);
        for(IBinder callback:session.stopCallbacks)CarProtocol.complete(callback,null,new IllegalStateException("Car session closed before navigation stopped"));
        session.stopCallbacks.clear();
        if(session.guidance!=null){try{session.guidance.close();}catch(Exception error){Log.w("MapsNativeCar","Native guidance listener cleanup failed",error);}session.guidance=null;}
        endNavigation(session);
        endPreview(session);
        clearKeyboard(session);
        if (session.host != null && session.death != null) session.host.unlinkToDeath(session.death, 0);
        session.host = null;
        session.death = null;
        if (session.renderer != null) session.renderer.close();
        session.renderer = null;
        if (session.nativeSession != null) session.nativeSession.close();
        session.nativeSession = null;
        session.appHost = null;
        session.navigationHost=null;
        session.overlayHost=null;
    }

    private void failed(Session session, Throwable error) {
        if (Looper.myLooper() != Looper.getMainLooper()) { main.post(() -> failed(session, error)); return; }
        if (active != session || session.closed || session.failure != null) return;
        session.failure = error;
        clearKeyboard(session);
        endNavigation(session);
        endPreview(session);
        if(session.stopTimeout!=null)main.removeCallbacks(session.stopTimeout);
        for(IBinder callback:session.stopCallbacks)CarProtocol.complete(callback,null,error);
        session.stopCallbacks.clear();
        if(session.guidance!=null){try{session.guidance.close();}catch(Exception cleanup){error.addSuppressed(cleanup);}session.guidance=null;}
        Log.e("MapsNativeCar", "Maps car renderer failed", error);
        if (session.renderer != null) session.renderer.close();
        if (session.nativeSession != null) session.nativeSession.close();
        session.nativeSession = null;
        invalidate(session);
    }

    private void clearKeyboard(Session session) {
        if (session.keyboard != null) session.keyboard.close();
        session.keyboard = null;
    }

    private void invalidate(Session session) {
        if (session.appHost == null || active != session || session.closed) return;
        try { CarProtocol.send(session.appHost, APP_HOST, 2, data -> {}); }
        catch (RemoteException | RuntimeException disconnected) { release(session); }
    }

    private void showKeyboard(Session session, IBinder input, EditorInfo editor) {
        if (active != session || session.closed || session.failure != null) return;
        try {
            clearKeyboard(session);
            session.keyboard = new NativeKeyboard(input, editor);
            invalidate(session);
        } catch (Exception error) { failed(session, error); }
    }

    private interface Action { void run() throws Exception; }

    private void endNavigation(Session session){
        main.removeCallbacks(session.tripUpdate);
        session.navigation=null;
        if(session.renderer!=null)session.renderer.hostedNavigation(false);
        if(!session.navigating)return;session.navigating=false;
        try{if(session.navigationHost!=null)CarProtocol.send(session.navigationHost,NAVIGATION_HOST,3,data->{});}
        catch(RemoteException|RuntimeException disconnected){Log.w("MapsNativeCar","Navigation host disconnected",disconnected);}
    }
    /**
     * A host row action returns before a native navigation transition (and its listener
     * callback) is guaranteed. Re-read the authoritative native source on a bounded schedule
     * so a missed listener emission cannot leave the host in the wrong guidance state. Refresh
     * never starts navigation and never fabricates a snapshot.
     */
    private void refreshGuidance(Session session){
        NativeGuidance guidance=session.guidance;if(guidance==null)return;
        guidance.refresh();
        for(long delay:new long[]{120,400,1000})main.postDelayed(()->{
            if(active==session&&session.guidance==guidance)guidance.refresh();
        },delay);
    }
    /**
     * Maps draws its own turn and ETA cards, so guidance never refreshes the host template;
     * it only starts/ends the host's navigation and feeds the car's cluster with trips.
     */
    private void navigation(Session session,NativeGuidance.Snapshot snapshot){
        if(active!=session||session.closed||session.failure!=null)return;
        try{
            if(!snapshot.guiding){
                endNavigation(session);
                if(session.stopTimeout!=null)main.removeCallbacks(session.stopTimeout);
                for(IBinder callback:session.stopCallbacks)CarProtocol.complete(callback,null,null);
                session.stopCallbacks.clear();return;
            }
            if(!session.navigating){CarProtocol.send(session.navigationHost,NAVIGATION_HOST,2,data->{});session.navigating=true;}
            session.navigation=snapshot;
            if(session.renderer!=null)session.renderer.hostedNavigation(true);
            main.removeCallbacks(session.tripUpdate);
            long delay=session.lastTripAt<0?0:Math.max(0,1000-(android.os.SystemClock.elapsedRealtime()-session.lastTripAt));
            if(delay==0)sendTrip(session);else main.postDelayed(session.tripUpdate,delay);
        }catch(Exception error){failed(session,error);}
    }

    private void sendTrip(Session session){
        if(active!=session||session.closed||session.failure!=null||!session.navigating||session.navigation==null)return;
        try{
            Bundle trip=CarProtocol.trip(session.navigation,System.currentTimeMillis());
            CarProtocol.send(session.navigationHost,NAVIGATION_HOST,4,data->{data.writeInt(1);data.writeBundle(trip);});
            session.lastTripAt=android.os.SystemClock.elapsedRealtime();
        }catch(Exception error){failed(session,error);}
    }

    /** A host service only some hosts offer; null when this host has none. */
    private static IBinder optionalHostService(IBinder host,String name){
        Parcel request=Parcel.obtain(),reply=Parcel.obtain();
        try{
            request.writeInterfaceToken("androidx.car.app.ICarHost");request.writeString(name);
            if(!host.transact(3,request,reply,0))return null;
            reply.readException();return reply.readStrongBinder();
        }catch(Exception unavailable){return null;}
        finally{reply.recycle();request.recycle();}
    }
    /**
     * A host that offers this service (DriveDeck) learns where Maps' boxes are
     * and places its floating pieces (its player) in the space Maps leaves free; it tells Maps
     * where those pieces landed, so the warning pills keep clear. Maps' own layout never changes.
     * Any other host keeps the standard visible area alone.
     */
    private void subscribeOverlays(Session session){
        IBinder service=optionalHostService(session.host,OVERLAY_SERVICE);
        if(service==null)return;
        Parcel request=Parcel.obtain(),reply=Parcel.obtain();
        try{
            request.writeInterfaceToken(OVERLAY_HOST);request.writeStrongBinder(new OverlayBinder(session));
            if(service.transact(1,request,reply,0)){
                reply.readException();session.overlayHost=service;
                session.renderer.setOccupiedListener(areas->sendOccupied(session,areas));
                session.renderer.setRoutePreviewListener(shown->sendPreview(session,shown));
            }
        }catch(Exception refused){Log.w("MapsNativeCar","Host overlays unavailable",refused);}
        finally{reply.recycle();request.recycle();}
    }

    /** Transaction 2 on the host's service, one-way: a count, then left, top, right, bottom per box. */
    private void sendOccupied(Session session,List<Rect> areas){
        IBinder service=session.overlayHost;
        if(service==null||active!=session||session.closed)return;
        Parcel request=Parcel.obtain();
        try{
            request.writeInterfaceToken(OVERLAY_HOST);request.writeInt(areas.size());
            for(Rect area:areas){request.writeInt(area.left);request.writeInt(area.top);request.writeInt(area.right);request.writeInt(area.bottom);}
            service.transact(2,request,null,IBinder.FLAG_ONEWAY);
        }catch(Exception gone){Log.w("MapsNativeCar","Host overlay service gone",gone);session.overlayHost=null;}
        finally{request.recycle();}
    }

    /** Transaction 3 on the host's service, one-way: one boolean, whether Maps' route preview is up. Sent when it changes. */
    private void sendPreview(Session session,boolean shown){
        if(active!=session||session.closed)return;
        transactPreview(session,shown);
    }
    /** The host's countdown ends with the preview: the last word to a host that was told "shown" is "not shown". */
    private void endPreview(Session session){
        if(session.previewSent)transactPreview(session,false);
    }
    private void transactPreview(Session session,boolean shown){
        IBinder service=session.overlayHost;
        if(service==null)return;
        Parcel request=Parcel.obtain();
        try{
            request.writeInterfaceToken(OVERLAY_HOST);request.writeInt(shown?1:0);
            // The result is not looked at: a host that does not know this transaction just ignores it.
            service.transact(PREVIEW_SHOWN,request,null,IBinder.FLAG_ONEWAY);
            session.previewSent=shown;
        }catch(Exception gone){Log.w("MapsNativeCar","Host overlay service gone",gone);session.overlayHost=null;}
        finally{request.recycle();}
    }

    /**
     * The host asks Maps to start the route it is showing, as the driver's tap on Start would. Maps' own
     * Start is pressed only when it is up and usable, and never while guidance already runs; the host
     * learns of the result as it does for a driver's tap, through the navigation it starts.
     */
    private void startGuidance(Session session){
        if(active!=session||session.closed||session.failure!=null||session.renderer==null||session.navigating)return;
        if(session.renderer.startRoutePreview())refreshGuidance(session);
    }

    /** One-way updates of the host's floating pieces; only the authenticated host's UID is heard. */
    private final class OverlayBinder extends Binder{
        private final Session session;
        OverlayBinder(Session session){this.session=session;attachInterface(null,OVERLAY_CALLBACK);}
        @Override protected boolean onTransact(int code,Parcel data,Parcel reply,int flags){
            if(CarProtocol.basic(OVERLAY_CALLBACK,code,data,reply))return true;
            if(code==2){
                // Where the host's finger went down for the drag that follows.
                if(Binder.getCallingUid()!=session.uid)return true;
                float x,y;
                try{x=data.readFloat();y=data.readFloat();}catch(RuntimeException malformed){return true;}
                main.post(()->{if(active==session&&!session.closed&&session.failure==null&&session.renderer!=null)session.renderer.gestureStart(x,y);});
                return true;
            }
            if(code==START_GUIDANCE){
                // No arguments: the host asks Maps to press its own Start. Nothing is returned; it hears
                // of the result as it does for a driver's tap.
                if(Binder.getCallingUid()!=session.uid)return true;
                main.post(()->startGuidance(session));
                return true;
            }
            if(code!=1)return false;
            if(Binder.getCallingUid()!=session.uid)return true;
            List<Rect> overlays;
            try{
                int count=data.readInt(); // basic() has already checked the interface token.
                if(count<0||count>MAX_OVERLAYS)return true;
                overlays=new ArrayList<>(count);
                for(int i=0;i<count;i++)overlays.add(new Rect(data.readInt(),data.readInt(),data.readInt(),data.readInt()));
            }catch(RuntimeException malformed){return true;}
            main.post(()->{if(active==session&&!session.closed&&session.failure==null&&session.renderer!=null)session.renderer.overlays(overlays);});
            return true;
        }
    }

    private IBinder hostService(IBinder host,String name)throws Exception{
        Parcel request=Parcel.obtain(),reply=Parcel.obtain();
        try{
            request.writeInterfaceToken("androidx.car.app.ICarHost");request.writeString(name);
            if(!host.transact(3,request,reply,0))throw new RemoteException("Car host service unavailable: "+name);
            reply.readException();IBinder result=reply.readStrongBinder();
            if(result==null)throw new IllegalStateException("Car host has no "+name+" service");return result;
        }finally{reply.recycle();request.recycle();}
    }

    private void dispatch(Session session, IBinder callback, boolean needsRenderer, Action action) {
        main.post(() -> {
            try {
                if (active != session || session.closed) throw new IllegalStateException("Car session closed");
                if (session.failure != null) throw new IllegalStateException("Maps car UI failed", session.failure);
                if (needsRenderer && session.renderer == null) throw new IllegalStateException("Car app has not been created");
                action.run();
                CarProtocol.complete(callback, null, session.failure);
            } catch (Exception error) {
                if (needsRenderer && session.renderer != null && !(error instanceof SecurityException)) failed(session, error);
                CarProtocol.complete(callback, null, error);
            }
        });
    }

    private void create(Session session, IBinder host, Intent intent, Configuration configuration, IBinder callback) {
        dispatch(session, callback, false, () -> {
            if (session.renderer != null) throw new IllegalStateException("Car app is already created");
            if (host == null) throw new IllegalArgumentException("Missing car host");
            session.host = host;
            session.death = () -> release(session);
            host.linkToDeath(session.death, 0);
            session.appHost=hostService(host,"app");
            session.navigationHost=hostService(host,"navigation");
            session.renderer = new ProjectionRenderer(this, session.uid, error -> failed(session, error));
            // The host template only changes for keyboard input; Maps' native search rows may
            // still change underneath an open host keyboard.
            session.renderer.setContentChangedListener(() -> { if (session.keyboard != null) invalidate(session); });
            session.renderer.setToastListener((text,duration)->{
                if(active!=session||session.closed)return;
                try{CarProtocol.send(session.appHost,APP_HOST,3,data->{data.writeInt(1);android.text.TextUtils.writeToParcel(text,data,0);data.writeInt(duration);});}
                catch(RemoteException|RuntimeException error){release(session);}
            });
            session.renderer.setKeyboardListener(new ProjectionRenderer.KeyboardListener() {
                @Override public void show(IBinder input, EditorInfo editor) { showKeyboard(session, input, editor); }
                @Override public void hide() {
                    if (active != session || session.closed || session.keyboard == null) return;
                    clearKeyboard(session); invalidate(session);
                }
            });
            session.nativeSession = new NativeCarNavigationSession(this, main, () -> {
                if (active == session && !session.closed && session.failure == null)
                    session.renderer.create(intent, configuration);
            }, error -> failed(session, error));
            session.nativeSession.connect();
            if (session.failure == null) CarProtocol.send(session.appHost, APP_HOST, 4,
                    data -> data.writeStrongBinder(new SurfaceBinder(session)));
            if (session.failure == null) subscribeOverlays(session);
            if(session.failure==null){
                session.guidance=new NativeGuidance(this,main,snapshot->navigation(session,snapshot),error->failed(session,error));
                if(session.failure!=null){session.guidance.close();session.guidance=null;}
            }
        });
    }

    private final class CarBinder extends Binder {
        private final Binding binding;
        CarBinder(Binding binding) { this.binding = binding; }
        @Override protected boolean onTransact(int code, Parcel data, Parcel reply, int flags) {
            if (CarProtocol.basic(CAR, code, data, reply)) return true;
            int uid = Binder.getCallingUid(); // Capture before posting any work to the main thread.
            IBinder callback = null;
            try {
                switch (code) {
                    case 10:
                        CarProtocol.complete(data.readStrongBinder(), CarProtocol.appInfo(), null); return true;
                    case 11:
                        Bundle handshake = CarProtocol.readBundleable(data); callback = data.readStrongBinder();
                        authenticate(binding, uid, handshake); CarProtocol.complete(callback, null, null); return true;
                    case 2: {
                        IBinder host = data.readStrongBinder();
                        Intent intent = CarProtocol.nullable(data, Intent.CREATOR);
                        Configuration configuration = CarProtocol.nullable(data, Configuration.CREATOR);
                        callback = data.readStrongBinder(); create(owned(binding, uid), host, intent, configuration, callback); return true;
                    }
                    case 3: case 4: case 5: case 6: {
                        callback = data.readStrongBinder(); Session session = owned(binding, uid);
                        dispatch(session, callback, true, () -> {
                            if (code == 3) session.renderer.start();
                            else if (code == 4) session.renderer.resume();
                            else if (code == 5) session.renderer.pause();
                            else session.renderer.stop();
                        }); return true;
                    }
                    case 7: {
                        Intent intent = CarProtocol.nullable(data, Intent.CREATOR); callback = data.readStrongBinder();
                        Session session = owned(binding, uid); dispatch(session, callback, true, () -> session.renderer.newIntent(intent)); return true;
                    }
                    case 8: {
                        Configuration config = CarProtocol.nullable(data, Configuration.CREATOR); callback = data.readStrongBinder();
                        Session session = owned(binding, uid); dispatch(session, callback, true, () -> session.renderer.configurationChanged(config)); return true;
                    }
                    case 9: {
                        String name = data.readString(); callback = data.readStrongBinder(); Session session = owned(binding, uid);
                        Bundle manager="app".equals(name)?CarProtocol.interfaceBinder("androidx.car.app.IAppManager$Stub",new AppBinder(session))
                                :"navigation".equals(name)?CarProtocol.interfaceBinder("androidx.car.app.navigation.INavigationManager$Stub",new NavigationBinder(session)):null;
                        CarProtocol.complete(callback,manager,null);return true;
                    }
                    case 12:
                        callback = data.readStrongBinder(); owned(binding, uid); CarProtocol.complete(callback, null, null); return true;
                    default: return false;
                }
            } catch (Exception error) { CarProtocol.complete(callback, null, error); return true; }
        }
    }

    private void requireSession(Session session) {
        if (owned(session.binding, Binder.getCallingUid()) != session) throw new SecurityException("Car session replaced");
    }

    private final class NavigationBinder extends Binder{
        final Session session;
        NavigationBinder(Session session){this.session=session;}
        @Override protected boolean onTransact(int code,Parcel data,Parcel reply,int flags){
            if(CarProtocol.basic(NAVIGATION_MANAGER,code,data,reply))return true;
            if(code!=2)return false;
            IBinder callback=data.readStrongBinder();
            try{
                requireSession(session);
                main.post(()->{
                    try{
                        if(active!=session||session.closed||session.failure!=null)throw new IllegalStateException("Car navigation session closed");
                        if(!session.navigating){CarProtocol.complete(callback,null,null);return;}
                        if(session.stopCallbacks.isEmpty()){
                            Intent stop=new Intent().setClassName(getPackageName(),"com.google.android.libraries.geo.navcore.service.base.NavigationService").putExtra("abortcurrentsession",true);
                            if(startService(stop)==null)throw new IllegalStateException("Maps native navigation stop service unavailable");
                            session.stopTimeout=()->{
                                for(IBinder pending:session.stopCallbacks)CarProtocol.complete(pending,null,new IllegalStateException("Maps did not confirm navigation stopped"));session.stopCallbacks.clear();
                            };
                            main.postDelayed(session.stopTimeout,10000);
                        }
                        session.stopCallbacks.add(callback);
                    }catch(Exception error){CarProtocol.complete(callback,null,error);}
                });
            }catch(Exception error){CarProtocol.complete(callback,null,error);}
            return true;
        }
    }

    private final class AppBinder extends Binder {
        private final Session session;
        AppBinder(Session session) { this.session = session; }
        @Override protected boolean onTransact(int code, Parcel data, Parcel reply, int flags) {
            if (CarProtocol.basic(APP, code, data, reply)) return true;
            IBinder callback = data.readStrongBinder();
            try {
                requireSession(session);
                if (code == 2) {
                    main.post(() -> {
                        if (active != session || session.closed) CarProtocol.complete(callback, null, new IllegalStateException("Car session closed"));
                        else if (session.renderer == null && session.failure == null) CarProtocol.complete(callback, null, new IllegalStateException("Car app has not been created"));
                        else {
                            try {
                                NativeKeyboard input = session.keyboard;
                                Bundle template = session.failure != null ? CarProtocol.template(session.failure)
                                        : input != null ? searchTemplate(session,input)
                                        : nativeTemplate(session);
                                session.screens.apply(template);
                                CarProtocol.complete(callback, template, null);
                            } catch (Exception error) { failed(session, error); CarProtocol.complete(callback, null, error); }
                        }
                    });
                } else if (code == 3) dispatch(session, callback, true, () -> {
                    // Back closes the host keyboard (and Maps' editor with it), otherwise it walks
                    // Maps' own back stack. Maps draws every panel, so the host has none to close.
                    clearKeyboard(session); session.renderer.back();
                    invalidate(session);
                });
                else if (code == 4 || code == 5) CarProtocol.complete(callback, null, null); // Maps owns its location stream.
                else return false;
            } catch (Exception error) { CarProtocol.complete(callback, null, error); }
            return true;
        }
    }

    /**
     * A plain map screen: Maps draws every control, card and panel itself, so the host gets no
     * actions and no turn cards to duplicate them. The empty action strip is required by the
     * navigation template; the map strip holds only the standard Pan action, without which hosts
     * such as Google's Android Auto send no drags or pinches (on a touchscreen it is not drawn).
     */
    private Bundle nativeTemplate(Session session) {
        return CarProtocol.mapTemplate(new PanBinder(session));
    }

    /** The host's pan mode; leaving it finishes any drag still being fed to Maps. */
    private final class PanBinder extends Binder {
        private static final String DESCRIPTOR = "androidx.car.app.navigation.model.IPanModeListener";
        private final Session session;
        PanBinder(Session session) { this.session = session; attachInterface(null, DESCRIPTOR); }
        @Override protected boolean onTransact(int code, Parcel data, Parcel reply, int flags) {
            if (CarProtocol.basic(DESCRIPTOR, code, data, reply)) return true;
            if (code != 2) return false;
            IBinder callback = null;
            try {
                boolean panning = data.readInt() != 0; callback = data.readStrongBinder();
                requireSession(session);
                dispatch(session, callback, true, () -> { if (!panning) session.renderer.endGesture(); });
            } catch (Exception error) { CarProtocol.complete(callback, null, error); }
            return true;
        }
    }

    private Bundle searchTemplate(Session session,NativeKeyboard input)throws Exception{
        NativeCarContent.Page page=session.renderer.content(input.text());
        return CarProtocol.searchTemplate(input.text(),input.hint(),new SearchBinder(session,input),page==null?java.util.Collections.emptyList():contentRows(session,page));
    }
    private List<Bundle> contentRows(Session session,NativeCarContent.Page page){
        List<Bundle> rows=new ArrayList<>();
        for(NativeCarContent.Row row:page.rows)
            rows.add(CarProtocol.contentRow(row.title,row.texts,row.action==null?null:new ContentActionBinder(session,row.action),row.action==null||row.action.enabled));
        return rows;
    }

    private final class ContentActionBinder extends Binder{
        final Session session;final NativeCarContent.Action action;
        ContentActionBinder(Session session,NativeCarContent.Action action){this.session=session;this.action=action;}
        @Override protected boolean onTransact(int code,Parcel data,Parcel reply,int flags){
            if(CarProtocol.basic("androidx.car.app.model.IOnClickListener",code,data,reply))return true;
            if(code!=2)return false;IBinder callback=data.readStrongBinder();
            try{requireSession(session);dispatch(session,callback,true,()->{session.renderer.performContentAction(action);refreshGuidance(session);invalidate(session);});}
            catch(Exception error){CarProtocol.complete(callback,null,error);}return true;
        }
    }

    private final class SearchBinder extends Binder {
        private final Session session;
        private final NativeKeyboard input;
        SearchBinder(Session session, NativeKeyboard input) { this.session = session; this.input = input; }
        @Override protected boolean onTransact(int code, Parcel data, Parcel reply, int flags) {
            if (CarProtocol.basic("androidx.car.app.model.ISearchCallback", code, data, reply)) return true;
            if (code != 2 && code != 3) return false;
            String query = data.readString(); IBinder callback = data.readStrongBinder();
            try {
                requireSession(session);
                if (session.keyboard != input) throw new SecurityException("Maps input connection replaced");
                dispatch(session, callback, true, () -> {
                    if (session.keyboard != input) throw new SecurityException("Maps input connection replaced");
                    if (code == 2) input.replace(query);
                    else {
                        input.submit(query);
                        clearKeyboard(session); invalidate(session);
                    }
                });
            } catch (Exception error) { CarProtocol.complete(callback, null, error); }
            return true;
        }
    }

    private final class SurfaceBinder extends Binder {
        private final Session session;
        SurfaceBinder(Session session) { this.session = session; }
        @Override protected boolean onTransact(int code, Parcel data, Parcel reply, int flags) {
            if (CarProtocol.basic(SURFACE, code, data, reply)) return true;
            IBinder callback = null;
            try {
                int callerUid = Binder.getCallingUid();
                if (code != 5 && code != 2) requireSession(session);
                switch (code) {
                    case 5: {
                        Bundle container = CarProtocol.readBundleable(data); callback = data.readStrongBinder();
                        Surface surface = CarProtocol.surface(container);
                        if (surface != null) surface.release(); // The destruction parcel owns a separate reference.
                        if (callerUid != session.uid) throw new SecurityException("Car surface belongs to another host UID");
                        IBinder answer = callback;
                        main.post(() -> {
                            // A host sends this one-way immediately before unbinding. Android can
                            // close the session before this queued cleanup runs; acknowledge that
                            // owner's redundant cleanup without reviving any renderer/capability.
                            if (active != session || session.closed || session.failure != null || session.renderer == null) {
                                CarProtocol.complete(answer, null, null); return;
                            }
                            try {
                                session.renderer.surfaceDestroyed();
                                CarProtocol.complete(answer, null, session.failure);
                            } catch (Exception error) { failed(session, error); CarProtocol.complete(answer, null, error); }
                        }); return true;
                    }
                    case 2: {
                        Bundle container = CarProtocol.readBundleable(data); callback = data.readStrongBinder();
                        Surface surface = CarProtocol.surface(container);
                        try { requireSession(session); }
                        catch (RuntimeException error) { if (surface != null) surface.release(); throw error; }
                        if (surface == null) {
                            dispatch(session, callback, true, () -> session.renderer.surfaceDestroyed());
                            return true;
                        }
                        int width = CarProtocol.member(container, "mWidth").getInt("tag_value");
                        int height = CarProtocol.member(container, "mHeight").getInt("tag_value");
                        int dpi = CarProtocol.member(container, "mDpi").getInt("tag_value");
                        IBinder answer = callback;
                        main.post(() -> {
                            if (active != session || session.closed || session.failure != null || session.renderer == null) {
                                if (surface != null) surface.release();
                                CarProtocol.complete(answer, null, new IllegalStateException("Maps car surface is unavailable", session.failure)); return;
                            }
                            try {
                                session.renderer.surfaceAvailable(surface, width, height, dpi); // Renderer owns this Surface now.
                                CarProtocol.complete(answer, null, session.failure);
                            } catch (Exception error) {
                                if (surface != null) surface.release(); failed(session, error); CarProtocol.complete(answer, null, error);
                            }
                        }); return true;
                    }
                    case 3: case 4: {
                        Rect area = CarProtocol.nullable(data, Rect.CREATOR); callback = data.readStrongBinder();
                        dispatch(session, callback, true, () -> {
                            if (code == 3) session.renderer.visibleArea(area); else session.renderer.stableArea(area);
                        }); return true;
                    }
                    case 6: case 7: case 9: {
                        float x = data.readFloat(), y = data.readFloat();
                        dispatch(session, null, true, () -> {
                            if (code == 6) session.renderer.scroll(x, y);
                            else if (code == 7) session.renderer.fling(x, y);
                            else session.renderer.click(x, y);
                        }); return true;
                    }
                    case 8: {
                        float x = data.readFloat(), y = data.readFloat(), scale = data.readFloat();
                        dispatch(session, null, true, () -> session.renderer.scale(x, y, scale)); return true;
                    }
                    default: return false;
                }
            } catch (Exception error) { CarProtocol.complete(callback, null, error); return true; }
        }
    }
}
