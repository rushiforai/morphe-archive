package o0;

import n0.i0;
import p1.o2;

/* loaded from: classes.dex */
public final class u {

    /* renamed from: a, reason: collision with root package name */
    public final y f78814a;

    /* renamed from: b, reason: collision with root package name */
    public int[] f78815b;

    /* renamed from: c, reason: collision with root package name */
    public final o2 f78816c;

    /* renamed from: d, reason: collision with root package name */
    public int[] f78817d;

    /* renamed from: e, reason: collision with root package name */
    public final o2 f78818e;

    /* renamed from: f, reason: collision with root package name */
    public boolean f78819f;

    /* renamed from: g, reason: collision with root package name */
    public Object f78820g;

    /* renamed from: h, reason: collision with root package name */
    public final i0 f78821h;

    public u(int[] iArr, int[] iArr2, y yVar) {
        Integer numValueOf;
        this.f78814a = yVar;
        this.f78815b = iArr;
        this.f78816c = androidx.compose.runtime.d.g(a(iArr));
        this.f78817d = iArr2;
        this.f78818e = androidx.compose.runtime.d.g(b(iArr, iArr2));
        if (iArr.length == 0) {
            numValueOf = null;
        } else {
            int i5 = iArr[0];
            int i11 = 1;
            int length = iArr.length - 1;
            if (1 <= length) {
                while (true) {
                    int i12 = iArr[i11];
                    i5 = i5 > i12 ? i12 : i5;
                    if (i11 == length) {
                        break;
                    } else {
                        i11++;
                    }
                }
            }
            numValueOf = Integer.valueOf(i5);
        }
        this.f78821h = new i0(numValueOf != null ? numValueOf.intValue() : 0, 90, 200);
    }

    public static int a(int[] iArr) {
        int length = iArr.length;
        int i5 = Integer.MAX_VALUE;
        int i11 = 0;
        while (true) {
            if (i11 >= length) {
                if (i5 == Integer.MAX_VALUE) {
                    break;
                }
                return i5;
            }
            int i12 = iArr[i11];
            if (i12 <= 0) {
                break;
            }
            if (i5 > i12) {
                i5 = i12;
            }
            i11++;
        }
        return 0;
    }

    public static int b(int[] iArr, int[] iArr2) {
        int iA = a(iArr);
        int length = iArr2.length;
        int iMin = Integer.MAX_VALUE;
        for (int i5 = 0; i5 < length; i5++) {
            if (iArr[i5] == iA) {
                iMin = Math.min(iMin, iArr2[i5]);
            }
        }
        if (iMin == Integer.MAX_VALUE) {
            return 0;
        }
        return iMin;
    }
}
