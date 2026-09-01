package defpackage;

import android.content.Context;
import android.os.Bundle;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Looper;
import com.drew.metadata.mp4.media.Mp4VideoDirectory;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class dkf extends wd5 {
    public final Bundle z;

    public dkf(Context context, Looper looper, uz5 uz5Var, uif uifVar, uif uifVar2) {
        super(context, looper, Mp4VideoDirectory.TAG_OPCOLOR, uz5Var, uifVar, uifVar2);
        this.z = new Bundle();
    }

    @Override // defpackage.mn0
    public final IInterface a(IBinder iBinder) {
        if (iBinder == null) {
            return null;
        }
        IInterface iInterfaceQueryLocalInterface = iBinder.queryLocalInterface("com.google.android.gms.auth.api.identity.internal.ISignInService");
        return iInterfaceQueryLocalInterface instanceof tkf ? (tkf) iInterfaceQueryLocalInterface : new tkf(iBinder, "com.google.android.gms.auth.api.identity.internal.ISignInService", 1);
    }

    @Override // defpackage.mn0
    public final da4[] d() {
        return pxf.N;
    }

    @Override // defpackage.mn0
    public final Bundle e() {
        return this.z;
    }

    @Override // defpackage.mn0
    public final int f() {
        return 17895000;
    }

    @Override // defpackage.mn0
    public final String i() {
        return "com.google.android.gms.auth.api.identity.internal.ISignInService";
    }

    @Override // defpackage.mn0
    public final String j() {
        return "com.google.android.gms.auth.api.identity.service.signin.START";
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
