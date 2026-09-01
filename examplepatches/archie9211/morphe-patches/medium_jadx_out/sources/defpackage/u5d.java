package defpackage;

import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.os.PowerManager;
import android.util.Log;
import com.google.firebase.messaging.FirebaseMessaging;
import java.io.IOException;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class u5d implements Runnable {
    public final long a;
    public final PowerManager.WakeLock b;
    public final FirebaseMessaging c;
    public final ThreadPoolExecutor d = new ThreadPoolExecutor(0, 1, 30, TimeUnit.SECONDS, new LinkedBlockingQueue(), new lv2("firebase-iid-executor", 1));

    public u5d(FirebaseMessaging firebaseMessaging, long j) {
        this.c = firebaseMessaging;
        this.a = j;
        PowerManager.WakeLock wakeLockNewWakeLock = ((PowerManager) firebaseMessaging.b.getSystemService("power")).newWakeLock(1, "fiid-sync");
        this.b = wakeLockNewWakeLock;
        wakeLockNewWakeLock.setReferenceCounted(false);
    }

    public final boolean a() {
        ConnectivityManager connectivityManager = (ConnectivityManager) this.c.b.getSystemService("connectivity");
        NetworkInfo activeNetworkInfo = connectivityManager != null ? connectivityManager.getActiveNetworkInfo() : null;
        return activeNetworkInfo != null && activeNetworkInfo.isConnected();
    }

    public final boolean b() throws IOException {
        try {
            if (this.c.a() == null) {
                Log.e("FirebaseMessaging", "Token retrieval failed: null");
                return false;
            }
            if (!Log.isLoggable("FirebaseMessaging", 3)) {
                return true;
            }
            Log.d("FirebaseMessaging", "Token successfully retrieved");
            return true;
        } catch (IOException e) {
            String message = e.getMessage();
            if (!"SERVICE_NOT_AVAILABLE".equals(message) && !"INTERNAL_SERVER_ERROR".equals(message) && !"InternalServerError".equals(message)) {
                if (e.getMessage() != null) {
                    throw e;
                }
                Log.w("FirebaseMessaging", "Token retrieval failed without exception message. Will retry token retrieval");
                return false;
            }
            Log.w("FirebaseMessaging", "Token retrieval failed: " + e.getMessage() + ". Will retry token retrieval");
            return false;
        } catch (SecurityException unused) {
            Log.w("FirebaseMessaging", "Token retrieval failed with SecurityException. Will retry token retrieval");
            return false;
        }
    }

    @Override // java.lang.Runnable
    public final void run() {
        PowerManager.WakeLock wakeLock = this.b;
        n0c n0cVarN = n0c.N();
        FirebaseMessaging firebaseMessaging = this.c;
        if (n0cVarN.P(firebaseMessaging.b)) {
            wakeLock.acquire();
        }
        try {
            try {
                synchronized (firebaseMessaging) {
                    firebaseMessaging.i = true;
                }
                if (!firebaseMessaging.h.f()) {
                    firebaseMessaging.g(false);
                    if (n0c.N().P(firebaseMessaging.b)) {
                        wakeLock.release();
                        return;
                    }
                    return;
                }
                if (!n0c.N().O(firebaseMessaging.b) || a()) {
                    if (b()) {
                        firebaseMessaging.g(false);
                    } else {
                        firebaseMessaging.i(this.a);
                    }
                    if (n0c.N().P(firebaseMessaging.b)) {
                        wakeLock.release();
                        return;
                    }
                    return;
                }
                t5d t5dVar = new t5d();
                t5dVar.c = this;
                t5dVar.a();
                if (n0c.N().P(firebaseMessaging.b)) {
                    wakeLock.release();
                }
            } catch (IOException e) {
                Log.e("FirebaseMessaging", "Topic sync or token retrieval failed on hard failure exceptions: " + e.getMessage() + ". Won't retry the operation.");
                firebaseMessaging.g(false);
                if (n0c.N().P(firebaseMessaging.b)) {
                    wakeLock.release();
                }
            }
        } catch (Throwable th) {
            if (n0c.N().P(firebaseMessaging.b)) {
                wakeLock.release();
            }
            throw th;
        }
    }
}
