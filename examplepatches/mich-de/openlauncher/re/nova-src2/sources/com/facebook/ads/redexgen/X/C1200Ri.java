package com.facebook.ads.redexgen.X;

import com.facebook.video.heroplayer.exocustom.MetaExoPlayerCustomization;
import java.io.IOException;

/* renamed from: com.facebook.ads.redexgen.X.Ri, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1200Ri implements VF, VG {
    public final int A00;
    public final /* synthetic */ C8p A01;

    public C1200Ri(C8p c8p, int i5) {
        this.A01 = c8p;
        this.A00 = i5;
    }

    @Override // com.facebook.ads.redexgen.X.VG
    @MetaExoPlayerCustomization
    public final long A8k() {
        return this.A01.A0L[this.A00].A0S();
    }

    @Override // com.facebook.ads.redexgen.X.VF
    public final boolean ABM() {
        return this.A01.A0f(this.A00);
    }

    @Override // com.facebook.ads.redexgen.X.VF
    public final void ADI() throws IOException {
        this.A01.A0d(this.A00);
    }

    @Override // com.facebook.ads.redexgen.X.VF
    public final int AIc(C1140Oo c1140Oo, T2 t22, int i5) {
        return this.A01.A0Y(this.A00, c1140Oo, t22, i5);
    }

    @Override // com.facebook.ads.redexgen.X.VF
    public final int ALK(long j11) {
        return this.A01.A0X(this.A00, j11);
    }
}
