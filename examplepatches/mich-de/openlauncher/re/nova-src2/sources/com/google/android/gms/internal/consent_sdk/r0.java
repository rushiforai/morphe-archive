package com.google.android.gms.internal.consent_sdk;

import java.util.Arrays;
import java.util.Objects;
import java.util.Set;

/* loaded from: classes.dex */
public abstract class r0 extends n0 implements Set {

    /* renamed from: b, reason: collision with root package name */
    public transient q0 f32222b;

    public static int f(int i5) {
        int iMax = Math.max(i5, 2);
        if (iMax >= 751619276) {
            if (iMax < 1073741824) {
                return 1073741824;
            }
            throw new IllegalArgumentException("collection too large");
        }
        int iHighestOneBit = Integer.highestOneBit(iMax - 1);
        do {
            iHighestOneBit += iHighestOneBit;
        } while (iHighestOneBit * 0.7d < iMax);
        return iHighestOneBit;
    }

    public static r0 g(int i5, Object... objArr) {
        if (i5 == 0) {
            return u0.f32252i;
        }
        if (i5 == 1) {
            Object obj = objArr[0];
            Objects.requireNonNull(obj);
            return new w0(obj);
        }
        int iF = f(i5);
        Object[] objArr2 = new Object[iF];
        int i11 = iF - 1;
        int i12 = 0;
        int i13 = 0;
        for (int i14 = 0; i14 < i5; i14++) {
            Object obj2 = objArr[i14];
            if (obj2 == null) {
                throw new NullPointerException(b.c0.h(i14, "at index "));
            }
            int iHashCode = obj2.hashCode();
            int iRotateLeft = (int) (Integer.rotateLeft((int) (iHashCode * (-862048943)), 15) * 461845907);
            while (true) {
                int i15 = iRotateLeft & i11;
                Object obj3 = objArr2[i15];
                if (obj3 == null) {
                    objArr[i13] = obj2;
                    objArr2[i15] = obj2;
                    i12 += iHashCode;
                    i13++;
                    break;
                }
                if (!obj3.equals(obj2)) {
                    iRotateLeft++;
                }
            }
        }
        Arrays.fill(objArr, i13, i5, (Object) null);
        if (i13 == 1) {
            Object obj4 = objArr[0];
            Objects.requireNonNull(obj4);
            return new w0(obj4);
        }
        if (f(i13) < iF / 2) {
            return g(i13, objArr);
        }
        if (i13 < 3) {
            objArr = Arrays.copyOf(objArr, i13);
        }
        return new u0(objArr, i12, objArr2, i11, i13);
    }

    @Override // java.util.Collection, java.util.Set
    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if ((obj instanceof r0) && (this instanceof u0) && (((r0) obj) instanceof u0) && hashCode() != obj.hashCode()) {
            return false;
        }
        if (obj == this) {
            return true;
        }
        if (obj instanceof Set) {
            Set set = (Set) obj;
            try {
                if (size() == set.size()) {
                    return containsAll(set);
                }
            } catch (ClassCastException | NullPointerException unused) {
            }
        }
        return false;
    }

    @Override // java.util.Collection, java.util.Set
    public abstract int hashCode();
}
