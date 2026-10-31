package com.google.android.gms.internal.measurement;

/* loaded from: classes3.dex */
public final class s2 {

    /* renamed from: a, reason: collision with root package name */
    public final n0 f33044a;

    /* renamed from: b, reason: collision with root package name */
    public final String f33045b;

    /* renamed from: c, reason: collision with root package name */
    public final Object[] f33046c;

    /* renamed from: d, reason: collision with root package name */
    public final int f33047d;

    public s2(n0 n0Var, String str, Object[] objArr) {
        this.f33044a = n0Var;
        this.f33045b = str;
        this.f33046c = objArr;
        char cCharAt = str.charAt(0);
        if (cCharAt < 55296) {
            this.f33047d = cCharAt;
            return;
        }
        int i5 = cCharAt & 8191;
        int i11 = 1;
        int i12 = 13;
        while (true) {
            int i13 = i11 + 1;
            char cCharAt2 = str.charAt(i11);
            if (cCharAt2 < 55296) {
                this.f33047d = i5 | (cCharAt2 << i12);
                return;
            } else {
                i5 |= (cCharAt2 & 8191) << i12;
                i12 += 13;
                i11 = i13;
            }
        }
    }

    public final int a() {
        int i5 = this.f33047d;
        if ((i5 & 1) != 0) {
            return 1;
        }
        return (i5 & 4) == 4 ? 3 : 2;
    }
}
