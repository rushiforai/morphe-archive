package org.ungoogled.car;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.ServiceConnection;
import android.os.Bundle;
import android.os.Handler;
import android.os.IBinder;
import android.os.Looper;
import android.util.Log;

import com.kaibatech.drivedeck.xadas.link.IXadasLink;
import com.kaibatech.drivedeck.xadas.link.LeadState;
import com.wazemod.api.IWazeModData;

/**
 * Whether Maps is allowed to read the data of Waze Mod and of xADAS: asks each service once (a short bind) and says
 * what it answered. Nothing is registered, so it never makes either app ask the user anything.
 */
public final class AccessCheck {
    private AccessCheck() {
    }

    public static final int NOT_INSTALLED = 0, NOT_ALLOWED = 1, ALLOWED = 2, UNREACHABLE = 3;

    /** What xADAS answers to a request: it is asking the user, or sharing is off in xADAS Pro. */
    public static final int PENDING = 4, SHARING_OFF = 5;
    /** Waze Mod is installed, but this version has no Data API (it came with V14). */
    public static final int NO_DATA_API = 6;

    /** "package version" of the first Waze Mod installed that Maps can see, or null. */
    public static String wazeInstalled(Context context) {
        for (String pkg : WazeModClient.HOSTS) {
            String found = installed(context, pkg);
            if (found != null) return found;
        }
        return null;
    }

    /** "package version" of xADAS, or null when Maps cannot see it. */
    public static String xadasInstalled(Context context) {
        return installed(context, XadasClient.PACKAGE);
    }

    private static String installed(Context context, String pkg) {
        try {
            return pkg + " " + context.getPackageManager().getPackageInfo(pkg, 0).versionName;
        } catch (android.content.pm.PackageManager.NameNotFoundException | RuntimeException e) {
            return null;
        }
    }

    /**
     * Asks xADAS for access for Maps (it registers, and xADAS lists Maps in its Settings and asks the user in a
     * notification), and reports what it answers, now and when it changes. Keeps the connection until the returned
     * Runnable is run. Results come on the main thread.
     */
    public static Runnable requestXadas(Context context, Result result) {
        Handler main = new Handler(Looper.getMainLooper());
        Context app = context.getApplicationContext();
        if (!XadasClient.trusted(app)) {
            main.post(() -> result.onResult(NOT_INSTALLED));
            return () -> { };
        }
        XadasClient client = new XadasClient(app, new XadasClient.Listener() {
            @Override
            public void onDistance(int meters, int verdict) {
            }

            @Override
            public void onAccess(int access) {
                int mapped = access == IXadasLink.ACCESS_GRANTED ? ALLOWED
                        : access == IXadasLink.ACCESS_PENDING ? PENDING
                        : access == IXadasLink.ACCESS_DISABLED ? SHARING_OFF : NOT_ALLOWED;
                main.post(() -> result.onResult(mapped));
            }
        });
        client.start();
        return client::close;
    }

    public interface Result {
        /** One of the constants above. Called on the main thread. */
        void onResult(int access);
    }

    private static final long TIMEOUT_MS = 3000;

    /** Waze Mod's Data API refuses a snapshot to an app the user has not allowed (a SecurityException). */
    public static void waze(Context context, Result result) {
        Context app = context.getApplicationContext();
        String host = null;
        for (String pkg : WazeModClient.HOSTS) {
            try {
                if (!app.getPackageManager().queryIntentServices(
                        new Intent(WazeModClient.ACTION_BIND).setPackage(pkg), 0).isEmpty()) {
                    host = pkg;
                    break;
                }
            } catch (RuntimeException ignored) {
            }
        }
        if (host == null) {
            result.onResult(wazeInstalled(app) != null ? NO_DATA_API : NOT_INSTALLED);
            return;
        }
        ask(app, new Intent(WazeModClient.ACTION_BIND).setPackage(host), binder -> {
            IWazeModData api = IWazeModData.Stub.asInterface(binder);
            try {
                if (api.getApiVersion() < 1) return UNREACHABLE;
                Bundle snapshot = api.getSnapshot();
                return ALLOWED;
            } catch (SecurityException e) {
                return NOT_ALLOWED;
            } catch (android.os.RemoteException | RuntimeException e) {
                return UNREACHABLE;
            }
        }, result);
    }

    /** xADAS says its state has no access when the app is not allowed, or sharing is off, or there is no Pro. */
    public static void xadas(Context context, Result result) {
        Context app = context.getApplicationContext();
        try {
            app.getPackageManager().getPackageInfo(XadasClient.PACKAGE, 0);
        } catch (android.content.pm.PackageManager.NameNotFoundException e) {
            result.onResult(NOT_INSTALLED);
            return;
        }
        if (!XadasClient.trusted(app)) {
            result.onResult(UNREACHABLE);
            return;
        }
        ask(app, new Intent(IXadasLink.ACTION_BIND_LINK).setPackage(XadasClient.PACKAGE), binder -> {
            IXadasLink api = IXadasLink.Stub.asInterface(binder);
            try {
                if (api.getApiVersion() < 1) return UNREACHABLE;
                LeadState state = api.getState();
                return state != null && state.status != IXadasLink.STATUS_NO_ACCESS ? ALLOWED : NOT_ALLOWED;
            } catch (android.os.RemoteException | RuntimeException e) {
                return UNREACHABLE;
            }
        }, result);
    }

    private interface Query {
        int run(IBinder binder);
    }

    /** Binds [intent], runs [query] on the service's binder off the main thread, and reports to [result]. */
    private static void ask(Context app, Intent intent, Query query, Result result) {
        Handler main = new Handler(Looper.getMainLooper());
        boolean[] done = {false};
        ServiceConnection[] connection = new ServiceConnection[1];
        Result once = access -> main.post(() -> {
            if (done[0]) return;
            done[0] = true;
            try {
                app.unbindService(connection[0]);
            } catch (RuntimeException ignored) {
            }
            result.onResult(access);
        });
        connection[0] = new ServiceConnection() {
            @Override
            public void onServiceConnected(ComponentName name, IBinder binder) {
                new Thread(() -> once.onResult(query.run(binder)), "UA-access").start();
            }

            @Override
            public void onServiceDisconnected(ComponentName name) {
            }

            @Override
            public void onNullBinding(ComponentName name) {
                once.onResult(UNREACHABLE);
            }

            @Override
            public void onBindingDied(ComponentName name) {
                once.onResult(UNREACHABLE);
            }
        };
        boolean bound;
        try {
            bound = app.bindService(intent, connection[0], Context.BIND_AUTO_CREATE);
        } catch (SecurityException e) {
            bound = false;
        }
        if (!bound) {
            Log.i("UA-ACCESS", "cannot bind " + intent.getAction());
            done[0] = true;
            try {
                app.unbindService(connection[0]);
            } catch (RuntimeException ignored) {
            }
            result.onResult(UNREACHABLE);
            return;
        }
        main.postDelayed(() -> once.onResult(UNREACHABLE), TIMEOUT_MS);
    }
}
