package defpackage;

import java.util.AbstractList;
import java.util.Arrays;
import java.util.List;
import java.util.RandomAccess;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class qof extends fmf implements RandomAccess {
    public static final Object[] d;
    public static final qof e;
    public Object[] b;
    public int c;

    static {
        Object[] objArr = new Object[0];
        d = objArr;
        e = new qof(objArr, 0, false);
    }

    public qof(Object[] objArr, int i, boolean z) {
        super(z);
        this.b = objArr;
        this.c = i;
    }

    @Override // java.util.AbstractList, java.util.List
    public final void add(int i, Object obj) {
        int i2;
        d();
        if (i < 0 || i > (i2 = this.c)) {
            z10.i(hmf.a(this.c, i, (byte) 13, "Index:", ", Size:"));
            return;
        }
        int i3 = i + 1;
        Object[] objArr = this.b;
        int length = objArr.length;
        if (i2 < length) {
            System.arraycopy(objArr, i, objArr, i3, i2 - i);
        } else {
            Object[] objArr2 = new Object[wgd.n(length, 3, 2, 1, 10)];
            System.arraycopy(this.b, 0, objArr2, 0, i);
            System.arraycopy(this.b, i, objArr2, i3, this.c - i);
            this.b = objArr2;
        }
        this.b[i] = obj;
        this.c++;
        ((AbstractList) this).modCount++;
    }

    public final void e(int i) {
        if (i < 0 || i >= this.c) {
            z10.i(hmf.a(this.c, i, (byte) 13, "Index:", ", Size:"));
        }
    }

    @Override // defpackage.fmf, java.util.AbstractList, java.util.Collection, java.util.List
    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (obj instanceof List) {
            if (!(obj instanceof RandomAccess)) {
                return super.equals(obj);
            }
            List list = (List) obj;
            int i = this.c;
            if (i == list.size()) {
                if (!(obj instanceof qof)) {
                    for (int i2 = 0; i2 < i; i2++) {
                        if (this.b[i2].equals(list.get(i2))) {
                        }
                    }
                    return true;
                }
                qof qofVar = (qof) obj;
                for (int i3 = 0; i3 < i; i3++) {
                    if (this.b[i3].equals(qofVar.b[i3])) {
                    }
                }
                return true;
            }
        }
        return false;
    }

    @Override // java.util.AbstractList, java.util.List
    public final Object get(int i) {
        e(i);
        return this.b[i];
    }

    @Override // java.util.AbstractList, java.util.Collection, java.util.List
    public final int hashCode() {
        int i = this.c;
        int iHashCode = 1;
        for (int i2 = 0; i2 < i; i2++) {
            iHashCode = (iHashCode * 31) + this.b[i2].hashCode();
        }
        return iHashCode;
    }

    @Override // defpackage.snf
    public final /* bridge */ /* synthetic */ snf n(int i) {
        if (i >= this.c) {
            return new qof(i == 0 ? d : Arrays.copyOf(this.b, i), this.c, true);
        }
        lg8.r();
        return null;
    }

    @Override // defpackage.fmf, java.util.AbstractList, java.util.List
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

    @Override // java.util.AbstractList, java.util.AbstractCollection, java.util.Collection, java.util.List
    public final boolean add(Object obj) {
        d();
        int i = this.c;
        Object[] objArrCopyOf = this.b;
        int length = objArrCopyOf.length;
        if (i == length) {
            objArrCopyOf = Arrays.copyOf(this.b, wgd.n(length, 3, 2, 1, 10));
            this.b = objArrCopyOf;
        }
        int i2 = this.c;
        this.c = i2 + 1;
        objArrCopyOf[i2] = obj;
        ((AbstractList) this).modCount++;
        return true;
    }
}
