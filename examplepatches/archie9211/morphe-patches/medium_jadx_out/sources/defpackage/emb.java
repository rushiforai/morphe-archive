package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class emb implements nn0, v72 {
    public final rc7 a;
    public final rn0 b;
    public s3c c;

    public emb(rc7 rc7Var, tn0 tn0Var, dmb dmbVar) {
        this.a = rc7Var;
        rn0 rn0VarW = dmbVar.a.w();
        this.b = rn0VarW;
        tn0Var.d(rn0VarW);
        rn0VarW.a(this);
    }

    public static int d(int i, int i2) {
        int i3 = i / i2;
        if ((i ^ i2) < 0 && i3 * i2 != i) {
            i3--;
        }
        return i - (i3 * i2);
    }

    @Override // defpackage.nn0
    public final void a() {
        this.a.invalidateSelf();
    }

    @Override // defpackage.v72
    public final void b(List list, List list2) {
    }
}
