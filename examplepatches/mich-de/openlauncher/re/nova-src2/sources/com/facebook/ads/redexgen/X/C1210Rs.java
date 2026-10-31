package com.facebook.ads.redexgen.X;

import android.net.Uri;
import com.facebook.video.heroplayer.exocustom.MetaExoPlayerCustomization;
import java.io.EOFException;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* renamed from: com.facebook.ads.redexgen.X.Rs, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1210Rs implements InterfaceC1292Uz {
    public static byte[] A03;
    public static String[] A04 = {"dheE", "Iwl2", "MEE4GexDrhsXhj", "D0RnELDLc4WQvimbBPbg52MLoCkd3U7O", "PyJuBTzi61xP0Rgs", "6HCI0jtPHoSOK2", "ApHe7VzdSKcwRAS0SKPKUFrd8tVtm3mv", "uvkaOnOj7C7QVT"};
    public InterfaceC1383Yv A00;
    public Q9 A01;
    public final InterfaceC1387Yz A02;

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A03, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 4);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A03 = new byte[]{-120, AbstractJsonLexerKt.TC_INVALID, -62, -50, -44, -53, -61, AbstractJsonLexerKt.TC_INVALID, -47, -60, -64, -61, AbstractJsonLexerKt.TC_INVALID, -45, -57, -60, AbstractJsonLexerKt.TC_INVALID, -46, -45, -47, -60, -64, -52, -115, 108, -115, -116, -125, 62, -115, -124, 62, -110, -122, -125, 62, AbstractJsonLexerKt.TC_INVALID, -108, AbstractJsonLexerKt.TC_INVALID, -121, -118, AbstractJsonLexerKt.TC_INVALID, -128, -118, -125, 62, -125, -106, -110, -112, AbstractJsonLexerKt.TC_INVALID, -127, -110, -115, -112, -111, 62, 70};
    }

    static {
        A01();
    }

    public C1210Rs(InterfaceC1387Yz interfaceC1387Yz) {
        this.A02 = interfaceC1387Yz;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1292Uz
    @MetaExoPlayerCustomization
    public final void A6X() {
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1292Uz
    public final long A8B() {
        if (this.A01 != null) {
            return this.A01.A9Q();
        }
        return -1L;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1292Uz
    public final void AAp(@MetaExoPlayerCustomization(" To be replaced with DataReader after upstream is updated") TE te2, Uri uri, Map<String, List<String>> map, long j11, long j12, InterfaceC1384Yw interfaceC1384Yw) throws IOException {
        C07378f c07378f = new C07378f(te2, j11, j12);
        this.A01 = c07378f;
        if (this.A00 != null) {
            return;
        }
        InterfaceC1383Yv[] extractors = this.A02.A5x(uri, map);
        if (extractors.length == 1) {
            this.A00 = extractors[0];
        } else {
            int length = extractors.length;
            int i5 = 0;
            while (true) {
                if (i5 >= length) {
                    break;
                }
                InterfaceC1383Yv interfaceC1383Yv = extractors[i5];
                try {
                } catch (EOFException unused) {
                    if (this.A00 != null || c07378f.A9Q() == j11) {
                    }
                } catch (Throwable th2) {
                    AbstractC1062Ln.A08(this.A00 != null || c07378f.A9Q() == j11);
                    c07378f.AK3();
                    throw th2;
                }
                if (interfaceC1383Yv.ALN(c07378f)) {
                    this.A00 = interfaceC1383Yv;
                    AbstractC1062Ln.A08(this.A00 != null || c07378f.A9Q() == j11);
                    c07378f.AK3();
                } else {
                    boolean z11 = this.A00 != null || c07378f.A9Q() == j11;
                    AbstractC1062Ln.A08(z11);
                    c07378f.AK3();
                    i5++;
                }
            }
            if (this.A00 == null) {
                throw new RX(A00(24, 34, 26) + N1.A0s(extractors) + A00(0, 24, 91), (Uri) AbstractC1062Ln.A01(uri));
            }
        }
        InterfaceC1383Yv interfaceC1383Yv2 = this.A00;
        String[] strArr = A04;
        if (strArr[2].length() != strArr[7].length()) {
            throw new RuntimeException();
        }
        A04[3] = "Ll15BA8YIA3F8MXDjYKO5u7HXF1WnxP9";
        interfaceC1383Yv2.AAq(interfaceC1384Yw);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1292Uz
    public final int AIZ(ZH zh2) throws IOException {
        return ((InterfaceC1383Yv) AbstractC1062Ln.A01(this.A00)).AIY((Q9) AbstractC1062Ln.A01(this.A01), zh2);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1292Uz
    public final void AIp() {
        if (this.A00 != null) {
            this.A00.AIp();
            String[] strArr = A04;
            if (strArr[2].length() != strArr[7].length()) {
                throw new RuntimeException();
            }
            String[] strArr2 = A04;
            strArr2[4] = "PSKkZCh97ktz0s4q";
            strArr2[5] = "8E6IFM17kqru9U";
            this.A00 = null;
        }
        this.A01 = null;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1292Uz
    public final void AKO(long j11, long j12) {
        ((InterfaceC1383Yv) AbstractC1062Ln.A01(this.A00)).AKO(j11, j12);
    }
}
