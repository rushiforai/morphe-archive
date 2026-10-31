package k0;

/* loaded from: classes.dex */
public abstract class k {

    /* renamed from: a, reason: collision with root package name */
    public static final g f70655a = new g(1);

    /* renamed from: b, reason: collision with root package name */
    public static final g f70656b = new g(0);

    /* renamed from: c, reason: collision with root package name */
    public static final e f70657c = new e(1);

    /* renamed from: d, reason: collision with root package name */
    public static final e f70658d = new e(0);

    /* renamed from: e, reason: collision with root package name */
    public static final f f70659e = new f(0);

    /* renamed from: f, reason: collision with root package name */
    public static final f f70660f = new f(3);

    /* renamed from: g, reason: collision with root package name */
    public static final f f70661g = new f(2);

    static {
        new f(1);
    }

    public static void a(int i5, int[] iArr, int[] iArr2, boolean z11) {
        int i11 = 0;
        int i12 = 0;
        for (int i13 : iArr) {
            i12 += i13;
        }
        float f11 = (i5 - i12) / 2;
        if (!z11) {
            int length = iArr.length;
            int i14 = 0;
            while (i11 < length) {
                int i15 = iArr[i11];
                iArr2[i14] = Math.round(f11);
                f11 += i15;
                i11++;
                i14++;
            }
            return;
        }
        int length2 = iArr.length;
        while (true) {
            length2--;
            if (-1 >= length2) {
                return;
            }
            int i16 = iArr[length2];
            iArr2[length2] = Math.round(f11);
            f11 += i16;
        }
    }

    public static void b(int[] iArr, int[] iArr2, boolean z11) {
        int i5 = 0;
        if (!z11) {
            int length = iArr.length;
            int i11 = 0;
            int i12 = 0;
            while (i5 < length) {
                int i13 = iArr[i5];
                iArr2[i11] = i12;
                i12 += i13;
                i5++;
                i11++;
            }
            return;
        }
        int length2 = iArr.length;
        while (true) {
            length2--;
            if (-1 >= length2) {
                return;
            }
            int i14 = iArr[length2];
            iArr2[length2] = i5;
            i5 += i14;
        }
    }

    public static void c(int i5, int[] iArr, int[] iArr2, boolean z11) {
        int i11 = 0;
        int i12 = 0;
        for (int i13 : iArr) {
            i12 += i13;
        }
        int i14 = i5 - i12;
        if (!z11) {
            int length = iArr.length;
            int i15 = 0;
            while (i11 < length) {
                int i16 = iArr[i11];
                iArr2[i15] = i14;
                i14 += i16;
                i11++;
                i15++;
            }
            return;
        }
        int length2 = iArr.length;
        while (true) {
            length2--;
            if (-1 >= length2) {
                return;
            }
            int i17 = iArr[length2];
            iArr2[length2] = i14;
            i14 += i17;
        }
    }

    public static void d(int i5, int[] iArr, int[] iArr2, boolean z11) {
        int i11 = 0;
        int i12 = 0;
        for (int i13 : iArr) {
            i12 += i13;
        }
        float length = iArr.length == 0 ? 0.0f : (i5 - i12) / iArr.length;
        float f11 = length / 2;
        if (!z11) {
            int length2 = iArr.length;
            int i14 = 0;
            while (i11 < length2) {
                int i15 = iArr[i11];
                iArr2[i14] = Math.round(f11);
                f11 += i15 + length;
                i11++;
                i14++;
            }
            return;
        }
        int length3 = iArr.length;
        while (true) {
            length3--;
            if (-1 >= length3) {
                return;
            }
            int i16 = iArr[length3];
            iArr2[length3] = Math.round(f11);
            f11 += i16 + length;
        }
    }

    public static void e(int i5, int[] iArr, int[] iArr2, boolean z11) {
        if (iArr.length == 0) {
            return;
        }
        int i11 = 0;
        int i12 = 0;
        for (int i13 : iArr) {
            i12 += i13;
        }
        float fMax = (i5 - i12) / Math.max(iArr.length - 1, 1);
        float f11 = (z11 && iArr.length == 1) ? fMax : 0.0f;
        if (z11) {
            for (int length = iArr.length - 1; -1 < length; length--) {
                int i14 = iArr[length];
                iArr2[length] = Math.round(f11);
                f11 += i14 + fMax;
            }
            return;
        }
        int length2 = iArr.length;
        int i15 = 0;
        while (i11 < length2) {
            int i16 = iArr[i11];
            iArr2[i15] = Math.round(f11);
            f11 += i16 + fMax;
            i11++;
            i15++;
        }
    }

    public static void f(int i5, int[] iArr, int[] iArr2, boolean z11) {
        int i11 = 0;
        int i12 = 0;
        for (int i13 : iArr) {
            i12 += i13;
        }
        float length = (i5 - i12) / (iArr.length + 1);
        if (z11) {
            float f11 = length;
            for (int length2 = iArr.length - 1; -1 < length2; length2--) {
                int i14 = iArr[length2];
                iArr2[length2] = Math.round(f11);
                f11 += i14 + length;
            }
            return;
        }
        int length3 = iArr.length;
        float f12 = length;
        int i15 = 0;
        while (i11 < length3) {
            int i16 = iArr[i11];
            iArr2[i15] = Math.round(f12);
            f12 += i16 + length;
            i11++;
            i15++;
        }
    }

    public static i g(float f11) {
        return new i(f11, true, new b00.i1(12, (byte) 0));
    }
}
