package ads_mobile_sdk;

import androidx.compose.ui.node.LayoutNode;
import b.c0;
import b.j6;
import b.k9;
import b.oc;
import java.util.AbstractList;
import java.util.Arrays;
import java.util.Collection;
import java.util.RandomAccess;

/* loaded from: classes2.dex */
public final class jb1 extends j implements j6, RandomAccess, oc {

    /* renamed from: d, reason: collision with root package name */
    public static final int[] f5201d;

    /* renamed from: e, reason: collision with root package name */
    public static final jb1 f5202e;

    /* renamed from: b, reason: collision with root package name */
    public int[] f5203b;

    /* renamed from: c, reason: collision with root package name */
    public int f5204c;

    static {
        int[] iArr = new int[0];
        f5201d = iArr;
        f5202e = new jb1(iArr, 0, false);
    }

    public jb1(int[] iArr, int i5, boolean z11) {
        super(z11);
        this.f5203b = iArr;
        this.f5204c = i5;
    }

    @Override // java.util.AbstractList, java.util.List
    public final void add(int i5, Object obj) {
        int i11;
        int iIntValue = ((Integer) obj).intValue();
        a$1();
        if (i5 < 0 || i5 > (i11 = this.f5204c)) {
            throw new IndexOutOfBoundsException(c0.g(i5, this.f5204c, "Index:", ", Size:"));
        }
        int[] iArr = this.f5203b;
        if (i11 < iArr.length) {
            System.arraycopy(iArr, i5, iArr, i5 + 1, i11 - i5);
        } else {
            int[] iArr2 = new int[k9.a(iArr.length)];
            System.arraycopy(this.f5203b, 0, iArr2, 0, i5);
            System.arraycopy(this.f5203b, i5, iArr2, i5 + 1, this.f5204c - i5);
            this.f5203b = iArr2;
        }
        this.f5203b[i5] = iIntValue;
        this.f5204c++;
        ((AbstractList) this).modCount++;
    }

    @Override // ads_mobile_sdk.j, java.util.AbstractCollection, java.util.Collection, java.util.List
    public final boolean addAll(Collection collection) {
        a$1();
        byte[] bArr = rb1.f9048a;
        collection.getClass();
        if (!(collection instanceof jb1)) {
            return super.addAll(collection);
        }
        jb1 jb1Var = (jb1) collection;
        int i5 = jb1Var.f5204c;
        if (i5 == 0) {
            return false;
        }
        int i11 = this.f5204c;
        if (LayoutNode.NotPlacedPlaceOrder - i11 < i5) {
            throw new OutOfMemoryError();
        }
        int i12 = i11 + i5;
        int[] iArr = this.f5203b;
        if (i12 > iArr.length) {
            this.f5203b = Arrays.copyOf(iArr, i12);
        }
        System.arraycopy(jb1Var.f5203b, 0, this.f5203b, this.f5204c, jb1Var.f5204c);
        this.f5204c = i12;
        ((AbstractList) this).modCount++;
        return true;
    }

    public final void b(int i5) {
        a$1();
        int i11 = this.f5204c;
        int[] iArr = this.f5203b;
        if (i11 == iArr.length) {
            int[] iArr2 = new int[k9.a(iArr.length)];
            System.arraycopy(this.f5203b, 0, iArr2, 0, this.f5204c);
            this.f5203b = iArr2;
        }
        int[] iArr3 = this.f5203b;
        int i12 = this.f5204c;
        this.f5204c = i12 + 1;
        iArr3[i12] = i5;
    }

    public final void c(int i5) {
        int[] iArr = this.f5203b;
        if (i5 <= iArr.length) {
            return;
        }
        if (iArr.length == 0) {
            this.f5203b = new int[Math.max(i5, 10)];
            return;
        }
        int length = iArr.length;
        while (length < i5) {
            length = k9.a(length);
        }
        this.f5203b = Arrays.copyOf(this.f5203b, length);
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final boolean contains(Object obj) {
        return indexOf(obj) != -1;
    }

    public final void d(int i5) {
        if (i5 < 0 || i5 >= this.f5204c) {
            throw new IndexOutOfBoundsException(c0.g(i5, this.f5204c, "Index:", ", Size:"));
        }
    }

    @Override // ads_mobile_sdk.j, java.util.AbstractList, java.util.Collection, java.util.List
    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof jb1)) {
            return super.equals(obj);
        }
        jb1 jb1Var = (jb1) obj;
        if (this.f5204c != jb1Var.f5204c) {
            return false;
        }
        int[] iArr = jb1Var.f5203b;
        for (int i5 = 0; i5 < this.f5204c; i5++) {
            if (this.f5203b[i5] != iArr[i5]) {
                return false;
            }
        }
        return true;
    }

    @Override // b.e9
    /* renamed from: f, reason: merged with bridge method [inline-methods] */
    public final jb1 a(int i5) {
        if (i5 >= this.f5204c) {
            return new jb1(i5 == 0 ? f5201d : Arrays.copyOf(this.f5203b, i5), this.f5204c, true);
        }
        throw new IllegalArgumentException();
    }

    @Override // java.util.AbstractList, java.util.List
    public final Object get(int i5) {
        d(i5);
        return Integer.valueOf(this.f5203b[i5]);
    }

    @Override // java.util.AbstractList, java.util.Collection, java.util.List
    public final int hashCode() {
        int i5 = 1;
        for (int i11 = 0; i11 < this.f5204c; i11++) {
            i5 = (i5 * 31) + this.f5203b[i11];
        }
        return i5;
    }

    @Override // java.util.AbstractList, java.util.List
    public final int indexOf(Object obj) {
        if (!(obj instanceof Integer)) {
            return -1;
        }
        int iIntValue = ((Integer) obj).intValue();
        int i5 = this.f5204c;
        for (int i11 = 0; i11 < i5; i11++) {
            if (this.f5203b[i11] == iIntValue) {
                return i11;
            }
        }
        return -1;
    }

    @Override // ads_mobile_sdk.j, java.util.AbstractList, java.util.List
    public final Object remove(int i5) {
        a$1();
        d(i5);
        int[] iArr = this.f5203b;
        int i11 = iArr[i5];
        if (i5 < this.f5204c - 1) {
            System.arraycopy(iArr, i5 + 1, iArr, i5, (r2 - i5) - 1);
        }
        this.f5204c--;
        ((AbstractList) this).modCount++;
        return Integer.valueOf(i11);
    }

    @Override // java.util.AbstractList
    public final void removeRange(int i5, int i11) {
        a$1();
        if (i11 < i5) {
            throw new IndexOutOfBoundsException("toIndex < fromIndex");
        }
        int[] iArr = this.f5203b;
        System.arraycopy(iArr, i11, iArr, i5, this.f5204c - i11);
        this.f5204c -= i11 - i5;
        ((AbstractList) this).modCount++;
    }

    @Override // java.util.AbstractList, java.util.List
    public final Object set(int i5, Object obj) {
        int iIntValue = ((Integer) obj).intValue();
        a$1();
        d(i5);
        int[] iArr = this.f5203b;
        int i11 = iArr[i5];
        iArr[i5] = iIntValue;
        return Integer.valueOf(i11);
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final int size() {
        return this.f5204c;
    }

    @Override // java.util.AbstractList, java.util.AbstractCollection, java.util.Collection, java.util.List
    public final boolean add(Object obj) {
        b(((Integer) obj).intValue());
        return true;
    }
}
