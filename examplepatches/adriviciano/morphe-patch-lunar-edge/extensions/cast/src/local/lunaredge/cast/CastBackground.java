package local.lunaredge.cast;

import android.Manifest;
import android.app.Activity;
import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.os.Build;
import android.os.Handler;
import android.os.Looper;
import android.widget.Toast;
import java.lang.ref.WeakReference;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;

/** Enlaza las sesiones Cast/DLNA con el servicio; no conserva una Activity como dueño fuerte. */
public final class CastBackground {
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final SessionLease.Registry REGISTRY = new SessionLease.Registry();
    private static volatile Binding active;
    private CastBackground() { }

    static final class Binding {
        final Context context;
        final WeakReference<Activity> owner;
        final Object control;
        final String protocol;
        final PendingIntent open;
        SessionLease lease;
        volatile boolean ready;
        volatile String dlnaState = "sin estado";
        Binding(Activity activity, Object control, String protocol) {
            context = activity.getApplicationContext(); owner = new WeakReference<>(activity);
            this.control = control; this.protocol = protocol;
            Intent intent = new Intent(activity.getIntent()).setClass(context, activity.getClass())
                    .setFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_REORDER_TO_FRONT | Intent.FLAG_ACTIVITY_SINGLE_TOP);
            open = PendingIntent.getActivity(context, 721, intent, PendingIntent.FLAG_UPDATE_CURRENT | PendingIntent.FLAG_IMMUTABLE);
        }
        boolean current() { return lease != null && lease.isCurrent(); }
    }

    public static SessionLease beginCast(Activity activity, CastSession session) {
        return begin(activity, session, "Google Cast", session::stop).lease;
    }

    private static Binding begin(Activity activity, Object control, String protocol, Runnable stopRemote) {
        Binding binding = new Binding(activity, control, protocol);
        binding.lease = REGISTRY.open(stopRemote, () -> MAIN.post(() -> {
            if (active != binding) return;
            active = null;
            binding.context.stopService(new Intent(binding.context, CastKeepAliveService.class));
        }));
        active = binding;
        try {
            Intent intent = new Intent(binding.context, CastKeepAliveService.class);
            if (Build.VERSION.SDK_INT >= 26) binding.context.startForegroundService(intent);
            else binding.context.startService(intent);
        } catch (RuntimeException error) {
            binding.lease.close();
            throw error;
        }
        try {
            if (Build.VERSION.SDK_INT >= 33 && !activity.isFinishing() && activity.checkSelfPermission(Manifest.permission.POST_NOTIFICATIONS) != PackageManager.PERMISSION_GRANTED) {
                activity.requestPermissions(new String[]{Manifest.permission.POST_NOTIFICATIONS}, 26381);
            }
        } catch (RuntimeException ignored) { /* El permiso de notificaciones no es requisito para iniciar el servicio. */ }
        MAIN.postDelayed(() -> {
            if (binding.current() && !binding.ready) {
                binding.lease.stop();
                Toast.makeText(binding.context, "La TV no ha confirmado la emisión", Toast.LENGTH_LONG).show();
            }
        }, 60000);
        return binding;
    }

    public static boolean keepAlive(Activity activity) {
        Binding binding = active;
        return binding != null && binding.current() && binding.owner.get() == activity;
    }

    static Binding binding() { Binding binding = active; return binding != null && binding.current() ? binding : null; }
    public static void stopAll() { REGISTRY.stop(); }
    public static void castReady(CastSession session) {
        Binding binding = active;
        if (binding != null && binding.control == session) binding.ready = true;
    }
    public static String report() {
        Binding binding = binding();
        return "Segundo plano: " + (binding == null ? "sin sesión" : binding.protocol + "; servicio " + CastKeepAliveService.running());
    }

    // Los campos y métodos de los callbacks originales se validan al construir el parche.
    public static void beginDlna(Object callback, Object control) {
        if (control == null) return;
        Runnable start = () -> {
            try {
                Activity activity = outer(callback, Activity.class);
                begin(activity, control, "DLNA", () -> stopDlna(control));
            } catch (Exception error) {
                Activity activity;
                try { activity = outer(callback, Activity.class); }
                catch (Exception ignored) { return; }
                Toast.makeText(activity, "No se pudo mantener la emisión en segundo plano", Toast.LENGTH_LONG).show();
            }
        };
        if (Looper.myLooper() == Looper.getMainLooper()) start.run(); else MAIN.post(start);
    }

    private static void stopDlna(Object control) {
        try {
            for (Method method : control.getClass().getMethods()) {
                if (method.getName().equals("a") && method.getParameterTypes().length == 1 &&
                        method.getParameterTypes()[0].getName().equals("com.android.cast.dlna.dmc.control.ServiceActionCallback")) {
                    method.invoke(control, new Object[]{null});
                    return;
                }
            }
        } catch (Exception ignored) { }
    }
    public static void dlnaStopped(Object control) {
        Binding binding = active;
        if (binding != null && binding.control == control) binding.lease.close();
    }
    public static void dlnaDisposed(Object control, boolean disposed) { if (disposed) dlnaStopped(control); }
    public static Object dlnaPlayCallback(Object control, Object unused, Object original) {
        Binding binding = active;
        if (binding == null || binding.control != control || !binding.current()) return original;
        try {
            Class<?> callback = Class.forName("com.android.cast.dlna.dmc.control.ServiceActionCallback", false, control.getClass().getClassLoader());
            return Proxy.newProxyInstance(callback.getClassLoader(), new Class<?>[]{callback}, (proxy, method, args) -> {
                if (method.getDeclaringClass() == Object.class) {
                    if (method.getName().equals("toString")) return "LunarCastCallback";
                    if (method.getName().equals("hashCode")) return System.identityHashCode(proxy);
                    if (method.getName().equals("equals")) return args != null && args.length == 1 && proxy == args[0];
                }
                if (binding.current()) {
                    if (method.getName().equals("onSuccess")) binding.ready = true;
                    else if (method.getName().equals("onFailure")) binding.lease.close();
                }
                return original == null ? null : method.invoke(original, args);
            });
        } catch (ClassNotFoundException error) { return original; }
    }
    public static void dlnaEvent(Object callback, Object unused, Object event) {
        if (event == null || !"TransportState".equals(event.getClass().getSimpleName())) return;
        try {
            Object control = outerControl(callback);
            Binding binding = active;
            if (binding == null || binding.control != control) return;
            String state = String.valueOf(event.getClass().getMethod("d").invoke(event));
            binding.dlnaState = state;
            if ("PLAYING".equals(state) || "PAUSED_PLAYBACK".equals(state)) binding.ready = true;
            else if (binding.ready && ("STOPPED".equals(state) || "NO_MEDIA_PRESENT".equals(state))) {
                // SetAVTransportURI puede emitir STOPPED antes de la siguiente reproducción.
                MAIN.postDelayed(() -> {
                    if (binding.current() && state.equals(binding.dlnaState)) binding.lease.close();
                }, 1500);
            }
        } catch (Exception ignored) { }
    }
    public static void dlnaDisconnected(Object callback) {
        try { dlnaStopped(outerControl(callback)); } catch (Exception ignored) { }
    }
    private static Object outerControl(Object callback) throws ReflectiveOperationException {
        for (Field field : callback.getClass().getDeclaredFields()) {
            if (field.getType().getName().equals("com.android.cast.dlna.dmc.control.CastControlImpl")) {
                field.setAccessible(true); return field.get(callback);
            }
        }
        throw new NoSuchFieldException();
    }
    private static <T> T outer(Object callback, Class<T> type) throws ReflectiveOperationException {
        for (Field field : callback.getClass().getDeclaredFields()) {
            if (type.isAssignableFrom(field.getType())) { field.setAccessible(true); return type.cast(field.get(callback)); }
        }
        throw new NoSuchFieldException();
    }
}
