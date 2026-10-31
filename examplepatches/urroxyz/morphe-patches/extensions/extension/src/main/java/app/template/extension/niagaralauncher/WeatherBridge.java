package app.template.extension.niagaralauncher;

import android.content.*;
import android.os.*;
import android.util.Log;

import java.lang.ref.WeakReference;
import java.lang.reflect.*;
import java.time.*;
import java.util.*;

/** Exact-build boundary: the engine never invokes Niagara's authenticated weather endpoint. */
public final class WeatherBridge {
    private static volatile WeakReference<Object> manager = new WeakReference<>(null);
    private static volatile Context context;

    public static Object field(Object o, String n) throws Exception {
        for (Class<?> c = o.getClass(); c != null; c = c.getSuperclass())
            try {
                Field f = c.getDeclaredField(n);
                f.setAccessible(true);
                return f.get(o);
            } catch (NoSuchFieldException ignored) {
            }
        throw new NoSuchFieldException(n);
    }

    public static void set(Object o, String n, Object v) throws Exception {
        for (Class<?> c = o.getClass(); c != null; c = c.getSuperclass())
            try {
                Field f = c.getDeclaredField(n);
                f.setAccessible(true);
                f.set(o, v);
                return;
            } catch (NoSuchFieldException ignored) {
            }
        throw new NoSuchFieldException(n);
    }

    public static Object invoke(Object o, String name, Object... args) throws Exception {
        Class<?> cls = o instanceof Class ? (Class<?>) o : o.getClass();
        for (Class<?> c = cls; c != null; c = c.getSuperclass())
            for (Method m : c.getDeclaredMethods()) {
                if (!m.getName().equals(name) || m.getParameterTypes().length != args.length)
                    continue;
                Class<?>[] types = m.getParameterTypes();
                boolean compatible = true;
                for (int i = 0; i < types.length; i++) {
                    Class<?> t = types[i];
                    if (t.isPrimitive())
                        t =
                                t == int.class
                                        ? Integer.class
                                        : t == long.class
                                                ? Long.class
                                                : t == boolean.class
                                                        ? Boolean.class
                                                        : t == float.class
                                                                ? Float.class
                                                                : Double.class;
                    if (args[i] != null && !t.isInstance(args[i])) compatible = false;
                }
                if (compatible) {
                    m.setAccessible(true);
                    return m.invoke(o instanceof Class ? null : o, args);
                }
            }
        throw new NoSuchMethodException(name);
    }

    public static void rememberManager(Object m) {
        manager = new WeakReference<>(m);
        try {
            context = ((Context) field(m, "W25MCjjv17pEZfZmd2om7Cw0o5")).getApplicationContext();
        } catch (Exception ignored) {
        }
    }

    public static boolean handles(Object coroutine) {
        try {
            return ((Integer) field(coroutine, "aF9kXAxTizk9j")) == 13;
        } catch (Exception e) {
            return false;
        }
    }

    public static Object fetch(Object coroutine) {
        try {
            Object m = field(coroutine, "fZSnYsn7yeHN0ufn7zjP2WfakeUJj");
            manager = new WeakReference<>(m);
            Context c = (Context) field(m, "W25MCjjv17pEZfZmd2om7Cw0o5");
            context = c.getApplicationContext();
            Object loc = field(coroutine, "jxBDvowjIhv6OeFMIFeBEx4BvC");
            double lat = Math.rint(((Number) field(loc, "aJjcCDwdQ7n")).doubleValue() * 100) / 100,
                    lon = Math.rint(((Number) field(loc, "cileMK8iL9T")).doubleValue() * 100) / 100;
            if (!Double.isFinite(lat)
                    || !Double.isFinite(lon)
                    || Math.abs(lat) > 90
                    || Math.abs(lon) > 180)
                throw new IllegalArgumentException("Invalid coordinates");
            long generation = WeatherSources.GENERATION.get();
            WeatherData data = WeatherEngine.load(c, lat, lon);
            String json =
                    data.nativeJson(
                                    lat,
                                    lon,
                                    System.currentTimeMillis() / 1000,
                                    ZoneId.systemDefault())
                            .toString();
            if (generation != WeatherSources.GENERATION.get())
                throw new java.util.concurrent.CancellationException();
            Object result = invoke(m, "tGxuW2FhK5LXFnPrr4plnTpS", json, System.currentTimeMillis());
            invoke(m, "UztznoJ3Uzs44xWBGv2j6WRw8Rs", json);
            Log.i(
                    "UrroWeather",
                    "v2 native model ready; hourly="
                            + data.hourly.size()
                            + " daily="
                            + data.daily.size());
            return result;
        } catch (Throwable e) {
            Throwable cause =
                    e instanceof InvocationTargetException
                            ? ((InvocationTargetException) e).getTargetException()
                            : e;
            if (cause instanceof java.util.concurrent.CancellationException) return sneaky(cause);
            try {
                Throwable failure =
                        (Throwable)
                                Class.forName("bitpit.launcher.weather.NoWeatherDataException")
                                        .getConstructor(int.class, Exception.class, String.class)
                                        .newInstance(
                                                2, null, "No usable weather from selected sources");
                return sneaky(failure);
            } catch (ReflectiveOperationException reflection) {
                return sneaky(new IllegalStateException("Weather adapter unavailable"));
            }
        }
    }

    @SuppressWarnings("unchecked")
    static <E extends Throwable> Object sneaky(Throwable e) throws E {
        throw (E) e;
    }

    public static void invalidate() {
        new Handler(Looper.getMainLooper())
                .post(
                        () -> {
                            Object m = manager.get();
                            if (m != null)
                                try {
                                    invoke(m, "cileMK8iL9T");
                                    if (context != null && WeatherSources.shown(context))
                                        invoke(
                                                m,
                                                "QZzYk7GYe8gePBkQzv",
                                                true,
                                                System.currentTimeMillis());
                                } catch (Exception e) {
                                    Log.w("UrroWeather", "Refresh scheduling unavailable");
                                }
                        });
    }

    public static Object agenda(Object producer) {
        try {
            Object m = field(producer, "senYdThi7jj9YKBgj");
            if (m == null) return null;
            invoke(m, "QZzYk7GYe8gePBkQzv", true, System.currentTimeMillis());
            Object state = field(m, "L1o4oKiDkLN5m9JIUe");
            if (!state.getClass().getName().equals("b.Dt7n0J2eYdXs5A6cxW")) return state;
            Object forecast = field(state, "aJjcCDwdQ7n");
            long now = System.currentTimeMillis();
            ZoneId zone = ZoneId.systemDefault();
            long end =
                    Instant.ofEpochMilli(now)
                            .atZone(zone)
                            .toLocalDate()
                            .plusDays(7)
                            .atStartOfDay(zone)
                            .toInstant()
                            .toEpochMilli();
            ArrayList<Object> hours = new ArrayList<>();
            for (Object h : (List<?>) field(forecast, "rUdvo0IC9dOZIZ1ZO")) {
                long t = ((Number) field(h, "tGxuW2FhK5LXFnPrr4plnTpS")).longValue();
                if (t > now && t < end) hours.add(h);
            }
            List<Object> days = new ArrayList<>();
            long start =
                    Instant.ofEpochMilli(now)
                            .atZone(zone)
                            .toLocalDate()
                            .atStartOfDay(zone)
                            .toInstant()
                            .toEpochMilli();
            for (Object d : (List<?>) field(forecast, "BU3xaJxCSBOq")) {
                long t = ((Number) field(d, "EdXckqe0ZBqEnrIhrGab")).longValue();
                if (t >= start && t < end) days.add(d);
            }
            return Class.forName("b.zkGgdqJ3OA8d0e81crUtTF")
                    .getConstructor(long.class, long.class, List.class, ArrayList.class, List.class)
                    .newInstance(now, end, Collections.emptyList(), hours, days);
        } catch (Exception e) {
            Log.w("UrroWeather", "Agenda adapter unavailable");
            return null;
        }
    }
}
