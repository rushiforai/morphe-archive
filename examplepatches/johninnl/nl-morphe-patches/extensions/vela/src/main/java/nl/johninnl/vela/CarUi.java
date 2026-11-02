package nl.johninnl.vela;

import android.graphics.Canvas;
import android.graphics.Color;
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
    private static final Map<Object,Object> PARENTS = Collections.synchronizedMap(new WeakHashMap<>());
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
                    TelemetryRuntime.spokenEnabled(), true));
            rows.add(toggle(screen, parent, label("Show zone and warning details", "Traject- en waarschuwingsdetails tonen"),
                    label("Partial observed average; progress may be estimated", "Gedeeltelijk waargenomen gemiddelde; voortgang kan geschat zijn"), TelemetryRuntime.carEnabled(), false));
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
                                 boolean spoken) throws ReflectiveOperationException {
        Object builder = construct("mq3");
        type("mq3").getMethod("c", String.class).invoke(builder, title);
        type("mq3").getMethod("a", CharSequence.class).invoke(builder, detail);
        Class<?> function = type("kotlin.jvm.functions.Function1");
        Object callback = Proxy.newProxyInstance(function.getClassLoader(), new Class<?>[]{function}, (proxy, method, args) -> {
            if (method.getName().equals("invoke")) {
                boolean enabled = Boolean.TRUE.equals(args[0]);
                if (spoken) TelemetryRuntime.setSpokenEnabled(enabled); else TelemetryRuntime.setCarEnabled(enabled);
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

    /** Intercept only the selected external-provider display; native mode keeps the original renderer. */
    public static boolean compact(Object renderer, Canvas canvas) {
        TelemetryRuntime.carFrame(renderer);
        if (TelemetryRuntime.selected().isEmpty() || !TelemetryRuntime.carEnabled()) return false;
        try {
            Rect safe = new Rect((Rect)invoke(renderer, "u"));
            if (!safe.intersect(0, 0, canvas.getWidth(), canvas.getHeight())) return true;
            boolean imperial = Boolean.TRUE.equals(invoke(type("gr4").getField("a").get(null), "getValue"));
            boolean dark = Boolean.TRUE.equals(invoke(renderer, "l"));
            double mps = TelemetryRuntime.carSpeedMps(((Number)field(renderer, "q")).doubleValue());
            String current = TelemetryRuntime.carCurrentLabel(renderer,
                    String.valueOf(Math.max(0, Math.round(mps * (imperial ? 2.236936 : 3.6)))));
            Double limit = TelemetryRuntime.carLimitKmh((Double)field(renderer, "r"));
            TelemetryStore.View view = TelemetryRuntime.view();
            String warning = TelemetryRuntime.compactWarningText();
            float radius = Math.max(22f, Math.min(46f,
                    Math.min(((Number)field(renderer,"h")).intValue(), ((Number)field(renderer,"i")).intValue()) / 18f));
            Layout layout = compactLayout(safe, Math.max(.7f, radius / 46f), view.zoneActive, !warning.isEmpty());
            if (layout == null) return true;
            renderCompact(canvas, layout, current, limit, view, warning, imperial, dark,
                    (Paint)field(renderer,"l0"), (Paint)field(renderer,"m0"), (Paint)field(renderer,"p0"),
                    (Paint)field(renderer,"n0"), (Paint)field(renderer,"o0"));
            return true;
        } catch (ReflectiveOperationException e) { failure(e); return false; }
    }

    /** One pair width governs the sign, average, progress track and distance footer. */
    static final class Layout {
        final RectF bounds, pair, bar;
        final float scale, rowTop;
        Layout(RectF bounds, float scale, boolean zone, boolean warning) {
            this.bounds = bounds; this.scale = scale;
            rowTop = bounds.top + (warning ? 22f * scale : 0f);
            pair = new RectF(bounds.left, rowTop, bounds.right, rowTop + 68f * scale);
            bar = zone ? new RectF(pair.left, rowTop + 97f * scale, pair.right, rowTop + 101f * scale) : null;
        }
    }
    static Layout compactLayout(Rect safe, float requestedScale, boolean zone, boolean warning) {
        float height = (zone ? 128f : 68f) + (warning ? 22f : 0f);
        float scale = Math.min(1f, requestedScale);
        scale = Math.min(scale, Math.min((safe.width()-16f)/156f, (safe.height()-16f)/height));
        if (scale < .5f) return null;
        float margin = 8f;
        RectF bounds = new RectF(safe.right-margin-156f*scale, safe.bottom-margin-height*scale,
                safe.right-margin, safe.bottom-margin);
        return new Layout(bounds, scale, zone, warning);
    }

    static void renderCompact(Canvas canvas, Layout layout, String current, Double limitKmh,
            TelemetryStore.View view, String warning, boolean imperial, boolean dark,
            Paint nativeNumber, Paint nativeUnit, Paint nativeLimit, Paint nativeDisc, Paint nativeRing) {
        float k=layout.scale, left=layout.pair.left, right=layout.pair.right, top=layout.rowTop;
        int ink=dark?Color.WHITE:0xff111827;
        Paint number=new Paint(nativeNumber), unit=new Paint(nativeUnit), limit=new Paint(nativeLimit);
        Paint disc=new Paint(nativeDisc), ring=new Paint(nativeRing);
        number.setColor(ink); unit.setColor(ink); limit.setColor(0xff111111);
        number.setTextAlign(Paint.Align.CENTER); unit.setTextAlign(Paint.Align.CENTER); limit.setTextAlign(Paint.Align.CENTER);
        number.setTextSize(42f*k); unit.setTextSize(18f*k); limit.setTextSize(36f*k);
        number.setShadowLayer(1.5f*k,0,0,dark?0x99000000:0xbbffffff);
        unit.setShadowLayer(1.5f*k,0,0,dark?0x99000000:0xbbffffff);
        if(number.measureText(current)>72f*k)number.setTextSize(number.getTextSize()*72f*k/number.measureText(current));
        String max=limitKmh==null||!Double.isFinite(limitKmh)||limitKmh<=0?"—":
                String.valueOf(Math.round(imperial?limitKmh/1.609344:limitKmh));
        if(limit.measureText(max)>51f*k)limit.setTextSize(limit.getTextSize()*51f*k/limit.measureText(max));
        try {
            double speed=Double.parseDouble(current)*(imperial?1.609344:1);
            if(limitKmh!=null&&speed>limitKmh+5)number.setColor(0xffe8514a);
        } catch(NumberFormatException ignored) { /* Unknown is a dash, never zero. */ }
        int save=canvas.save();
        try {
            canvas.clipRect(layout.bounds);
            float currentX=left+36f*k, limitX=right-34f*k;
            canvas.drawText(current,currentX,top+41f*k,number);
            canvas.drawText(imperial?"mph":"km/h",currentX,top+62f*k,unit);
            disc.setColor(Color.WHITE); disc.setStyle(Paint.Style.FILL);
            ring.setStyle(Paint.Style.STROKE); ring.setStrokeWidth(5f*k);
            canvas.drawCircle(limitX,top+34f*k,30f*k,disc);
            canvas.drawCircle(limitX,top+34f*k,30f*k,ring);
            canvas.drawText(max,limitX,top+46f*k,limit);
            if(!warning.isEmpty()) {
                unit.setTextAlign(Paint.Align.LEFT); unit.setTextSize(18f*k);
                canvas.drawText(ellipsize(warning,unit,layout.bounds.width()),left,layout.bounds.top+17f*k,unit);
            }
            if(view.zoneActive) {
                unit.setTextAlign(Paint.Align.LEFT); unit.setTextSize(20f*k);
                if(view.averageKmh!=null&&limitKmh!=null&&view.averageKmh>limitKmh+5)unit.setColor(0xffe8514a);
                canvas.drawText(averageText(view.averageKmh,imperial),left,top+89f*k,unit);
                unit.setColor(ink); unit.setTextSize(16f*k);
                Paint track=new Paint(Paint.ANTI_ALIAS_FLAG);
                track.setColor(dark?0xff68737e:0xffc5cbd0);
                canvas.drawRoundRect(layout.bar,2f*k,2f*k,track);
                float fraction=view.progressPercent==null?0:Math.max(0f,Math.min(1f,view.progressPercent.floatValue()/100f));
                track.setColor(0xff1f6feb);
                canvas.drawRoundRect(new RectF(layout.bar.left,layout.bar.top,layout.bar.left+layout.bar.width()*fraction,layout.bar.bottom),2f*k,2f*k,track);
                canvas.drawText(progressText(view.progressPercent,view.progressEstimated),left,top+123f*k,unit);
                unit.setTextAlign(Paint.Align.RIGHT);
                canvas.drawText(distanceText(view.remainingMeters,imperial),right,top+123f*k,unit);
            }
        } finally { canvas.restoreToCount(save); }
    }
    static String averageText(Double averageKmh,boolean imperial) {
        return "Ø"+(averageKmh==null?"—":Math.round(imperial?averageKmh/1.609344:averageKmh))+(imperial?" mph":" km/h");
    }
    static String progressText(Double percent,boolean estimated) {
        return percent==null?"—":(estimated?"≈":"")+Math.round(percent)+"%";
    }
    static String distanceText(int meters,boolean imperial) {
        if(meters<0)return "—";
        if(imperial)return meters<304.8?Math.max(10,Math.round(meters*3.28084/10)*10)+"ft":String.format(java.util.Locale.US,"%.1fmi",meters/1609.344);
        return meters>=1000?String.format(java.util.Locale.US,"%.1fkm",meters/1000.0):meters+"m";
    }
    private static String ellipsize(String value,Paint paint,float width) {
        if(paint.measureText(value)<=width)return value;
        int count=paint.breakText(value,true,Math.max(0,width-paint.measureText("…")),null);
        return value.substring(0,count).trim()+"…";
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
