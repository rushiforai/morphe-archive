package defpackage;

import java.util.AbstractList;
import java.util.Arrays;
import java.util.RandomAccess;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class v7a extends a2 implements RandomAccess {
    public static final v7a d;
    public Object[] b;
    public int c;

    static {
        v7a v7aVar = new v7a(0, new Object[0]);
        d = v7aVar;
        v7aVar.a = false;
    }

    public v7a(int i, Object[] objArr) {
        this.b = objArr;
        this.c = i;
    }

    @Override // java.util.AbstractList, java.util.List
    public final void add(int i, Object obj) {
        int i2;
        d();
        if (i < 0 || i > (i2 = this.c)) {
            ik4.e(this.c, ev6.C("Index:", i, ", Size:"));
            return;
        }
        Object[] objArr = this.b;
        if (i2 < objArr.length) {
            System.arraycopy(objArr, i, objArr, i + 1, i2 - i);
        } else {
            Object[] objArr2 = new Object[((i2 * 3) / 2) + 1];
            System.arraycopy(objArr, 0, objArr2, 0, i);
            System.arraycopy(this.b, i, objArr2, i + 1, this.c - i);
            this.b = objArr2;
        }
        this.b[i] = obj;
        this.c++;
        ((AbstractList) this).modCount++;
    }

    public final void e(int i) {
        if (i < 0 || i >= this.c) {
            ik4.e(this.c, ev6.C("Index:", i, ", Size:"));
        }
    }

    @Override // java.util.AbstractList, java.util.List
    public final Object get(int i) {
        e(i);
        return this.b[i];
    }

    @Override // defpackage.t56
    public final t56 h(int i) {
        if (i >= this.c) {
            return new v7a(this.c, Arrays.copyOf(this.b, i));
        }
        lg8.r();
        return null;
    }

    @Override // defpackage.a2, java.util.AbstractList, java.util.List
    public final Object remove(int i) {
        d();
        e(i);
        Object[] objArr = this.b;
        Object obj = objArr[i];
        if (i < this.c - 1) {
            System.arraycopy(objArr, i + 1, objArr, i, (r2 - i) - 1);
        }
        this.c--;
        ((AbstractList) this).modCount++;
        return obj;
    }

    @Override // java.util.AbstractList, java.util.List
    public final Object set(int i, Object obj) {
        d();
        e(i);
        Object[] objArr = this.b;
        Object obj2 = objArr[i];
        objArr[i] = obj;
        ((AbstractList) this).modCount++;
        return obj2;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final int size() {
        return this.c;
    }

    @Override // defpackage.a2, java.util.AbstractList, java.util.AbstractCollection, java.util.Collection, java.util.List
    public final boolean add(Object obj) {
        d();
        int i = this.c;
        Object[] objArrCopyOf = this.b;
        if (i == objArrCopyOf.length) {
            objArrCopyOf = Arrays.copyOf(objArrCopyOf, ((i * 3) / 2) + 1);
            this.b = objArrCopyOf;
        }
        int i2 = this.c;
        this.c = i2 + 1;
        objArrCopyOf[i2] = obj;
        ((AbstractList) this).modCount++;
        return true;
    }
}
