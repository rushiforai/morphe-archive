package patches.maps.gearslip;

import android.app.Service;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.ServiceConnection;
import android.content.res.Configuration;
import android.graphics.Rect;
import android.hardware.display.VirtualDisplay;
import android.os.Binder;
import android.os.Bundle;
import android.os.Handler;
import android.os.IBinder;
import android.os.Looper;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.Process;
import android.os.RemoteException;
import android.os.SystemClock;
import android.util.Log;
import android.view.KeyEvent;
import android.view.MotionEvent;
import android.view.Surface;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.view.inputmethod.EditorInfo;
import java.lang.ref.WeakReference;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.function.Consumer;

/** Runs the patched app's original Android Auto activity on the host's surface. */
public final class ProjectionRenderer {
    private static final String ORIGINAL = "com.google.android.apps.gmm.car.GmmCarProjectionService";
    private static final String PROJECTION = "com.google.android.gms.car.ICarProjection";
    private static final String CAR = "com.google.android.gms.car.ICar";
    private static final String DISPLAY_MANAGER = "com.google.android.gms.car.display.manager.ICarDisplayManager";
    private static final String DISPLAY = "com.google.android.gms.car.display.manager.ICarDisplay";
    private static final String CALLBACK = "com.google.android.gms.car.ICarProjectionCallback";
    private static final NativeUiStateStore UI_STATES = new NativeUiStateStore(6);
    private final NativeUiStateStore.Lease uiStateLease;
    private Bundle initialUiState;
    private final Service service;
    private final Consumer<Throwable> onFailure;
    private final Handler main = new Handler(Looper.getMainLooper());
    private final HostBinder car = new HostBinder(CAR);
    private final HostBinder callback = new HostBinder(CALLBACK);
    private Object controller;
    private Intent intent;
    private Configuration configuration;
    private Surface surface;
    private int width, height, dpi;
    private int nativeWidth, nativeHeight, nativeDpi;
    private boolean bound, created, resumed, closed, failed;
    private volatile boolean keyboardRequested;
    private KeyboardListener keyboardListener;
    private final NativeCarContent content;
    private String contentQuery;
    private boolean hostedNavigation;
    private Runnable contentChanged = () -> {};
    private java.util.function.BiConsumer<CharSequence,Integer> toast=(text,duration)->{};
    private Rect visibleArea, stableArea, appliedInsets;
    /** The host's floating pieces over this surface (DriveDeck's player), in surface pixels; warnings keep clear. */
    private List<Rect> hostOverlays = Collections.emptyList();
    /** Receives where Maps' own boxes are, for a host that places its floating pieces in the free space. */
    private java.util.function.Consumer<List<Rect>> occupiedListener;
    private List<Rect> occupiedSent;
    private View occupiedRoot;
    private boolean occupiedPending;
    /** Maps animates its cards; at most this often is the layout read again while it draws. */
    static final long OCCUPIED_INTERVAL_MS = 50;
    private final Runnable reportOccupied = this::reportOccupiedNow;
    private final android.view.ViewTreeObserver.OnPreDrawListener occupiedDraw = () -> {
        if (!occupiedPending) { occupiedPending = true; main.postDelayed(reportOccupied, OCCUPIED_INTERVAL_MS); }
        return true;
    };
    private long downTime;
    /** A host-reported drag start is used only by a drag that follows within this time. */
    static final long HOST_START_MS = 600;
    private float hostStartX, hostStartY;
    private long hostStartAt = Long.MIN_VALUE / 2;
    private float touchX, touchY;
    private final Runnable endScroll = () -> guard(this::finishTouch);
    private final Runnable bindTimeout = () -> fail(new IllegalStateException("Maps' native car service did not connect"));
    private final ServiceConnection connection = new ServiceConnection() {
        @Override public void onServiceConnected(ComponentName name, IBinder binder) {
            if (closed) return;
            main.removeCallbacks(bindTimeout);
            guard(() -> {
                if (!PROJECTION.equals(binder.getInterfaceDescriptor())) throw new IllegalStateException("Maps projection protocol changed");
                Object reference = field(binder, "a");
                if (!(reference instanceof WeakReference)) throw new IllegalStateException("Maps native service must run in the adapter process");
                controller = ((WeakReference<?>) reference).get();
                if (controller == null) throw new IllegalStateException("Maps native projection controller is unavailable");
                // This private connection is entirely inside Maps. The exported adapter validates
                // the external host first; the original service remains restricted to our own UID.
                controller.getClass().getField("H").setInt(controller, Process.myUid());
                Parcel request = Parcel.obtain(), reply = Parcel.obtain();
                try {
                    request.writeInterfaceToken(PROJECTION);
                    request.writeStrongBinder(callback);
                    request.writeStrongBinder(car);
                    if (!binder.transact(1, request, reply, 0)) throw new RemoteException("Maps native initialization is unavailable");
                    reply.readException();
                } finally { reply.recycle(); request.recycle(); }
                showSurface();
            });
        }
        @Override public void onServiceDisconnected(ComponentName name) { fail(new IllegalStateException("Maps' native car service disconnected")); }
        @Override public void onBindingDied(ComponentName name) { fail(new IllegalStateException("Maps' native car service died")); }
        @Override public void onNullBinding(ComponentName name) { fail(new IllegalStateException("Maps refused its native car connection")); }
    };

    public ProjectionRenderer(Service service, Consumer<Throwable> onFailure) {
        this(service, Process.myUid(), onFailure);
    }
    public ProjectionRenderer(Service service, int hostUid, Consumer<Throwable> onFailure) {
        this.service = service;
        this.onFailure = onFailure;
        uiStateLease = UI_STATES.acquire(hostUid);
        initialUiState = uiStateLease.restored;
        content=new NativeCarContent(this,service,()->contentChanged.run());
    }

    /** The car host supplies its keyboard; the original Maps editor owns query handling. */
    public interface KeyboardListener {
        void show(IBinder connection, EditorInfo editor);
        void hide();
    }

    public void setKeyboardListener(KeyboardListener listener) { keyboardListener = listener; }
    /** Maps' native search rows changed; the host refreshes them only while its keyboard is open. */
    void setContentChangedListener(Runnable listener) { contentChanged = listener; }
    void setToastListener(java.util.function.BiConsumer<CharSequence,Integer> listener){toast=listener;}
    /** Maps' own recents/search rows for the host keyboard's query. */
    NativeCarContent.Page content(String query)throws Exception{
        contentQuery=query;
        return content.read(query);
    }
    void performContentAction(NativeCarContent.Action action)throws Exception{
        content.invoke(action,contentQuery);
    }
    /** Maps draws its own guidance; the warning patch only learns whether the host is navigating. */
    void hostedNavigation(boolean active){
        if(hostedNavigation==active)return;
        hostedNavigation=active;
        guard(()->telemetryNavigation(active));
    }

    public void create(Intent value, Configuration config) {
        guard(() -> {
            intent = nativeIntent(value);
            LocalCarUiSession.attach(this,next->main.post(()->newIntent(next)),(text,duration)->main.post(()->{if(!closed&&!failed)toast.accept(text,duration);}));
            configuration = config == null ? new Configuration(service.getResources().getConfiguration()) : new Configuration(config);
            if (!bound) {
                bound = service.bindService(new Intent(Intent.ACTION_MAIN).setComponent(originalComponent()), connection, Context.BIND_AUTO_CREATE);
                if (!bound) throw new IllegalStateException("Cannot bind Maps' original Android Auto service");
                main.postDelayed(bindTimeout, 15000);
            }
        });
    }
    public void start() {}
    public void resume() { resumed = true; guard(() -> { if (created) lifecycle(5); telemetrySession(true); telemetrySurface(decor()); markProbe(); }); }
    public void pause() { resumed = false; guard(() -> { telemetrySession(false); finishTouch(); if (created) lifecycle(3); }); }
    public void stop() { resumed = false; guard(() -> { telemetrySession(false); finishTouch(); if (created) lifecycle(2); }); }
    public void close() {
        if (closed) return;
        closed = true;
        LocalCarUiSession.detach(this);
        content.close(this);
        telemetryNavigation(false);
        telemetrySession(false);
        main.removeCallbacks(bindTimeout);
        main.removeCallbacks(endScroll);
        releaseOverlays();
        try { destroySurface(); } catch (Exception error) { Log.w("MapsNativeCar", "Native car cleanup failed", error); }
        if (bound) {
            try { service.unbindService(connection); } catch (IllegalArgumentException ignored) {}
        }
        bound = false;
        controller = null;
        keyboardListener = null;
        contentChanged = () -> {};
        visibleArea = stableArea = appliedInsets = null;
    }
    public void newIntent(Intent value) {
        guard(() -> {
            intent = nativeIntent(value);
            if (created) call(field(controller, "J"), "C", new Class<?>[]{Intent.class}, intent);
        });
    }
    public void configurationChanged(Configuration value) {
        if (value == null) return;
        configuration = created ? canvasConfiguration(value,nativeWidth,nativeHeight,nativeDpi) : new Configuration(value);
        guard(() -> {
            if (created) {
                controller.getClass().getField("o").set(controller, configuration);
                call(controller, "v", new Class<?>[0]);
                call(controller, "t", new Class<?>[]{android.content.res.Resources.class}, service.getResources());
                Object activity = field(controller, "J");
                if (activity != null) call(activity, "b", new Class<?>[]{Configuration.class}, configuration);
                watchOccupied();
            }
        });
    }
    public void surfaceAvailable(Surface value, int w, int h, int density) {
        guard(() -> {
            if (value == null || !value.isValid() || w <= 0 || h <= 0 || density <= 0) throw new IllegalArgumentException("Invalid car surface");
            // A host can replace/hide its surface just to display its keyboard. The Maps
            // activity and native editor must survive that target change.
            boolean sameCanvas = nativeWidth == w && nativeHeight == h && nativeDpi == density;
            // Areas belong to the old surface geometry. Do not reuse them while
            // waiting for AA's callbacks for the resized/replaced canvas.
            if(width!=w||height!=h||dpi!=density){visibleArea=stableArea=null;appliedInsets=null;}
            if (surface != null && surface != value) detachSurface();
            surface = value; width = w; height = h; dpi = density;
            if (created && !sameCanvas) resizeCanvas(w, h, density);
            showSurface();
        });
    }
    public void surfaceDestroyed() { guard(this::detachSurface); }
    /** The host's floating pieces (DriveDeck's player); Maps' layout stays as Google draws it. */
    void overlays(List<Rect> value) {
        if (closed || failed) return;
        List<Rect> copy = new ArrayList<>();
        if (value != null) for (Rect rect : value) if (rect != null && !rect.isEmpty()) copy.add(new Rect(rect));
        hostOverlays = Collections.unmodifiableList(copy);
        if (resumed) guard(() -> telemetrySurface(decor()));
    }
    /** Starts reporting Maps' occupied boxes; the host offers to place its floating pieces around them. */
    void setOccupiedListener(java.util.function.Consumer<List<Rect>> listener) {
        occupiedListener = listener;
        occupiedSent = null;
        guard(this::watchOccupied);
    }
    private void watchOccupied() throws Exception {
        View root = occupiedListener == null ? null : decor();
        if (root == occupiedRoot) return;
        if (occupiedRoot != null) occupiedRoot.getViewTreeObserver().removeOnPreDrawListener(occupiedDraw);
        occupiedRoot = root;
        occupiedSent = null;
        if (root != null) { root.getViewTreeObserver().addOnPreDrawListener(occupiedDraw); root.invalidate(); }
    }
    private void reportOccupiedNow() {
        occupiedPending = false;
        if (closed || failed || occupiedListener == null || !(occupiedRoot instanceof ViewGroup)) return;
        try {
            List<Rect> areas = NativeOccupiedAreas.of((ViewGroup) occupiedRoot);
            if (areas.equals(occupiedSent)) return;
            occupiedSent = areas;
            occupiedListener.accept(Collections.unmodifiableList(areas));
        } catch (RuntimeException error) {
            // Reporting free space to the host is a placement hint; it never ends the car session.
            Log.w("MapsNativeCar", "Maps layout report unavailable", error);
        }
    }
    private void releaseOverlays() {
        main.removeCallbacks(reportOccupied);
        occupiedPending = false;
        if (occupiedRoot != null) occupiedRoot.getViewTreeObserver().removeOnPreDrawListener(occupiedDraw);
        occupiedRoot = null;
        occupiedListener = null;
        occupiedSent = null;
        hostOverlays = Collections.emptyList();
    }
    public void visibleArea(Rect area) { guard(() -> { visibleArea = area == null ? null : new Rect(area); applyAreas(); if (resumed) telemetrySurface(decor()); }); }
    public void stableArea(Rect area) { guard(() -> { stableArea = area == null ? null : new Rect(area); applyAreas(); if (resumed) telemetrySurface(decor()); }); }
    private Rect insets(int w, int h) {
        Rect canvas = new Rect(0, 0, w, h), safe = visibleArea == null ? null : new Rect(visibleArea);
        if (safe == null || safe.isEmpty() || !safe.intersect(canvas)) safe = stableArea == null ? null : new Rect(stableArea);
        if (safe == null || safe.isEmpty() || !safe.intersect(canvas)) return new Rect();
        return new Rect(safe.left, safe.top, w - safe.right, h - safe.bottom);
    }
    private void applyAreas() throws Exception {
        if (!created || controller == null) return;
        Rect insets = insets(nativeWidth, nativeHeight);
        if (insets.equals(appliedInsets)) return;
        Object presentation = field(controller, "k");
        if (presentation == null) return;
        ((Rect) controller.getClass().getField("v").get(controller)).set(insets);
        call(presentation, "A", new Class<?>[]{Rect.class}, insets);
        if (surface != null && surface.isValid()) controller.getClass().getField("C").set(controller, drawing(nativeWidth, nativeHeight, nativeDpi));
        appliedInsets = new Rect(insets);
    }
    /**
     * As below, kept clear of a host overlay in the lower right, where the speedometer and warning
     * pills sit: above a low piece (the floating player), left of one reaching down from the top (a
     * full player card). A piece that stays in the upper half (a compact card) leaves them alone.
     */
    static Rect warningViewport(int width,int height,Rect visible,Rect stable,List<Rect> overlays){
        Rect result=warningViewport(width,height,visible,stable);
        if(result.isEmpty()||overlays==null)return result;
        for(Rect overlay:overlays){
            if(!Rect.intersects(overlay,result)||overlay.right<=result.centerX()||overlay.bottom<=result.centerY())continue;
            if(overlay.top>result.centerY())result.bottom=Math.min(result.bottom,overlay.top);
            else result.right=Math.min(result.right,overlay.left);
        }
        if(result.bottom<=result.top||result.right<=result.left)result.setEmpty();
        return result;
    }
    static Rect warningViewport(int width,int height,Rect visible,Rect stable){
        Rect result=new Rect(0,0,Math.max(0,width),Math.max(0,height));
        // Warnings move with the currently visible native controls. The stable
        // area reserves space even for hidden controls; intersecting it here
        // prevents alignment with Maps after those controls disappear.
        Rect area=visible!=null?visible:stable;
        if(area==null||area.isEmpty()||!result.intersect(area))result.setEmpty();
        return result;
    }

    private void resizeCanvas(int w,int h,int density) throws Exception {
        finishTouch();
        Object holder=displayHolder();
        Object target=field(holder,"b");
        if(!(target instanceof VirtualDisplay))throw new IllegalStateException("Maps virtual display ABI changed");
        // Resize the existing display/window, including while a host keyboard is
        // open. Recreating the activity would invalidate its native editor.
        controller.getClass().getField("C").set(controller,drawing(w,h,density));
        ((VirtualDisplay)target).resize(w,h,density);
        nativeWidth=w;nativeHeight=h;nativeDpi=density;
        Configuration updated=canvasConfiguration(configuration,w,h,density);
        configurationChanged(updated);
        appliedInsets=null;
    }

    static Configuration canvasConfiguration(Configuration previous,int w,int h,int density){
        // CAL hosts may pass their phone Activity configuration. A full copy
        // carries its hidden WindowConfiguration bounds into the car display
        // (for example 1080px inside a 1280px Surface). Carry only public policy
        // and input values; the real car Surface owns all display geometry.
        Configuration value=new Configuration();
        value.setLocales(previous.getLocales());
        value.fontScale=previous.fontScale>0?previous.fontScale:1;
        value.uiMode=previous.uiMode;value.touchscreen=previous.touchscreen;
        value.navigation=previous.navigation;value.navigationHidden=previous.navigationHidden;
        value.keyboard=previous.keyboard;value.keyboardHidden=previous.keyboardHidden;value.hardKeyboardHidden=previous.hardKeyboardHidden;
        value.mcc=previous.mcc;value.mnc=previous.mnc;
        value.densityDpi=density;
        value.screenWidthDp=Math.round(w*160f/density);
        value.screenHeightDp=Math.round(h*160f/density);
        value.smallestScreenWidthDp=Math.min(value.screenWidthDp,value.screenHeightDp);
        value.orientation=w>=h?Configuration.ORIENTATION_LANDSCAPE:Configuration.ORIENTATION_PORTRAIT;
        return value;
    }
    /** Ends a drag the host stopped feeding (for example on leaving pan mode). */
    public void endGesture() { guard(this::finishTouch); }
    public void back() {
        guard(() -> {
            finishTouch();
            View view = decor();
            if (view != null) {
                view.dispatchKeyEvent(new KeyEvent(KeyEvent.ACTION_DOWN, KeyEvent.KEYCODE_BACK));
                view.dispatchKeyEvent(new KeyEvent(KeyEvent.ACTION_UP, KeyEvent.KEYCODE_BACK));
            }
        });
    }
    public void click(float x, float y) {
        guard(() -> {
            finishTouch();
            downTime = SystemClock.uptimeMillis();
            touchX = x; touchY = y;
            touch(MotionEvent.ACTION_DOWN, x, y);
            touch(MotionEvent.ACTION_UP, x, y);
            downTime = 0;
        });
    }
    /**
     * Where the host saw the finger go down for the drag that follows (DriveDeck sends it; the
     * Car App Library itself reports drags only as distances). Kept briefly for that drag.
     */
    void gestureStart(float x, float y) {
        if (!Float.isFinite(x) || !Float.isFinite(y)) return;
        hostStartX = x; hostStartY = y; hostStartAt = SystemClock.uptimeMillis();
    }
    public void scroll(float distanceX, float distanceY) {
        guard(() -> {
            if (downTime == 0) {
                downTime = SystemClock.uptimeMillis();
                float[] anchor = downTime - hostStartAt <= HOST_START_MS ? new float[]{hostStartX, hostStartY} : null;
                hostStartAt = Long.MIN_VALUE / 2;
                boolean fromHost = anchor != null;
                View root = decor();
                if (anchor == null) anchor = dragAnchor(root instanceof ViewGroup ? (ViewGroup) root : null, distanceX, distanceY, width, height);
                touchX = anchor[0]; touchY = anchor[1];
                // Owner-approved drag diagnostic (2026-11-11): one line per host drag.
                Log.i("MapsNativeCar", "drag start (" + Math.round(touchX) + "," + Math.round(touchY) + ") " + (fromHost ? "from host" : "chosen")
                        + " over " + (root instanceof ViewGroup ? NativeOccupiedAreas.describe(root, touchX, touchY) : "no window"));
                touch(MotionEvent.ACTION_DOWN, touchX, touchY);
            }
            touchX = Math.max(1, Math.min(width - 1, touchX - distanceX));
            touchY = Math.max(1, Math.min(height - 1, touchY - distanceY));
            touch(MotionEvent.ACTION_MOVE, touchX, touchY);
            main.removeCallbacks(endScroll);
            main.postDelayed(endScroll, 100);
        });
    }
    /**
     * Where a drag without a known start begins. A mostly vertical drag goes to the list drawn on
     * top (any RecyclerView, including Maps' paged car lists, or a scroll/list view): search
     * results, categories, Settings, route options, place details. Otherwise it pans the map from
     * the middle of the surface. The list itself does the scrolling, as under a real finger.
     */
    static float[] dragAnchor(ViewGroup root, float distanceX, float distanceY, int width, int height) {
        float[] map = {width / 2f, height / 2f};
        View list = Math.abs(distanceY) < Math.abs(distanceX) ? null : topList(root);
        if (list == null) return map;
        Rect visible = new Rect();
        if (!list.getGlobalVisibleRect(visible)) return map;
        int[] origin = new int[2];
        root.getLocationInWindow(origin);
        return new float[]{visible.exactCenterX() - origin[0], visible.exactCenterY() - origin[1]};
    }
    /** The visible list drawn last (on top), depth first in drawing order; null when none is shown. */
    static View topList(View view) {
        if (view == null || view.getVisibility() != View.VISIBLE || view.getAlpha() == 0f || view.getWidth() <= 0 || view.getHeight() <= 0) return null;
        View found = null;
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) { View inner = topList(group.getChildAt(i)); if (inner != null) found = inner; }
        }
        if (found != null) return found;
        return isList(view) && view.getGlobalVisibleRect(new Rect()) ? view : null;
    }
    private static boolean isList(View view) {
        if (view instanceof android.widget.AbsListView || view instanceof android.widget.ScrollView) return true;
        for (Class<?> type = view.getClass(); type != null && type != View.class; type = type.getSuperclass()) {
            String name = type.getName();
            if (name.endsWith("RecyclerView") || name.endsWith("NestedScrollView")) return true;
        }
        return view.canScrollVertically(1) || view.canScrollVertically(-1);
    }
    public void fling(float velocityX, float velocityY) {
        scroll(-velocityX / 15f, -velocityY / 15f);
        guard(this::finishTouch);
    }
    public void scale(float focusX, float focusY, float factor) {
        guard(() -> {
            if (!Float.isFinite(factor) || factor <= 0) return;
            finishTouch();
            downTime = SystemClock.uptimeMillis();
            float radius = Math.min(width, height) / 8f;
            twoPointers(MotionEvent.ACTION_DOWN, focusX, focusY, radius, 1);
            twoPointers(MotionEvent.ACTION_POINTER_DOWN | (1 << MotionEvent.ACTION_POINTER_INDEX_SHIFT), focusX, focusY, radius, 2);
            twoPointers(MotionEvent.ACTION_MOVE, focusX, focusY, radius * factor, 2);
            twoPointers(MotionEvent.ACTION_POINTER_UP | (1 << MotionEvent.ACTION_POINTER_INDEX_SHIFT), focusX, focusY, radius * factor, 2);
            twoPointers(MotionEvent.ACTION_UP, focusX, focusY, radius * factor, 1);
            downTime = 0;
        });
    }

    private ComponentName originalComponent() { return new ComponentName(service.getPackageName(), ORIGINAL); }
    private Intent nativeIntent(Intent value) {
        Intent result = value == null ? new Intent(Intent.ACTION_MAIN) : new Intent(value);
        if ("androidx.car.app.action.NAVIGATE".equals(result.getAction())) result.setAction(Intent.ACTION_VIEW);
        return result.setComponent(originalComponent()).setPackage(service.getPackageName());
    }
    private void showSurface() throws Exception {
        if (controller == null || surface == null || !surface.isValid() || intent == null) return;
        if (created) {
            Object holder = displayHolder();
            call(holder, "f", new Class<?>[]{Surface.class}, surface);
            controller.getClass().getField("C").set(controller, drawing(nativeWidth, nativeHeight, nativeDpi));
            applyAreas();
            watchOccupied();
            if(resumed)telemetrySurface(decor());
            return;
        }
        Object drawing = drawing(width, height, dpi);
        configuration=canvasConfiguration(configuration,width,height,dpi);
        Object display = type("com.google.android.gms.car.display.CarDisplayId").getConstructor(int.class).newInstance(0);
        Object region = type("com.google.android.gms.car.display.CarRegionId").getConstructor(int.class, display.getClass()).newInstance(0, display);
        Bundle state = restoredUiState();
        call(controller, "o", new Class<?>[]{region.getClass(), drawing.getClass(), Intent.class, Configuration.class, Bundle.class}, region, drawing, intent, configuration, state);
        initialUiState = null;
        nativeWidth = width; nativeHeight = height; nativeDpi = dpi;
        created = true;
        Object target=field(displayHolder(),"b");
        if(target instanceof VirtualDisplay)NativeCarScopes.display(this,((VirtualDisplay)target).getDisplay().getDisplayId());
        appliedInsets = null; applyAreas();
        watchOccupied();
        if (resumed) { lifecycle(5); telemetrySession(true); telemetrySurface(decor()); }
    }
    Bundle restoredUiState() {
        // Maps' IntentRouter treats every non-null Bundle as restoration and
        // skips initial-intent routing. An empty Bundle is not a fresh session.
        Bundle state = initialUiState == null ? null : initialUiState.deepCopy();
        if (state != null) state.setClassLoader(service.getClassLoader());
        return state;
    }
    private Object drawing(int w, int h, int density) throws Exception {
        return type("com.google.android.gms.car.DrawingSpec").getConstructor(int.class, int.class, int.class, Surface.class, Rect.class, int.class, int.class, Bundle.class)
                .newInstance(w, h, density, surface, insets(w, h), 0, 0, new Bundle());
    }
    private void lifecycle(int state) throws Exception { call(controller, "m", new Class<?>[]{int.class, boolean.class}, state, false); }
    private void detachSurface() throws Exception {
        telemetrySurface(null);
        finishTouch();
        if (controller != null && created) {
            // Maps' original VirtualDisplay holder can change its output without destroying
            // the Presentation/window. Destroying it here invalidates IProxyInputConnection.
            Object holder = displayHolder();
            call(holder, "f", new Class<?>[]{Surface.class}, new Object[]{null});
        }
        if (surface != null) surface.release();
        surface = null;
    }
    private void destroySurface() throws Exception {
        telemetrySurface(null);
        finishTouch();
        if (controller != null && created) {
            // The native STOP transition saves J.e(Bundle) into n. Pull it before
            // DESTROY clears native fields; its Binder callback may arrive later.
            lifecycle(2);
            UI_STATES.save(uiStateLease, (Bundle) field(controller, "n"));
            lifecycle(0);
            call(controller, "k", new Class<?>[0]);
        }
        created = false;
        nativeWidth = nativeHeight = nativeDpi = 0;
        keyboardRequested = false;
        appliedInsets = null;
        if (surface != null) surface.release();
        surface = null;
    }
    private Class<?> telemetryType() throws ClassNotFoundException {return Class.forName("org.ungoogled.ui.ExternalTelemetry",true,service.getClassLoader());}
    private void telemetrySession(boolean active) {
        try {telemetryType().getMethod("carSession",Context.class,Object.class,boolean.class).invoke(null,service,this,active);}
        catch(ClassNotFoundException absent) { /* The warning patch is optional. */ }
        catch(ReflectiveOperationException|RuntimeException error){Log.w("MapsNativeCar","Warning car lifecycle unavailable",error);}
    }
    private void telemetryNavigation(boolean active){
        try{telemetryType().getMethod("carNavigation",Context.class,Object.class,boolean.class).invoke(null,service,this,active);}
        catch(ClassNotFoundException absent){ /* The warning patch is optional. */ }
        catch(ReflectiveOperationException|RuntimeException error){Log.w("MapsNativeCar","Warning car guidance unavailable",error);}
    }
    private void telemetrySurface(View root) {
        try {telemetryType().getMethod("carSurface",Object.class,android.view.ViewGroup.class,Rect.class).invoke(null,this,root instanceof android.view.ViewGroup?root:null,warningViewport(width,height,visibleArea,stableArea,hostOverlays));}
        catch(ClassNotFoundException absent) { /* The warning patch is optional. */ }
        catch(ReflectiveOperationException|RuntimeException error){Log.w("MapsNativeCar","Warning car surface unavailable",error);}
    }
    private View decor() throws Exception {
        if (!created || controller == null) return null;
        Object presentation = field(controller, "k");
        if (presentation == null) return null;
        Method method = presentation.getClass().getMethod("f");
        Window window = (Window) method.invoke(presentation);
        return window == null ? null : window.getDecorView();
    }

    /**
     * Anchor-verification pass (BydLabelProbe): names Maps' own car texts just after the host first
     * sees the surface, and logs the map so a screenshot can be read without guessing. Removed once
     * the view the vehicle figures belong on is known.
     */
    private void markProbe() {
        main.postDelayed(() -> guard(this::decorateCar), 3000L);
        main.postDelayed(() -> guard(this::decorateCar), 9000L);
    }

    /** Hands Maps' car surface to the vehicle decorator, and keeps it decorated while resumed. */
    private void decorateCar() throws Exception {
        View root = decor();
        if (root == null) return;
        BydVehicle.setCarSurface(root);
    }
    private void finishTouch() throws Exception {
        main.removeCallbacks(endScroll);
        if (downTime != 0) { touch(MotionEvent.ACTION_UP, touchX, touchY); downTime = 0; }
    }
    private void touch(int action, float x, float y) throws Exception {
        View view = decor();
        if (view == null) return;
        MotionEvent event = MotionEvent.obtain(downTime, SystemClock.uptimeMillis(), action, x, y, 0);
        event.setSource(0x1002);
        try { view.dispatchTouchEvent(event); } finally { event.recycle(); }
    }
    private void twoPointers(int action, float x, float y, float radius, int count) throws Exception {
        View view = decor();
        if (view == null) return;
        MotionEvent.PointerProperties[] properties = new MotionEvent.PointerProperties[count];
        MotionEvent.PointerCoords[] coordinates = new MotionEvent.PointerCoords[count];
        for (int i = 0; i < count; i++) {
            properties[i] = new MotionEvent.PointerProperties(); properties[i].id = i; properties[i].toolType = MotionEvent.TOOL_TYPE_FINGER;
            coordinates[i] = new MotionEvent.PointerCoords(); coordinates[i].x = x + (i == 0 ? -radius : radius); coordinates[i].y = y; coordinates[i].pressure = 1; coordinates[i].size = 1;
        }
        MotionEvent event = MotionEvent.obtain(downTime, SystemClock.uptimeMillis(), action, count, properties, coordinates, 0, 0, 1, 1, 0, 0, 0x1002, 0);
        try { view.dispatchTouchEvent(event); } finally { event.recycle(); }
    }
    private Class<?> type(String name) throws ClassNotFoundException { return service.getClassLoader().loadClass(name); }
    private Object displayHolder() throws Exception { return field(field(controller, "k"), "j"); }
    private static Object field(Object target, String name) throws Exception {
        Field member = target.getClass().getDeclaredField(name); member.setAccessible(true); return member.get(target);
    }
    private static Object call(Object target, String name, Class<?>[] parameters, Object... values) throws Exception {
        try { return target.getClass().getMethod(name, parameters).invoke(target, values); }
        catch (InvocationTargetException error) {
            Throwable cause = error.getCause();
            if (cause instanceof Exception) throw (Exception) cause;
            throw error;
        }
    }
    private interface Work { void run() throws Exception; }
    private void guard(Work work) {
        if (closed || failed) return;
        try { work.run(); } catch (Exception error) { fail(error); }
    }
    private void fail(Throwable error) {
        if (closed || failed) return;
        failed = true;
        Log.e("MapsNativeCar", "Original Maps car renderer failed", error);
        onFailure.accept(error);
    }
    private Parcelable ui() throws Exception {
        return (Parcelable) type("com.google.android.gms.car.CarUiInfo").getConstructor(boolean.class, boolean.class, boolean.class, boolean.class, int[].class, boolean.class, int.class, boolean.class, int.class, int.class)
                .newInstance(false, true, false, false, null, false, 1, false, 0, 0);
    }

    /** Minimum native host services. No speed, gear, fuel or driving-state samples are invented. */
    private final class HostBinder extends Binder {
        private final String descriptor;
        HostBinder(String descriptor) { this.descriptor = descriptor; attachInterface(null, descriptor); }
        @Override protected boolean onTransact(int code, Parcel data, Parcel reply, int flags) throws RemoteException {
            if (code == INTERFACE_TRANSACTION) { reply.writeString(descriptor); return true; }
            data.enforceInterface(descriptor);
            if (Binder.getCallingUid() != Process.myUid()) throw new SecurityException("Maps internal projection only");
            try {
                if (CAR.equals(descriptor)) {
                    switch (code) {
                        case 5: case 6: data.readStrongBinder(); reply.writeNoException(); return true;
                        case 55:
                            data.readString(); data.createStringArrayList(); reply.writeNoException(); reply.writeStringList(new ArrayList<String>()); return true;
                        case 19: case 71:
                            data.readString(); int bool = data.readInt(); reply.writeNoException(); reply.writeInt(bool); return true;
                        case 68:
                            data.readString(); int value = data.readInt(); reply.writeNoException(); reply.writeInt(value); return true;
                        case 1:
                            reply.writeNoException(); reply.writeInt(1); ((Parcelable) type("com.google.android.gms.car.CarInfo").getConstructor().newInstance()).writeToParcel(reply, 0); return true;
                        case 2: reply.writeNoException(); reply.writeInt(1); ui().writeToParcel(reply, 0); return true;
                        case 77: reply.writeNoException(); reply.writeStrongBinder(new HostBinder(DISPLAY_MANAGER)); return true;
                    }
                } else if (DISPLAY_MANAGER.equals(descriptor)) {
                    if (code == 3) { reply.writeNoException(); reply.writeStrongBinder(new HostBinder(DISPLAY)); return true; }
                } else if (DISPLAY.equals(descriptor)) {
                    if (code == 3) { reply.writeNoException(); reply.writeInt(1); ui().writeToParcel(reply, 0); return true; }
                    if (Arrays.asList(4, 5, 7, 8, 10, 11, 13, 14).contains(code)) { reply.writeNoException(); return true; }
                } else if (CALLBACK.equals(descriptor)) {
                    if (code == 12) {
                        Bundle state = data.readInt() == 0 ? null : Bundle.CREATOR.createFromParcel(data);
                        if (state != null) state.setClassLoader(service.getClassLoader());
                        UI_STATES.save(uiStateLease, state);
                    } else if (code == 16) {
                        IBinder input = data.readStrongBinder();
                        EditorInfo editor = data.readInt() == 0 ? null : EditorInfo.CREATOR.createFromParcel(data);
                        if (input == null || editor == null) throw new IllegalArgumentException("Maps supplied no native editor");
                        keyboardRequested = true;
                        main.post(() -> {
                            if (!closed && !failed && keyboardListener != null) keyboardListener.show(input, editor);
                        });
                    } else if (code == 17) {
                        keyboardRequested = false;
                        main.post(() -> {
                            if (!closed && keyboardListener != null) keyboardListener.hide();
                        });
                    }
                    if (reply != null) { reply.writeNoException(); if (code == 24) reply.writeInt(0); }
                    return true;
                }
                Log.w("MapsNativeCar", "Unsupported native host request " + descriptor + " transaction " + code);
                return false;
            } catch (Exception error) {
                if (reply != null) reply.writeException(new IllegalStateException("Native Maps host request failed", error));
                main.post(() -> fail(error));
                return true;
            }
        }
    }
}
