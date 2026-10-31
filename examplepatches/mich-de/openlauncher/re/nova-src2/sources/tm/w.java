package tm;

import android.content.Context;
import android.content.IntentFilter;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.os.PowerManager;
import android.util.Log;
import java.io.IOException;

/* loaded from: classes3.dex */
public final class w implements Runnable {

    /* renamed from: f, reason: collision with root package name */
    public static final Object f89527f = new Object();

    /* renamed from: g, reason: collision with root package name */
    public static Boolean f89528g;

    /* renamed from: h, reason: collision with root package name */
    public static Boolean f89529h;

    /* renamed from: a, reason: collision with root package name */
    public final Context f89530a;

    /* renamed from: b, reason: collision with root package name */
    public final ja.d f89531b;

    /* renamed from: c, reason: collision with root package name */
    public final PowerManager.WakeLock f89532c;

    /* renamed from: d, reason: collision with root package name */
    public final u f89533d;

    /* renamed from: e, reason: collision with root package name */
    public final long f89534e;

    public w(u uVar, Context context, ja.d dVar, long j11) {
        this.f89533d = uVar;
        this.f89530a = context;
        this.f89534e = j11;
        this.f89531b = dVar;
        this.f89532c = ((PowerManager) context.getSystemService("power")).newWakeLock(1, "wake:com.google.firebase.messaging");
    }

    public static boolean a(Context context) {
        boolean zBooleanValue;
        synchronized (f89527f) {
            try {
                Boolean bool = f89529h;
                zBooleanValue = (bool == null && bool == null) ? context.checkCallingOrSelfPermission("android.permission.ACCESS_NETWORK_STATE") == 0 : bool.booleanValue();
                f89529h = Boolean.valueOf(zBooleanValue);
            } catch (Throwable th2) {
                throw th2;
            }
        }
        return zBooleanValue;
    }

    public static boolean b(Context context) {
        boolean zBooleanValue;
        synchronized (f89527f) {
            try {
                Boolean bool = f89528g;
                zBooleanValue = (bool == null && bool == null) ? context.checkCallingOrSelfPermission("android.permission.WAKE_LOCK") == 0 : bool.booleanValue();
                f89528g = Boolean.valueOf(zBooleanValue);
            } catch (Throwable th2) {
                throw th2;
            }
        }
        return zBooleanValue;
    }

    /* JADX WARN: Removed duplicated region for block: B:13:0x001f  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final synchronized boolean c() {
        boolean z11;
        try {
            ConnectivityManager connectivityManager = (ConnectivityManager) this.f89530a.getSystemService("connectivity");
            NetworkInfo activeNetworkInfo = connectivityManager != null ? connectivityManager.getActiveNetworkInfo() : null;
            if (activeNetworkInfo != null) {
                z11 = activeNetworkInfo.isConnected();
            }
        } catch (Throwable th2) {
            throw th2;
        }
        return z11;
    }

    /* JADX WARN: Finally extract failed */
    @Override // java.lang.Runnable
    public final void run() {
        u uVar = this.f89533d;
        Context context = this.f89530a;
        boolean zB = b(context);
        PowerManager.WakeLock wakeLock = this.f89532c;
        if (zB) {
            wakeLock.acquire(e.f89467a);
        }
        try {
            try {
                try {
                    uVar.a(true);
                    if (!this.f89531b.l()) {
                        uVar.a(false);
                        if (b(context)) {
                            try {
                                wakeLock.release();
                                return;
                            } catch (RuntimeException unused) {
                                Log.i("FirebaseMessaging", "TopicsSyncTask's wakelock was already released due to timeout.");
                                return;
                            }
                        }
                        return;
                    }
                    if (!a(context) || c()) {
                        if (uVar.b()) {
                            uVar.a(false);
                        } else {
                            uVar.c(this.f89534e);
                        }
                        if (b(context)) {
                            wakeLock.release();
                            return;
                        }
                        return;
                    }
                    v vVar = new v();
                    vVar.f89526a = this;
                    context.registerReceiver(vVar, new IntentFilter("android.net.conn.CONNECTIVITY_CHANGE"));
                    if (b(context)) {
                        try {
                            wakeLock.release();
                        } catch (RuntimeException unused2) {
                            Log.i("FirebaseMessaging", "TopicsSyncTask's wakelock was already released due to timeout.");
                        }
                    }
                } catch (IOException e3) {
                    Log.e("FirebaseMessaging", "Failed to sync topics. Won't retry sync. " + e3.getMessage());
                    uVar.a(false);
                    if (b(context)) {
                        wakeLock.release();
                    }
                }
            } catch (RuntimeException unused3) {
                Log.i("FirebaseMessaging", "TopicsSyncTask's wakelock was already released due to timeout.");
            }
        } catch (Throwable th2) {
            if (b(context)) {
                try {
                    wakeLock.release();
                } catch (RuntimeException unused4) {
                    Log.i("FirebaseMessaging", "TopicsSyncTask's wakelock was already released due to timeout.");
                }
            }
            throw th2;
        }
    }
}
