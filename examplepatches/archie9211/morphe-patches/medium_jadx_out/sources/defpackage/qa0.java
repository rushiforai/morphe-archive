package defpackage;

import android.content.ComponentName;
import android.content.ServiceConnection;
import android.os.IBinder;
import java.util.concurrent.LinkedBlockingDeque;
import java.util.concurrent.atomic.AtomicBoolean;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class qa0 implements ServiceConnection {
    public final AtomicBoolean a = new AtomicBoolean(false);
    public final LinkedBlockingDeque b = new LinkedBlockingDeque();

    public final IBinder a() throws InterruptedException {
        if (!this.a.compareAndSet(false, true)) {
            ygf.f("Binder already consumed");
            return null;
        }
        Object objTake = this.b.take();
        objTake.getClass();
        return (IBinder) objTake;
    }

    @Override // android.content.ServiceConnection
    public final void onServiceConnected(ComponentName componentName, IBinder iBinder) {
        if (iBinder != null) {
            try {
                this.b.put(iBinder);
            } catch (InterruptedException unused) {
                f94 f94Var = f94.a;
            }
        }
    }

    @Override // android.content.ServiceConnection
    public final void onServiceDisconnected(ComponentName componentName) {
    }
}
