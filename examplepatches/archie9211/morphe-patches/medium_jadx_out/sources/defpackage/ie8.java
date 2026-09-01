package defpackage;

import android.os.Build;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ie8 extends jn0 {
    public static final String b = d87.k("NetworkMeteredCtrlr");

    @Override // defpackage.o52
    public final boolean c(c8f c8fVar) {
        c8fVar.getClass();
        return c8fVar.j.a == te8.METERED;
    }

    @Override // defpackage.jn0
    public final int d() {
        return 7;
    }

    @Override // defpackage.jn0
    public final boolean e(Object obj) {
        oe8 oe8Var = (oe8) obj;
        oe8Var.getClass();
        boolean z = oe8Var.e;
        boolean z2 = oe8Var.a;
        if (Build.VERSION.SDK_INT >= 26) {
            return (z2 && oe8Var.c && !z) ? false : true;
        }
        d87.h().d(b, "Metered network constraint is not supported before API 26, only checking for connected state.");
        return !z2 || z;
    }
}
