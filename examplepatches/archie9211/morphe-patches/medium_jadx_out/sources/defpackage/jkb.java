package defpackage;

import java.util.Arrays;
import java.util.Iterator;
import java.util.RandomAccess;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class jkb extends k1 implements RandomAccess {
    public final Object[] a;
    public final int b;
    public int c;
    public int d;

    public jkb(int i, Object[] objArr) {
        this.a = objArr;
        if (i < 0) {
            ywb.g(b09.w(i, "ring buffer filled size should not be negative but it is "));
            throw null;
        }
        if (i <= objArr.length) {
            this.b = objArr.length;
            this.d = i;
        } else {
            StringBuilder sbC = ev6.C("ring buffer filled size: ", i, " cannot be larger than the buffer size: ");
            sbC.append(objArr.length);
            throw new IllegalArgumentException(sbC.toString().toString());
        }
    }

    public final void d(int i) {
        if (i < 0) {
            ywb.g(b09.w(i, "n shouldn't be negative but it is "));
            return;
        }
        if (i > this.d) {
            StringBuilder sbC = ev6.C("n shouldn't be greater than the buffer size: n = ", i, ", size = ");
            sbC.append(this.d);
            throw new IllegalArgumentException(sbC.toString().toString());
        }
        if (i > 0) {
            int i2 = this.c;
            int i3 = this.b;
            int i4 = (i2 + i) % i3;
            Object[] objArr = this.a;
            if (i2 > i4) {
                Arrays.fill(objArr, i2, i3, (Object) null);
                Arrays.fill(objArr, 0, i4, (Object) null);
            } else {
                Arrays.fill(objArr, i2, i4, (Object) null);
            }
            this.c = i4;
            this.d -= i;
        }
    }

    @Override // java.util.List
    public final Object get(int i) {
        g1 g1Var = k1.Companion;
        int i2 = this.d;
        g1Var.getClass();
        g1.b(i, i2);
        return this.a[(this.c + i) % this.b];
    }

    @Override // defpackage.t0
    public final int getSize() {
        return this.d;
    }

    @Override // defpackage.k1, java.util.Collection, java.lang.Iterable, java.util.List
    public final Iterator iterator() {
        return new ikb(this);
    }

    @Override // defpackage.t0, java.util.Collection, java.util.List
    public final Object[] toArray(Object[] objArr) {
        Object[] objArr2;
        objArr.getClass();
        int length = objArr.length;
        int i = this.d;
        if (length < i) {
            objArr = Arrays.copyOf(objArr, i);
        }
        int i2 = this.d;
        int i3 = this.c;
        int i4 = 0;
        int i5 = 0;
        while (true) {
            objArr2 = this.a;
            if (i5 >= i2 || i3 >= this.b) {
                break;
            }
            objArr[i5] = objArr2[i3];
            i5++;
            i3++;
        }
        while (i5 < i2) {
            objArr[i5] = objArr2[i4];
            i5++;
            i4++;
        }
        if (i2 < objArr.length) {
            objArr[i2] = null;
        }
        return objArr;
    }

    @Override // defpackage.t0, java.util.Collection, java.util.List
    public final Object[] toArray() {
        return toArray(new Object[getSize()]);
    }
}
