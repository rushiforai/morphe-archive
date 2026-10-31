package sg;

import android.content.Context;
import android.content.ServiceConnection;
import android.os.HandlerThread;
import android.os.Looper;
import com.google.android.gms.common.ConnectionResult;
import java.util.HashMap;
import java.util.concurrent.Executor;

/* loaded from: classes.dex */
public final class g0 {

    /* renamed from: g, reason: collision with root package name */
    public static final Object f87431g = new Object();

    /* renamed from: h, reason: collision with root package name */
    public static g0 f87432h;

    /* renamed from: i, reason: collision with root package name */
    public static HandlerThread f87433i;

    /* renamed from: a, reason: collision with root package name */
    public final HashMap f87434a = new HashMap();

    /* renamed from: b, reason: collision with root package name */
    public final Context f87435b;

    /* renamed from: c, reason: collision with root package name */
    public volatile lh.i f87436c;

    /* renamed from: d, reason: collision with root package name */
    public final wg.a f87437d;

    /* renamed from: e, reason: collision with root package name */
    public final long f87438e;

    /* renamed from: f, reason: collision with root package name */
    public final long f87439f;

    public g0(Context context, Looper looper) {
        f0 f0Var = new f0(this);
        this.f87435b = context.getApplicationContext();
        lh.i iVar = new lh.i(looper, f0Var);
        Looper.getMainLooper();
        this.f87436c = iVar;
        this.f87437d = wg.a.b();
        this.f87438e = 5000L;
        this.f87439f = 300000L;
    }

    public static g0 a(Context context) {
        synchronized (f87431g) {
            try {
                if (f87432h == null) {
                    f87432h = new g0(context.getApplicationContext(), context.getMainLooper());
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
        return f87432h;
    }

    public final ConnectionResult b(d0 d0Var, a0 a0Var, String str, Executor executor) {
        ConnectionResult connectionResultD;
        HashMap map = this.f87434a;
        synchronized (map) {
            try {
                e0 e0Var = (e0) map.get(d0Var);
                if (executor == null) {
                    executor = null;
                }
                if (e0Var == null) {
                    e0Var = new e0(this, d0Var);
                    e0Var.f87422a.put(a0Var, a0Var);
                    connectionResultD = e0Var.d(str, executor);
                    map.put(d0Var, e0Var);
                } else {
                    this.f87436c.removeMessages(0, d0Var);
                    if (e0Var.f87422a.containsKey(a0Var)) {
                        String string = d0Var.toString();
                        StringBuilder sb2 = new StringBuilder(string.length() + 81);
                        sb2.append("Trying to bind a GmsServiceConnection that was already connected before.  config=");
                        sb2.append(string);
                        throw new IllegalStateException(sb2.toString());
                    }
                    e0Var.f87422a.put(a0Var, a0Var);
                    int i5 = e0Var.f87423b;
                    if (i5 == 1) {
                        a0Var.onServiceConnected(e0Var.f87427f, e0Var.f87425d);
                    } else if (i5 == 2) {
                        connectionResultD = e0Var.d(str, executor);
                    }
                    connectionResultD = null;
                }
                if (e0Var.f87424c) {
                    return ConnectionResult.f31777k;
                }
                if (connectionResultD == null) {
                    connectionResultD = new ConnectionResult(-1, null, null);
                }
                return connectionResultD;
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    public final void c(String str, ServiceConnection serviceConnection, boolean z11) {
        d0 d0Var = new d0(str, z11);
        w.i(serviceConnection, "ServiceConnection must not be null");
        HashMap map = this.f87434a;
        synchronized (map) {
            try {
                e0 e0Var = (e0) map.get(d0Var);
                if (e0Var == null) {
                    String string = d0Var.toString();
                    StringBuilder sb2 = new StringBuilder(string.length() + 50);
                    sb2.append("Nonexistent connection status for service config: ");
                    sb2.append(string);
                    throw new IllegalStateException(sb2.toString());
                }
                if (!e0Var.f87422a.containsKey(serviceConnection)) {
                    String string2 = d0Var.toString();
                    StringBuilder sb3 = new StringBuilder(string2.length() + 76);
                    sb3.append("Trying to unbind a GmsServiceConnection  that was not bound before.  config=");
                    sb3.append(string2);
                    throw new IllegalStateException(sb3.toString());
                }
                e0Var.f87422a.remove(serviceConnection);
                if (e0Var.f87422a.isEmpty()) {
                    this.f87436c.sendMessageDelayed(this.f87436c.obtainMessage(0, d0Var), this.f87438e);
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }
}
