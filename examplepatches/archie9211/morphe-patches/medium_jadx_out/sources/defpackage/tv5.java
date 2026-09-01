package defpackage;

import android.os.IBinder;
import android.os.IInterface;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class tv5 extends wd5 {
    @Override // defpackage.mn0
    public final IInterface a(IBinder iBinder) {
        iBinder.getClass();
        int i = du5.f;
        IInterface iInterfaceQueryLocalInterface = iBinder.queryLocalInterface("com.google.android.gms.identitycredentials.internal.IIdentityCredentialService");
        return iInterfaceQueryLocalInterface instanceof eu5 ? (eu5) iInterfaceQueryLocalInterface : new cu5(iBinder);
    }

    @Override // defpackage.mn0
    public final da4[] d() {
        return m40.q;
    }

    @Override // defpackage.mn0
    public final int f() {
        return 17895000;
    }

    @Override // defpackage.mn0
    public final String i() {
        return "com.google.android.gms.identitycredentials.internal.IIdentityCredentialService";
    }

    @Override // defpackage.mn0
    public final String j() {
        return "com.google.android.gms.identitycredentials.service.START";
    }

    @Override // defpackage.mn0
    public final boolean k() {
        return true;
    }

    @Override // defpackage.mn0
    public final boolean o() {
        return true;
    }
}
