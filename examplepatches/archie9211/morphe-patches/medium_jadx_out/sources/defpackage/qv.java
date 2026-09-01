package defpackage;

import android.os.Build;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class qv implements jw2 {
    public final boolean a;

    public qv() {
        this.a = Build.VERSION.SDK_INT < 34;
    }

    @Override // defpackage.jw2
    public final lw2 a(kkc kkcVar, ew8 ew8Var) {
        zz0 zz0VarV0 = kkcVar.a.v0();
        if (!zz0VarV0.C(0L, iw2.b) && !zz0VarV0.C(0L, iw2.a) && (!zz0VarV0.C(0L, iw2.c) || !zz0VarV0.C(8L, iw2.d) || !zz0VarV0.C(12L, iw2.e) || !zz0VarV0.request(21L) || ((byte) (zz0VarV0.a().L(20L) & 2)) <= 0)) {
            if (Build.VERSION.SDK_INT < 30 || !zz0VarV0.C(4L, iw2.f)) {
                return null;
            }
            if (!zz0VarV0.C(8L, iw2.g) && !zz0VarV0.C(8L, iw2.h) && !zz0VarV0.C(8L, iw2.i)) {
                return null;
            }
        }
        return new vv(kkcVar.a, ew8Var, this.a);
    }
}
