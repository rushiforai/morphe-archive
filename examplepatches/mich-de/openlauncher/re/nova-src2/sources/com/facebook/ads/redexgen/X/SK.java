package com.facebook.ads.redexgen.X;

import java.nio.ByteBuffer;
import java.nio.ByteOrder;

/* loaded from: assets/audience_network/classes.dex */
public abstract class SK implements LZ {
    public boolean A04;
    public ByteBuffer A02 = LZ.A00;
    public ByteBuffer A03 = LZ.A00;
    public LX A00 = LX.A06;
    public LX A01 = LX.A06;
    public LX A05 = LX.A06;
    public LX A06 = LX.A06;

    public abstract LX A09(LX lx2) throws LY;

    public final ByteBuffer A00(int i5) {
        if (this.A02.capacity() < i5) {
            this.A02 = ByteBuffer.allocateDirect(i5).order(ByteOrder.nativeOrder());
        } else {
            this.A02.clear();
        }
        this.A03 = this.A02;
        return this.A02;
    }

    public final boolean A01() {
        return this.A03.hasRemaining();
    }

    public void A0A() {
    }

    public void A0B() {
    }

    @Override // com.facebook.ads.redexgen.X.LZ
    public final LX A5g(LX lx2) throws LY {
        this.A00 = lx2;
        this.A01 = A09(lx2);
        return AB3() ? this.A01 : LX.A06;
    }

    @Override // com.facebook.ads.redexgen.X.LZ
    public ByteBuffer A9G() {
        ByteBuffer byteBuffer = this.A03;
        ByteBuffer outputBuffer = LZ.A00;
        this.A03 = outputBuffer;
        return byteBuffer;
    }

    @Override // com.facebook.ads.redexgen.X.LZ
    public boolean AB3() {
        return this.A01 != LX.A06;
    }

    @Override // com.facebook.ads.redexgen.X.LZ
    public boolean AB7() {
        return this.A04 && this.A03 == LZ.A00;
    }

    @Override // com.facebook.ads.redexgen.X.LZ
    public final void AIT() {
        this.A04 = true;
        A0B();
    }

    @Override // com.facebook.ads.redexgen.X.LZ
    public final void flush() {
        this.A03 = LZ.A00;
        this.A04 = false;
        this.A05 = this.A00;
        this.A06 = this.A01;
        A0A();
    }
}
