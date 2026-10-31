package com.google.android.gms.internal.consent_sdk;

/* loaded from: classes3.dex */
public final class s6 {

    /* renamed from: a, reason: collision with root package name */
    public final i5 f32237a;

    /* renamed from: b, reason: collision with root package name */
    public final String f32238b;

    /* renamed from: c, reason: collision with root package name */
    public final Object[] f32239c;

    /* renamed from: d, reason: collision with root package name */
    public final int f32240d;

    public s6(i5 i5Var, String str, Object[] objArr) {
        this.f32237a = i5Var;
        this.f32238b = str;
        this.f32239c = objArr;
        char cCharAt = str.charAt(0);
        if (cCharAt < 55296) {
            this.f32240d = cCharAt;
            return;
        }
        int i5 = cCharAt & 8191;
        int i11 = 1;
        int i12 = 13;
        while (true) {
            int i13 = i11 + 1;
            char cCharAt2 = str.charAt(i11);
            if (cCharAt2 < 55296) {
                this.f32240d = i5 | (cCharAt2 << i12);
                return;
            } else {
                i5 |= (cCharAt2 & 8191) << i12;
                i12 += 13;
                i11 = i13;
            }
        }
    }

    public final int a() {
        int i5 = this.f32240d;
        if ((i5 & 1) != 0) {
            return 1;
        }
        return (i5 & 4) == 4 ? 3 : 2;
    }
}
