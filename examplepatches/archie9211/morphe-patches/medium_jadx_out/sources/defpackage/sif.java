package defpackage;

import android.os.IBinder;
import android.os.IInterface;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class sif extends wd5 {
    @Override // defpackage.mn0
    public final IInterface a(IBinder iBinder) {
        if (iBinder == null) {
            return null;
        }
        IInterface iInterfaceQueryLocalInterface = iBinder.queryLocalInterface("com.google.android.gms.common.internal.service.IClientNotificationTelemetryService");
        return iInterfaceQueryLocalInterface instanceof ojf ? (ojf) iInterfaceQueryLocalInterface : new ojf(iBinder, "com.google.android.gms.common.internal.service.IClientNotificationTelemetryService", 0);
    }

    @Override // defpackage.mn0
    public final da4[] d() {
        return wgf.B;
    }

    @Override // defpackage.mn0
    public final int f() {
        return 253600000;
    }

    @Override // defpackage.mn0
    public final String i() {
        return "com.google.android.gms.common.internal.service.IClientNotificationTelemetryService";
    }

    @Override // defpackage.mn0
    public final String j() {
        return "com.google.android.gms.common.telemetry.notification.service.START";
    }

    @Override // defpackage.mn0
    public final boolean k() {
        return true;
    }
}
