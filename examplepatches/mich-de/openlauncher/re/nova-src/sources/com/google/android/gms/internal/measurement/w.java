package com.google.android.gms.internal.measurement;

import java.util.AbstractMap;
import java.util.Arrays;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

/* loaded from: classes3.dex */
public final class w extends AbstractMap {

    /* renamed from: f, reason: collision with root package name */
    public static final t f33164f = new t(1);

    /* renamed from: a, reason: collision with root package name */
    public final Object[] f33165a;

    /* renamed from: b, reason: collision with root package name */
    public final int[] f33166b;

    /* renamed from: c, reason: collision with root package name */
    public final v f33167c;

    /* renamed from: d, reason: collision with root package name */
    public Integer f33168d;

    /* renamed from: e, reason: collision with root package name */
    public String f33169e;

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v0, types: [com.google.android.gms.internal.measurement.w, java.util.AbstractMap] */
    /* JADX WARN: Type inference failed for: r0v1, types: [com.google.android.gms.internal.measurement.w] */
    /* JADX WARN: Type inference failed for: r0v13 */
    /* JADX WARN: Type inference failed for: r0v19 */
    /* JADX WARN: Type inference failed for: r0v2 */
    /* JADX WARN: Type inference failed for: r0v5 */
    /* JADX WARN: Type inference failed for: r0v8 */
    public w(w wVar, w wVar2) {
        int i5;
        Object obj;
        Object[] objArr;
        ?? abstractMap = new AbstractMap();
        abstractMap.f33167c = new v(abstractMap, -1);
        abstractMap.f33168d = null;
        abstractMap.f33169e = null;
        int size = wVar2.size() + wVar.size();
        int i11 = wVar.f33166b[wVar.size()] + wVar2.f33166b[wVar2.size()];
        int i12 = size + 1;
        Object[] objArr2 = new Object[i11];
        int[] iArr = new int[i12];
        int i13 = 0;
        iArr[0] = size;
        Map.Entry entryC = wVar.c(0);
        Map.Entry entryC2 = wVar2.c(0);
        int i14 = 0;
        int i15 = 0;
        int iA = size;
        int i16 = 0;
        while (true) {
            if (entryC == null && entryC2 == null) {
                break;
            }
            int i17 = i16 + 1;
            if (entryC != null) {
                if (entryC2 != null) {
                    int iCompareTo = ((String) entryC.getKey()).compareTo((String) entryC2.getKey());
                    if (iCompareTo == 0) {
                        int i18 = i14 + 1;
                        int i19 = i15 + 1;
                        objArr2[i16] = new AbstractMap.SimpleImmutableEntry((String) entryC.getKey(), new v(abstractMap, i16));
                        v vVar = (v) entryC.getValue();
                        v vVar2 = (v) entryC2.getValue();
                        int i21 = 0;
                        int i22 = 0;
                        abstractMap = abstractMap;
                        while (true) {
                            int iD = vVar.d();
                            w wVar3 = vVar.f33119b;
                            if (i21 >= iD - vVar.c() && i22 >= vVar2.d() - vVar2.c()) {
                                break;
                            }
                            int iCompare = i21 == vVar.d() - vVar.c() ? 1 : i22 == vVar2.d() - vVar2.c() ? -1 : 0;
                            if (iCompare == 0) {
                                t tVar = x.f33204b;
                                i5 = i21;
                                iCompare = x.f33204b.compare(wVar3.f33165a[vVar.c() + i21], vVar2.f33119b.f33165a[vVar2.c() + i22]);
                            } else {
                                i5 = i21;
                            }
                            if (iCompare < 0) {
                                i21 = i5 + 1;
                                obj = wVar3.f33165a[vVar.c() + i5];
                            } else {
                                int i23 = i22 + 1;
                                Object obj2 = vVar2.f33119b.f33165a[vVar2.c() + i22];
                                if (iCompare == 0) {
                                    i22 = i23;
                                    obj = obj2;
                                    i21 = i5 + 1;
                                } else {
                                    i22 = i23;
                                    obj = obj2;
                                    i21 = i5;
                                }
                            }
                            objArr2[iA] = obj;
                            abstractMap = this;
                            iA++;
                        }
                        iArr[i17] = iA;
                        entryC = wVar.c(i19);
                        entryC2 = wVar2.c(i18);
                        i15 = i19;
                        i14 = i18;
                        i16 = i17;
                        i13 = 0;
                    } else {
                        if (iCompareTo < 0) {
                        }
                        i16 = i17;
                        i13 = 0;
                        abstractMap = this;
                    }
                }
                i15++;
                iA = a(entryC, i16, iA, objArr2, iArr);
                entryC = wVar.c(i15);
                i16 = i17;
                i13 = 0;
                abstractMap = this;
            }
            Map.Entry entry = entryC;
            i14++;
            int iA2 = a(entryC2, i16, iA, objArr2, iArr);
            entryC2 = wVar2.c(i14);
            iA = iA2;
            entryC = entry;
            i16 = i17;
            i13 = 0;
            abstractMap = this;
        }
        int i24 = iArr[i13];
        int i25 = i24 - i16;
        if (i25 != 0) {
            for (int i26 = i13; i26 <= i16; i26++) {
                iArr[i26] = iArr[i26] - i25;
            }
            int i27 = iArr[i16];
            int i28 = i27 - i16;
            if (b(i11, i27)) {
                objArr = new Object[i27];
                System.arraycopy(objArr2, i13, objArr, i13, i16);
            } else {
                objArr = objArr2;
            }
            System.arraycopy(objArr2, i24, objArr, i16, i28);
            objArr2 = objArr;
        }
        abstractMap.f33165a = objArr2;
        int i29 = iArr[i13] + 1;
        abstractMap.f33166b = b(i12, i29) ? Arrays.copyOf(iArr, i29) : iArr;
    }

    public static boolean b(int i5, int i11) {
        return i5 > 16 && i5 * 9 > i11 * 10;
    }

    public final int a(Map.Entry entry, int i5, int i11, Object[] objArr, int[] iArr) {
        v vVar = (v) entry.getValue();
        int iD = vVar.d() - vVar.c();
        System.arraycopy(vVar.f33119b.f33165a, vVar.c(), objArr, i11, iD);
        objArr[i5] = new AbstractMap.SimpleImmutableEntry((String) entry.getKey(), new v(this, i5));
        int i12 = i11 + iD;
        iArr[i5 + 1] = i12;
        return i12;
    }

    public final Map.Entry c(int i5) {
        if (i5 < this.f33166b[0]) {
            return (Map.Entry) this.f33165a[i5];
        }
        return null;
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final Set entrySet() {
        return this.f33167c;
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final int hashCode() {
        if (this.f33168d == null) {
            this.f33168d = Integer.valueOf(super.hashCode());
        }
        return this.f33168d.intValue();
    }

    @Override // java.util.AbstractMap
    public final String toString() {
        if (this.f33169e == null) {
            this.f33169e = super.toString();
        }
        return this.f33169e;
    }

    public w() {
        List list = Collections.EMPTY_LIST;
        this.f33167c = new v(this, -1);
        this.f33168d = null;
        this.f33169e = null;
        Iterator it = list.iterator();
        if (!it.hasNext()) {
            int size = list.size();
            Object[] objArr = new Object[size];
            Iterator it2 = list.iterator();
            if (!it2.hasNext()) {
                int[] iArr = {0};
                this.f33165a = b(size, 0) ? Arrays.copyOf(objArr, 0) : objArr;
                this.f33166b = iArr;
                return;
            }
            throw b.u4.e(it2);
        }
        throw b.u4.e(it);
    }
}
