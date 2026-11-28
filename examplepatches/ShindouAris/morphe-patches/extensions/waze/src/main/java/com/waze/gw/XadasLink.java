package com.waze.gw;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.ServiceConnection;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.Signature;
import android.content.pm.SigningInfo;
import android.os.IBinder;
import android.os.SystemClock;
import android.util.Log;

import com.kaibatech.drivedeck.xadas.link.IXadasLink;
import com.kaibatech.drivedeck.xadas.link.IXadasLinkListener;
import com.kaibatech.drivedeck.xadas.link.LeadAlert;
import com.kaibatech.drivedeck.xadas.link.LeadState;

import java.security.MessageDigest;

/**
 * Optional client of the xADAS (DriveDeck Link) partner API. Data stays in memory only: it is
 * never persisted, logged or sent off the device. Driven from {@link #refresh}, which is cheap
 * enough for a hot path.
 */
final class XadasLink {
    private static final String TAG = "WazeModXadas";
    static final String PACKAGE = "com.kaibatech.drivedeck.xadas";
    private static final String CERT_SHA256 =
            "67D74D015348E4E54C52445A7D8DE7EDB36734263DFA36D4F9FF289005E18302";
    private static final long[] BACKOFF_MS = {1000L, 2000L, 4000L, 8000L, 16000L, 30000L};

    private static final Object LOCK = new Object();
    private static ServiceConnection connection;
    private static IXadasLink link;
    private static boolean bound;
    private static int failures;
    private static long nextAttemptAt;

    /** Why the link is not up; feeds the status card in Settings. Never persisted or sent anywhere. */
    private static volatile int failure = XadasLeadPolicy.FAIL_NONE;
    private static volatile int access;          // last IXadasLink.ACCESS_* seen, 0 = none yet
    private static volatile boolean enabledNow;
    private static volatile boolean connectedNow;

    private static volatile int status = -1;
    private static volatile int distanceM = -1;
    private static volatile int distanceAgeMs = -1;
    private static volatile int verdict;
    private static volatile long receivedAt;

    private static final IXadasLinkListener LISTENER = new IXadasLinkListener.Stub() {
        @Override public void onState(LeadState state) {
            if (state == null) return;
            distanceM = state.distanceM;
            distanceAgeMs = state.distanceAgeMs;
            verdict = state.verdict;
            status = state.status;
            receivedAt = SystemClock.elapsedRealtime();
        }

        @Override public void onAlert(LeadAlert alert) { }

        @Override public void onAccessChanged(int value) {
            access = value;
            Log.i(TAG, "access changed -> " + value);
            if (value != IXadasLink.ACCESS_GRANTED) clearState();
        }
    };

    private XadasLink() { }

    /** Measured gap in metres, or -1 when sharing is off, stale or not measuring. */
    static int metres() {
        return XadasLeadPolicy.metres(status, distanceM, distanceAgeMs, receivedAt,
                SystemClock.elapsedRealtime());
    }

    /** Verdict must hold 0.7 s to raise the alert and be gone 1.5 s to clear it. */
    private static final XadasDebounce TOO_CLOSE = new XadasDebounce(700L, 1500L);

    static boolean tooClose() {
        if (metres() < 0) {
            TOO_CLOSE.reset();
            return false;
        }
        return TOO_CLOSE.update(XadasLeadPolicy.tooClose(verdict), SystemClock.elapsedRealtime());
    }

    /** Status for the Settings card: one of XadasLeadPolicy.UI_*. Call refresh() first to keep it live. */
    static int uiState() {
        long received = receivedAt;
        long age = received <= 0L ? Long.MAX_VALUE : SystemClock.elapsedRealtime() - received;
        return XadasLeadPolicy.uiState(enabledNow, failure, connectedNow, access, status, metres(), age);
    }

    /** Distance for the Settings card, or -1. */
    static int uiMetres() { return metres(); }

    /** Opens the xADAS app, or returns false when it is not installed. */
    static boolean openApp(Context context) {
        try {
            Intent intent = context.getPackageManager().getLaunchIntentForPackage(PACKAGE);
            if (intent == null) return false;
            context.startActivity(intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));
            return true;
        } catch (Throwable error) {
            return false;
        }
    }

    /**
     * Binds while {@code enabled}, unbinds otherwise. Failed attempts back off from 1 s to 30 s and
     * keep going at that pace: xADAS may be installed, started or switched on after the toggle.
     */
    static void refresh(Context context, boolean enabled) {
        if (context == null) return;
        synchronized (LOCK) {
            enabledNow = enabled;
            if (!enabled) {
                disconnect(context);
                failures = 0;
                nextAttemptAt = 0L;
                failure = XadasLeadPolicy.FAIL_NONE;
                access = 0;
                return;
            }
            long now = SystemClock.elapsedRealtime();
            if (bound || now < nextAttemptAt) return;
            int problem = checkInstalled(context);
            if (problem != XadasLeadPolicy.FAIL_NONE) {
                setFailure(problem);
                nextAttemptAt = now + 5000L;
                return;
            }
            connect(context, now);
        }
    }

    private static void setFailure(int value) {
        if (failure != value) Log.i(TAG, "link problem -> " + value);
        failure = value;
    }

    private static void connect(final Context context, long now) {
        final Context app = context.getApplicationContext();
        connection = new ServiceConnection() {
            @Override public void onServiceConnected(ComponentName name, IBinder service) {
                try {
                    IXadasLink proxy = IXadasLink.Stub.asInterface(service);
                    if (proxy.getApiVersion() < IXadasLink.API_VERSION) {
                        setFailure(XadasLeadPolicy.FAIL_API);
                        throw new IllegalStateException("api");
                    }
                    int granted = proxy.register(LISTENER);
                    synchronized (LOCK) {
                        link = proxy;
                        failures = 0;
                        access = granted;
                        connectedNow = true;
                        failure = XadasLeadPolicy.FAIL_NONE;
                    }
                    Log.i(TAG, "registered, access=" + granted);
                    LeadState current = proxy.getState();
                    if (current != null) LISTENER.onState(current);
                } catch (Throwable error) {
                    Log.w(TAG, "register failed: " + error.getClass().getSimpleName());
                    synchronized (LOCK) { failed(app); }
                }
            }

            @Override public void onServiceDisconnected(ComponentName name) {
                synchronized (LOCK) { link = null; connectedNow = false; clearState(); }
            }

            @Override public void onNullBinding(ComponentName name) { synchronized (LOCK) { failed(app); } }

            @Override public void onBindingDied(ComponentName name) { synchronized (LOCK) { failed(app); } }
        };
        Intent intent = new Intent(IXadasLink.ACTION_BIND_LINK).setPackage(PACKAGE);
        try {
            bound = app.bindService(intent, connection, Context.BIND_AUTO_CREATE);
        } catch (Throwable error) {
            bound = false;
        }
        if (!bound) {
            connection = null;
            setFailure(XadasLeadPolicy.FAIL_BIND);
            scheduleRetry(now);
        } else {
            Log.i(TAG, "bind requested");
        }
    }

    private static void failed(Context app) {
        disconnect(app);
        scheduleRetry(SystemClock.elapsedRealtime());
    }

    private static void scheduleRetry(long now) {
        nextAttemptAt = now + BACKOFF_MS[Math.min(failures, BACKOFF_MS.length - 1)];
        failures++;
    }

    private static void disconnect(Context context) {
        IXadasLink proxy = link;
        link = null;
        if (proxy != null) {
            try { proxy.unregister(LISTENER); } catch (Throwable ignored) { }
        }
        if (connection != null) {
            try { context.getApplicationContext().unbindService(connection); } catch (Throwable ignored) { }
        }
        connection = null;
        bound = false;
        connectedNow = false;
        clearState();
    }

    private static void clearState() {
        status = -1;
        distanceM = -1;
        distanceAgeMs = -1;
        verdict = 0;
        receivedAt = 0L;
    }

    /**
     * Only the signing certificate pinned by xADAS may receive our bind.
     * Returns FAIL_NONE when it is installed and genuine, FAIL_NOT_INSTALLED or FAIL_UNTRUSTED otherwise.
     */
    private static int checkInstalled(Context context) {
        try {
            Signature[] signers = signersOf(context.getPackageManager());
            if (signers == null || signers.length == 0) {
                logUntrusted("no signing certificate returned by the system");
                return XadasLeadPolicy.FAIL_UNTRUSTED;
            }
            // Every signer must have signed the APK, so the pinned certificate being one of them is enough
            // (key rotation lists the old and the new certificate).
            StringBuilder seen = new StringBuilder();
            MessageDigest sha = MessageDigest.getInstance("SHA-256");
            for (Signature signer : signers) {
                StringBuilder hex = new StringBuilder();
                for (byte b : sha.digest(signer.toByteArray())) hex.append(String.format("%02X", b & 0xFF));
                if (CERT_SHA256.equalsIgnoreCase(hex.toString())) return XadasLeadPolicy.FAIL_NONE;
                seen.append(seen.length() == 0 ? "" : ",").append(hex);
            }
            logUntrusted("certificate " + seen + " is not the pinned one");
            return XadasLeadPolicy.FAIL_UNTRUSTED;
        } catch (PackageManager.NameNotFoundException notInstalled) {
            return XadasLeadPolicy.FAIL_NOT_INSTALLED;
        } catch (Throwable unreadable) {
            logUntrusted("cannot read the signature: " + unreadable);
            return XadasLeadPolicy.FAIL_UNTRUSTED;
        }
    }

    /** The certificates the installed xADAS is signed with; GET_SIGNATURES when a ROM returns no signingInfo. */
    @SuppressWarnings("deprecation")
    private static Signature[] signersOf(PackageManager pm) throws PackageManager.NameNotFoundException {
        SigningInfo signing = pm.getPackageInfo(PACKAGE, PackageManager.GET_SIGNING_CERTIFICATES).signingInfo;
        if (signing != null) {
            Signature[] found = signing.hasMultipleSigners()
                    ? signing.getApkContentsSigners() : signing.getSigningCertificateHistory();
            if (found != null && found.length > 0) return found;
        }
        return pm.getPackageInfo(PACKAGE, PackageManager.GET_SIGNATURES).signatures;
    }

    private static String lastUntrusted;

    private static void logUntrusted(String why) {
        if (!why.equals(lastUntrusted)) Log.w(TAG, "xADAS rejected: " + why);
        lastUntrusted = why;
    }
}
