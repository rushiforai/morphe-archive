package defpackage;

import android.os.IBinder;
import android.os.IInterface;
import com.squareup.wire.sjIw.ezwlgQm;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class neg extends wd5 {
    @Override // defpackage.mn0
    public final /* bridge */ /* synthetic */ IInterface a(IBinder iBinder) {
        iBinder.getClass();
        IInterface iInterfaceQueryLocalInterface = iBinder.queryLocalInterface("com.google.android.gms.recaptchabase.internal.IRecaptchaBaseService");
        return iInterfaceQueryLocalInterface instanceof p3g ? (p3g) iInterfaceQueryLocalInterface : new p3g(iBinder);
    }

    @Override // defpackage.mn0
    public final da4[] d() {
        return r40.j;
    }

    @Override // defpackage.mn0
    public final int f() {
        return 17895000;
    }

    @Override // defpackage.mn0
    public final String i() {
        return "com.google.android.gms.recaptchabase.internal.IRecaptchaBaseService";
    }

    @Override // defpackage.mn0
    public final boolean k() {
        return true;
    }

    @Override // defpackage.mn0
    public final boolean o() {
        return false;
    }

    @Override // defpackage.mn0
    public final String j() {
        return ezwlgQm.hfJoVnoaSzY;
    }
}
