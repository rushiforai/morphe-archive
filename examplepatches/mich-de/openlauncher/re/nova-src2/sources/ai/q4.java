package ai;

import android.os.Bundle;
import android.os.RemoteException;
import com.google.android.gms.internal.measurement.k7;
import com.google.android.gms.measurement.internal.AppMeasurementDynamiteService;

/* loaded from: classes3.dex */
public final class q4 implements d2 {

    /* renamed from: a, reason: collision with root package name */
    public final k7 f13265a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ AppMeasurementDynamiteService f13266b;

    public q4(AppMeasurementDynamiteService appMeasurementDynamiteService, k7 k7Var) {
        this.f13266b = appMeasurementDynamiteService;
        this.f13265a = k7Var;
    }

    @Override // ai.d2
    public final void a(String str, String str2, Bundle bundle, long j11) {
        try {
            this.f13265a.b(str, str2, bundle, j11);
        } catch (RemoteException e3) {
            m1 m1Var = this.f13266b.f33752a;
            if (m1Var != null) {
                o0 o0Var = m1Var.f13138f;
                m1.l(o0Var);
                o0Var.f13193i.b(e3, "Event listener threw exception");
            }
        }
    }
}
