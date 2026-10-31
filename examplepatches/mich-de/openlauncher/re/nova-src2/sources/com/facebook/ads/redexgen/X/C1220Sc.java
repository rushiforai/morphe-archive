package com.facebook.ads.redexgen.X;

import com.facebook.video.heroplayer.exocustom.MetaExoPlayerCustomization;

@MetaExoPlayerCustomization
/* renamed from: com.facebook.ads.redexgen.X.Sc, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class C1220Sc implements InterfaceC1149Ox {
    public static String[] A05 = {"Azs17CFr08No3JiudECzTD969WN37o7", "gdwVSO", "BQbkTVLnALmTK4t3iDSCe", "QuSzUIEdxNu6DWfru6OCfMbe1VI61w", "bkbC2gVlY1Yk1m7JUTGD", "IkE81", "GWIaH4TtsLO6epnDEeFC9wRIEzAgGgGA", "PjMvm1PmNrw6x"};
    public long A00;
    public long A01;
    public UW A02 = UW.A05;
    public boolean A03;
    public final InterfaceC1069Lu A04;

    public C1220Sc(InterfaceC1069Lu interfaceC1069Lu) {
        this.A04 = interfaceC1069Lu;
    }

    public void A00() {
        if (!this.A03) {
            this.A00 = this.A04.A6s();
            this.A03 = true;
        }
    }

    public void A01() {
        if (this.A03) {
            A02(A9S());
            this.A03 = false;
        }
    }

    public void A02(long j11) {
        this.A01 = j11;
        if (this.A03) {
            long jA6s = this.A04.A6s();
            if (A05[6].charAt(16) != 'E') {
                throw new RuntimeException();
            }
            String[] strArr = A05;
            strArr[2] = "LKBp3WmaJ7eIQYhbukbaZ";
            strArr[4] = "jnJGPiBBu5SxkPoUo9gt";
            this.A00 = jA6s;
        }
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1149Ox
    public UW A9P() {
        return this.A02;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1149Ox
    public long A9S() {
        long j11 = this.A01;
        if (this.A03) {
            long jA6s = this.A04.A6s();
            long positionUs = this.A00;
            long j12 = jA6s - positionUs;
            float f11 = this.A02.A01;
            String[] strArr = A05;
            if (strArr[1].length() == strArr[0].length()) {
                throw new RuntimeException();
            }
            A05[6] = "hLp01FOAv5eA49unEvsyMhNhGGc3ow5h";
            if (f11 == 1.0f) {
                long positionUs2 = N1.A0O(j12);
                return j11 + positionUs2;
            }
            long positionUs3 = this.A02.A03(j12);
            return j11 + positionUs3;
        }
        return j11;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1149Ox
    public void AKv(UW uw2) {
        if (this.A03) {
            A02(A9S());
        }
        this.A02 = uw2;
    }
}
