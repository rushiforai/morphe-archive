package com.facebook.ads.redexgen.X;

import com.facebook.video.heroplayer.exocustom.MetaExoPlayerCustomization;
import java.io.IOException;

/* renamed from: com.facebook.ads.redexgen.X.8t, reason: invalid class name */
/* loaded from: assets/audience_network/classes.dex */
public final class C8t implements InterfaceC1203Rl, InterfaceC1204Rm {
    public static String[] A06 = {"j7ubs5bwgBez5KDYUpPY3y9IUQxc", "JOAIKi1HLeUTl2tk5bOhUejHSMD1BwGe", "YxHHt2R32vuln3OS2w6ZQ7XqQwwfs", "aupLwo0WeDrisWiY1FBdNsKSCvzUPpFe", "KV0q3mJ2COCv3zNe1TKQIxAqT8En", "VvmcfsKIDFg0hFd1fCD4fg9J7lYLhQDg", "7uek9E1vo9MWNmtvovjiW3PoQelKtD61", "xssxyHNHBfHwiy7JIZEyvUKZcMkbPmVh"};
    public long A00;
    public long A01;
    public long A02;
    public InterfaceC1204Rm A03;
    public C1206Ro[] A04 = new C1206Ro[0];
    public final InterfaceC1203Rl A05;

    public C8t(InterfaceC1203Rl interfaceC1203Rl, boolean z11, long j11, long j12) {
        this.A05 = interfaceC1203Rl;
        this.A02 = z11 ? j11 : -9223372036854775807L;
        this.A01 = j11;
        this.A00 = j12;
    }

    private C1156Pj A00(long j11, C1156Pj c1156Pj) {
        long toleranceBeforeUs = N1.A0T(c1156Pj.A01, 0L, j11 - this.A01);
        long jA0T = N1.A0T(c1156Pj.A00, 0L, this.A00 == Long.MIN_VALUE ? Long.MAX_VALUE : this.A00 - j11);
        if (toleranceBeforeUs == c1156Pj.A01 && jA0T == c1156Pj.A00) {
            return c1156Pj;
        }
        return new C1156Pj(toleranceBeforeUs, jA0T);
    }

    /* JADX INFO: Access modifiers changed from: private */
    @Override // com.facebook.ads.redexgen.X.VI
    /* renamed from: A01, reason: merged with bridge method [inline-methods] */
    public final void AEW(InterfaceC1203Rl interfaceC1203Rl) {
        ((InterfaceC1204Rm) AbstractC1062Ln.A01(this.A03)).AEW(this);
    }

    public static boolean A02(long j11, RA[] raArr) {
        if (j11 != 0) {
            for (RA ra2 : raArr) {
                if (A06[3].charAt(14) == 'B') {
                    throw new RuntimeException();
                }
                String[] strArr = A06;
                strArr[6] = "fGuJHx4aftfK4nNvykLU6KmljzgT82dn";
                strArr[5] = "kD9XBGQyLMsMzCVi6Yj91l7kD05F7qTo";
                if (ra2 != null) {
                    VC vcA9f = ra2.A9f();
                    if (!L8.A0G(vcA9f.A0W, vcA9f.A0R)) {
                        return true;
                    }
                }
            }
        }
        return false;
    }

    public final boolean A03() {
        return this.A02 != -9223372036854775807L;
    }

    @Override // com.facebook.ads.redexgen.X.VJ
    @MetaExoPlayerCustomization
    public final void A5O(long j11) {
        this.A05.A5O(j11);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1203Rl
    public final boolean A5l(long j11) {
        return this.A05.A5l(j11);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1203Rl
    public final void A6Z(long j11, boolean z11) {
        this.A05.A6Z(j11, z11);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1203Rl
    public final long A7R(long j11, C1156Pj c1156Pj) {
        if (j11 == this.A01) {
            return this.A01;
        }
        return this.A05.A7R(j11, A00(j11, c1156Pj));
    }

    @Override // com.facebook.ads.redexgen.X.VJ
    @MetaExoPlayerCustomization
    public final long A7g(long j11) {
        return this.A05.A7g(j11);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1203Rl
    public final long A7i() {
        long jA7i = this.A05.A7i();
        if (jA7i == Long.MIN_VALUE || (this.A00 != Long.MIN_VALUE && jA7i >= this.A00)) {
            return Long.MIN_VALUE;
        }
        return jA7i;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1203Rl
    public final long A9E() {
        long jA9E = this.A05.A9E();
        if (jA9E != Long.MIN_VALUE) {
            if (this.A00 != Long.MIN_VALUE) {
                long j11 = this.A00;
                if (A06[3].charAt(14) == 'B') {
                    throw new RuntimeException();
                }
                String[] strArr = A06;
                strArr[4] = "xQnkrCD7Wc1JZKFxJsjRaCrFf9eL";
                strArr[0] = "QqNj2pBz7mrHzdsygHykcydjOmZN";
                if (jA9E >= j11) {
                }
            }
            return jA9E;
        }
        return Long.MIN_VALUE;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1203Rl
    public final RY A9z() {
        return this.A05.A9z();
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1203Rl
    public final void ADJ() throws IOException {
        if (0 == 0) {
            this.A05.ADJ();
            return;
        }
        throw null;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1204Rm
    public final void AGX(InterfaceC1203Rl interfaceC1203Rl) {
        if (0 != 0) {
            return;
        }
        ((InterfaceC1204Rm) AbstractC1062Ln.A01(this.A03)).AGX(this);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1203Rl
    public final void AII(InterfaceC1204Rm interfaceC1204Rm, long j11) {
        this.A03 = interfaceC1204Rm;
        this.A05.AII(this, j11);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1203Rl
    public final long AId() {
        if (A03()) {
            long childDiscontinuityUs = this.A02;
            this.A02 = -9223372036854775807L;
            long initialDiscontinuityUs = AId();
            return initialDiscontinuityUs != -9223372036854775807L ? initialDiscontinuityUs : childDiscontinuityUs;
        }
        long jAId = this.A05.AId();
        if (jAId == -9223372036854775807L) {
            return -9223372036854775807L;
        }
        boolean z11 = true;
        AbstractC1062Ln.A08(jAId >= this.A01);
        long discontinuityUs = this.A00;
        if (discontinuityUs != Long.MIN_VALUE && jAId > this.A00) {
            z11 = false;
        }
        AbstractC1062Ln.A08(z11);
        return jAId;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1203Rl
    public final void AIk(long j11) {
        this.A05.AIk(j11);
    }

    /* JADX WARN: Removed duplicated region for block: B:20:0x0055  */
    @Override // com.facebook.ads.redexgen.X.InterfaceC1203Rl
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final long AKQ(@MetaExoPlayerCustomization long j11, boolean z11) {
        this.A02 = -9223372036854775807L;
        boolean z12 = false;
        for (C1206Ro c1206Ro : this.A04) {
            if (c1206Ro != null) {
                c1206Ro.A00();
            }
        }
        long jAKQ = this.A05.AKQ(j11, z11);
        if (jAKQ == j11) {
            z12 = true;
        } else if (jAKQ >= this.A01) {
            long j12 = this.A00;
            String[] strArr = A06;
            if (strArr[4].length() != strArr[0].length()) {
                throw new RuntimeException();
            }
            A06[2] = "YjAFFIZthIBm8p803KJts";
            if (j12 == Long.MIN_VALUE || jAKQ <= this.A00) {
            }
        }
        AbstractC1062Ln.A08(z12);
        return jAKQ;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1203Rl
    public final long AKR(RA[] raArr, boolean[] zArr, VF[] vfArr, boolean[] zArr2, long j11) {
        long j12;
        boolean z11;
        this.A04 = new C1206Ro[vfArr.length];
        VF[] vfArr2 = new VF[vfArr.length];
        int i5 = 0;
        while (true) {
            VF vf2 = null;
            if (i5 >= vfArr.length) {
                break;
            }
            this.A04[i5] = (C1206Ro) vfArr[i5];
            VF[] childStreams = this.A04;
            if (childStreams[i5] != null) {
                vf2 = this.A04[i5].A01;
            }
            vfArr2[i5] = vf2;
            i5++;
        }
        long jAKR = this.A05.AKR(raArr, zArr, vfArr2, zArr2, j11);
        if (A03() && j11 == this.A01 && A02(this.A01, raArr)) {
            j12 = jAKR;
        } else {
            j12 = -9223372036854775807L;
        }
        this.A02 = j12;
        if (jAKR != j11) {
            long enablePositionUs = this.A01;
            if (jAKR >= enablePositionUs) {
                long enablePositionUs2 = this.A00;
                if (enablePositionUs2 != Long.MIN_VALUE) {
                    long enablePositionUs3 = this.A00;
                    if (jAKR <= enablePositionUs3) {
                    }
                }
                z11 = true;
            }
            z11 = false;
        } else {
            z11 = true;
        }
        AbstractC1062Ln.A08(z11);
        for (int i11 = 0; i11 < vfArr.length; i11++) {
            if (vfArr2[i11] == null) {
                VF[] childStreams2 = this.A04;
                childStreams2[i11] = null;
            } else {
                VF[] childStreams3 = this.A04;
                if (childStreams3[i11] == null || this.A04[i11].A01 != vfArr2[i11]) {
                    this.A04[i11] = new C1206Ro(this, vfArr2[i11]);
                }
            }
            VF[] childStreams4 = this.A04;
            vfArr[i11] = childStreams4[i11];
        }
        return jAKR;
    }

    @Override // com.facebook.ads.redexgen.X.VJ
    @MetaExoPlayerCustomization
    public final void AKu(boolean z11) {
        this.A05.AKu(z11);
    }

    @Override // com.facebook.ads.redexgen.X.VJ
    @MetaExoPlayerCustomization
    public final void ALv(byte b11) {
        this.A05.ALv(b11);
    }
}
