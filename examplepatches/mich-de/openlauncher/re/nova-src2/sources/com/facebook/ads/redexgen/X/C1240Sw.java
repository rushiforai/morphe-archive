package com.facebook.ads.redexgen.X;

import com.facebook.video.heroplayer.exocustom.MetaExoPlayerCustomization;
import java.util.Arrays;

/* renamed from: com.facebook.ads.redexgen.X.Sw, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1240Sw implements InterfaceC1149Ox {
    public static byte[] A07;
    public static String[] A08 = {"rzHoui5FCY2txYmQPhBR8KnZrt2k1zHf", "kW", "8UoYFvsA4YH9hERzKy4kjiF0B8fM71vZ", "7438j8GJ5chy", "sA9yRk9BDkS1eIgMaGcl0fZ", "UZ01", "BvFRsFBpXh8z621x1ZIYqzzWo02vyFBW", "8X7U"};
    public InterfaceC1149Ox A00;
    public InterfaceC1224Sg A01;
    public boolean A04;
    public final OE A05;
    public final C1220Sc A06;
    public boolean A03 = true;

    @MetaExoPlayerCustomization
    public boolean A02 = XL.A03(XQ.A2K);

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A07, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 57);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A07 = new byte[]{-83, -43, -52, -44, -55, -48, -52, -59, -128, -46, -59, -50, -60, -59, -46, -59, -46, -128, -51, -59, -60, -55, -63, -128, -61, -52, -49, -61, -53, -45, -128, -59, -50, -63, -62, -52, -59, -60, -114};
    }

    static {
        A01();
    }

    public C1240Sw(OE oe2, InterfaceC1069Lu interfaceC1069Lu) {
        this.A05 = oe2;
        this.A06 = new C1220Sc(interfaceC1069Lu);
    }

    private void A02(boolean z11) {
        if (A03(z11)) {
            this.A03 = true;
            if (this.A04) {
                this.A06.A00();
                return;
            }
            return;
        }
        InterfaceC1149Ox interfaceC1149Ox = (InterfaceC1149Ox) AbstractC1062Ln.A01(this.A00);
        long rendererClockPositionUs = interfaceC1149Ox.A9S();
        if (this.A03) {
            InterfaceC1149Ox rendererClock = this.A06;
            if (rendererClockPositionUs < rendererClock.A9S()) {
                this.A06.A01();
                return;
            } else {
                this.A03 = false;
                if (this.A04) {
                    this.A06.A00();
                }
            }
        }
        this.A06.A02(rendererClockPositionUs);
        UW uwA9P = interfaceC1149Ox.A9P();
        InterfaceC1149Ox rendererClock2 = this.A06;
        if (!uwA9P.equals(rendererClock2.A9P())) {
            InterfaceC1149Ox rendererClock3 = this.A06;
            rendererClock3.AKv(uwA9P);
            this.A05.AGN(uwA9P);
        }
    }

    private boolean A03(boolean z11) {
        return this.A01 == null || this.A01.AB7() || (!this.A01.ABM() && (z11 || this.A01.AAT()));
    }

    public final long A04(boolean z11) {
        A02(z11);
        return A9S();
    }

    public final void A05() {
        this.A04 = true;
        this.A06.A00();
    }

    public final void A06() {
        this.A04 = false;
        this.A06.A01();
    }

    public final void A07(long j11) {
        this.A06.A02(j11);
    }

    public final void A08(InterfaceC1224Sg interfaceC1224Sg) {
        if (interfaceC1224Sg == this.A01) {
            this.A00 = null;
            this.A01 = null;
            this.A03 = true;
        }
    }

    public final void A09(InterfaceC1224Sg interfaceC1224Sg) throws AnonymousClass96 {
        InterfaceC1149Ox interfaceC1149OxA95 = interfaceC1224Sg.A95();
        if (interfaceC1149OxA95 != null) {
            InterfaceC1149Ox rendererMediaClock = this.A00;
            if (interfaceC1149OxA95 != rendererMediaClock) {
                InterfaceC1149Ox rendererMediaClock2 = this.A00;
                if (rendererMediaClock2 == null) {
                    this.A00 = interfaceC1149OxA95;
                    this.A01 = interfaceC1224Sg;
                    InterfaceC1149Ox interfaceC1149Ox = this.A00;
                    InterfaceC1149Ox rendererMediaClock3 = this.A06;
                    interfaceC1149Ox.AKv(rendererMediaClock3.A9P());
                    return;
                }
                throw AnonymousClass96.A02(new IllegalStateException(A00(0, 39, 39)));
            }
        }
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1149Ox
    public final UW A9P() {
        if (this.A00 != null) {
            return this.A00.A9P();
        }
        return this.A06.A9P();
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1149Ox
    public final long A9S() {
        if (this.A03) {
            C1220Sc c1220Sc = this.A06;
            if (A08[4].length() != 23) {
                throw new RuntimeException();
            }
            A08[0] = "haFfgiF2A5A3793S64y9oZunablguEEE";
            return c1220Sc.A9S();
        }
        return ((InterfaceC1149Ox) AbstractC1062Ln.A01(this.A00)).A9S();
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1149Ox
    @MetaExoPlayerCustomization
    public final void AKv(UW uw2) {
        if (this.A00 != null) {
            this.A00.AKv(uw2);
            uw2 = this.A00.A9P();
        }
        this.A06.AKv(uw2);
        if (this.A02) {
            this.A05.AGN(uw2);
        }
    }
}
