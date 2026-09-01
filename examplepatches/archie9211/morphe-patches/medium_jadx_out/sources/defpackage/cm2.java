package defpackage;

import android.content.ComponentName;
import android.os.RemoteException;
import java.util.concurrent.locks.ReentrantLock;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class cm2 extends gm2 {
    public static lig b;
    public static m50 c;
    public static final ReentrantLock d = new ReentrantLock();

    @Override // defpackage.gm2
    public final void a(ComponentName componentName, lig ligVar) {
        componentName.getClass();
        try {
            ((vt5) ((xt5) ligVar.b)).d();
        } catch (RemoteException unused) {
        }
        b = ligVar;
        rx0.S();
    }

    @Override // android.content.ServiceConnection
    public final void onServiceDisconnected(ComponentName componentName) {
        componentName.getClass();
    }
}
