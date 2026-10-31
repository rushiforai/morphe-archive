package ads_mobile_sdk;

import android.content.Context;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Looper;
import com.vungle.ads.internal.protos.Sdk;

/* loaded from: classes.dex */
public final class rt0 extends sg.e {

    /* renamed from: a, reason: collision with root package name */
    public final int f9301a;

    public rt0(int i5, Context context, Looper looper, sg.b bVar, sg.c cVar) {
        super(Sdk.SDKError.Reason.GZIP_ENCODE_ERROR_VALUE, context, looper, bVar, cVar);
        this.f9301a = i5;
    }

    @Override // sg.e
    public final IInterface createServiceInterface(IBinder iBinder) {
        int i5 = b.p4.f15974j;
        if (iBinder == null) {
            return null;
        }
        IInterface iInterfaceQueryLocalInterface = iBinder.queryLocalInterface("com.google.android.gms.gass.internal.IGassService");
        return iInterfaceQueryLocalInterface instanceof b.b5 ? (b.b5) iInterfaceQueryLocalInterface : new b.g4(iBinder, "com.google.android.gms.gass.internal.IGassService", 1);
    }

    @Override // sg.e
    public final int getMinApkVersion() {
        return this.f9301a;
    }

    @Override // sg.e
    public final String getServiceDescriptor() {
        return "com.google.android.gms.gass.internal.IGassService";
    }

    @Override // sg.e
    public final String getStartServiceAction() {
        return "com.google.android.gms.gass.START";
    }
}
