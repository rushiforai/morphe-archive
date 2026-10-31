package androidx.datastore.preferences.protobuf;

import b.u4;
import java.util.AbstractList;
import java.util.Arrays;
import java.util.RandomAccess;

/* loaded from: classes2.dex */
public final class x0 extends b implements RandomAccess {

    /* renamed from: d, reason: collision with root package name */
    public static final x0 f14429d = new x0(new Object[0], 0, false);

    /* renamed from: b, reason: collision with root package name */
    public Object[] f14430b;

    /* renamed from: c, reason: collision with root package name */
    public int f14431c;

    public x0(Object[] objArr, int i5, boolean z11) {
        this.f14277a = z11;
        this.f14430b = objArr;
        this.f14431c = i5;
    }

    public static x0 e() {
        return f14429d;
    }

    @Override // java.util.AbstractList, java.util.AbstractCollection, java.util.Collection, java.util.List
    public final boolean add(Object obj) {
        c();
        int i5 = this.f14431c;
        Object[] objArr = this.f14430b;
        if (i5 == objArr.length) {
            this.f14430b = Arrays.copyOf(objArr, ((i5 * 3) / 2) + 1);
        }
        Object[] objArr2 = this.f14430b;
        int i11 = this.f14431c;
        this.f14431c = i11 + 1;
        objArr2[i11] = obj;
        ((AbstractList) this).modCount++;
        return true;
    }

    public final void f(int i5) {
        if (i5 < 0 || i5 >= this.f14431c) {
            StringBuilder sbJ = u4.j(i5, "Index:", ", Size:");
            sbJ.append(this.f14431c);
            throw new IndexOutOfBoundsException(sbJ.toString());
        }
    }

    public final x0 g(int i5) {
        if (i5 >= this.f14431c) {
            return new x0(Arrays.copyOf(this.f14430b, i5), this.f14431c, true);
        }
        throw new IllegalArgumentException();
    }

    @Override // java.util.AbstractList, java.util.List
    public final Object get(int i5) {
        f(i5);
        return this.f14430b[i5];
    }

    @Override // androidx.datastore.preferences.protobuf.b, java.util.AbstractList, java.util.List
    public final Object remove(int i5) {
        c();
        f(i5);
        Object[] objArr = this.f14430b;
        Object obj = objArr[i5];
        if (i5 < this.f14431c - 1) {
            System.arraycopy(objArr, i5 + 1, objArr, i5, (r2 - i5) - 1);
        }
        this.f14431c--;
        ((AbstractList) this).modCount++;
        return obj;
    }

    @Override // java.util.AbstractList, java.util.List
    public final Object set(int i5, Object obj) {
        c();
        f(i5);
        Object[] objArr = this.f14430b;
        Object obj2 = objArr[i5];
        objArr[i5] = obj;
        ((AbstractList) this).modCount++;
        return obj2;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final int size() {
        return this.f14431c;
    }

    @Override // java.util.AbstractList, java.util.List
    public final void add(int i5, Object obj) {
        int i11;
        c();
        if (i5 >= 0 && i5 <= (i11 = this.f14431c)) {
            Object[] objArr = this.f14430b;
            if (i11 < objArr.length) {
                System.arraycopy(objArr, i5, objArr, i5 + 1, i11 - i5);
            } else {
                Object[] objArr2 = new Object[a2.c.A(i11, 3, 2, 1)];
                System.arraycopy(objArr, 0, objArr2, 0, i5);
                System.arraycopy(this.f14430b, i5, objArr2, i5 + 1, this.f14431c - i5);
                this.f14430b = objArr2;
            }
            this.f14430b[i5] = obj;
            this.f14431c++;
            ((AbstractList) this).modCount++;
            return;
        }
        StringBuilder sbJ = u4.j(i5, "Index:", ", Size:");
        sbJ.append(this.f14431c);
        throw new IndexOutOfBoundsException(sbJ.toString());
    }
}
