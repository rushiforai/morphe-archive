package defpackage;

import android.content.ComponentName;
import android.content.ServiceConnection;
import android.os.IBinder;
import android.os.IInterface;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class w1g implements ServiceConnection {
    public final int a;
    public final /* synthetic */ mn0 b;

    public w1g(mn0 mn0Var, int i) {
        this.b = mn0Var;
        this.a = i;
    }

    @Override // android.content.ServiceConnection
    public final void onServiceConnected(ComponentName componentName, IBinder iBinder) {
        mn0 mn0Var = this.b;
        if (iBinder == null) {
            mn0Var.q();
            return;
        }
        synchronized (mn0Var.g) {
            try {
                IInterface iInterfaceQueryLocalInterface = iBinder.queryLocalInterface("com.google.android.gms.common.internal.IGmsServiceBroker");
                mn0Var.h = (iInterfaceQueryLocalInterface == null || !(iInterfaceQueryLocalInterface instanceof alf)) ? new alf(iBinder) : (alf) iInterfaceQueryLocalInterface;
            } catch (Throwable th) {
                throw th;
            }
        }
        mn0 mn0Var2 = this.b;
        int i = this.a;
        q4g q4gVar = new q4g(mn0Var2, 0, null);
        wvf wvfVar = mn0Var2.e;
        wvfVar.sendMessage(wvfVar.obtainMessage(7, i, -1, q4gVar));
    }

    @Override // android.content.ServiceConnection
    public final void onServiceDisconnected(ComponentName componentName) {
        mn0 mn0Var = this.b;
        synchronized (mn0Var.g) {
            mn0Var.h = null;
        }
        mn0 mn0Var2 = this.b;
        int i = this.a;
        wvf wvfVar = mn0Var2.e;
        wvfVar.sendMessage(wvfVar.obtainMessage(6, i, 1));
    }
}
