package com.google.protobuf;

/* loaded from: classes.dex */
public final class z1 {

    /* renamed from: a, reason: collision with root package name */
    public final o1 f35010a;

    /* renamed from: b, reason: collision with root package name */
    public final String f35011b;

    /* renamed from: c, reason: collision with root package name */
    public final Object[] f35012c;

    /* renamed from: d, reason: collision with root package name */
    public final int f35013d;

    public z1(o1 o1Var, String str, Object[] objArr) {
        this.f35010a = o1Var;
        this.f35011b = str;
        this.f35012c = objArr;
        char cCharAt = str.charAt(0);
        if (cCharAt < 55296) {
            this.f35013d = cCharAt;
            return;
        }
        int i5 = cCharAt & 8191;
        int i11 = 13;
        int i12 = 1;
        while (true) {
            int i13 = i12 + 1;
            char cCharAt2 = str.charAt(i12);
            if (cCharAt2 < 55296) {
                this.f35013d = i5 | (cCharAt2 << i11);
                return;
            } else {
                i5 |= (cCharAt2 & 8191) << i11;
                i11 += 13;
                i12 = i13;
            }
        }
    }

    public final int a() {
        int i5 = this.f35013d;
        if ((i5 & 1) != 0) {
            return 1;
        }
        return (i5 & 4) == 4 ? 3 : 2;
    }
}
