package ads_mobile_sdk;

import b.c0;
import b.e9;
import b.k9;
import java.io.Serializable;
import java.util.AbstractList;
import java.util.Arrays;
import java.util.List;
import java.util.RandomAccess;

/* loaded from: classes.dex */
public final class in2 extends j implements RandomAccess, Serializable {

    /* renamed from: d, reason: collision with root package name */
    public static final Object[] f4886d;

    /* renamed from: e, reason: collision with root package name */
    public static final in2 f4887e;

    /* renamed from: b, reason: collision with root package name */
    public Object[] f4888b;

    /* renamed from: c, reason: collision with root package name */
    public int f4889c;

    static {
        Object[] objArr = new Object[0];
        f4886d = objArr;
        f4887e = new in2(objArr, 0, false);
    }

    public in2(Object[] objArr, int i5, boolean z11) {
        super(z11);
        this.f4888b = objArr;
        this.f4889c = i5;
    }

    @Override // b.e9
    public final e9 a(int i5) {
        if (i5 >= this.f4889c) {
            return new in2(i5 == 0 ? f4886d : Arrays.copyOf(this.f4888b, i5), this.f4889c, true);
        }
        throw new IllegalArgumentException();
    }

    @Override // java.util.AbstractList, java.util.List
    public final void add(int i5, Object obj) {
        int i11;
        a$1();
        if (i5 < 0 || i5 > (i11 = this.f4889c)) {
            throw new IndexOutOfBoundsException(c(i5));
        }
        Object[] objArr = this.f4888b;
        if (i11 < objArr.length) {
            System.arraycopy(objArr, i5, objArr, i5 + 1, i11 - i5);
        } else {
            Object[] objArr2 = new Object[k9.a(objArr.length)];
            System.arraycopy(this.f4888b, 0, objArr2, 0, i5);
            System.arraycopy(this.f4888b, i5, objArr2, i5 + 1, this.f4889c - i5);
            this.f4888b = objArr2;
        }
        this.f4888b[i5] = obj;
        this.f4889c++;
        ((AbstractList) this).modCount++;
    }

    public final String c(int i5) {
        return c0.g(i5, this.f4889c, "Index:", ", Size:");
    }

    @Override // ads_mobile_sdk.j, java.util.AbstractList, java.util.Collection, java.util.List
    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof List)) {
            return false;
        }
        if (!(obj instanceof RandomAccess)) {
            return super.equals(obj);
        }
        List list = (List) obj;
        int i5 = this.f4889c;
        if (i5 != list.size()) {
            return false;
        }
        if (!(obj instanceof in2)) {
            for (int i11 = 0; i11 < i5; i11++) {
                if (!this.f4888b[i11].equals(list.get(i11))) {
                    return false;
                }
            }
            return true;
        }
        in2 in2Var = (in2) obj;
        for (int i12 = 0; i12 < i5; i12++) {
            if (!this.f4888b[i12].equals(in2Var.f4888b[i12])) {
                return false;
            }
        }
        return true;
    }

    @Override // java.util.AbstractList, java.util.List
    public final Object get(int i5) {
        if (i5 < 0 || i5 >= this.f4889c) {
            throw new IndexOutOfBoundsException(c(i5));
        }
        return this.f4888b[i5];
    }

    @Override // java.util.AbstractList, java.util.Collection, java.util.List
    public final int hashCode() {
        int i5 = this.f4889c;
        int iHashCode = 1;
        for (int i11 = 0; i11 < i5; i11++) {
            iHashCode = (iHashCode * 31) + this.f4888b[i11].hashCode();
        }
        return iHashCode;
    }

    @Override // ads_mobile_sdk.j, java.util.AbstractList, java.util.List
    public final Object remove(int i5) {
        int i11;
        a$1();
        if (i5 < 0 || i5 >= (i11 = this.f4889c)) {
            throw new IndexOutOfBoundsException(c(i5));
        }
        Object[] objArr = this.f4888b;
        Object obj = objArr[i5];
        if (i5 < i11 - 1) {
            System.arraycopy(objArr, i5 + 1, objArr, i5, (i11 - i5) - 1);
        }
        this.f4889c--;
        ((AbstractList) this).modCount++;
        return obj;
    }

    @Override // java.util.AbstractList, java.util.List
    public final Object set(int i5, Object obj) {
        a$1();
        if (i5 < 0 || i5 >= this.f4889c) {
            throw new IndexOutOfBoundsException(c(i5));
        }
        Object[] objArr = this.f4888b;
        Object obj2 = objArr[i5];
        objArr[i5] = obj;
        ((AbstractList) this).modCount++;
        return obj2;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final int size() {
        return this.f4889c;
    }

    @Override // java.util.AbstractList, java.util.AbstractCollection, java.util.Collection, java.util.List
    public final boolean add(Object obj) {
        a$1();
        int i5 = this.f4889c;
        Object[] objArr = this.f4888b;
        if (i5 == objArr.length) {
            this.f4888b = Arrays.copyOf(this.f4888b, k9.a(objArr.length));
        }
        Object[] objArr2 = this.f4888b;
        int i11 = this.f4889c;
        this.f4889c = i11 + 1;
        objArr2[i11] = obj;
        ((AbstractList) this).modCount++;
        return true;
    }
}
