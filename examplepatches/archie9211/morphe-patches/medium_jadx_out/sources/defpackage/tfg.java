package defpackage;

import j$.util.Objects;
import java.io.Serializable;
import java.util.AbstractMap;
import java.util.Arrays;
import java.util.Collection;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class tfg extends AbstractMap implements Serializable {
    public static final Object j = new Object();
    public transient Object a;
    public transient int[] b;
    public transient Object[] c;
    public transient Object[] d;
    public transient int e = Math.min(Math.max(3, 1), 1073741823);
    public transient int f;
    public transient qfg g;
    public transient qfg h;
    public transient sfg i;

    public final Object[] a() {
        Object[] objArr = this.c;
        Objects.requireNonNull(objArr);
        return objArr;
    }

    public final Object[] b() {
        Object[] objArr = this.d;
        Objects.requireNonNull(objArr);
        return objArr;
    }

    public final boolean c() {
        return this.a == null;
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final void clear() {
        if (c()) {
            return;
        }
        this.e += 32;
        Map mapD = d();
        if (mapD != null) {
            this.e = Math.min(Math.max(size(), 3), 1073741823);
            mapD.clear();
            this.a = null;
            this.f = 0;
            return;
        }
        Arrays.fill(a(), 0, this.f, (Object) null);
        Arrays.fill(b(), 0, this.f, (Object) null);
        Object obj = this.a;
        Objects.requireNonNull(obj);
        if (obj instanceof byte[]) {
            Arrays.fill((byte[]) obj, (byte) 0);
        } else if (obj instanceof short[]) {
            Arrays.fill((short[]) obj, (short) 0);
        } else {
            Arrays.fill((int[]) obj, 0);
        }
        Arrays.fill(k(), 0, this.f, 0);
        this.f = 0;
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final boolean containsKey(Object obj) {
        Map mapD = d();
        return mapD != null ? mapD.containsKey(obj) : i(obj) != -1;
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final boolean containsValue(Object obj) {
        Map mapD = d();
        if (mapD != null) {
            return mapD.containsValue(obj);
        }
        for (int i = 0; i < this.f; i++) {
            if (Objects.equals(obj, b()[i])) {
                return true;
            }
        }
        return false;
    }

    public final Map d() {
        Object obj = this.a;
        if (obj instanceof Map) {
            return (Map) obj;
        }
        return null;
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final Set entrySet() {
        qfg qfgVar = this.h;
        if (qfgVar != null) {
            return qfgVar;
        }
        qfg qfgVar2 = new qfg(this, 0);
        this.h = qfgVar2;
        return qfgVar2;
    }

    public final void f(int i, int i2) {
        Object obj = this.a;
        Objects.requireNonNull(obj);
        int[] iArrK = k();
        Object[] objArrA = a();
        Object[] objArrB = b();
        int size = size();
        int i3 = size - 1;
        if (i >= i3) {
            objArrA[i] = null;
            objArrB[i] = null;
            iArrK[i] = 0;
            return;
        }
        int i4 = i + 1;
        Object obj2 = objArrA[i3];
        objArrA[i] = obj2;
        objArrB[i] = objArrB[i3];
        objArrA[i3] = null;
        objArrB[i3] = null;
        iArrK[i] = iArrK[i3];
        iArrK[i3] = 0;
        int I = gr7.I(obj2) & i2;
        int iM = er7.M(I, obj);
        if (iM == size) {
            er7.N(I, i4, obj);
            return;
        }
        while (true) {
            int i5 = iM - 1;
            int i6 = iArrK[i5];
            int i7 = i6 & i2;
            if (i7 == size) {
                iArrK[i5] = ((~i2) & i6) | (i4 & i2);
                return;
            }
            iM = i7;
        }
    }

    public final int g() {
        return (1 << (this.e & 31)) - 1;
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final Object get(Object obj) {
        Map mapD = d();
        if (mapD != null) {
            return mapD.get(obj);
        }
        int i = i(obj);
        if (i == -1) {
            return null;
        }
        return b()[i];
    }

    public final int h(int i, int i2, int i3, int i4) {
        int i5 = i2 - 1;
        Object objK = er7.K(i2);
        if (i4 != 0) {
            er7.N(i3 & i5, i4 + 1, objK);
        }
        Object obj = this.a;
        Objects.requireNonNull(obj);
        int[] iArrK = k();
        for (int i6 = 0; i6 <= i; i6++) {
            int iM = er7.M(i6, obj);
            while (iM != 0) {
                int i7 = iM - 1;
                int i8 = iArrK[i7];
                int i9 = ((~i) & i8) | i6;
                int i10 = i9 & i5;
                int iM2 = er7.M(i10, objK);
                er7.N(i10, iM, objK);
                iArrK[i7] = ((~i5) & i9) | (iM2 & i5);
                iM = i8 & i;
            }
        }
        this.a = objK;
        this.e = ((32 - Integer.numberOfLeadingZeros(i5)) & 31) | (this.e & (-32));
        return i5;
    }

    public final int i(Object obj) {
        if (c()) {
            return -1;
        }
        int I = gr7.I(obj);
        int iG = g();
        Object obj2 = this.a;
        Objects.requireNonNull(obj2);
        int iM = er7.M(I & iG, obj2);
        if (iM != 0) {
            int i = ~iG;
            int i2 = I & i;
            do {
                int i3 = iM - 1;
                int i4 = k()[i3];
                if ((i4 & i) == i2 && Objects.equals(obj, a()[i3])) {
                    return i3;
                }
                iM = i4 & iG;
            } while (iM != 0);
        }
        return -1;
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final boolean isEmpty() {
        return size() == 0;
    }

    public final Object j(Object obj) {
        if (!c()) {
            int iG = g();
            Object obj2 = this.a;
            Objects.requireNonNull(obj2);
            int iO = er7.O(obj, null, iG, obj2, k(), a(), null);
            if (iO != -1) {
                Object obj3 = b()[iO];
                f(iO, iG);
                this.f--;
                this.e += 32;
                return obj3;
            }
        }
        return j;
    }

    public final int[] k() {
        int[] iArr = this.b;
        Objects.requireNonNull(iArr);
        return iArr;
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final Set keySet() {
        qfg qfgVar = this.g;
        if (qfgVar != null) {
            return qfgVar;
        }
        qfg qfgVar2 = new qfg(this, 1);
        this.g = qfgVar2;
        return qfgVar2;
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final Object put(Object obj, Object obj2) {
        int i;
        int i2 = 32;
        if (c()) {
            jq7.y("Arrays already allocated", c());
            int i3 = this.e;
            int iMax = Math.max(i3 + 1, 2);
            int iHighestOneBit = Integer.highestOneBit(iMax);
            if (iMax > iHighestOneBit && (iHighestOneBit = iHighestOneBit + iHighestOneBit) <= 0) {
                iHighestOneBit = 1073741824;
            }
            int iMax2 = Math.max(4, iHighestOneBit);
            this.a = er7.K(iMax2);
            this.e = ((32 - Integer.numberOfLeadingZeros(iMax2 - 1)) & 31) | (this.e & (-32));
            this.b = new int[i3];
            this.c = new Object[i3];
            this.d = new Object[i3];
        }
        Map mapD = d();
        if (mapD != null) {
            return mapD.put(obj, obj2);
        }
        int[] iArrK = k();
        Object[] objArrA = a();
        Object[] objArrB = b();
        int i4 = this.f;
        int i5 = i4 + 1;
        int I = gr7.I(obj);
        int iG = g();
        int i6 = I & iG;
        Object obj3 = this.a;
        Objects.requireNonNull(obj3);
        int iM = er7.M(i6, obj3);
        if (iM == 0) {
            if (i5 > iG) {
                iG = h(iG, (iG + 1) * (iG < 32 ? 4 : 2), I, i4);
            } else {
                Object obj4 = this.a;
                Objects.requireNonNull(obj4);
                er7.N(i6, i5, obj4);
            }
            i = 1;
        } else {
            int i7 = ~iG;
            int i8 = I & i7;
            int i9 = 0;
            while (true) {
                int i10 = iM - 1;
                int i11 = iArrK[i10];
                i = 1;
                int i12 = i11 & i7;
                int i13 = i2;
                if (i12 == i8 && Objects.equals(obj, objArrA[i10])) {
                    Object obj5 = objArrB[i10];
                    objArrB[i10] = obj2;
                    return obj5;
                }
                int i14 = i11 & iG;
                int i15 = i9 + 1;
                if (i14 != 0) {
                    i9 = i15;
                    iM = i14;
                    i2 = i13;
                } else {
                    if (i15 >= 9) {
                        LinkedHashMap linkedHashMap = new LinkedHashMap(g() + 1, 1.0f);
                        int i16 = isEmpty() ? -1 : 0;
                        while (i16 >= 0) {
                            linkedHashMap.put(a()[i16], b()[i16]);
                            int i17 = i16 + 1;
                            i16 = i17 < this.f ? i17 : -1;
                        }
                        this.a = linkedHashMap;
                        this.b = null;
                        this.c = null;
                        this.d = null;
                        this.e += 32;
                        return linkedHashMap.put(obj, obj2);
                    }
                    if (i5 > iG) {
                        iG = h(iG, (iG + 1) * (iG < i13 ? 4 : 2), I, i4);
                    } else {
                        iArrK[i10] = (i5 & iG) | i12;
                    }
                }
            }
        }
        int length = k().length;
        if (i5 > length) {
            int i18 = i;
            int iMin = Math.min(1073741823, (Math.max(i18, length >>> 1) + length) | i18);
            if (iMin != length) {
                this.b = Arrays.copyOf(k(), iMin);
                this.c = Arrays.copyOf(a(), iMin);
                this.d = Arrays.copyOf(b(), iMin);
            }
        }
        k()[i4] = (~iG) & I;
        a()[i4] = obj;
        b()[i4] = obj2;
        this.f = i5;
        this.e += 32;
        return null;
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final Object remove(Object obj) {
        Map mapD = d();
        if (mapD != null) {
            return mapD.remove(obj);
        }
        Object objJ = j(obj);
        if (objJ == j) {
            return null;
        }
        return objJ;
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final int size() {
        Map mapD = d();
        return mapD != null ? mapD.size() : this.f;
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final Collection values() {
        sfg sfgVar = this.i;
        if (sfgVar != null) {
            return sfgVar;
        }
        sfg sfgVar2 = new sfg(this);
        this.i = sfgVar2;
        return sfgVar2;
    }
}
