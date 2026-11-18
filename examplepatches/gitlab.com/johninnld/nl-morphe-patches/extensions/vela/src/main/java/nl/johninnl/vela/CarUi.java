package nl.johninnl.vela;

import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Rect;
import android.graphics.RectF;
import android.util.Log;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.WeakHashMap;

/** Native Vela 0.5.2621 car templates and map-surface additions. No window or car runtime. */
public final class CarUi {
    private static final Map<Object,Float> DENSITIES=java.util.Collections.synchronizedMap(new java.util.WeakHashMap<>());
    /** Retain the host DPI without replacing or changing the original surface callback. */
    public static void surface(Object renderer,Object container){
        if(renderer==null||container==null)return;
        try{int dpi=((Number)invoke(container,"getDpi")).intValue();if(dpi>0&&dpi<=1000)DENSITIES.put(renderer,dpi/160f);}
        catch(ReflectiveOperationException|RuntimeException unavailable){DENSITIES.remove(renderer);}
    }
    private static final Map<Object,Object> PARENTS = Collections.synchronizedMap(new WeakHashMap<>());
    private static final Map<Object,Boolean> RENDERERS=Collections.synchronizedMap(new WeakHashMap<>());
    private static String lastWarningFrameKey="";
    private static boolean loggedFailure;
    private CarUi() {}

    /** Called once while the original settings list is built, before ji1.a(). */
    @SuppressWarnings("unchecked")
    public static void settingsEntry(Object screen, Object itemListBuilder) {
        try {
            Object row = row(label("Navigation provider", "Navigatieprovider"), TelemetryRuntime.statusText(), () -> {
                try {
                    Object context = field(screen, "f");
                    Object page = type("nl.johninnl.vela.car.ProviderScreen")
                            .getConstructor(type("androidx.car.app.i")).newInstance(context);
                    PARENTS.put(page, screen);
                    Object manager = invoke(screen, "i");
                    type("pt3").getMethod("c", type("nt3")).invoke(manager, page);
                } catch (ReflectiveOperationException e) { failure(e); }
            }, true);
            ((List<Object>)field(itemListBuilder, "a")).add(row);
        } catch (ReflectiveOperationException e) { failure(e); }
    }

    /** Call on the main thread when the runtime publishes a new telemetry/preference state. */
    public static void changed() {
        warningChanged();
        Object[] pages;
        synchronized (PARENTS) { pages = PARENTS.keySet().toArray(); }
        for (Object page : pages) {
            invalidate(page);
            Object parent = PARENTS.get(page);
            if (parent != null) invalidate(parent);
        }
    }

    /** Return the original ListTemplate type through a descriptor-only generated Screen. */
    @SuppressWarnings("unchecked")
    public static Object providerTemplate(Object screen) {
        try {
            Object parent = PARENTS.get(screen);
            if (parent == null) throw new IllegalStateException("Provider screen has no native parent");
            List<Object> rows = new ArrayList<>();
            String selected = TelemetryRuntime.selected();
            String[] ids = {"", "com.waze", "nl.flitsmeister"};
            String[] names = {label("Vela (native)", "Vela (eigen gegevens)"), "De-Waze", "Flitsmeister"};
            for (int i = 0; i < ids.length; i++) {
                final String id = ids[i];
                String detail = id.equals(selected) ? TelemetryRuntime.statusText()
                        : label("Use this provider", "Deze provider gebruiken");
                rows.add(row((id.equals(selected) ? "✓ " : "") + names[i], detail, () -> {
                    TelemetryRuntime.select(id);
                    invalidate(screen);
                    invalidate(parent);
                }, false));
            }
            rows.add(toggle(screen, parent, label("Spoken road warnings", "Gesproken wegwaarschuwingen"),
                    label("Respects Vela's voice and mute settings", "Volgt Vela's stem- en dempinstellingen"),
                    TelemetryRuntime.spokenEnabled(), TelemetryRuntime::setSpokenEnabled));
            rows.add(toggle(screen, parent, label("Show zone and warning details", "Traject- en waarschuwingsdetails tonen"),
                    label("Partial observed average; progress may be estimated", "Gedeeltelijk waargenomen gemiddelde; voortgang kan geschat zijn"), TelemetryRuntime.carEnabled(), TelemetryRuntime::setCarEnabled));
            rows.add(toggle(screen, parent, label("Show alerts on the map", "Waarschuwingen op de kaart tonen"),
                    label("Icons at the reported positions", "Pictogrammen op de gemelde plekken"), TelemetryRuntime.markersEnabled(), TelemetryRuntime::setMarkersEnabled));
            Object list = construct("ji1");
            ((List<Object>)field(list, "a")).addAll(rows);
            Object template = construct("qv1");
            Object title = type("androidx.car.app.model.CarText").getMethod("create", CharSequence.class)
                    .invoke(null, label("Navigation provider", "Navigatieprovider"));
            set(template, "d", title);
            set(template, "e", type("androidx.car.app.model.Action").getField("BACK").get(null));
            set(template, "b", invoke(list, "a"));
            ((List<?>)field(template, "c")).clear();
            return invoke(template, "a");
        } catch (ReflectiveOperationException e) {
            throw new IllegalStateException("Vela car template binding failed", e);
        }
    }

    private static Object toggle(Object screen, Object parent, String title, String detail, boolean checked,
                                 java.util.function.Consumer<Boolean> setter) throws ReflectiveOperationException {
        Object builder = construct("mq3");
        type("mq3").getMethod("c", String.class).invoke(builder, title);
        type("mq3").getMethod("a", CharSequence.class).invoke(builder, detail);
        Class<?> function = type("kotlin.jvm.functions.Function1");
        Object callback = Proxy.newProxyInstance(function.getClassLoader(), new Class<?>[]{function}, (proxy, method, args) -> {
            if (method.getName().equals("invoke")) {
                boolean enabled = Boolean.TRUE.equals(args[0]);
                setter.accept(enabled);
                invalidate(screen);
                return type("er4").getField("a").get(null);
            }
            return proxyObject(proxy, method, args);
        });
        // R8 specialized the host's checked listener to ke(Function1, hw). Keep that exact native path.
        Object listener = type("ke").getConstructor(Object.class, Object.class).newInstance(callback, parent);
        Object delegate = type("androidx.car.app.model.OnCheckedChangeDelegateImpl")
                .getMethod("create", type("rj4")).invoke(null, listener);
        Object toggle = type("nl.johninnl.vela.car.ProviderScreen")
                .getMethod("nativeToggle", Object.class, boolean.class).invoke(null, delegate, checked);
        set(builder, "e", toggle);
        return invoke(builder, "b");
    }

    private static Object row(String title, String detail, Runnable click, boolean browsable)
            throws ReflectiveOperationException {
        Object builder = construct("mq3");
        type("mq3").getMethod("c", String.class).invoke(builder, title);
        type("mq3").getMethod("a", CharSequence.class).invoke(builder, detail);
        Class<?> listener = type("gv2");
        Object callback = Proxy.newProxyInstance(listener.getClassLoader(), new Class<?>[]{listener}, (proxy, method, args) -> {
            if (method.getName().equals("onClick")) { click.run(); return null; }
            return proxyObject(proxy, method, args);
        });
        Object delegate = type("androidx.car.app.model.OnClickDelegateImpl")
                .getMethod("create", listener).invoke(null, callback);
        set(builder, "f", delegate);
        set(builder, "h", browsable);
        return invoke(builder, "b");
    }

    /** Request the original surface snapshot on semantic arrival, clear and expiry, even without GPS. */
    public static void warningChanged() {
        if(TelemetryRuntime.app()==null)return;
        TelemetryStore.View state=TelemetryRuntime.view();long now=android.os.SystemClock.elapsedRealtime();
        StringBuilder presentation=new StringBuilder().append(TelemetryRuntime.selected()).append(':').append(TelemetryRuntime.carEnabled())
            .append(':').append(TelemetryRuntime.app().getSharedPreferences("vela_settings",0).getBoolean("car_speed_on",false))
            .append(':').append(NativeUi.imperial()).append(':').append(state.currentKmh).append(':').append(state.limitKmh)
            .append(':').append(state.zoneActive).append(':').append(state.averageKmh).append(':').append(state.progressPercent)
            .append(':').append(state.progressEstimated).append(':').append(state.remainingMeters).append(':').append(TelemetryRuntime.nativeCarWarningText());
        for(nl.johninnl.navigation.alerts.WarningEvent event:TelemetryRuntime.carWarnings()){
            nl.johninnl.navigation.alerts.WarningGeometry geometry=TelemetryRuntime.carWarningGeometry(event,now);
            presentation.append('|').append(nl.johninnl.navigation.alerts.WarningIcons.key(event)).append(':').append(event.relationship)
                .append(':').append(nl.johninnl.navigation.alerts.WarningGeometry.relationshipKnown(event,now))
                .append(':').append(geometry==null?null:geometry.distanceMeters).append(':').append(geometry==null?null:geometry.estimated)
                .append(':').append(geometry==null?null:geometry.progress(event,now))
                .append(':').append(nl.johninnl.navigation.alerts.IndicatorContract.valueText(event,NativeUi.imperial()))
                .append(':').append(event.triggerMeters).append(':').append(nl.johninnl.navigation.alerts.CarWarningPills.fresh(event.triggerObservedAt,now));
        }
        presentation.append("|markers:").append(TelemetryRuntime.markersEnabled()).append(':').append(AlertMarkers.signature(TelemetryRuntime.markers(now)));
        String key=presentation.toString();
        if(key.equals(lastWarningFrameKey))return;
        lastWarningFrameKey=key;
        Object[] renderers;synchronized(RENDERERS){renderers=RENDERERS.keySet().toArray();}
        for(Object renderer:renderers)try{invoke(renderer,"s");}catch(ReflectiveOperationException error){failure(error);}
    }

    /** The values the intercepted native speed display handed over this frame. */
    static final class SpeedFrame {
        final Double kmh,limitKmh;
        SpeedFrame(Double kmh,Double limitKmh){this.kmh=kmh;this.limitKmh=limitKmh;}
    }
    private static final Map<Object,SpeedFrame> SPEED=Collections.synchronizedMap(new WeakHashMap<>());

    /**
     * Observe every actual native map frame, including browsing and a disabled speed display. The
     * frame's native speed display runs first ({@link #compact}); when it did, the speed pill is the
     * stack's bottom row, so warnings and speed share one scale and one right edge.
     */
    public static void warningFrame(Object renderer, Canvas canvas) { warningFrame(renderer,canvas,null,1f,1f); }

    /**
     * The patched native snapshot callback: {@code snapshot} is the MapSnapshot this frame drew and
     * {@code scaleX}/{@code scaleY} the factors it used to scale that bitmap onto the car surface.
     * Alert markers go beneath the pills, inside the same visible rectangle.
     */
    public static void warningFrame(Object renderer, Canvas canvas, Object snapshot, float scaleX, float scaleY) {
        RENDERERS.put(renderer,Boolean.TRUE);
        SpeedFrame speed=SPEED.remove(renderer);
        TelemetryRuntime.carFrame(renderer);
        if (!TelemetryRuntime.carEnabled()) return;
        markers(renderer,canvas,snapshot,scaleX,scaleY);
        TelemetryStore.View view=TelemetryRuntime.view();
        java.util.List<nl.johninnl.navigation.alerts.WarningEvent> all=TelemetryRuntime.carWarnings(),events=new java.util.ArrayList<>();
        for(nl.johninnl.navigation.alerts.WarningEvent event:all)
            if(!view.zoneActive||!nl.johninnl.navigation.alerts.CarWarningPills.zoneEvent(event))events.add(event);
        // An untyped provider warning keeps an icon pill; its prose stays in speech and accessibility.
        boolean untyped=all.isEmpty()&&!TelemetryRuntime.compactCarWarningText().isEmpty();
        if(!view.zoneActive&&events.isEmpty()&&!untyped&&speed==null)return;
        try {
            Rect safe=overlayViewport(renderer,canvas.getWidth(),canvas.getHeight());
            if (safe.isEmpty()) return;
            Float hostDensity=DENSITIES.get(renderer);float scale=hostDensity==null?1f:hostDensity;
            safe.inset(Math.round(8*scale),Math.round(8*scale));
            boolean imperial=NativeUi.imperial();
            Double maximum=speed!=null?speed.limitKmh:TelemetryRuntime.carLimitKmh(null);
            android.graphics.Typeface face=null;
            try{face=((Paint)field(renderer,"l0")).getTypeface();}catch(ReflectiveOperationException unavailable){/* Use the regular system face until the native number paint is available. */}
            java.util.Map<String,nl.johninnl.navigation.alerts.WarningGeometry> geometry=new java.util.HashMap<>();
            long now=android.os.SystemClock.elapsedRealtime();
            for(nl.johninnl.navigation.alerts.WarningEvent event:events)geometry.put(event.warningId,TelemetryRuntime.carWarningGeometry(event,now));
            nl.johninnl.navigation.alerts.CarWarningPills.draw(TelemetryRuntime.app(),canvas,new RectF(safe),scale,
                Boolean.TRUE.equals(invoke(renderer,"l")),imperial,view.zoneActive,view.averageKmh,maximum,
                view.progressPercent,view.remainingMeters,view.progressEstimated,events,face,geometry,untyped,
                speed!=null,speed==null?null:speed.kmh);
        } catch (ReflectiveOperationException|RuntimeException error) { failure(error); }
    }
    static final float MARKER_DP=28;
    /** Draws a marker icon into its slot; the shared 256px warning artwork in the product. */
    interface MarkerPainter { void draw(Canvas canvas,AlertMarkers.Placement placement); }
    static MarkerPainter markerPainter=(canvas,placement)->
        nl.johninnl.navigation.alerts.WarningIcons.draw(TelemetryRuntime.app(),canvas,placement.marker.event,placement.slot);
    /** Icons at native alert positions, projected through the very snapshot this frame drew. */
    private static void markers(Object renderer,Canvas canvas,Object snapshot,float scaleX,float scaleY) {
        if(snapshot==null||!TelemetryRuntime.markersEnabled())return;
        try {
            Rect visible=overlayViewport(renderer,canvas.getWidth(),canvas.getHeight());
            java.util.List<AlertMarkers.Placement> placed=markerPlacements(renderer,canvas.getWidth(),canvas.getHeight(),visible,snapshot,scaleX,scaleY);
            if(placed.isEmpty())return;
            int saved=canvas.save();
            try {
                canvas.clipRect(visible);
                for(AlertMarkers.Placement placement:placed)markerPainter.draw(canvas,placement);
            } finally { canvas.restoreToCount(saved); }
        } catch(ReflectiveOperationException|RuntimeException error) { failure(error); }
    }
    static java.util.List<AlertMarkers.Placement> markerPlacements(Object renderer,int width,int height,Rect visible,
            Object snapshot,float scaleX,float scaleY) throws ReflectiveOperationException {
        java.util.List<AlertMarkers.Marker> markers=TelemetryRuntime.markers(android.os.SystemClock.elapsedRealtime());
        // Without a bitmap the native frame filled the surface instead of drawing the map.
        if(markers.isEmpty()||visible.isEmpty()||invoke(snapshot,"getBitmap")==null)return java.util.Collections.emptyList();
        Float hostDensity=DENSITIES.get(renderer);float density=hostDensity==null?1f:hostDensity;
        float size=Math.max(16f,Math.min(MARKER_DP*density,Math.min(width,height)/5f));
        Class<?> latLng=Class.forName("org.maplibre.android.geometry.LatLng",false,snapshot.getClass().getClassLoader());
        java.lang.reflect.Constructor<?> point=latLng.getConstructor(double.class,double.class);
        Method pixel=snapshot.getClass().getMethod("pixelForLatLng",latLng);
        return AlertMarkers.place(markers,
            (latitude,longitude)->(android.graphics.PointF)pixel.invoke(snapshot,point.newInstance(latitude,longitude)),
            scaleX,scaleY,visible,size);
    }
    /** Current host occlusion wins; the map-action column remains reserved while auto-hidden. */
    static Rect overlayViewport(Rect visible,Rect stable,int width,int height) {
        return overlayViewport(visible,stable,width,height,1f);
    }
    static Rect overlayViewport(Rect visible,Rect stable,int width,int height,float density) {
        Rect selected=visible!=null?visible:stable;
        Rect result=selected==null?new Rect():new Rect(selected);
        if(width<=0||height<=0||!result.intersect(0,0,width,height))result.setEmpty();
        // The AA17 host's visible/stable rectangles can extend into its map-action
        // buttons (run89: right=1154 on a 1190px surface, button starts at1114).
        // Reserve the native 80dp end column as well as all reported occlusions.
        // Keep it when the strip auto-hides so both pills retain one stable anchor.
        if(!result.isEmpty()) {
            result.right=Math.min(result.right,width-Math.round(80f*density));
            if(result.right<=result.left)result.setEmpty();
        }
        return result;
    }
    private static Rect overlayViewport(Object renderer,int width,int height)throws ReflectiveOperationException {
        Float hostDensity=DENSITIES.get(renderer);float density=hostDensity==null?1f:hostDensity;
        try{return overlayViewport((Rect)field(renderer,"K"),(Rect)field(renderer,"u0"),width,height,density);}
        catch(NoSuchFieldException legacy){
            // Preserve the existing bounds-only renderer adapter. The pinned Vela
            // binding guards both native callback fields before installing this code.
            return overlayViewport((Rect)invoke(renderer,"u"),null,width,height,density);
        }
    }
    /**
     * Intercept only the selected external-provider display; native mode keeps the original renderer.
     * The native display is skipped and its values handed to this frame's {@link #warningFrame}.
     */
    public static boolean compact(Object renderer, Canvas canvas) {
        TelemetryRuntime.carFrame(renderer);
        if (TelemetryRuntime.selected().isEmpty() || !TelemetryRuntime.carEnabled()) return false;
        try {
            double mps = TelemetryRuntime.carSpeedMps(((Number)field(renderer, "q")).doubleValue());
            // A stale native speed with no provider speed is unknown: a dash, never zero.
            boolean unknown = "—".equals(TelemetryRuntime.carCurrentLabel(renderer, ""));
            Double kmh = unknown || !Double.isFinite(mps) || mps < 0 ? null : mps * 3.6;
            SPEED.put(renderer, new SpeedFrame(kmh, TelemetryRuntime.carLimitKmh((Double)field(renderer, "r"))));
            return true;
        } catch (ReflectiveOperationException e) { failure(e); return false; }
    }
    private static String label(String en,String nl) {
        return TelemetryRuntime.app().getResources().getConfiguration().getLocales().get(0).getLanguage().equals("nl")?nl:en;
    }
    private static Object proxyObject(Object proxy,Method method,Object[] args) {
        if(method.getName().equals("equals"))return proxy==args[0];
        if(method.getName().equals("hashCode"))return System.identityHashCode(proxy);
        if(method.getName().equals("toString"))return "Vela navigation provider listener";
        return null;
    }
    private static void invalidate(Object screen) {
        try { invoke(screen,"j"); } catch(ReflectiveOperationException e){failure(e);}
    }
    private static Class<?> type(String name) throws ClassNotFoundException { return Class.forName(name); }
    private static Object construct(String name) throws ReflectiveOperationException { return type(name).getConstructor().newInstance(); }
    private static Object invoke(Object target,String name) throws ReflectiveOperationException { return target.getClass().getMethod(name).invoke(target); }
    private static Object field(Object target,String name) throws ReflectiveOperationException { return target.getClass().getField(name).get(target); }
    private static void set(Object target,String name,Object value) throws ReflectiveOperationException { target.getClass().getField(name).set(target,value); }
    private static void failure(Exception error) {
        if(!loggedFailure){loggedFailure=true;Log.e("VelaTelemetry","Native car binding failed",error);}
    }
}
