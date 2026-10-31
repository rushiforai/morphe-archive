package sp;

import android.app.Application;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.ServiceConnection;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.IBinder;
import android.os.IInterface;
import android.os.RemoteException;
import java.security.SecureRandom;

/* loaded from: classes4.dex */
public final class b0 implements ServiceConnection {

    /* renamed from: e, reason: collision with root package name */
    public static final SecureRandom f87564e = new SecureRandom();

    /* renamed from: f, reason: collision with root package name */
    public static final b50.d f87565f = new b50.d(a0.class.getSimpleName());

    /* renamed from: a, reason: collision with root package name */
    public up.c f87566a;

    /* renamed from: b, reason: collision with root package name */
    public final Context f87567b;

    /* renamed from: c, reason: collision with root package name */
    public final q.c f87568c;

    /* renamed from: d, reason: collision with root package name */
    public final String f87569d;

    public b0(Application application, q.c cVar) {
        HandlerThread handlerThread = new HandlerThread("license_checker");
        handlerThread.start();
        this.f87567b = application;
        this.f87569d = application.getPackageName();
        new Handler(handlerThread.getLooper());
        this.f87568c = cVar;
    }

    public final synchronized void l() {
        up.c cVar = this.f87566a;
        if (cVar == null) {
            f87565f.getClass();
            try {
                if (!this.f87567b.bindService(new Intent("com.android.vending.licensing.ILicensingService").setPackage("com.android.vending"), this, 1)) {
                    this.f87568c.t(-1, "Binding failed", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
                }
            } catch (SecurityException e3) {
                f87565f.getClass();
                this.f87568c.t(-1, "Exception: " + e3.toString() + ", Message: " + e3.getMessage(), com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
            }
            f87565f.getClass();
        } else {
            try {
                ((up.a) cVar).T(f87564e.nextInt(), this.f87569d, new androidx.room.k(this));
            } catch (RemoteException e11) {
                f87565f.getClass();
                this.f87568c.t(-1, "Exception: " + e11.toString() + ", Message: " + e11.getMessage(), com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
            }
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r4v7, types: [up.c] */
    @Override // android.content.ServiceConnection
    public final synchronized void onServiceConnected(ComponentName componentName, IBinder iBinder) {
        up.a aVar;
        f87565f.getClass();
        int i5 = up.b.f91502a;
        if (iBinder == null) {
            aVar = null;
        } else {
            IInterface iInterfaceQueryLocalInterface = iBinder.queryLocalInterface("com.android.vending.licensing.ILicensingService");
            if (iInterfaceQueryLocalInterface == null || !(iInterfaceQueryLocalInterface instanceof up.c)) {
                up.a aVar2 = new up.a();
                aVar2.f91501a = iBinder;
                aVar = aVar2;
            } else {
                aVar = (up.c) iInterfaceQueryLocalInterface;
            }
        }
        this.f87566a = aVar;
        try {
            aVar.T(f87564e.nextInt(), this.f87569d, new androidx.room.k(this));
        } catch (RemoteException e3) {
            f87565f.getClass();
            this.f87568c.t(-1, e3.toString(), com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
        }
    }

    @Override // android.content.ServiceConnection
    public final synchronized void onServiceDisconnected(ComponentName componentName) {
        f87565f.getClass();
        this.f87566a = null;
    }
}
