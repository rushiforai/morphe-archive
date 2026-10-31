package com.facebook.ads.redexgen.X;

import android.net.Uri;
import com.facebook.video.heroplayer.exocustom.MetaExoPlayerCustomization;
import java.io.EOFException;
import java.io.IOException;

/* loaded from: assets/audience_network/classes.dex */
public final class QA implements ZP {
    public final byte[] A00 = new byte[androidx.recyclerview.widget.u1.FLAG_APPEARED_IN_PRE_LAYOUT];

    @Override // com.facebook.ads.redexgen.X.ZP
    public final /* synthetic */ int AK7(KR kr2, int i5, boolean z11) {
        return ZM.A00(this, kr2, i5, z11);
    }

    @Override // com.facebook.ads.redexgen.X.ZP
    public final /* synthetic */ void AK9(C1084Mk c1084Mk, int i5) {
        ZM.A01(this, c1084Mk, i5);
    }

    @Override // com.facebook.ads.redexgen.X.ZP
    public final void A7E(VC vc) {
    }

    @Override // com.facebook.ads.redexgen.X.ZP
    public final int AK8(KR kr2, int i5, boolean z11, int i11) throws IOException {
        int bytesSkipped = kr2.read(this.A00, 0, Math.min(this.A00.length, i5));
        if (bytesSkipped == -1) {
            if (z11) {
                return -1;
            }
            throw new EOFException();
        }
        return bytesSkipped;
    }

    @Override // com.facebook.ads.redexgen.X.ZP
    public final void AKA(C1084Mk c1084Mk, int i5, int i11) {
        c1084Mk.A0g(i5);
    }

    @Override // com.facebook.ads.redexgen.X.ZP
    public final void AKC(long j11, int i5, int i11, int i12, ZN zn2) {
    }

    @Override // com.facebook.ads.redexgen.X.ZP
    @MetaExoPlayerCustomization
    public final void ALz(Uri uri) {
    }
}
