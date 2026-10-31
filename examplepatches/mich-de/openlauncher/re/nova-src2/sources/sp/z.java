package sp;

import android.content.Context;
import android.content.Intent;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;

/* loaded from: classes4.dex */
public abstract class z {

    /* renamed from: a, reason: collision with root package name */
    public static final /* synthetic */ int f87693a = 0;

    static {
        new b50.d(z.class.getSimpleName());
    }

    public static String a(Context context) {
        x xVar;
        y yVar = new y();
        Intent intent = new Intent("com.google.android.gms.ads.identifier.service.START");
        intent.setPackage("com.google.android.gms");
        if (!context.bindService(intent, yVar, 1)) {
            return com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
        try {
            if (yVar.f87691a) {
                throw new IllegalStateException();
            }
            yVar.f87691a = true;
            IBinder iBinder = (IBinder) yVar.f87692b.take();
            int i5 = w.f87690a;
            if (iBinder == null) {
                xVar = null;
            } else {
                IInterface iInterfaceQueryLocalInterface = iBinder.queryLocalInterface("com.google.android.gms.ads.identifier.internal.IAdvertisingIdService");
                if (iInterfaceQueryLocalInterface == null || !(iInterfaceQueryLocalInterface instanceof x)) {
                    v vVar = new v();
                    vVar.f87689a = iBinder;
                    xVar = vVar;
                } else {
                    xVar = (x) iInterfaceQueryLocalInterface;
                }
            }
            v vVar2 = (v) xVar;
            vVar2.getClass();
            Parcel parcelObtain = Parcel.obtain();
            Parcel parcelObtain2 = Parcel.obtain();
            try {
                parcelObtain.writeInterfaceToken("com.google.android.gms.ads.identifier.internal.IAdvertisingIdService");
                vVar2.f87689a.transact(1, parcelObtain, parcelObtain2, 0);
                parcelObtain2.readException();
                return parcelObtain2.readString();
            } finally {
                parcelObtain2.recycle();
                parcelObtain.recycle();
            }
        } catch (Throwable th2) {
            try {
                r0.c(th2);
                return com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
            } finally {
                context.unbindService(yVar);
            }
        }
    }
}
