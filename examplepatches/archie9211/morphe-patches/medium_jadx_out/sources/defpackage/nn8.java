package defpackage;

import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class nn8 {
    public final t76 a;
    public final int[] b;
    public final String[] c;
    public final Set d;

    public nn8(t76 t76Var, int[] iArr, String[] strArr) {
        t76Var.getClass();
        iArr.getClass();
        strArr.getClass();
        this.a = t76Var;
        this.b = iArr;
        this.c = strArr;
        if (iArr.length == strArr.length) {
            this.d = !(strArr.length == 0) ? qo7.B(strArr[0]) : ny3.a;
        } else {
            ygf.f("Check failed.");
            throw null;
        }
    }
}
