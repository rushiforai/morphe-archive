package com.facebook.ads.redexgen.X;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;

/* renamed from: com.facebook.ads.redexgen.X.rp, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C2501rp {
    public String A02;
    public String A03;
    public final C1742fL A06;
    public final C1756fZ A07;
    public final C0958Hi A08;
    public C1744fN A01 = C1744fN.A01(null);
    public int A00 = 1000;
    public boolean A05 = false;
    public String A04 = b.f42142b;

    public C2501rp(C0958Hi c0958Hi, C1742fL c1742fL, C1756fZ c1756fZ) {
        this.A08 = c0958Hi;
        this.A06 = c1742fL;
        this.A07 = c1756fZ;
    }

    public final C2501rp A09(int i5) {
        this.A00 = i5;
        return this;
    }

    public final C2501rp A0A(C1744fN c1744fN) {
        this.A01 = c1744fN;
        return this;
    }

    public final C2501rp A0B(String str) {
        this.A04 = str;
        return this;
    }

    public final C2501rp A0C(String str) {
        this.A02 = str;
        return this;
    }

    public final C2501rp A0D(String str) {
        this.A03 = str;
        return this;
    }

    public final C2501rp A0E(boolean z11) {
        this.A05 = z11;
        return this;
    }

    public final C2499rn A0F() {
        return new C2499rn(this, null);
    }
}
