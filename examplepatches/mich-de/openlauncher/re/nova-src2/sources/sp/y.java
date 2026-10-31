package sp;

import android.content.ComponentName;
import android.content.ServiceConnection;
import android.os.IBinder;
import java.util.concurrent.LinkedBlockingQueue;

/* loaded from: classes4.dex */
public final class y implements ServiceConnection {

    /* renamed from: a, reason: collision with root package name */
    public boolean f87691a = false;

    /* renamed from: b, reason: collision with root package name */
    public final LinkedBlockingQueue f87692b = new LinkedBlockingQueue();

    @Override // android.content.ServiceConnection
    public final void onServiceConnected(ComponentName componentName, IBinder iBinder) throws InterruptedException {
        try {
            this.f87692b.put(iBinder);
        } catch (InterruptedException e3) {
            int i5 = z.f87693a;
            r0.c(e3);
        }
    }

    @Override // android.content.ServiceConnection
    public final void onServiceDisconnected(ComponentName componentName) {
    }
}
