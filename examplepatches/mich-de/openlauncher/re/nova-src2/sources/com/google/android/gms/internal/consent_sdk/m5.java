package com.google.android.gms.internal.consent_sdk;

/* loaded from: classes3.dex */
public final class m5 extends n5 {
    @Override // com.google.android.gms.internal.consent_sdk.n5
    public final byte c(int i5) {
        if (((47 - (i5 + 1)) | i5) >= 0) {
            return this.f32155b[i5];
        }
        if (i5 < 0) {
            throw new ArrayIndexOutOfBoundsException(b.c0.h(i5, "Index < 0: "));
        }
        throw new ArrayIndexOutOfBoundsException(b.c0.i(i5, "Index > length: ", ", 47"));
    }

    @Override // com.google.android.gms.internal.consent_sdk.n5
    public final byte d(int i5) {
        return this.f32155b[i5];
    }

    @Override // com.google.android.gms.internal.consent_sdk.n5
    public final int e() {
        return 47;
    }
}
