package com.facebook.ads.redexgen.X;

/* loaded from: assets/audience_network/classes.dex */
public final class M7 {
    public float A00 = 1.0f;
    public int A01;
    public int A02;
    public long A03;

    public M7(int i5, int i11) {
        this.A02 = i5;
        this.A01 = i11;
    }

    public final M7 A00(float f11) {
        this.A00 = f11;
        return this;
    }

    public final M8 A01() {
        return new M8(this.A02, this.A01, this.A00, this.A03);
    }
}
