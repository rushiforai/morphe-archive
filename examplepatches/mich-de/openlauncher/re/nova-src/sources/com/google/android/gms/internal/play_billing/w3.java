package com.google.android.gms.internal.play_billing;

/* loaded from: classes3.dex */
public final class w3 {

    /* renamed from: a, reason: collision with root package name */
    public final g2 f33569a;

    /* renamed from: b, reason: collision with root package name */
    public final String f33570b;

    /* renamed from: c, reason: collision with root package name */
    public final Object[] f33571c;

    /* renamed from: d, reason: collision with root package name */
    public final int f33572d;

    public w3(g2 g2Var, String str, Object[] objArr) {
        this.f33569a = g2Var;
        this.f33570b = str;
        this.f33571c = objArr;
        char cCharAt = str.charAt(0);
        if (cCharAt < 55296) {
            this.f33572d = cCharAt;
            return;
        }
        int i5 = cCharAt & 8191;
        int i11 = 1;
        int i12 = 13;
        while (true) {
            int i13 = i11 + 1;
            char cCharAt2 = str.charAt(i11);
            if (cCharAt2 < 55296) {
                this.f33572d = i5 | (cCharAt2 << i12);
                return;
            } else {
                i5 |= (cCharAt2 & 8191) << i12;
                i12 += 13;
                i11 = i13;
            }
        }
    }

    public final int a() {
        int i5 = this.f33572d;
        if ((i5 & 1) != 0) {
            return 1;
        }
        return (i5 & 4) == 4 ? 3 : 2;
    }
}
