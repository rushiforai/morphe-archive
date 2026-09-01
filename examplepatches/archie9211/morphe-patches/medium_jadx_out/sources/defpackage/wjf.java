package defpackage;

import android.content.Context;
import android.os.Bundle;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Looper;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class wjf extends wd5 {
    public final fgd z;

    public wjf(Context context, Looper looper, uz5 uz5Var, fgd fgdVar, uif uifVar, uif uifVar2) {
        super(context, looper, 270, uz5Var, uifVar, uifVar2);
        this.z = fgdVar;
    }

    @Override // defpackage.mn0
    public final IInterface a(IBinder iBinder) {
        if (iBinder == null) {
            return null;
        }
        IInterface iInterfaceQueryLocalInterface = iBinder.queryLocalInterface("com.google.android.gms.common.internal.service.IClientTelemetryService");
        return iInterfaceQueryLocalInterface instanceof qjf ? (qjf) iInterfaceQueryLocalInterface : new qjf(iBinder, "com.google.android.gms.common.internal.service.IClientTelemetryService", 0);
    }

    @Override // defpackage.mn0
    public final da4[] d() {
        return wgf.B;
    }

    @Override // defpackage.mn0
    public final Bundle e() {
        this.z.getClass();
        return new Bundle();
    }

    @Override // defpackage.mn0
    public final int f() {
        return 203400000;
    }

    @Override // defpackage.mn0
    public final String i() {
        return "com.google.android.gms.common.internal.service.IClientTelemetryService";
    }

    @Override // defpackage.mn0
    public final String j() {
        return "com.google.android.gms.common.telemetry.service.START";
    }

    @Override // defpackage.mn0
    public final boolean k() {
        return true;
    }
}
