package defpackage;

import android.content.ComponentName;
import android.content.Context;
import android.os.RemoteException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class em2 extends gm2 {
    public final /* synthetic */ Context b;

    public em2(Context context) {
        this.b = context;
    }

    @Override // defpackage.gm2
    public final void a(ComponentName componentName, lig ligVar) {
        try {
            ((vt5) ((xt5) ligVar.b)).d();
        } catch (RemoteException unused) {
        }
        this.b.unbindService(this);
    }

    @Override // android.content.ServiceConnection
    public final void onServiceDisconnected(ComponentName componentName) {
    }
}
