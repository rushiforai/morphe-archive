package defpackage;

import java.nio.charset.Charset;
import java.util.AbstractList;
import java.util.Arrays;
import java.util.Collection;
import java.util.RandomAccess;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class jn4 extends a2 implements q56, RandomAccess, s0a {
    public static final jn4 d;
    public float[] b;
    public int c;

    static {
        jn4 jn4Var = new jn4(0, new float[0]);
        d = jn4Var;
        jn4Var.a = false;
    }

    public jn4(int i, float[] fArr) {
        this.b = fArr;
        this.c = i;
    }

    @Override // java.util.AbstractList, java.util.List
    public final void add(int i, Object obj) {
        int i2;
        float fFloatValue = ((Float) obj).floatValue();
        d();
        if (i < 0 || i > (i2 = this.c)) {
            ik4.e(this.c, ev6.C("Index:", i, ", Size:"));
            return;
        }
        float[] fArr = this.b;
        if (i2 < fArr.length) {
            System.arraycopy(fArr, i, fArr, i + 1, i2 - i);
        } else {
            float[] fArr2 = new float[((i2 * 3) / 2) + 1];
            System.arraycopy(fArr, 0, fArr2, 0, i);
            System.arraycopy(this.b, i, fArr2, i + 1, this.c - i);
            this.b = fArr2;
        }
        this.b[i] = fFloatValue;
        this.c++;
        ((AbstractList) this).modCount++;
    }

    @Override // defpackage.a2, java.util.AbstractCollection, java.util.Collection, java.util.List
    public final boolean addAll(Collection collection) {
        d();
        Charset charset = v56.a;
        collection.getClass();
        if (!(collection instanceof jn4)) {
            return super.addAll(collection);
        }
        jn4 jn4Var = (jn4) collection;
        int i = jn4Var.c;
        if (i == 0) {
            return false;
        }
        int i2 = this.c;
        if (Integer.MAX_VALUE - i2 < i) {
            throw new OutOfMemoryError();
        }
        int i3 = i2 + i;
        float[] fArrCopyOf = this.b;
        if (i3 > fArrCopyOf.length) {
            fArrCopyOf = Arrays.copyOf(fArrCopyOf, i3);
            this.b = fArrCopyOf;
        }
        System.arraycopy(jn4Var.b, 0, fArrCopyOf, this.c, jn4Var.c);
        this.c = i3;
        ((AbstractList) this).modCount++;
        return true;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final boolean contains(Object obj) {
        return indexOf(obj) != -1;
    }

    public final void e(float f) {
        d();
        int i = this.c;
        float[] fArr = this.b;
        if (i == fArr.length) {
            float[] fArr2 = new float[((i * 3) / 2) + 1];
            System.arraycopy(fArr, 0, fArr2, 0, i);
            this.b = fArr2;
            fArr = fArr2;
        }
        int i2 = this.c;
        this.c = i2 + 1;
        fArr[i2] = f;
    }

    @Override // defpackage.a2, java.util.AbstractList, java.util.Collection, java.util.List
    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof jn4)) {
            return super.equals(obj);
        }
        jn4 jn4Var = (jn4) obj;
        if (this.c != jn4Var.c) {
            return false;
        }
        float[] fArr = jn4Var.b;
        for (int i = 0; i < this.c; i++) {
            if (Float.floatToIntBits(this.b[i]) != Float.floatToIntBits(fArr[i])) {
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
        return Float.valueOf(this.b[i]);
    }

    @Override // defpackage.t56
    public final t56 h(int i) {
        if (i >= this.c) {
            return new jn4(this.c, Arrays.copyOf(this.b, i));
        }
        lg8.r();
        return null;
    }

    @Override // defpackage.a2, java.util.AbstractList, java.util.Collection, java.util.List
    public final int hashCode() {
        int iFloatToIntBits = 1;
        for (int i = 0; i < this.c; i++) {
            iFloatToIntBits = (iFloatToIntBits * 31) + Float.floatToIntBits(this.b[i]);
        }
        return iFloatToIntBits;
    }

    @Override // java.util.AbstractList, java.util.List
    public final int indexOf(Object obj) {
        if (!(obj instanceof Float)) {
            return -1;
        }
        float fFloatValue = ((Float) obj).floatValue();
        int i = this.c;
        for (int i2 = 0; i2 < i; i2++) {
            if (this.b[i2] == fFloatValue) {
                return i2;
            }
        }
        return -1;
    }

    @Override // defpackage.a2, java.util.AbstractList, java.util.List
    public final Object remove(int i) {
        d();
        f(i);
        float[] fArr = this.b;
        float f = fArr[i];
        if (i < this.c - 1) {
            System.arraycopy(fArr, i + 1, fArr, i, (r2 - i) - 1);
        }
        this.c--;
        ((AbstractList) this).modCount++;
        return Float.valueOf(f);
    }

    @Override // java.util.AbstractList
    public final void removeRange(int i, int i2) {
        d();
        if (i2 < i) {
            z10.i("toIndex < fromIndex");
            return;
        }
        float[] fArr = this.b;
        System.arraycopy(fArr, i2, fArr, i, this.c - i2);
        this.c -= i2 - i;
        ((AbstractList) this).modCount++;
    }

    @Override // java.util.AbstractList, java.util.List
    public final Object set(int i, Object obj) {
        float fFloatValue = ((Float) obj).floatValue();
        d();
        f(i);
        float[] fArr = this.b;
        float f = fArr[i];
        fArr[i] = fFloatValue;
        return Float.valueOf(f);
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final int size() {
        return this.c;
    }

    @Override // defpackage.a2, java.util.AbstractList, java.util.AbstractCollection, java.util.Collection, java.util.List
    public final boolean add(Object obj) {
        e(((Float) obj).floatValue());
        return true;
    }
}
