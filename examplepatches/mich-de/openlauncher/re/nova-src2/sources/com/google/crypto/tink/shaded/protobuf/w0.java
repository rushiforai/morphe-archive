package com.google.crypto.tink.shaded.protobuf;

/* loaded from: classes3.dex */
public final class w0 {

    /* renamed from: a, reason: collision with root package name */
    public final a f34679a;

    /* renamed from: b, reason: collision with root package name */
    public final String f34680b;

    /* renamed from: c, reason: collision with root package name */
    public final Object[] f34681c;

    /* renamed from: d, reason: collision with root package name */
    public final int f34682d;

    public w0(a aVar, String str, Object[] objArr) {
        this.f34679a = aVar;
        this.f34680b = str;
        this.f34681c = objArr;
        char cCharAt = str.charAt(0);
        if (cCharAt < 55296) {
            this.f34682d = cCharAt;
            return;
        }
        int i5 = cCharAt & 8191;
        int i11 = 13;
        int i12 = 1;
        while (true) {
            int i13 = i12 + 1;
            char cCharAt2 = str.charAt(i12);
            if (cCharAt2 < 55296) {
                this.f34682d = i5 | (cCharAt2 << i11);
                return;
            } else {
                i5 |= (cCharAt2 & 8191) << i11;
                i11 += 13;
                i12 = i13;
            }
        }
    }

    public final a a() {
        return this.f34679a;
    }

    public final int b() {
        int i5 = this.f34682d;
        if ((i5 & 1) != 0) {
            return 1;
        }
        return (i5 & 4) == 4 ? 3 : 2;
    }

    public final boolean c() {
        return (this.f34682d & 2) == 2;
    }
}
