package kh;

import android.os.IBinder;
import android.os.IInterface;
import com.google.android.gms.common.Feature;
import sg.f;

/* loaded from: classes3.dex */
public final class a extends f {
    @Override // sg.e
    public final /* synthetic */ IInterface createServiceInterface(IBinder iBinder) {
        if (iBinder == null) {
            return null;
        }
        IInterface iInterfaceQueryLocalInterface = iBinder.queryLocalInterface("com.google.android.gms.cloudmessaging.internal.ICloudMessagingService");
        return iInterfaceQueryLocalInterface instanceof b ? (b) iInterfaceQueryLocalInterface : new b(iBinder);
    }

    @Override // sg.e
    public final Feature[] getApiFeatures() {
        return og.c.f80389b;
    }

    @Override // sg.e
    public final int getMinApkVersion() {
        return 261200000;
    }

    @Override // sg.e
    public final String getServiceDescriptor() {
        return "com.google.android.gms.cloudmessaging.internal.ICloudMessagingService";
    }

    @Override // sg.e
    public final String getStartServiceAction() {
        return "com.google.android.gms.cloudmessaging.service.START";
    }

    @Override // sg.e
    public final boolean usesClientTelemetry() {
        return true;
    }
}
