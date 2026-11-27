package org.ungoogled.car;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.ServiceConnection;
import android.content.pm.PackageManager;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.IBinder;
import android.os.RemoteException;
import android.util.Log;

import com.kaibatech.drivedeck.xadas.link.IXadasLink;
import com.kaibatech.drivedeck.xadas.link.IXadasLinkListener;
import com.kaibatech.drivedeck.xadas.link.LeadAlert;
import com.kaibatech.drivedeck.xadas.link.LeadState;

/**
 * Reads the distance to the vehicle ahead from xADAS (Pro) on the same phone, through its data link
 * (https://github.com/drivedeck/link, Apache-2.0): a bound service the user lets an app use once, from the
 * notification xADAS shows. Only an xADAS signed by its publisher is trusted.
 */
final class XadasClient {
    private static final String TAG = "UA-XADAS";
    static final String PACKAGE = "com.kaibatech.drivedeck.xadas";
    /** SHA-256 of xADAS' signing certificate, as its integration guide publishes it. */
    private static final String CERT_SHA256 = "67D74D015348E4E54C52445A7D8DE7EDB36734263DFA36D4F9FF289005E18302";
    private static final int MAX_RETRIES = 6;

    interface Listener {
        /** The lead vehicle's distance in metres, or -1 when there is none to show. Called on a worker thread. */
        void onDistance(int meters, int verdict);

        /** What xADAS says of this app's access (IXadasLink.ACCESS_*), when it registers and when it changes. */
        default void onAccess(int access) {
        }
    }

    private final Context app;
    private final Listener listener;
    private final HandlerThread thread = new HandlerThread("UA-xadas");
    private final Handler worker;

    private boolean started, bound;
    private int retries;
    private volatile IXadasLink link;
    private final Runnable retry = this::bind;

    private final IXadasLinkListener.Stub updates = new IXadasLinkListener.Stub() {
        @Override
        public void onState(LeadState state) {
            if (state != null) publish(state);
        }

        @Override
        public void onAlert(LeadAlert alert) {
        }

        @Override
        public void onAccessChanged(int access) {
            worker.post(() -> {
                Log.i(TAG, "xADAS access changed: " + access);
                listener.onAccess(access);
                if (access == IXadasLink.ACCESS_GRANTED) readNow();
                else listener.onDistance(-1, 0);
            });
        }
    };

    private final ServiceConnection connection = new ServiceConnection() {
        @Override
        public void onServiceConnected(ComponentName name, IBinder binder) {
            worker.post(() -> {
                IXadasLink api = IXadasLink.Stub.asInterface(binder);
                try {
                    if (api.getApiVersion() < 1) {
                        unbind();
                        return;
                    }
                    link = api;
                    retries = 0;
                    int access = api.register(updates);
                    Log.i(TAG, "xADAS api " + api.getApiVersion() + ", access " + access
                            + " (1 granted, 2 asking the user, 3 denied, 4 sharing off or no Pro)");
                    listener.onAccess(access);
                    if (access == IXadasLink.ACCESS_GRANTED) readNow();
                } catch (RemoteException | RuntimeException e) {
                    Log.w(TAG, "xADAS call failed", e);
                    lost();
                }
            });
        }

        @Override
        public void onServiceDisconnected(ComponentName name) {
            worker.post(XadasClient.this::lost);
        }

        @Override
        public void onBindingDied(ComponentName name) {
            worker.post(XadasClient.this::lost);
        }

        @Override
        public void onNullBinding(ComponentName name) {
            worker.post(XadasClient.this::unbind);
        }
    };

    XadasClient(Context context, Listener listener) {
        this.app = context.getApplicationContext();
        this.listener = listener;
        thread.start();
        worker = new Handler(thread.getLooper());
    }

    void start() {
        worker.post(() -> {
            if (started) return;
            started = true;
            retries = 0;
            bind();
        });
    }

    void stop() {
        worker.post(() -> {
            started = false;
            worker.removeCallbacks(retry);
            unbind();
            listener.onDistance(-1, 0);
        });
    }

    void close() {
        stop();
        thread.quitSafely();
    }

    /** Whether the xADAS installed is the publisher's (not a look-alike package). */
    private boolean trusted() {
        return trusted(app);
    }

    static boolean trusted(Context app) {
        try {
            byte[] digest = new byte[32];
            for (int i = 0; i < 32; i++) digest[i] = (byte) Integer.parseInt(CERT_SHA256.substring(i * 2, i * 2 + 2), 16);
            return app.getPackageManager().hasSigningCertificate(PACKAGE, digest, PackageManager.CERT_INPUT_SHA256);
        } catch (RuntimeException e) {
            return false;
        }
    }

    private void bind() {
        if (!started || bound) return;
        if (!trusted()) {
            Log.i(TAG, "no trusted xADAS installed");
            return;
        }
        try {
            bound = app.bindService(new Intent(IXadasLink.ACTION_BIND_LINK).setPackage(PACKAGE), connection,
                    Context.BIND_AUTO_CREATE);
        } catch (SecurityException e) {
            bound = false;
        }
        Log.i(TAG, "binding xADAS: " + bound);
        if (!bound) unbind();   // a connection that did not bind is still to be released
    }

    private void unbind() {
        IXadasLink current = link;
        link = null;
        if (current != null) {
            try {
                current.unregister(updates);
            } catch (RemoteException | RuntimeException ignored) {
            }
        }
        bound = false;
        try {
            app.unbindService(connection);
        } catch (RuntimeException ignored) {
        }
    }

    /** The connection dropped: nothing to show, and try again after a longer wait each time. */
    private void lost() {
        unbind();
        listener.onDistance(-1, 0);
        if (!started || retries >= MAX_RETRIES) return;
        worker.postDelayed(retry, Math.min(1_000L << Math.min(retries++, 5), 30_000L));
    }

    private void readNow() {
        try {
            IXadasLink current = link;
            LeadState state = current == null ? null : current.getState();
            if (state != null) publish(state);
        } catch (RemoteException | RuntimeException e) {
            lost();
        }
    }

    private void publish(LeadState state) {
        // Distance and verdict are live only while it measures.
        boolean live = state.status == IXadasLink.STATUS_MEASURING && state.distanceM >= 0
                && state.verdict != IXadasLink.VERDICT_NO_LEAD;
        listener.onDistance(live ? state.distanceM : -1, live ? state.verdict : 0);
    }
}
