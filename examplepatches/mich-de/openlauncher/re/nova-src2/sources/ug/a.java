package ug;

import android.os.IBinder;
import android.os.IInterface;
import com.google.android.gms.common.Feature;
import sg.f;

/* loaded from: classes3.dex */
public final class a extends f {
    @Override // sg.e
    public final IInterface createServiceInterface(IBinder iBinder) {
        if (iBinder == null) {
            return null;
        }
        IInterface iInterfaceQueryLocalInterface = iBinder.queryLocalInterface("com.google.android.gms.common.internal.service.IClientNotificationTelemetryService");
        return iInterfaceQueryLocalInterface instanceof b ? (b) iInterfaceQueryLocalInterface : new b(iBinder, "com.google.android.gms.common.internal.service.IClientNotificationTelemetryService", 3);
    }

    @Override // sg.e
    public final Feature[] getApiFeatures() {
        return jh.a.f69560c;
    }

    @Override // sg.e
    public final int getMinApkVersion() {
        return 253600000;
    }

    @Override // sg.e
    public final String getServiceDescriptor() {
        return "com.google.android.gms.common.internal.service.IClientNotificationTelemetryService";
    }

    @Override // sg.e
    public final String getStartServiceAction() {
        return "com.google.android.gms.common.telemetry.notification.service.START";
    }

    @Override // sg.e
    public final boolean getUseDynamicLookup() {
        return true;
    }
}
