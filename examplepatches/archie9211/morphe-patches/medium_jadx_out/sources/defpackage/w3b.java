package defpackage;

import android.content.ComponentName;
import android.content.ServiceConnection;
import android.os.IBinder;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class w3b implements ServiceConnection {
    public IBinder a;
    private final CountDownLatch latch = new CountDownLatch(1);

    public final IBinder a() throws InterruptedException {
        this.latch.await(5L, TimeUnit.SECONDS);
        return this.a;
    }

    @Override // android.content.ServiceConnection
    public final void onNullBinding(ComponentName componentName) {
        componentName.getClass();
        this.latch.countDown();
    }

    @Override // android.content.ServiceConnection
    public final void onServiceConnected(ComponentName componentName, IBinder iBinder) {
        componentName.getClass();
        iBinder.getClass();
        this.a = iBinder;
        this.latch.countDown();
    }

    @Override // android.content.ServiceConnection
    public final void onServiceDisconnected(ComponentName componentName) {
        componentName.getClass();
    }
}
