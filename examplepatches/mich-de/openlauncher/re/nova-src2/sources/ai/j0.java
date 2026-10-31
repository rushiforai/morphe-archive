package ai;

import android.content.Context;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Looper;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes3.dex */
public final class j0 extends sg.e {

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ int f13023b;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ j0(Context context, Looper looper, int i5, sg.b bVar, sg.c cVar, int i11) {
        super(i5, context, looper, bVar, cVar);
        this.f13023b = i11;
    }

    @Override // sg.e
    public final IInterface createServiceInterface(IBinder binder) {
        switch (this.f13023b) {
            case 0:
                if (binder == null) {
                    return null;
                }
                IInterface iInterfaceQueryLocalInterface = binder.queryLocalInterface("com.google.android.gms.measurement.internal.IMeasurementService");
                return iInterfaceQueryLocalInterface instanceof a0 ? (a0) iInterfaceQueryLocalInterface : new y(binder);
            default:
                Intrinsics.g(binder, "binder");
                int i5 = b.j3.f15900j;
                IInterface iInterfaceQueryLocalInterface2 = binder.queryLocalInterface("com.google.android.gms.ads.internal.request.IAdRequestService");
                return iInterfaceQueryLocalInterface2 instanceof b.s3 ? (b.s3) iInterfaceQueryLocalInterface2 : new b.s2(binder, "com.google.android.gms.ads.internal.request.IAdRequestService", 1);
        }
    }

    @Override // sg.e
    public final int getMinApkVersion() {
        switch (this.f13023b) {
            case 0:
                return 12451000;
            default:
                return 243300000;
        }
    }

    @Override // sg.e
    public final String getServiceDescriptor() {
        switch (this.f13023b) {
            case 0:
                return "com.google.android.gms.measurement.internal.IMeasurementService";
            default:
                return "com.google.android.gms.ads.internal.request.IAdRequestService";
        }
    }

    @Override // sg.e
    public final String getStartServiceAction() {
        switch (this.f13023b) {
            case 0:
                return "com.google.android.gms.measurement.START";
            default:
                return "com.google.android.gms.ads.service.START";
        }
    }
}
