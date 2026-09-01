package defpackage;

import j$.util.Objects;
import java.util.Arrays;
import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class fyf extends ogf implements Set, j$.util.Set {
    public static final /* synthetic */ int g = 0;
    public transient ayf f;

    public static fyf y(int i, Object... objArr) {
        if (i == 0) {
            return pzf.n;
        }
        if (i == 1) {
            Object obj = objArr[0];
            Objects.requireNonNull(obj);
            return new c0g(obj);
        }
        int iZ = z(i);
        Object[] objArr2 = new Object[iZ];
        int i2 = iZ - 1;
        int i3 = 0;
        int i4 = 0;
        for (int i5 = 0; i5 < i; i5++) {
            Object obj2 = objArr[i5];
            if (obj2 == null) {
                z72.c(b09.w(i5, "at index "));
                return null;
            }
            int iHashCode = obj2.hashCode();
            int iRotateLeft = (int) (((long) Integer.rotateLeft((int) (((long) iHashCode) * (-862048943)), 15)) * 461845907);
            while (true) {
                int i6 = iRotateLeft & i2;
                Object obj3 = objArr2[i6];
                if (obj3 == null) {
                    objArr[i4] = obj2;
                    objArr2[i6] = obj2;
                    i3 += iHashCode;
                    i4++;
                    break;
                }
                if (!obj3.equals(obj2)) {
                    iRotateLeft++;
                }
            }
        }
        Arrays.fill(objArr, i4, i, (Object) null);
        if (i4 == 1) {
            Object obj4 = objArr[0];
            Objects.requireNonNull(obj4);
            return new c0g(obj4);
        }
        if (z(i4) < iZ / 2) {
            return y(i4, objArr);
        }
        if (i4 <= 0) {
            objArr = Arrays.copyOf(objArr, i4);
        }
        return new pzf(i3, i2, i4, objArr, objArr2);
    }

    public static int z(int i) {
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

    public ayf A() {
        ayf ayfVar = this.f;
        if (ayfVar != null) {
            return ayfVar;
        }
        ayf ayfVarB = B();
        this.f = ayfVarB;
        return ayfVarB;
    }

    public ayf B() {
        Object[] array = toArray(ogf.e);
        hxf hxfVar = ayf.f;
        return ayf.A(array.length, array);
    }

    @Override // java.util.Collection, java.util.Set
    public boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if ((obj instanceof fyf) && (this instanceof pzf) && (((fyf) obj) instanceof pzf) && ((pzf) this).i != obj.hashCode()) {
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
        return lk7.H(this);
    }
}
