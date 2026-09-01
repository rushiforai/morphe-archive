package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class yy5 extends k1 implements az5 {
    public final x1 a;
    public final int b;
    public final int c;

    public yy5(x1 x1Var, int i, int i2) {
        this.a = x1Var;
        this.b = i;
        sgg.H(i, i2, x1Var.getSize());
        this.c = i2 - i;
    }

    @Override // java.util.List
    public final Object get(int i) {
        sgg.F(i, this.c);
        return this.a.get(this.b + i);
    }

    @Override // defpackage.t0
    public final int getSize() {
        return this.c;
    }

    @Override // defpackage.k1, java.util.List
    public final List subList(int i, int i2) {
        sgg.H(i, i2, this.c);
        int i3 = this.b;
        return new yy5(this.a, i + i3, i3 + i2);
    }
}
