package defpackage;

import j$.util.Objects;
import java.util.Arrays;
import java.util.Iterator;
import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class gyf extends cxf implements Set, j$.util.Set {
    public static final /* synthetic */ int c = 0;
    public transient uxf b;

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

    public static gyf t(int i, Object... objArr) {
        if (i == 0) {
            return zyf.j;
        }
        if (i == 1) {
            Object obj = objArr[0];
            Objects.requireNonNull(obj);
            return new dzf(obj);
        }
        int iR = r(i);
        Object[] objArr2 = new Object[iR];
        int i2 = iR - 1;
        int i3 = 0;
        int i4 = 0;
        for (int i5 = 0; i5 < i; i5++) {
            Object obj2 = objArr[i5];
            if (obj2 == null) {
                z72.c(b09.w(i5, "at index "));
                return null;
            }
            int iHashCode = obj2.hashCode();
            int iQ = pr7.q(iHashCode);
            while (true) {
                int i6 = iQ & i2;
                Object obj3 = objArr2[i6];
                if (obj3 == null) {
                    objArr[i4] = obj2;
                    objArr2[i6] = obj2;
                    i3 += iHashCode;
                    i4++;
                    break;
                }
                if (!obj3.equals(obj2)) {
                    iQ++;
                }
            }
        }
        Arrays.fill(objArr, i4, i, (Object) null);
        if (i4 == 1) {
            Object obj4 = objArr[0];
            Objects.requireNonNull(obj4);
            return new dzf(obj4);
        }
        if (r(i4) < iR / 2) {
            return t(i4, objArr);
        }
        int length = objArr.length;
        if (i4 < (length >> 1) + (length >> 2)) {
            objArr = Arrays.copyOf(objArr, i4);
        }
        return new zyf(i3, i2, i4, objArr, objArr2);
    }

    @Override // java.util.Collection, java.util.Set
    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if ((obj instanceof gyf) && (this instanceof zyf) && (((gyf) obj) instanceof zyf) && ((zyf) this).e != obj.hashCode()) {
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

    @Override // defpackage.cxf
    public uxf m() {
        uxf uxfVar = this.b;
        if (uxfVar != null) {
            return uxfVar;
        }
        uxf uxfVarS = s();
        this.b = uxfVarS;
        return uxfVarS;
    }

    public uxf s() {
        Object[] array = toArray(cxf.a);
        exf exfVar = uxf.b;
        return uxf.s(array.length, array);
    }
}
