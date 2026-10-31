package androidx.recyclerview.widget;

import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;

/* loaded from: classes2.dex */
public final class s {

    /* renamed from: a, reason: collision with root package name */
    public final ArrayList f15116a;

    /* renamed from: b, reason: collision with root package name */
    public final int[] f15117b;

    /* renamed from: c, reason: collision with root package name */
    public final int[] f15118c;

    /* renamed from: d, reason: collision with root package name */
    public final a5.d f15119d;

    /* renamed from: e, reason: collision with root package name */
    public final int f15120e;

    /* renamed from: f, reason: collision with root package name */
    public final int f15121f;

    /* renamed from: g, reason: collision with root package name */
    public final boolean f15122g;

    public s(a5.d dVar, ArrayList arrayList, int[] iArr, int[] iArr2) {
        int i5;
        r rVar;
        int i11;
        this.f15116a = arrayList;
        this.f15117b = iArr;
        this.f15118c = iArr2;
        Arrays.fill(iArr, 0);
        Arrays.fill(iArr2, 0);
        this.f15119d = dVar;
        int iE = dVar.E();
        this.f15120e = iE;
        int iD = dVar.D();
        this.f15121f = iD;
        this.f15122g = true;
        r rVar2 = arrayList.isEmpty() ? null : (r) arrayList.get(0);
        if (rVar2 == null || rVar2.f15082a != 0 || rVar2.f15083b != 0) {
            arrayList.add(0, new r(0, 0, 0));
        }
        arrayList.add(new r(iE, iD, 0));
        Iterator it = arrayList.iterator();
        while (it.hasNext()) {
            r rVar3 = (r) it.next();
            for (int i12 = 0; i12 < rVar3.f15084c; i12++) {
                int i13 = rVar3.f15082a + i12;
                int i14 = rVar3.f15083b + i12;
                int i15 = dVar.z(i13, i14) ? 1 : 2;
                iArr[i13] = (i14 << 4) | i15;
                iArr2[i14] = (i13 << 4) | i15;
            }
        }
        if (this.f15122g) {
            Iterator it2 = arrayList.iterator();
            int i16 = 0;
            while (it2.hasNext()) {
                r rVar4 = (r) it2.next();
                while (true) {
                    i5 = rVar4.f15082a;
                    if (i16 < i5) {
                        if (iArr[i16] == 0) {
                            int size = arrayList.size();
                            int i17 = 0;
                            int i18 = 0;
                            while (true) {
                                if (i17 < size) {
                                    rVar = (r) arrayList.get(i17);
                                    while (true) {
                                        i11 = rVar.f15083b;
                                        if (i18 < i11) {
                                            if (iArr2[i18] == 0 && dVar.A(i16, i18)) {
                                                int i19 = dVar.z(i16, i18) ? 8 : 4;
                                                iArr[i16] = (i18 << 4) | i19;
                                                iArr2[i18] = i19 | (i16 << 4);
                                            } else {
                                                i18++;
                                            }
                                        }
                                    }
                                }
                                i18 = rVar.f15084c + i11;
                                i17++;
                            }
                        }
                        i16++;
                    }
                }
                i16 = rVar4.f15084c + i5;
            }
        }
    }

    public static u a(ArrayDeque arrayDeque, int i5, boolean z11) {
        u uVar;
        Iterator it = arrayDeque.iterator();
        while (true) {
            if (!it.hasNext()) {
                uVar = null;
                break;
            }
            uVar = (u) it.next();
            if (uVar.f15129a == i5 && uVar.f15131c == z11) {
                it.remove();
                break;
            }
        }
        while (it.hasNext()) {
            u uVar2 = (u) it.next();
            if (z11) {
                uVar2.f15130b--;
            } else {
                uVar2.f15130b++;
            }
        }
        return uVar;
    }
}
