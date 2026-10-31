package ads_mobile_sdk;

import androidx.compose.ui.node.LayoutNode;
import b.c0;
import b.k9;
import b.oc;
import java.util.AbstractList;
import java.util.Arrays;
import java.util.Collection;
import java.util.RandomAccess;

/* loaded from: classes2.dex */
public final class wm1 extends j implements b.k8, RandomAccess, oc {

    /* renamed from: d, reason: collision with root package name */
    public static final long[] f11334d;

    /* renamed from: e, reason: collision with root package name */
    public static final wm1 f11335e;

    /* renamed from: b, reason: collision with root package name */
    public long[] f11336b;

    /* renamed from: c, reason: collision with root package name */
    public int f11337c;

    static {
        long[] jArr = new long[0];
        f11334d = jArr;
        f11335e = new wm1(jArr, 0, false);
    }

    public wm1(long[] jArr, int i5, boolean z11) {
        super(z11);
        this.f11336b = jArr;
        this.f11337c = i5;
    }

    public final void a(long j11) {
        a$1();
        int i5 = this.f11337c;
        long[] jArr = this.f11336b;
        if (i5 == jArr.length) {
            long[] jArr2 = new long[k9.a(jArr.length)];
            System.arraycopy(this.f11336b, 0, jArr2, 0, this.f11337c);
            this.f11336b = jArr2;
        }
        long[] jArr3 = this.f11336b;
        int i11 = this.f11337c;
        this.f11337c = i11 + 1;
        jArr3[i11] = j11;
    }

    @Override // java.util.AbstractList, java.util.List
    public final void add(int i5, Object obj) {
        int i11;
        long jLongValue = ((Long) obj).longValue();
        a$1();
        if (i5 < 0 || i5 > (i11 = this.f11337c)) {
            throw new IndexOutOfBoundsException(c0.g(i5, this.f11337c, "Index:", ", Size:"));
        }
        long[] jArr = this.f11336b;
        if (i11 < jArr.length) {
            System.arraycopy(jArr, i5, jArr, i5 + 1, i11 - i5);
        } else {
            long[] jArr2 = new long[k9.a(jArr.length)];
            System.arraycopy(this.f11336b, 0, jArr2, 0, i5);
            System.arraycopy(this.f11336b, i5, jArr2, i5 + 1, this.f11337c - i5);
            this.f11336b = jArr2;
        }
        this.f11336b[i5] = jLongValue;
        this.f11337c++;
        ((AbstractList) this).modCount++;
    }

    @Override // ads_mobile_sdk.j, java.util.AbstractCollection, java.util.Collection, java.util.List
    public final boolean addAll(Collection collection) {
        a$1();
        byte[] bArr = rb1.f9048a;
        collection.getClass();
        if (!(collection instanceof wm1)) {
            return super.addAll(collection);
        }
        wm1 wm1Var = (wm1) collection;
        int i5 = wm1Var.f11337c;
        if (i5 == 0) {
            return false;
        }
        int i11 = this.f11337c;
        if (LayoutNode.NotPlacedPlaceOrder - i11 < i5) {
            throw new OutOfMemoryError();
        }
        int i12 = i11 + i5;
        long[] jArr = this.f11336b;
        if (i12 > jArr.length) {
            this.f11336b = Arrays.copyOf(jArr, i12);
        }
        System.arraycopy(wm1Var.f11336b, 0, this.f11336b, this.f11337c, wm1Var.f11337c);
        this.f11337c = i12;
        ((AbstractList) this).modCount++;
        return true;
    }

    public final void b(int i5) {
        long[] jArr = this.f11336b;
        if (i5 <= jArr.length) {
            return;
        }
        if (jArr.length == 0) {
            this.f11336b = new long[Math.max(i5, 10)];
            return;
        }
        int length = jArr.length;
        while (length < i5) {
            length = k9.a(length);
        }
        this.f11336b = Arrays.copyOf(this.f11336b, length);
    }

    public final void c(int i5) {
        if (i5 < 0 || i5 >= this.f11337c) {
            throw new IndexOutOfBoundsException(c0.g(i5, this.f11337c, "Index:", ", Size:"));
        }
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final boolean contains(Object obj) {
        return indexOf(obj) != -1;
    }

    @Override // b.e9
    /* renamed from: e, reason: merged with bridge method [inline-methods] */
    public final wm1 a(int i5) {
        if (i5 >= this.f11337c) {
            return new wm1(i5 == 0 ? f11334d : Arrays.copyOf(this.f11336b, i5), this.f11337c, true);
        }
        throw new IllegalArgumentException();
    }

    @Override // ads_mobile_sdk.j, java.util.AbstractList, java.util.Collection, java.util.List
    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof wm1)) {
            return super.equals(obj);
        }
        wm1 wm1Var = (wm1) obj;
        if (this.f11337c != wm1Var.f11337c) {
            return false;
        }
        long[] jArr = wm1Var.f11336b;
        for (int i5 = 0; i5 < this.f11337c; i5++) {
            if (this.f11336b[i5] != jArr[i5]) {
                return false;
            }
        }
        return true;
    }

    @Override // java.util.AbstractList, java.util.List
    public final Object get(int i5) {
        c(i5);
        return Long.valueOf(this.f11336b[i5]);
    }

    @Override // java.util.AbstractList, java.util.Collection, java.util.List
    public final int hashCode() {
        int i5 = 1;
        for (int i11 = 0; i11 < this.f11337c; i11++) {
            long j11 = this.f11336b[i11];
            byte[] bArr = rb1.f9048a;
            i5 = (i5 * 31) + ((int) (j11 ^ (j11 >>> 32)));
        }
        return i5;
    }

    @Override // java.util.AbstractList, java.util.List
    public final int indexOf(Object obj) {
        if (!(obj instanceof Long)) {
            return -1;
        }
        long jLongValue = ((Long) obj).longValue();
        int i5 = this.f11337c;
        for (int i11 = 0; i11 < i5; i11++) {
            if (this.f11336b[i11] == jLongValue) {
                return i11;
            }
        }
        return -1;
    }

    @Override // ads_mobile_sdk.j, java.util.AbstractList, java.util.List
    public final Object remove(int i5) {
        a$1();
        c(i5);
        long[] jArr = this.f11336b;
        long j11 = jArr[i5];
        if (i5 < this.f11337c - 1) {
            System.arraycopy(jArr, i5 + 1, jArr, i5, (r3 - i5) - 1);
        }
        this.f11337c--;
        ((AbstractList) this).modCount++;
        return Long.valueOf(j11);
    }

    @Override // java.util.AbstractList
    public final void removeRange(int i5, int i11) {
        a$1();
        if (i11 < i5) {
            throw new IndexOutOfBoundsException("toIndex < fromIndex");
        }
        long[] jArr = this.f11336b;
        System.arraycopy(jArr, i11, jArr, i5, this.f11337c - i11);
        this.f11337c -= i11 - i5;
        ((AbstractList) this).modCount++;
    }

    @Override // java.util.AbstractList, java.util.List
    public final Object set(int i5, Object obj) {
        long jLongValue = ((Long) obj).longValue();
        a$1();
        c(i5);
        long[] jArr = this.f11336b;
        long j11 = jArr[i5];
        jArr[i5] = jLongValue;
        return Long.valueOf(j11);
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final int size() {
        return this.f11337c;
    }

    @Override // java.util.AbstractList, java.util.AbstractCollection, java.util.Collection, java.util.List
    public final boolean add(Object obj) {
        a(((Long) obj).longValue());
        return true;
    }
}
