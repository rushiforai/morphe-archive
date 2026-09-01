package defpackage;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.ServiceConnection;
import android.os.Build;
import android.os.IBinder;
import android.os.StrictMode;
import com.google.android.gms.common.internal.zzaf;
import java.util.HashMap;
import java.util.Iterator;
import java.util.concurrent.Executor;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class egg implements ServiceConnection {
    public final HashMap a = new HashMap();
    public int b = 2;
    public boolean c;
    public IBinder d;
    public final gfg e;
    public ComponentName f;
    public final /* synthetic */ rig g;

    public egg(rig rigVar, gfg gfgVar) {
        this.g = rigVar;
        this.e = gfgVar;
    }

    public final h42 a(String str, Executor executor) {
        try {
            Intent intentA = vpf.a(this.g.b, this.e);
            this.b = 3;
            StrictMode.VmPolicy vmPolicy = StrictMode.getVmPolicy();
            if (Build.VERSION.SDK_INT >= 31) {
                StrictMode.setVmPolicy(mxf.a(new StrictMode.VmPolicy.Builder(vmPolicy)).build());
            }
            try {
                rig rigVar = this.g;
                l42 l42Var = rigVar.d;
                Context context = rigVar.b;
                gfg gfgVar = this.e;
                boolean zC = l42Var.c(context, str, intentA, this, 4225, executor);
                this.c = zC;
                if (zC) {
                    rigVar.c.sendMessageDelayed(rigVar.c.obtainMessage(1, gfgVar), rigVar.f);
                    h42 h42Var = h42.f;
                    StrictMode.setVmPolicy(vmPolicy);
                    return h42Var;
                }
                this.b = 2;
                try {
                    rigVar.d.b(rigVar.b, this);
                } catch (IllegalArgumentException unused) {
                }
                h42 h42Var2 = new h42(16, null, null);
                StrictMode.setVmPolicy(vmPolicy);
                return h42Var2;
            } catch (Throwable th) {
                StrictMode.setVmPolicy(vmPolicy);
                throw th;
            }
        } catch (zzaf e) {
            return e.a;
        }
    }

    @Override // android.content.ServiceConnection
    public final void onBindingDied(ComponentName componentName) {
        onServiceDisconnected(componentName);
    }

    @Override // android.content.ServiceConnection
    public final void onServiceConnected(ComponentName componentName, IBinder iBinder) {
        rig rigVar = this.g;
        synchronized (rigVar.a) {
            try {
                rigVar.c.removeMessages(1, this.e);
                this.d = iBinder;
                this.f = componentName;
                Iterator it2 = this.a.values().iterator();
                while (it2.hasNext()) {
                    ((ServiceConnection) it2.next()).onServiceConnected(componentName, iBinder);
                }
                this.b = 1;
            } catch (Throwable th) {
                throw th;
            }
        }
    }

    @Override // android.content.ServiceConnection
    public final void onServiceDisconnected(ComponentName componentName) {
        rig rigVar = this.g;
        synchronized (rigVar.a) {
            try {
                rigVar.c.removeMessages(1, this.e);
                this.d = null;
                this.f = componentName;
                Iterator it2 = this.a.values().iterator();
                while (it2.hasNext()) {
                    ((ServiceConnection) it2.next()).onServiceDisconnected(componentName);
                }
                this.b = 2;
            } catch (Throwable th) {
                throw th;
            }
        }
    }
}
