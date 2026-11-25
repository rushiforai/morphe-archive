package nl.johninnl.vela;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.RectF;
import android.os.Looper;
import android.os.SystemClock;
import android.util.Log;
import java.lang.ref.WeakReference;
import java.lang.reflect.Array;
import java.lang.reflect.Constructor;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import nl.johninnl.navigation.alerts.WarningIcons;

/**
 * Phone map markers: a dedicated GeoJSON source and symbol layer added to each Vela style after
 * Vela installed its own layers ({@code iw4.f0}). Vela's own sources are never reused or changed.
 * The renamed MapLibre methods used here are hash-pinned by the patch before injection.
 */
public final class MapMarkers {
    private MapMarkers() {}
    static final String SOURCE="johninnl-warnings-src",LAYER="johninnl-warnings";
    static final float ICON_DP=30;

    /** The MapLibre surface, behind an interface so the selection/update policy is JVM-testable. */
    interface Backend {
        /** False once a newer style replaced this one. */
        boolean loaded(Object style) throws ReflectiveOperationException;
        /** Add the empty source and its symbol layer; returns the source. */
        Object install(Object style) throws ReflectiveOperationException;
        void image(Object style,String name,Bitmap image) throws ReflectiveOperationException;
        void publish(Object source,List<AlertMarkers.Marker> markers) throws ReflectiveOperationException;
    }

    /** The shared 256px warning artwork; replaceable for JVM tests without the patched assets. */
    interface Painter { boolean draw(Context context,Canvas canvas,AlertMarkers.Marker marker,RectF slot); }
    private static final Painter ICONS=(context,canvas,marker,slot)->WarningIcons.draw(context,canvas,marker.event,slot);
    private static Painter painter=ICONS;
    private static Backend backend=new Reflective();
    private static WeakReference<Object> style=new WeakReference<>(null);
    private static Object source;
    private static final Set<String> images=new HashSet<>();
    private static String shown="";
    private static boolean loggedFailure;

    /** Patched into the end of Vela's style setup. Runs on the main thread with the loaded style. */
    public static void style(Object value) {
        if(value==null)return;
        try {
            Object installed=backend.install(value);
            style=new WeakReference<>(value);source=installed;images.clear();shown="";
        } catch(ReflectiveOperationException|RuntimeException error) { drop(error);return; }
        refresh();
    }

    /** Publish on change only. Display-only: reads the current pill selection, renews nothing. */
    public static void refresh() {
        if(Looper.myLooper()!=Looper.getMainLooper())return;
        Object current=style.get();
        if(current==null||source==null)return;
        try {
            if(!backend.loaded(current)){drop(null);return;}
            List<AlertMarkers.Marker> markers=TelemetryRuntime.markers(SystemClock.elapsedRealtime());
            String key=AlertMarkers.signature(markers);
            if(key.equals(shown))return;
            List<AlertMarkers.Marker> drawable=new ArrayList<>();
            for(AlertMarkers.Marker marker:markers)if(image(current,marker))drawable.add(marker);
            backend.publish(source,drawable);
            shown=key;
        } catch(ReflectiveOperationException|RuntimeException error) { drop(error); }
    }

    private static boolean image(Object current,AlertMarkers.Marker marker) throws ReflectiveOperationException {
        String name=marker.image();
        if(images.contains(name))return true;
        Context app=TelemetryRuntime.app();if(app==null)return false;
        android.util.DisplayMetrics metrics=app.getResources().getDisplayMetrics();
        int pixels=Math.max(16,Math.round(ICON_DP*metrics.density));
        Bitmap image=Bitmap.createBitmap(pixels,pixels,Bitmap.Config.ARGB_8888);
        // MapLibre derives the icon pixel ratio from the bitmap density: this keeps it at ICON_DP.
        image.setDensity(metrics.densityDpi);
        if(!painter.draw(app,new Canvas(image),marker,new RectF(0,0,pixels,pixels))){image.recycle();return false;}
        backend.image(current,name,image);
        images.add(name);
        return true;
    }

    private static void drop(Exception error) {
        style=new WeakReference<>(null);source=null;images.clear();shown="";
        if(error!=null&&!loggedFailure){loggedFailure=true;Log.e("VelaTelemetry","Vela map markers unavailable",error);}
    }

    static void backendForTest(Backend value,Painter icons){backend=value;painter=icons;}
    static void resetForTest(){backend=new Reflective();painter=ICONS;drop(null);loggedFailure=false;}

    /** org.maplibre.android.maps.l = Style; xd3 = PropertyValue (layout when not a paint subclass). */
    private static final class Reflective implements Backend {
        private static Class<?> type(String name) throws ClassNotFoundException { return Class.forName(name); }
        @Override public boolean loaded(Object value) throws ReflectiveOperationException {
            return value.getClass().getField("f").getBoolean(value);
        }
        @Override public Object install(Object value) throws ReflectiveOperationException {
            Class<?> styleType=value.getClass();
            Class<?> sourceType=type("org.maplibre.android.style.sources.Source"),layerType=type("org.maplibre.android.style.layers.Layer");
            Object existing=styleType.getMethod("n",String.class).invoke(value,SOURCE);
            if(existing!=null)return existing;
            Object created=type("org.maplibre.android.style.sources.GeoJsonSource").getConstructor(String.class).newInstance(SOURCE);
            styleType.getMethod("h",sourceType).invoke(value,created);
            Object layer=type("org.maplibre.android.style.layers.SymbolLayer").getConstructor(String.class,String.class).newInstance(LAYER,SOURCE);
            Class<?> property=type("xd3");Constructor<?> make=property.getConstructor(String.class,Object.class);
            Object[] values={
                make.newInstance("icon-image",new Object[]{"get","icon"}),
                make.newInstance("icon-allow-overlap",Boolean.TRUE),
                make.newInstance("icon-ignore-placement",Boolean.TRUE),
                make.newInstance("icon-anchor","center"),
            };
            Object properties=Array.newInstance(property,values.length);
            for(int i=0;i<values.length;i++)Array.set(properties,i,values[i]);
            layerType.getMethod("g",properties.getClass()).invoke(layer,properties);
            // Topmost at install time: above Vela's own symbols, beneath later-added overlays.
            styleType.getMethod("d",layerType).invoke(value,layer);
            return created;
        }
        @Override public void image(Object value,String name,Bitmap image) throws ReflectiveOperationException {
            value.getClass().getMethod("a",String.class,Bitmap.class).invoke(value,name,image);
        }
        @Override public void publish(Object target,List<AlertMarkers.Marker> markers) throws ReflectiveOperationException {
            Class<?> point=type("org.maplibre.geojson.Point"),feature=type("org.maplibre.geojson.Feature");
            Class<?> geometry=type("org.maplibre.geojson.Geometry"),collection=type("org.maplibre.geojson.FeatureCollection");
            List<Object> features=new ArrayList<>();
            for(AlertMarkers.Marker marker:markers){
                Object at=point.getMethod("fromLngLat",double.class,double.class).invoke(null,marker.longitude,marker.latitude);
                Object item=feature.getMethod("fromGeometry",geometry).invoke(null,at);
                feature.getMethod("addStringProperty",String.class,String.class).invoke(item,"icon",marker.image());
                features.add(item);
            }
            Object value=collection.getMethod("fromFeatures",List.class).invoke(null,features);
            target.getClass().getMethod("c",collection).invoke(target,value);
        }
    }
}
