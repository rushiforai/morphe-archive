package com.facebook.ads.redexgen.X;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;

/* renamed from: com.facebook.ads.redexgen.X.kZ, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C2061kZ {
    public final long A00;
    public final EnumC2060kY A01;
    public final String A02;
    public final boolean A03;

    public C2061kZ(String str, boolean z11, EnumC2060kY enumC2060kY) {
        this(str, z11, enumC2060kY, System.currentTimeMillis());
    }

    public C2061kZ(String str, boolean z11, EnumC2060kY enumC2060kY, long j11) {
        this.A02 = str;
        this.A03 = z11;
        this.A01 = enumC2060kY;
        this.A00 = j11;
    }

    public static C2061kZ A00() {
        return new C2061kZ(b.f42142b, true, EnumC2060kY.A06, -1L);
    }

    public final long A01() {
        return this.A00;
    }

    public final EnumC2060kY A02() {
        return this.A01;
    }

    public final String A03() {
        return this.A02;
    }

    public final boolean A04() {
        return this.A03;
    }
}
