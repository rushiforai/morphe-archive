package com.facebook.ads.redexgen.X;

import com.facebook.ads.androidx.media3.common.Metadata;
import com.facebook.video.heroplayer.exocustom.MetaExoPlayerCustomization;
import java.util.Arrays;
import java.util.List;
import org.checkerframework.checker.nullness.qual.EnsuresNonNullIf;

/* renamed from: com.facebook.ads.redexgen.X.On, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1139On extends AbstractC1498bN {
    public static byte[] A01;
    public static final byte[] A02;
    public static final byte[] A03;
    public boolean A00;

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A01, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 1);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A01 = new byte[]{-46, -26, -43, -38, -32, -96, -32, -31, -26, -28};
    }

    static {
        A01();
        A03 = new byte[]{79, 112, 117, 115, 72, 101, 97, 100};
        A02 = new byte[]{79, 112, 117, 115, 84, 97, 103, 115};
    }

    public static boolean A02(C1084Mk c1084Mk) {
        return A03(c1084Mk, A03);
    }

    public static boolean A03(C1084Mk c1084Mk, byte[] bArr) {
        if (c1084Mk.A07() < bArr.length) {
            return false;
        }
        int iA09 = c1084Mk.A09();
        int startPosition = bArr.length;
        byte[] header = new byte[startPosition];
        int startPosition2 = bArr.length;
        c1084Mk.A0k(header, 0, startPosition2);
        c1084Mk.A0f(iA09);
        return Arrays.equals(header, bArr);
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC1498bN
    public final long A0E(C1084Mk c1084Mk) {
        return A0D(ZF.A05(c1084Mk.A0l()));
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC1498bN
    public final void A0I(boolean z11) {
        super.A0I(z11);
        if (z11) {
            this.A00 = false;
        }
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC1498bN
    @EnsuresNonNullIf
    @MetaExoPlayerCustomization
    public final boolean A0J(C1084Mk c1084Mk, long j11, C1497bM c1497bM) throws L9 {
        if (A03(c1084Mk, A03)) {
            byte[] headerBytes = Arrays.copyOf(c1084Mk.A0l(), c1084Mk.A0A());
            int iA01 = ZF.A01(headerBytes);
            List<byte[]> listA06 = ZF.A06(headerBytes);
            if (c1497bM.A00 != null) {
                return true;
            }
            c1497bM.A00 = new C1029Ke().A11(A00(0, 10, 112)).A0b(iA01).A0m(48000).A12(listA06).A14();
            return true;
        }
        if (A03(c1084Mk, A02)) {
            AbstractC1062Ln.A02(c1497bM.A00);
            if (this.A00) {
                return true;
            }
            this.A00 = true;
            c1084Mk.A0g(A02.length);
            ZT commentHeader = ZW.A05(c1084Mk, false, false);
            Metadata vorbisMetadata = ZW.A02(XR.A02(commentHeader.A02));
            if (vorbisMetadata == null) {
                return true;
            }
            c1497bM.A00 = c1497bM.A00.A07().A0v(vorbisMetadata.A04(c1497bM.A00.A0P)).A14();
            return true;
        }
        AbstractC1062Ln.A02(c1497bM.A00);
        return false;
    }
}
