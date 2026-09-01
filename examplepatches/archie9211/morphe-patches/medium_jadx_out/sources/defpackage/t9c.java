package defpackage;

import android.content.Context;
import android.os.Bundle;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Looper;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class t9c extends wd5 {
    public final uz5 A;
    public final Bundle B;
    public final Integer C;
    public final boolean z;

    public t9c(Context context, Looper looper, uz5 uz5Var, Bundle bundle, ce5 ce5Var, de5 de5Var) {
        super(context, looper, 44, uz5Var, ce5Var, de5Var);
        this.z = true;
        this.A = uz5Var;
        this.B = bundle;
        this.C = (Integer) uz5Var.f;
    }

    @Override // defpackage.mn0
    public final IInterface a(IBinder iBinder) {
        if (iBinder == null) {
            return null;
        }
        IInterface iInterfaceQueryLocalInterface = iBinder.queryLocalInterface("com.google.android.gms.signin.internal.ISignInService");
        return iInterfaceQueryLocalInterface instanceof gjf ? (gjf) iInterfaceQueryLocalInterface : new gjf(iBinder, "com.google.android.gms.signin.internal.ISignInService", 0);
    }

    @Override // defpackage.mn0
    public final Bundle e() {
        uz5 uz5Var = this.A;
        boolean zEquals = this.c.getPackageName().equals((String) uz5Var.c);
        Bundle bundle = this.B;
        if (!zEquals) {
            bundle.putString("com.google.android.gms.signin.internal.realClientPackageName", (String) uz5Var.c);
        }
        return bundle;
    }

    @Override // defpackage.mn0
    public final int f() {
        return 12451000;
    }

    @Override // defpackage.mn0
    public final String i() {
        return "com.google.android.gms.signin.internal.ISignInService";
    }

    @Override // defpackage.mn0
    public final String j() {
        return "com.google.android.gms.signin.service.START";
    }

    @Override // defpackage.mn0
    public final boolean n() {
        return this.z;
    }
}
