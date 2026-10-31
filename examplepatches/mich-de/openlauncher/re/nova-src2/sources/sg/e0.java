package sg;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.ServiceConnection;
import android.os.Build;
import android.os.IBinder;
import android.os.StrictMode;
import com.google.android.gms.common.ConnectionResult;
import com.google.android.gms.common.internal.zzaf;
import java.util.HashMap;
import java.util.Iterator;
import java.util.concurrent.Executor;

/* loaded from: classes.dex */
public final class e0 implements ServiceConnection {

    /* renamed from: a, reason: collision with root package name */
    public final HashMap f87422a = new HashMap();

    /* renamed from: b, reason: collision with root package name */
    public int f87423b = 2;

    /* renamed from: c, reason: collision with root package name */
    public boolean f87424c;

    /* renamed from: d, reason: collision with root package name */
    public IBinder f87425d;

    /* renamed from: e, reason: collision with root package name */
    public final d0 f87426e;

    /* renamed from: f, reason: collision with root package name */
    public ComponentName f87427f;

    /* renamed from: g, reason: collision with root package name */
    public final /* synthetic */ g0 f87428g;

    public e0(g0 g0Var, d0 d0Var) {
        this.f87428g = g0Var;
        this.f87426e = d0Var;
    }

    public final ConnectionResult d(String str, Executor executor) throws Throwable {
        try {
            Intent intentA = x.a(this.f87428g.f87435b, this.f87426e);
            this.f87423b = 3;
            StrictMode.VmPolicy vmPolicy = StrictMode.getVmPolicy();
            if (Build.VERSION.SDK_INT >= 31) {
                StrictMode.setVmPolicy(xg.e.a(new StrictMode.VmPolicy.Builder(vmPolicy)).build());
            }
            try {
                g0 g0Var = this.f87428g;
                wg.a aVar = g0Var.f87437d;
                Context context = g0Var.f87435b;
                d0 d0Var = this.f87426e;
                try {
                    boolean zD = aVar.d(context, str, intentA, this, 4225, executor);
                    this.f87424c = zD;
                    if (zD) {
                        g0Var.f87436c.sendMessageDelayed(g0Var.f87436c.obtainMessage(1, d0Var), g0Var.f87439f);
                        ConnectionResult connectionResult = ConnectionResult.f31777k;
                        StrictMode.setVmPolicy(vmPolicy);
                        return connectionResult;
                    }
                    this.f87423b = 2;
                    try {
                        g0Var.f87437d.c(g0Var.f87435b, this);
                    } catch (IllegalArgumentException unused) {
                    }
                    ConnectionResult connectionResult2 = new ConnectionResult(16, null, null);
                    StrictMode.setVmPolicy(vmPolicy);
                    return connectionResult2;
                } catch (Throwable th2) {
                    th = th2;
                    Throwable th3 = th;
                    StrictMode.setVmPolicy(vmPolicy);
                    throw th3;
                }
            } catch (Throwable th4) {
                th = th4;
            }
        } catch (zzaf e3) {
            return e3.f31880a;
        }
    }

    @Override // android.content.ServiceConnection
    public final void onBindingDied(ComponentName componentName) {
        onServiceDisconnected(componentName);
    }

    @Override // android.content.ServiceConnection
    public final void onServiceConnected(ComponentName componentName, IBinder iBinder) {
        g0 g0Var = this.f87428g;
        synchronized (g0Var.f87434a) {
            try {
                g0Var.f87436c.removeMessages(1, this.f87426e);
                this.f87425d = iBinder;
                this.f87427f = componentName;
                Iterator it = this.f87422a.values().iterator();
                while (it.hasNext()) {
                    ((ServiceConnection) it.next()).onServiceConnected(componentName, iBinder);
                }
                this.f87423b = 1;
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    @Override // android.content.ServiceConnection
    public final void onServiceDisconnected(ComponentName componentName) {
        g0 g0Var = this.f87428g;
        synchronized (g0Var.f87434a) {
            try {
                g0Var.f87436c.removeMessages(1, this.f87426e);
                this.f87425d = null;
                this.f87427f = componentName;
                Iterator it = this.f87422a.values().iterator();
                while (it.hasNext()) {
                    ((ServiceConnection) it.next()).onServiceDisconnected(componentName);
                }
                this.f87423b = 2;
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }
}
