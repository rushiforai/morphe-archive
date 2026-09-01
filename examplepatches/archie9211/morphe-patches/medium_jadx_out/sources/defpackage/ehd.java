package defpackage;

import android.app.RemoteAction;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ehd implements c55 {
    public final /* synthetic */ RemoteAction a;

    public ehd(RemoteAction remoteAction) {
        this.a = remoteAction;
    }

    @Override // defpackage.c55
    public final Object f(Object obj, Object obj2, Object obj3) {
        long j = ((uu1) obj).a;
        x12 x12Var = (x12) obj2;
        int iIntValue = ((Number) obj3).intValue();
        p65 p65Var = (p65) x12Var;
        if (p65Var.P(iIntValue & 1, (iIntValue & 17) != 16)) {
            ep6.c.e(this.a.getIcon(), p65Var, 48);
        } else {
            p65Var.S();
        }
        return c1e.a;
    }
}
