package defpackage;

import java.util.List;
import java.util.RandomAccess;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class j1 extends k1 implements RandomAccess {
    public final k1 a;
    public final int b;
    public final int c;

    public j1(k1 k1Var, int i, int i2) {
        this.a = k1Var;
        this.b = i;
        g1 g1Var = k1.Companion;
        int size = k1Var.getSize();
        g1Var.getClass();
        g1.d(i, i2, size);
        this.c = i2 - i;
    }

    @Override // java.util.List
    public final Object get(int i) {
        k1.Companion.getClass();
        g1.b(i, this.c);
        return this.a.get(this.b + i);
    }

    @Override // defpackage.t0
    public final int getSize() {
        return this.c;
    }

    @Override // defpackage.k1, java.util.List
    public final List subList(int i, int i2) {
        k1.Companion.getClass();
        g1.d(i, i2, this.c);
        int i3 = this.b;
        return new j1(this.a, i + i3, i3 + i2);
    }
}
