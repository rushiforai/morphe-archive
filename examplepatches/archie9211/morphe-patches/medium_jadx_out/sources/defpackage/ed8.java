package defpackage;

import android.view.View;
import java.util.WeakHashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ed8 implements zc8 {
    public final nd8 a;
    public final int[] b;

    public ed8(View view) {
        nd8 nd8Var = new nd8(view);
        if (nd8Var.d) {
            WeakHashMap weakHashMap = ute.a;
            view.stopNestedScroll();
        }
        nd8Var.d = true;
        this.a = nd8Var;
        this.b = new int[2];
        WeakHashMap weakHashMap2 = ute.a;
        view.setNestedScrollingEnabled(true);
    }

    @Override // defpackage.zc8
    public final Object A(long j, long j2, n92 n92Var) {
        nd8 nd8Var = this.a;
        if (nd8Var.e(0) != null) {
            nd8Var.g(0);
        }
        if (nd8Var.e(1) != null) {
            nd8Var.g(1);
        }
        return new qre(0L);
    }

    @Override // defpackage.zc8
    public final long K(int i, long j) {
        int iP = jq7.p(j);
        int i2 = i == 1 ? 1 : 0;
        nd8 nd8Var = this.a;
        if (!nd8Var.f(iP, i2 ^ 1)) {
            return 0L;
        }
        int[] iArr = this.b;
        k80.p0(0, 0, 6, iArr);
        int i3 = jq7.i(Float.intBitsToFloat((int) (j >> 32)));
        int i4 = jq7.i(Float.intBitsToFloat((int) (4294967295L & j)));
        nd8Var.c(i3, i4, iArr, null, (i == 1 ? 1 : 0) ^ 1);
        return jq7.w(i3, i4, iArr, j);
    }

    @Override // defpackage.zc8
    public final Object j0(long j, n92 n92Var) {
        float fB = qre.b(j) * (-1.0f);
        float fC = qre.c(j) * (-1.0f);
        nd8 nd8Var = this.a;
        if (!nd8Var.b(fB, fC) && !nd8Var.a(qre.b(j) * (-1.0f), qre.c(j) * (-1.0f), true)) {
            j = 0;
        }
        return new qre(j);
    }

    @Override // defpackage.zc8
    public final long n0(long j, long j2, int i) {
        int iP = jq7.p(j2);
        int i2 = i == 1 ? 1 : 0;
        nd8 nd8Var = this.a;
        if (!nd8Var.f(iP, i2 ^ 1)) {
            return 0L;
        }
        int[] iArr = this.b;
        k80.p0(0, 0, 6, iArr);
        int i3 = jq7.i(Float.intBitsToFloat((int) (j2 >> 32)));
        int i4 = jq7.i(Float.intBitsToFloat((int) (j2 & 4294967295L)));
        nd8Var.d(jq7.i(Float.intBitsToFloat((int) (j >> 32))), jq7.i(Float.intBitsToFloat((int) (j & 4294967295L))), i3, i4, null, (i == 1 ? 1 : 0) ^ 1, iArr);
        return jq7.w(i3, i4, iArr, j2);
    }
}
