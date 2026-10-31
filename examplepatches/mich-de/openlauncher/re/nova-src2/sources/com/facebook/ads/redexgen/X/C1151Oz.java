package com.facebook.ads.redexgen.X;

import com.facebook.ads.androidx.media3.common.Timeline;
import com.facebook.video.heroplayer.exocustom.MetaExoPlayerCustomization;
import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* renamed from: com.facebook.ads.redexgen.X.Oz, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1151Oz {
    public static byte[] A0E;
    public static String[] A0F = {"xeNmsN5JKd3AA", "Z04P8T13CEqsnfEVcttKFEqj29GRXKUL", "lC6IfUxfJXSeS", "mqCbdzoESXNqi7TcuBtcGY3oRo12E4Pd", "NLwB4WZdcWvz5YN3eLjjOx3Ay2p6uDYK", "ZPMzBEU0DQA2C", "r1txEiQ0trD4b", "F2qoMedzc104itDVaFIeKDfHUX98ZJvI"};
    public P0 A00;
    public boolean A01;
    public boolean A02;
    public long A03;
    public C1151Oz A04;
    public RY A05 = RY.A06;
    public C1324Wj A06;
    public final InterfaceC1203Rl A07;
    public final Object A08;
    public final VF[] A09;
    public final InterfaceC1150Oy A0A;
    public final AbstractC1323Wi A0B;
    public final InterfaceC1153Pe[] A0C;
    public final boolean[] A0D;

    public static String A01(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A0E, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 101);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A04() {
        byte[] bArr = {94, 118, 119, 122, 114, 67, 118, 97, 122, 124, 119, 91, 124, AbstractJsonLexerKt.TC_INVALID, 119, 118, 97, 44, 25, 14, 21, 19, 24, 92, 14, 25, 16, 25, 29, 15, 25, 92, 26, 29, 21, 16, 25, 24, 82};
        String[] strArr = A0F;
        if (strArr[6].length() != strArr[2].length()) {
            throw new RuntimeException();
        }
        String[] strArr2 = A0F;
        strArr2[5] = "xrsRfx8FMqka3";
        strArr2[0] = "gzwWjpeZxHefO";
        A0E = bArr;
    }

    static {
        A04();
    }

    @MetaExoPlayerCustomization
    public C1151Oz(InterfaceC1153Pe[] interfaceC1153PeArr, long j11, AbstractC1323Wi abstractC1323Wi, InterfaceC1327Wm interfaceC1327Wm, InterfaceC1276Uj interfaceC1276Uj, P0 p02, C1324Wj c1324Wj) {
        this.A0C = interfaceC1153PeArr;
        this.A03 = j11 - p02.A03;
        this.A0B = abstractC1323Wi;
        this.A08 = AbstractC1062Ln.A01(p02.A04.A04);
        this.A00 = p02;
        this.A06 = c1324Wj;
        this.A09 = new VF[interfaceC1153PeArr.length];
        this.A0D = new boolean[interfaceC1153PeArr.length];
        this.A0A = new C1225Sh(this, interfaceC1276Uj);
        this.A07 = A00(p02.A04, this.A0A, interfaceC1327Wm, p02.A03, p02.A01);
    }

    @MetaExoPlayerCustomization
    public static InterfaceC1203Rl A00(C1202Rk c1202Rk, InterfaceC1150Oy interfaceC1150Oy, InterfaceC1327Wm interfaceC1327Wm, long j11, long j12) {
        InterfaceC1203Rl interfaceC1203RlA65 = interfaceC1150Oy.A65(c1202Rk, interfaceC1327Wm, j11);
        if (j12 != -9223372036854775807L) {
            return new C8t(interfaceC1203RlA65, true, 0L, j12);
        }
        return interfaceC1203RlA65;
    }

    /* JADX WARN: Incorrect condition in loop: B:7:0x000c */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private void A02() {
        if (!A08()) {
            return;
        }
        for (int i5 = 0; i5 < i; i5++) {
            boolean rendererEnabled = this.A06.A00(i5);
            RA ra2 = this.A06.A04[i5];
            if (rendererEnabled && ra2 != null) {
                ra2.A6W();
            }
        }
    }

    /* JADX WARN: Incorrect condition in loop: B:7:0x000c */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private void A03() {
        if (!A08()) {
            return;
        }
        for (int i5 = 0; i5 < i; i5++) {
            boolean rendererEnabled = this.A06.A00(i5);
            RA ra2 = this.A06.A04[i5];
            if (rendererEnabled && ra2 != null) {
                ra2.A6t();
            }
        }
    }

    @MetaExoPlayerCustomization
    public static void A05(InterfaceC1150Oy interfaceC1150Oy, InterfaceC1203Rl interfaceC1203Rl) {
        try {
            if (interfaceC1203Rl instanceof C8t) {
                interfaceC1150Oy.AIy(((C8t) interfaceC1203Rl).A05);
            } else {
                interfaceC1150Oy.AIy(interfaceC1203Rl);
            }
        } catch (RuntimeException e3) {
            MV.A08(A01(0, 17, Sdk.SDKError.Reason.PROTOBUF_SERIALIZATION_ERROR_VALUE), A01(17, 22, 25), e3);
        }
    }

    /* JADX WARN: Incorrect condition in loop: B:4:0x0004 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private void A06(VF[] vfArr) {
        for (int i5 = 0; i5 < i; i5++) {
            if (this.A0C[i5].AA0() == -2 && this.A06.A00(i5)) {
                vfArr[i5] = new C1205Rn();
            }
        }
    }

    private void A07(VF[] vfArr) {
        int i5 = 0;
        while (true) {
            InterfaceC1153Pe[] interfaceC1153PeArr = this.A0C;
            String[] strArr = A0F;
            String str = strArr[3];
            String str2 = strArr[7];
            int iCharAt = str.charAt(12);
            int i11 = str2.charAt(12);
            if (iCharAt != i11) {
                throw new RuntimeException();
            }
            String[] strArr2 = A0F;
            strArr2[1] = "e67iNPwlo2xMyItWeFWVrh6Sq5MD7b9N";
            strArr2[4] = "8j5sJWHYuA8HuIuKrszfSbVSyNbW6rIm";
            int i12 = interfaceC1153PeArr.length;
            if (i5 < i12) {
                int iAA0 = this.A0C[i5].AA0();
                String[] strArr3 = A0F;
                String str3 = strArr3[5];
                String str4 = strArr3[0];
                int length = str3.length();
                int i13 = str4.length();
                if (length != i13) {
                    throw new RuntimeException();
                }
                String[] strArr4 = A0F;
                strArr4[1] = "a5omIPsi53glrCjuYuliWX9X1uQjkwF7";
                strArr4[4] = "o4jjjRHo4L3CtOBwjjyvFJ2NYpv36dqm";
                if (iAA0 == -2) {
                    vfArr[i5] = null;
                }
                i5++;
            } else {
                return;
            }
        }
    }

    private boolean A08() {
        return this.A04 == null;
    }

    public final long A09() {
        if (!this.A02) {
            return this.A00.A03;
        }
        long jA7i = this.A01 ? this.A07.A7i() : Long.MIN_VALUE;
        return jA7i == Long.MIN_VALUE ? this.A00.A00 : jA7i;
    }

    public final long A0A() {
        if (this.A02) {
            return this.A07.A9E();
        }
        return 0L;
    }

    public final long A0B() {
        return this.A03;
    }

    @MetaExoPlayerCustomization
    public final long A0C(long j11) {
        return this.A07.A7g(j11);
    }

    public final long A0D(long j11) {
        return j11 - A0B();
    }

    public final long A0E(long j11) {
        return A0B() + j11;
    }

    public final long A0F(C1324Wj c1324Wj, long j11, boolean z11) {
        return A0G(c1324Wj, j11, z11, new boolean[this.A0C.length]);
    }

    public final long A0G(C1324Wj c1324Wj, long j11, boolean z11, boolean[] zArr) {
        int i5 = 0;
        while (true) {
            boolean z12 = false;
            if (i5 >= c1324Wj.A00) {
                break;
            }
            boolean[] zArr2 = this.A0D;
            if (!z11 && c1324Wj.A01(this.A06, i5)) {
                z12 = true;
            }
            zArr2[i5] = z12;
            i5++;
        }
        A07(this.A09);
        A02();
        this.A06 = c1324Wj;
        A03();
        long jAKR = this.A07.AKR(c1324Wj.A04, this.A0D, this.A09, zArr, j11);
        A06(this.A09);
        this.A01 = false;
        for (int i11 = 0; i11 < this.A09.length; i11++) {
            if (this.A09[i11] != null) {
                AbstractC1062Ln.A08(c1324Wj.A00(i11));
                int iAA0 = this.A0C[i11].AA0();
                String[] strArr = A0F;
                if (strArr[5].length() != strArr[0].length()) {
                    throw new RuntimeException();
                }
                String[] strArr2 = A0F;
                strArr2[5] = "SpfogtgHHCqG6";
                strArr2[0] = "WCRSsSXzpYDpA";
                if (iAA0 != -2) {
                    this.A01 = true;
                }
            } else {
                AbstractC1062Ln.A08(c1324Wj.A04[i11] == null);
            }
        }
        return jAKR;
    }

    @MetaExoPlayerCustomization
    public final long A0H(boolean z11) {
        if (!z11) {
            return this.A03;
        }
        return this.A00.A03 + this.A03;
    }

    public final C1151Oz A0I() {
        return this.A04;
    }

    public final RY A0J() {
        return this.A05;
    }

    public final C1324Wj A0K() {
        return this.A06;
    }

    public final C1324Wj A0L(float f11, Timeline timeline) throws AnonymousClass96 {
        C1324Wj c1324WjA0b = this.A0B.A0b(this.A0C, A0J(), this.A00.A04, timeline);
        for (RA ra2 : c1324WjA0b.A04) {
            if (ra2 != null) {
                ra2.AGO(f11);
            }
        }
        return c1324WjA0b;
    }

    @MetaExoPlayerCustomization
    public final void A0M() {
        A02();
        A05(this.A0A, this.A07);
    }

    public final void A0N(float f11, Timeline timeline) throws AnonymousClass96 {
        this.A02 = true;
        this.A05 = this.A07.A9z();
        long jA0F = A0F(A0L(f11, timeline), this.A00.A03, false);
        this.A03 += this.A00.A03 - jA0F;
        this.A00 = this.A00.A00(jA0F);
    }

    public final void A0O(long j11) {
        AbstractC1062Ln.A08(A08());
        this.A07.A5l(A0D(j11));
    }

    public final void A0P(long j11) {
        AbstractC1062Ln.A08(A08());
        if (this.A02) {
            this.A07.AIk(A0D(j11));
        }
    }

    public final void A0Q(C1151Oz c1151Oz) {
        if (c1151Oz == this.A04) {
            return;
        }
        A02();
        this.A04 = c1151Oz;
        A03();
    }

    public final boolean A0R() {
        return this.A02 && (!this.A01 || this.A07.A7i() == Long.MIN_VALUE);
    }
}
