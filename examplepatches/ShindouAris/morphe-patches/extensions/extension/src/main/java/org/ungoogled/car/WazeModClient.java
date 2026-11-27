package org.ungoogled.car;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.ServiceConnection;
import android.os.Bundle;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.IBinder;
import android.os.RemoteException;
import android.util.Log;

import com.wazemod.api.IWazeModData;
import com.wazemod.api.IWazeModListener;

/**
 * Reads speed, speed limit and alerts from Waze Mod (V14+) on the same phone, through its Data API: a bound
 * service (action com.wazemod.api.action.BIND) the user lets an app use once, on Waze Mod's own screen
 * (com.wazemod.api.action.REQUEST_ACCESS).
 */
final class WazeModClient implements ServiceConnection {
    private static final String TAG = "UA-WAZE";
    static final String ACTION_BIND = "com.wazemod.api.action.BIND";
    static final String ACTION_REQUEST_ACCESS = "com.wazemod.api.action.REQUEST_ACCESS";
    static final String[] HOSTS = {"com.waze", "com.chisadin.wazemod"};

    interface Listener {
        /** New data, or null when there is none (no Waze Mod, or it went away). Called on a worker thread. */
        void onData(WazeData data);

        /** Waze Mod has not let Maps read its data yet: [request] opens its permission screen. */
        void onAccessNeeded(Intent request);
    }

    private final Context app;
    private final Listener listener;
    private final HandlerThread thread = new HandlerThread("UA-waze");
    private final Handler worker;

    private String host;
    private boolean bound;
    private volatile IWazeModData service;

    private final IWazeModListener.Stub updates = new IWazeModListener.Stub() {
        @Override
        public void onUpdate(Bundle snapshot) {
            if (snapshot != null) publish(snapshot);
        }

        @Override
        public void onRevoked() {
            Log.i(TAG, "Waze Mod revoked the access");
            worker.post(() -> {
                release();
                needAccess();
            });
        }
    };

    WazeModClient(Context context, Listener listener) {
        this.app = context.getApplicationContext();
        this.listener = listener;
        thread.start();
        worker = new Handler(thread.getLooper());
    }

    /** The first Waze Mod installed that offers the Data API. */
    private String findHost() {
        for (String pkg : HOSTS) {
            try {
                if (!app.getPackageManager().queryIntentServices(new Intent(ACTION_BIND).setPackage(pkg), 0).isEmpty()) {
                    return pkg;
                }
            } catch (RuntimeException ignored) {
            }
        }
        return null;
    }

    void connect() {
        worker.post(() -> {
            if (bound) return;
            host = findHost();
            if (host == null) {
                Log.i(TAG, "no Waze Mod with the Data API");
                return;
            }
            try {
                bound = app.bindService(new Intent(ACTION_BIND).setPackage(host), this, Context.BIND_AUTO_CREATE);
            } catch (SecurityException e) {
                needAccess();
                return;
            }
            Log.i(TAG, "binding " + host + ": " + bound);
        });
    }

    void disconnect() {
        worker.post(() -> {
            IWazeModData current = service;
            if (current != null) {
                try {
                    current.unregisterListener(updates);
                } catch (RemoteException | RuntimeException ignored) {
                }
            }
            release();
            listener.onData(null);
        });
    }

    void close() {
        disconnect();
        thread.quitSafely();
    }

    @Override
    public void onServiceConnected(ComponentName name, IBinder binder) {
        worker.post(() -> {
            IWazeModData api = IWazeModData.Stub.asInterface(binder);
            try {
                if (api.getApiVersion() < 1) {
                    Log.w(TAG, "unsupported Data API version");
                    release();
                    return;
                }
                service = api;
                api.registerListener(updates);
                Bundle snapshot = api.getSnapshot();
                if (snapshot != null) publish(snapshot);
                Log.i(TAG, "connected to " + host);
            } catch (SecurityException e) {
                release();
                needAccess();
            } catch (RemoteException | RuntimeException e) {
                Log.w(TAG, "connecting to Waze Mod", e);
                release();
            }
        });
    }

    @Override
    public void onServiceDisconnected(ComponentName name) {
        // Waze Mod stopped; the binding stays, and connects again when it is back.
        service = null;
        listener.onData(null);
    }

    @Override
    public void onBindingDied(ComponentName name) {
        worker.post(() -> {
            release();
            listener.onData(null);
            connect();
        });
    }

    @Override
    public void onNullBinding(ComponentName name) {
        worker.post(this::release);
    }

    private void publish(Bundle snapshot) {
        try {
            listener.onData(WazeData.from(snapshot));
        } catch (RuntimeException e) {
            Log.w(TAG, "reading a Waze Mod snapshot", e);
        }
    }

    private void needAccess() {
        if (host != null) listener.onAccessNeeded(new Intent(ACTION_REQUEST_ACCESS).setPackage(host));
    }

    private void release() {
        service = null;
        if (bound) {
            bound = false;
            try {
                app.unbindService(this);
            } catch (RuntimeException ignored) {
            }
        }
    }
}
