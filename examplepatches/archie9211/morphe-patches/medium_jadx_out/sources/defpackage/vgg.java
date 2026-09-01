package defpackage;

import j$.util.Objects;
import java.util.Arrays;
import java.util.Iterator;
import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class vgg extends agg implements Set, j$.util.Set {
    public static final /* synthetic */ int c = 0;
    public transient mgg b;

    public static int r(int i) {
        int iMax = Math.max(i, 2);
        if (iMax < 751619276) {
            int iHighestOneBit = Integer.highestOneBit(iMax - 1);
            do {
                iHighestOneBit += iHighestOneBit;
            } while (((double) iHighestOneBit) * 0.7d < iMax);
            return iHighestOneBit;
        }
        if (iMax < 1073741824) {
            return 1073741824;
        }
        ay0.e("collection too large");
        return 0;
    }

    public static vgg u(int i, Object... objArr) {
        if (i == 0) {
            return lhg.j;
        }
        int i2 = 1;
        if (i == 1) {
            Object obj = objArr[0];
            Objects.requireNonNull(obj);
            return new wgg(i2, obj);
        }
        int iR = r(i);
        Object[] objArr2 = new Object[iR];
        int i3 = iR - 1;
        int i4 = 0;
        int i5 = 0;
        for (int i6 = 0; i6 < i; i6++) {
            Object obj2 = objArr[i6];
            pr7.r(i6, obj2);
            int iHashCode = obj2.hashCode();
            int iG = gr7.G(iHashCode);
            while (true) {
                int i7 = iG & i3;
                Object obj3 = objArr2[i7];
                if (obj3 == null) {
                    objArr[i5] = obj2;
                    objArr2[i7] = obj2;
                    i4 += iHashCode;
                    i5++;
                    break;
                }
                if (!obj3.equals(obj2)) {
                    iG++;
                }
            }
        }
        Arrays.fill(objArr, i5, i, (Object) null);
        if (i5 == 1) {
            Object obj4 = objArr[0];
            Objects.requireNonNull(obj4);
            return new wgg(i2, obj4);
        }
        if (r(i5) < iR / 2) {
            return u(i5, objArr);
        }
        int length = objArr.length;
        if (i5 < (length >> 1) + (length >> 2)) {
            objArr = Arrays.copyOf(objArr, i5);
        }
        return new lhg(i4, i3, i5, objArr, objArr2);
    }

    @Override // java.util.Collection, java.util.Set
    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if ((obj instanceof vgg) && (this instanceof lhg) && (((vgg) obj) instanceof lhg) && ((lhg) this).e != obj.hashCode()) {
            return false;
        }
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof Set)) {
            return false;
        }
        Set set = (Set) obj;
        try {
            if (size() == set.size()) {
                return containsAll(set);
            }
            return false;
        } catch (ClassCastException | NullPointerException unused) {
            return false;
        }
    }

    @Override // java.util.Collection, java.util.Set
    public int hashCode() {
        Iterator it2 = iterator();
        int iHashCode = 0;
        while (it2.hasNext()) {
            Object next = it2.next();
            iHashCode += next != null ? next.hashCode() : 0;
        }
        return iHashCode;
    }

    public final mgg s() {
        mgg mggVar = this.b;
        if (mggVar != null) {
            return mggVar;
        }
        mgg mggVarT = t();
        this.b = mggVarT;
        return mggVarT;
    }

    public mgg t() {
        Object[] array = toArray(agg.a);
        cgg cggVar = mgg.b;
        int length = array.length;
        return length == 0 ? dhg.e : new dhg(length, array);
    }
}
