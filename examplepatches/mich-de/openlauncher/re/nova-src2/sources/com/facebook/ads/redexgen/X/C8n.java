package com.facebook.ads.redexgen.X;

import android.net.Uri;
import android.os.Looper;
import com.facebook.ads.androidx.media3.common.Timeline;
import com.facebook.video.heroplayer.exocustom.MetaExoPlayerCustomization;

/* renamed from: com.facebook.ads.redexgen.X.8n, reason: invalid class name */
/* loaded from: assets/audience_network/classes.dex */
public final class C8n extends AbstractC1213Rv implements V4 {
    public static String[] A0D = {"aCCKp74F07xhks0wjUvUAOmke7ahumy3", "9yAdGChhzOrYvLlK7jxyWzYr2hB00EYR", "AU2N5WlA62GLL7yzjoonUPMRJtI3OVuj", "X4V0lMVEaRTDuPih5Dhtu8vWV1OA2igf", "peOHYqBZE6", "uU4ndoabaB4ymOQNkB8SKkaAeZXx9A8F", "bUyNtGoxVfGpgtNWB6WaPvyYmlQ53Sfo", "OkgGnovhzwhyAaFDcd6UqCls"};
    public long A00;
    public InterfaceC1108Ni A01;
    public InterfaceC1317Wb<XN> A02;
    public boolean A03;
    public boolean A04;
    public boolean A05;
    public final int A06;
    public final C1042Kr A07;
    public final C1273Ug A08;
    public final NN A09;
    public final InterfaceC1212Ru A0A;
    public final InterfaceC1291Uy A0B;
    public final X1 A0C;

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.Wb != com.google.common.base.Supplier<com.facebook.ads.androidx.media3.exoplayer.util.ReleasableExecutor> */
    @MetaExoPlayerCustomization
    public C8n(C1273Ug c1273Ug, NN nn2, InterfaceC1291Uy interfaceC1291Uy, InterfaceC1212Ru interfaceC1212Ru, X1 x12, int i5, InterfaceC1317Wb<XN> interfaceC1317Wb) {
        this.A07 = (C1042Kr) AbstractC1062Ln.A01(c1273Ug.A03);
        this.A08 = c1273Ug;
        this.A09 = nn2;
        this.A0B = interfaceC1291Uy;
        this.A0A = interfaceC1212Ru == null ? InterfaceC1212Ru.A00 : interfaceC1212Ru;
        this.A0C = x12;
        this.A06 = i5;
        this.A04 = true;
        this.A00 = -9223372036854775807L;
        this.A02 = interfaceC1317Wb;
    }

    private void A00() {
        final Timeline c8m = new C8m(this.A00, this.A05, false, this.A03, null, this.A08);
        if (this.A04) {
            Timeline timeline = new C8r(c8m) { // from class: com.facebook.ads.redexgen.X.4F
                @Override // com.facebook.ads.redexgen.X.C8r, com.facebook.ads.androidx.media3.common.Timeline
                public final UM A0I(int i5, UM um2, boolean z11) {
                    super.A0I(i5, um2, z11);
                    um2.A05 = true;
                    return um2;
                }

                @Override // com.facebook.ads.redexgen.X.C8r, com.facebook.ads.androidx.media3.common.Timeline
                public final UK A0L(int i5, UK uk2, long j11) {
                    super.A0L(i5, uk2, j11);
                    uk2.A0F = true;
                    return uk2;
                }
            };
            c8m = timeline;
        }
        A05(c8m);
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC1213Rv
    public final void A09() {
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC1213Rv
    public final void A0A(InterfaceC1108Ni interfaceC1108Ni) {
        this.A01 = interfaceC1108Ni;
        this.A0A.AIH();
        this.A0A.AKw((Looper) AbstractC1062Ln.A01(Looper.myLooper()), A00());
        A00();
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1276Uj
    @MetaExoPlayerCustomization
    public final InterfaceC1203Rl A65(C1202Rk c1202Rk, InterfaceC1327Wm interfaceC1327Wm, long j11) {
        TE teA5r = this.A09.A5r();
        if (this.A01 != null) {
            teA5r.A4T(this.A01);
        }
        Uri uri = this.A07.A00;
        InterfaceC1292Uz interfaceC1292UzA66 = this.A0B.A66(QD.A03);
        InterfaceC1212Ru interfaceC1212Ru = this.A0A;
        C1207Rp c1207RpA01 = A01(c1202Rk);
        X1 x12 = this.A0C;
        C1287Uu c1287UuA02 = A02(c1202Rk);
        String str = this.A07.A04;
        int i5 = this.A06;
        XN xn2 = this.A02 != null ? this.A02.get() : null;
        if (A0D[3].charAt(15) != 'h') {
            throw new RuntimeException();
        }
        String[] strArr = A0D;
        strArr[7] = "mg70WGikq5hXOPBSzr51jpiB";
        strArr[4] = "U6N8G9lzc0";
        return new C8p(uri, teA5r, interfaceC1292UzA66, interfaceC1212Ru, c1207RpA01, x12, c1287UuA02, this, interfaceC1327Wm, str, i5, xn2);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1276Uj
    public final void ADK() {
    }

    @Override // com.facebook.ads.redexgen.X.V4
    public final void AH7(long j11, boolean z11, boolean z12) {
        if (j11 == -9223372036854775807L) {
            j11 = this.A00;
        }
        if (!this.A04 && this.A00 == j11 && this.A05 == z11 && this.A03 == z12) {
            return;
        }
        this.A00 = j11;
        this.A05 = z11;
        this.A03 = z12;
        this.A04 = false;
        A00();
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1276Uj
    public final void AIy(InterfaceC1203Rl interfaceC1203Rl) {
        ((C8p) interfaceC1203Rl).A0a();
    }
}
