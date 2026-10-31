package hh;

import android.os.IBinder;
import android.os.IInterface;
import com.google.android.gms.common.Feature;

/* loaded from: classes.dex */
public final class a extends sg.f {
    @Override // sg.e
    public final /* synthetic */ IInterface createServiceInterface(IBinder iBinder) {
        if (iBinder == null) {
            return null;
        }
        IInterface iInterfaceQueryLocalInterface = iBinder.queryLocalInterface("com.google.android.gms.appset.internal.IAppSetService");
        return iInterfaceQueryLocalInterface instanceof b ? (b) iInterfaceQueryLocalInterface : new b(iBinder);
    }

    @Override // sg.e
    public final Feature[] getApiFeatures() {
        return ig.a.f61591b;
    }

    @Override // sg.e
    public final int getMinApkVersion() {
        return 212800000;
    }

    @Override // sg.e
    public final String getServiceDescriptor() {
        return "com.google.android.gms.appset.internal.IAppSetService";
    }

    @Override // sg.e
    public final String getStartServiceAction() {
        return "com.google.android.gms.appset.service.START";
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
