package com.facebook.ads.redexgen.X;

import com.facebook.ads.androidx.media3.extractor.mkv.MatroskaExtractor;
import java.io.IOException;

/* loaded from: assets/audience_network/classes.dex */
public final class PN implements InterfaceC1445aW {
    public final /* synthetic */ MatroskaExtractor A00;

    public PN(MatroskaExtractor matroskaExtractor) {
        this.A00 = matroskaExtractor;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1445aW
    public final void A5B(int i5, int i11, Q9 q92) throws IOException {
        this.A00.A0U(i5, i11, q92);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1445aW
    public final void A6w(int i5) throws L9 {
        this.A00.A0S(i5);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1445aW
    public final void A7A(int i5, double d5) throws L9 {
        this.A00.A0T(i5, d5);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1445aW
    public final int A8V(int i5) {
        return this.A00.A0R(i5);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1445aW
    public final void AAv(int i5, long j11) throws L9 {
        this.A00.A0V(i5, j11);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1445aW
    public final boolean ABE(int i5) {
        return this.A00.A0Y(i5);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1445aW
    public final void ALS(int i5, long j11, long j12) throws L9 {
        this.A00.A0W(i5, j11, j12);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1445aW
    public final void ALd(int i5, String str) throws L9 {
        this.A00.A0X(i5, str);
    }
}
