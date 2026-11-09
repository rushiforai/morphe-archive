package patches.maps.gearslip;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.ServiceConnection;
import android.os.Binder;
import android.os.Bundle;
import android.os.Handler;
import android.os.IBinder;
import android.os.Parcel;
import android.util.Log;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.function.Consumer;

/** Forwards the authenticated public car session to Maps' own navigation lifecycle. */
public final class NativeCarNavigationSession implements AutoCloseable {
    static final String COMPONENT = "com.google.android.apps.gmm.car.projected.service.CarNavigationProviderService";
    private static volatile int publicHosts;
    private final Context context;
    private final Handler main;
    private final Runnable ready;
    private final Consumer<Throwable> failure;
    private boolean bound, closed, publicHostRegistered;
    private LocalProvider provider;
    private final Runnable timeout = () -> fail(new IllegalStateException("Maps' native navigation session did not connect"));
    private final ServiceConnection connection = new ServiceConnection() {
        @Override public void onServiceConnected(ComponentName name, IBinder binder) {
            if (closed) return;
            try {
                // This Binder is obtained only from the non-exported service in this APK.
                // Its external onTransact Google-host check remains entirely unchanged.
                // Maps 26.44 renamed 26.43's provider binder `lur` to `lvp`
                // (CarNavigationProviderService -> lvt.onBind returns lvt.b:Llvp;).
                Class<?> type = context.getClassLoader().loadClass("lvp");
                if (binder == null || binder.getClass() != type || !(binder instanceof Binder))
                    throw new SecurityException("Maps navigation provider is not local");
                provider = new LocalProvider(binder);
                publicHostRegistered = true;
                publicHosts++;
                provider.start();
                main.removeCallbacks(timeout);
                // Native start posts through its existing main-thread dispatcher. Queue
                // presentation creation afterward, rather than racing that lifecycle.
                main.post(() -> {
                    if (closed) return;
                    try { ready.run(); } catch (RuntimeException error) { fail(error); }
                });
            } catch (Exception error) { fail(error); }
        }
        @Override public void onServiceDisconnected(ComponentName name) { fail(new IllegalStateException("Maps navigation provider disconnected")); }
        @Override public void onBindingDied(ComponentName name) { fail(new IllegalStateException("Maps navigation provider binding died")); }
        @Override public void onNullBinding(ComponentName name) { fail(new IllegalStateException("Maps refused its navigation provider")); }
    };

    NativeCarNavigationSession(Context context, Handler main, Runnable ready, Consumer<Throwable> failure) {
        this.context = context; this.main = main; this.ready = ready; this.failure = failure;
    }

    /** Native private-focus registration is optional while CAL owns navigation. */
    public static boolean usesPublicHost() { return publicHosts > 0; }

    void connect() throws Exception {
        if (closed || bound) throw new IllegalStateException("Maps navigation session already used");
        bound = context.bindService(new Intent(Intent.ACTION_MAIN).setClassName(context.getPackageName(), COMPONENT),
                connection, Context.BIND_AUTO_CREATE);
        if (!bound) throw new IllegalStateException("Cannot bind Maps' native navigation provider");
        main.postDelayed(timeout, 15000);
    }

    private void fail(Throwable error) {
        if (closed) return;
        close();
        failure.accept(error);
    }

    @Override public void close() {
        if (closed) return;
        closed = true;
        main.removeCallbacks(timeout);
        if (provider != null) {
            try { provider.close(); } catch (Exception error) { Log.w("MapsNativeCar", "Native car-session stop failed", error); }
            provider = null;
        }
        if (publicHostRegistered) { publicHostRegistered = false; publicHosts--; }
        if (bound) {
            try { context.unbindService(connection); } catch (IllegalArgumentException error) { Log.w("MapsNativeCar", "Native car-session unbind failed", error); }
            bound = false;
        }
    }

    /** Original version-1 dispatch, called locally after the adapter authenticates its host. */
    static final class LocalProvider implements AutoCloseable {
        private final IBinder binder;
        private final Method dispatch;
        private boolean started, closed;

        LocalProvider(IBinder binder) throws Exception {
            this.binder = binder;
            dispatch = binder.getClass().getDeclaredMethod("y", int.class, Parcel.class, Parcel.class);
            dispatch.setAccessible(true);
        }

        void start() throws Exception {
            if (closed || started) throw new IllegalStateException("Native car session already used");
            Bundle versions = call(1, null, true);
            if (versions == null || versions.getInt("MIN_VERSION", -1) > 1 || versions.getInt("MAX_VERSION", -1) < 1)
                throw new IllegalStateException("Maps navigation-provider protocol changed");
            Bundle configuration = new Bundle();
            configuration.putInt("version", 1);
            // No private host capabilities, experimental flags or vehicle grants claimed.
            configuration.putBundle("dynamic_configuration", new Bundle());
            call(2, configuration, false);
            Bundle state = new Bundle();
            state.putInt("mode", 1); // The real authenticated projected session is connected.
            started = true;
            call(3, state, false);
        }

        @Override public void close() throws Exception {
            if (closed) return;
            closed = true;
            if (started) { started = false; call(4, null, false); }
        }

        private Bundle call(int code, Bundle value, boolean result) throws Exception {
            Parcel data = Parcel.obtain(), reply = Parcel.obtain();
            try {
                if (value != null) { data.writeInt(1); data.writeBundle(value); }
                data.setDataPosition(0);
                try {
                    if (!Boolean.TRUE.equals(dispatch.invoke(binder, code, data, reply)))
                        throw new IllegalStateException("Maps navigation-provider dispatch rejected " + code);
                } catch (InvocationTargetException error) {
                    Throwable cause = error.getCause();
                    if (cause instanceof Exception) throw (Exception) cause;
                    if (cause instanceof Error) throw (Error) cause;
                    throw error;
                }
                if (code == 3) return null; // Native start is an existing queued callback.
                reply.setDataPosition(0);
                reply.readException();
                return result && reply.readInt() != 0 ? reply.readBundle(LocalProvider.class.getClassLoader()) : null;
            } finally { reply.recycle(); data.recycle(); }
        }
    }
}
