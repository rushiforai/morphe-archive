package defpackage;

import android.content.Context;
import android.os.Bundle;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Looper;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class jkf extends wd5 {
    public final ikf z;

    public jkf(Context context, Looper looper, uz5 uz5Var, ikf ikfVar, uif uifVar, uif uifVar2) {
        super(context, looper, 68, uz5Var, uifVar, uifVar2);
        ikfVar = ikfVar == null ? ikf.c : ikfVar;
        d2f d2fVar = new d2f(6);
        d2fVar.b = Boolean.FALSE;
        ikf ikfVar2 = ikf.c;
        ikfVar.getClass();
        d2fVar.b = Boolean.valueOf(ikfVar.a);
        d2fVar.c = ikfVar.b;
        d2fVar.c = ekf.a();
        this.z = new ikf(d2fVar);
    }

    @Override // defpackage.mn0
    public final IInterface a(IBinder iBinder) {
        if (iBinder == null) {
            return null;
        }
        IInterface iInterfaceQueryLocalInterface = iBinder.queryLocalInterface("com.google.android.gms.auth.api.credentials.internal.ICredentialsService");
        return iInterfaceQueryLocalInterface instanceof lkf ? (lkf) iInterfaceQueryLocalInterface : new lkf(iBinder, "com.google.android.gms.auth.api.credentials.internal.ICredentialsService", 1);
    }

    @Override // defpackage.mn0
    public final Bundle e() {
        ikf ikfVar = this.z;
        ikfVar.getClass();
        Bundle bundle = new Bundle();
        bundle.putString("consumer_package", null);
        bundle.putBoolean("force_save_dialog", ikfVar.a);
        bundle.putString("log_session_id", ikfVar.b);
        return bundle;
    }

    @Override // defpackage.mn0
    public final int f() {
        return 12800000;
    }

    @Override // defpackage.mn0
    public final String i() {
        return "com.google.android.gms.auth.api.credentials.internal.ICredentialsService";
    }

    @Override // defpackage.mn0
    public final String j() {
        return "com.google.android.gms.auth.api.credentials.service.START";
    }
}
