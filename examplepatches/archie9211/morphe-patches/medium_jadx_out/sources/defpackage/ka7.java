package defpackage;

import java.nio.charset.Charset;
import java.util.AbstractList;
import java.util.Arrays;
import java.util.Collection;
import java.util.RandomAccess;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ka7 extends a2 implements s56, RandomAccess, s0a {
    public static final ka7 d;
    public long[] b;
    public int c;

    static {
        ka7 ka7Var = new ka7(0, new long[0]);
        d = ka7Var;
        ka7Var.a = false;
    }

    public ka7(int i, long[] jArr) {
        this.b = jArr;
        this.c = i;
    }

    @Override // java.util.AbstractList, java.util.List
    public final void add(int i, Object obj) {
        int i2;
        long jLongValue = ((Long) obj).longValue();
        d();
        if (i < 0 || i > (i2 = this.c)) {
            ik4.e(this.c, ev6.C("Index:", i, ", Size:"));
            return;
        }
        long[] jArr = this.b;
        if (i2 < jArr.length) {
            System.arraycopy(jArr, i, jArr, i + 1, i2 - i);
        } else {
            long[] jArr2 = new long[((i2 * 3) / 2) + 1];
            System.arraycopy(jArr, 0, jArr2, 0, i);
            System.arraycopy(this.b, i, jArr2, i + 1, this.c - i);
            this.b = jArr2;
        }
        this.b[i] = jLongValue;
        this.c++;
        ((AbstractList) this).modCount++;
    }

    @Override // defpackage.a2, java.util.AbstractCollection, java.util.Collection, java.util.List
    public final boolean addAll(Collection collection) {
        d();
        Charset charset = v56.a;
        collection.getClass();
        if (!(collection instanceof ka7)) {
            return super.addAll(collection);
        }
        ka7 ka7Var = (ka7) collection;
        int i = ka7Var.c;
        if (i == 0) {
            return false;
        }
        int i2 = this.c;
        if (Integer.MAX_VALUE - i2 < i) {
            throw new OutOfMemoryError();
        }
        int i3 = i2 + i;
        long[] jArrCopyOf = this.b;
        if (i3 > jArrCopyOf.length) {
            jArrCopyOf = Arrays.copyOf(jArrCopyOf, i3);
            this.b = jArrCopyOf;
        }
        System.arraycopy(ka7Var.b, 0, jArrCopyOf, this.c, ka7Var.c);
        this.c = i3;
        ((AbstractList) this).modCount++;
        return true;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final boolean contains(Object obj) {
        return indexOf(obj) != -1;
    }

    public final void e(long j) {
        d();
        int i = this.c;
        long[] jArr = this.b;
        if (i == jArr.length) {
            long[] jArr2 = new long[((i * 3) / 2) + 1];
            System.arraycopy(jArr, 0, jArr2, 0, i);
            this.b = jArr2;
            jArr = jArr2;
        }
        int i2 = this.c;
        this.c = i2 + 1;
        jArr[i2] = j;
    }

    @Override // defpackage.a2, java.util.AbstractList, java.util.Collection, java.util.List
    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof ka7)) {
            return super.equals(obj);
        }
        ka7 ka7Var = (ka7) obj;
        if (this.c != ka7Var.c) {
            return false;
        }
        long[] jArr = ka7Var.b;
        for (int i = 0; i < this.c; i++) {
            if (this.b[i] != jArr[i]) {
                return false;
            }
        }
        return true;
    }

    public final void f(int i) {
        if (i < 0 || i >= this.c) {
            ik4.e(this.c, ev6.C("Index:", i, ", Size:"));
        }
    }

    @Override // java.util.AbstractList, java.util.List
    public final Object get(int i) {
        f(i);
        return Long.valueOf(this.b[i]);
    }

    @Override // defpackage.t56
    public final t56 h(int i) {
        if (i >= this.c) {
            return new ka7(this.c, Arrays.copyOf(this.b, i));
        }
        lg8.r();
        return null;
    }

    @Override // defpackage.a2, java.util.AbstractList, java.util.Collection, java.util.List
    public final int hashCode() {
        int iB = 1;
        for (int i = 0; i < this.c; i++) {
            iB = (iB * 31) + v56.b(this.b[i]);
        }
        return iB;
    }

    @Override // java.util.AbstractList, java.util.List
    public final int indexOf(Object obj) {
        if (!(obj instanceof Long)) {
            return -1;
        }
        long jLongValue = ((Long) obj).longValue();
        int i = this.c;
        for (int i2 = 0; i2 < i; i2++) {
            if (this.b[i2] == jLongValue) {
                return i2;
            }
        }
        return -1;
    }

    @Override // defpackage.a2, java.util.AbstractList, java.util.List
    public final Object remove(int i) {
        d();
        f(i);
        long[] jArr = this.b;
        long j = jArr[i];
        if (i < this.c - 1) {
            System.arraycopy(jArr, i + 1, jArr, i, (r3 - i) - 1);
        }
        this.c--;
        ((AbstractList) this).modCount++;
        return Long.valueOf(j);
    }

    @Override // java.util.AbstractList
    public final void removeRange(int i, int i2) {
        d();
        if (i2 < i) {
            z10.i("toIndex < fromIndex");
            return;
        }
        long[] jArr = this.b;
        System.arraycopy(jArr, i2, jArr, i, this.c - i2);
        this.c -= i2 - i;
        ((AbstractList) this).modCount++;
    }

    @Override // java.util.AbstractList, java.util.List
    public final Object set(int i, Object obj) {
        long jLongValue = ((Long) obj).longValue();
        d();
        f(i);
        long[] jArr = this.b;
        long j = jArr[i];
        jArr[i] = jLongValue;
        return Long.valueOf(j);
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final int size() {
        return this.c;
    }

    @Override // defpackage.a2, java.util.AbstractList, java.util.AbstractCollection, java.util.Collection, java.util.List
    public final boolean add(Object obj) {
        e(((Long) obj).longValue());
        return true;
    }
}
