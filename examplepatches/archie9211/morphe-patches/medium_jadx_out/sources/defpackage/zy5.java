package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class zy5 extends k1 {
    public final y1 a;
    public final int b;
    public final int c;

    public zy5(y1 y1Var, int i, int i2) {
        this.a = y1Var;
        this.b = i;
        hlg.o(i, i2, y1Var.getSize());
        this.c = i2 - i;
    }

    @Override // java.util.List
    public final Object get(int i) {
        hlg.m(i, this.c);
        return this.a.get(this.b + i);
    }

    @Override // defpackage.t0
    public final int getSize() {
        return this.c;
    }

    @Override // defpackage.k1, java.util.List
    public final List subList(int i, int i2) {
        hlg.o(i, i2, this.c);
        int i3 = this.b;
        return new zy5(this.a, i + i3, i3 + i2);
    }
}
