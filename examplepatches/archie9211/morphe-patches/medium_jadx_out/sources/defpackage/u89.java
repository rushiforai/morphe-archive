package defpackage;

import java.util.ListIterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class u89 extends x1 {
    public final Object[] a;
    public final Object[] b;
    public final int c;
    public final int d;

    public u89(Object[] objArr, Object[] objArr2, int i, int i2) {
        objArr.getClass();
        objArr2.getClass();
        this.a = objArr;
        this.b = objArr2;
        this.c = i;
        this.d = i2;
        if (getSize() > 32) {
            return;
        }
        throw new IllegalArgumentException(("Trie-based persistent vector should have at least 33 elements, got " + getSize()).toString());
    }

    @Override // java.util.List
    public final Object get(int i) {
        Object[] objArr;
        int i2 = this.c;
        sgg.F(i, i2);
        if (((i2 - 1) & (-32)) <= i) {
            objArr = this.b;
        } else {
            Object[] objArr2 = this.a;
            for (int i3 = this.d; i3 > 0; i3 -= 5) {
                Object[] objArr3 = objArr2[tr7.u(i, i3)];
                objArr3.getClass();
                objArr2 = objArr3;
            }
            objArr = objArr2;
        }
        return objArr[i & 31];
    }

    @Override // defpackage.t0
    public final int getSize() {
        return this.c;
    }

    @Override // defpackage.k1, java.util.List
    public final ListIterator listIterator(int i) {
        sgg.G(i, this.c);
        return new y89(i, this.c, (this.d / 5) + 1, this.a, this.b);
    }
}
