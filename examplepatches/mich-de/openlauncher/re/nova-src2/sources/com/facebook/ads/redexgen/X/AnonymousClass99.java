package com.facebook.ads.redexgen.X;

import android.net.Uri;
import java.io.IOException;
import java.util.Collections;
import java.util.List;
import java.util.Map;

/* renamed from: com.facebook.ads.redexgen.X.99, reason: invalid class name */
/* loaded from: assets/audience_network/classes.dex */
public final class AnonymousClass99 implements TE {
    public long A00;
    public Uri A01 = Uri.EMPTY;
    public Map<String, List<String>> A02 = Collections.emptyMap();
    public final TE A03;

    public AnonymousClass99(TE te2) {
        this.A03 = (TE) AbstractC1062Ln.A01(te2);
    }

    public final long A00() {
        return this.A00;
    }

    public final Uri A01() {
        return this.A01;
    }

    public final Map<String, List<String>> A02() {
        return this.A02;
    }

    @Override // com.facebook.ads.redexgen.X.TE
    public final void A4T(InterfaceC1108Ni interfaceC1108Ni) {
        AbstractC1062Ln.A01(interfaceC1108Ni);
        this.A03.A4T(interfaceC1108Ni);
    }

    @Override // com.facebook.ads.redexgen.X.TE
    public final Map<String, List<String>> A9W() {
        return this.A03.A9W();
    }

    @Override // com.facebook.ads.redexgen.X.TE
    public final Uri AA2() {
        return this.A03.AA2();
    }

    @Override // com.facebook.ads.redexgen.X.TE
    public final long AHv(NX nx2) throws IOException {
        this.A01 = nx2.A06;
        this.A02 = Collections.emptyMap();
        long jAHv = this.A03.AHv(nx2);
        this.A01 = (Uri) AbstractC1062Ln.A01(AA2());
        this.A02 = A9W();
        return jAHv;
    }

    @Override // com.facebook.ads.redexgen.X.TE
    public final void close() throws IOException {
        this.A03.close();
    }

    @Override // com.facebook.ads.redexgen.X.KR
    public final int read(byte[] bArr, int i5, int i11) throws IOException {
        int i12 = this.A03.read(bArr, i5, i11);
        if (i12 != -1) {
            this.A00 += i12;
        }
        return i12;
    }
}
