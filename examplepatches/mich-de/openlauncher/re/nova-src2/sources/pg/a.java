package pg;

import android.content.ComponentName;
import android.content.ServiceConnection;
import android.os.IBinder;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;
import sg.w;

/* loaded from: classes.dex */
public final class a implements ServiceConnection {

    /* renamed from: a, reason: collision with root package name */
    public boolean f82556a = false;

    /* renamed from: b, reason: collision with root package name */
    public final LinkedBlockingQueue f82557b = new LinkedBlockingQueue();

    public final IBinder l() throws TimeoutException {
        TimeUnit timeUnit = TimeUnit.MILLISECONDS;
        w.g("BlockingServiceConnection.getServiceWithTimeout() called on main thread");
        if (this.f82556a) {
            throw new IllegalStateException("Cannot call get on this connection more than once");
        }
        this.f82556a = true;
        IBinder iBinder = (IBinder) this.f82557b.poll(com.moloco.sdk.xenoss.sdkdevkit.android.persistenttransport.h.f42227c, timeUnit);
        if (iBinder != null) {
            return iBinder;
        }
        throw new TimeoutException("Timed out waiting for the service connection");
    }

    @Override // android.content.ServiceConnection
    public final void onServiceConnected(ComponentName componentName, IBinder iBinder) {
        this.f82557b.add(iBinder);
    }

    @Override // android.content.ServiceConnection
    public final void onServiceDisconnected(ComponentName componentName) {
    }
}
