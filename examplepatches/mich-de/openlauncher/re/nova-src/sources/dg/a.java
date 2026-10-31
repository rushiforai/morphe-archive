package dg;

import com.google.android.gms.ads.identifier.AdvertisingIdClient;
import java.lang.ref.WeakReference;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;

/* loaded from: classes3.dex */
public final class a extends Thread {

    /* renamed from: a, reason: collision with root package name */
    public final WeakReference f49225a;

    /* renamed from: b, reason: collision with root package name */
    public final long f49226b;

    /* renamed from: c, reason: collision with root package name */
    public final CountDownLatch f49227c;

    public a(AdvertisingIdClient advertisingIdClient, long j11) {
        super("AdIdClientAutoDisconnectThread");
        this.f49225a = new WeakReference(advertisingIdClient);
        this.f49226b = j11;
        this.f49227c = new CountDownLatch(1);
        start();
    }

    @Override // java.lang.Thread, java.lang.Runnable
    public final void run() {
        AdvertisingIdClient advertisingIdClient;
        WeakReference weakReference = this.f49225a;
        try {
            if (this.f49227c.await(this.f49226b, TimeUnit.MILLISECONDS) || (advertisingIdClient = (AdvertisingIdClient) weakReference.get()) == null) {
                return;
            }
            advertisingIdClient.b();
        } catch (InterruptedException unused) {
            AdvertisingIdClient advertisingIdClient2 = (AdvertisingIdClient) weakReference.get();
            if (advertisingIdClient2 != null) {
                advertisingIdClient2.b();
            }
        }
    }
}
