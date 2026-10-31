package fh;

import android.os.IBinder;
import android.os.IInterface;
import com.google.android.gms.common.Feature;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes3.dex */
public final class e extends sg.f {
    @Override // sg.e
    public final IInterface createServiceInterface(IBinder iBinder) {
        Intrinsics.g(iBinder, "iBinder");
        int i5 = c.f55131b;
        IInterface iInterfaceQueryLocalInterface = iBinder.queryLocalInterface("com.google.android.gms.identitycredentials.internal.IIdentityCredentialService");
        return iInterfaceQueryLocalInterface instanceof d ? (d) iInterfaceQueryLocalInterface : new b(iBinder);
    }

    @Override // sg.e
    public final Feature[] getApiFeatures() {
        return nh.a.f78241b;
    }

    @Override // sg.e
    public final int getMinApkVersion() {
        return 17895000;
    }

    @Override // sg.e
    public final String getServiceDescriptor() {
        return "com.google.android.gms.identitycredentials.internal.IIdentityCredentialService";
    }

    @Override // sg.e
    public final String getStartServiceAction() {
        return "com.google.android.gms.identitycredentials.service.START";
    }

    @Override // sg.e
    public final boolean getUseDynamicLookup() {
        return true;
    }

    @Override // sg.e
    public final boolean usesClientTelemetry() {
        return true;
    }
}
