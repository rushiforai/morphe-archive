package com.facebook.ads.redexgen.X;

import android.util.SparseBooleanArray;
import android.view.ViewGroup;
import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;
import java.util.List;
import kotlin.Metadata;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

@Metadata
/* loaded from: assets/audience_network/classes.dex */
public final class CP extends AbstractC1948ik<CL> {
    public static byte[] A09;
    public final SparseBooleanArray A00;
    public final C1750fT A01;
    public final C0958Hi A02;
    public final InterfaceC2224nG A03;
    public final C2417qT A04;
    public final C1539c2 A05;
    public final String A06;
    public final List<C2278oA> A07;
    public final InterfaceC05600l<String, Integer, Integer, AnonymousClass22> A08;

    static {
        A04();
    }

    public static String A01(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A09, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 13);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A04() {
        A09 = new byte[]{-124, -121, 104, -103, -120, -111, -105, 112, -124, -111, -124, -118, -120, -107, -17, -8, -11, -15, -6, 0, -32, -5, -9, -15, -6, -24, -12, -13, -7, -22, -3, -7, 123, -126, AbstractJsonLexerKt.TC_INVALID, 119, 120, -123, -44, -45, -75, -41, -44, -55, -38, -56, -39, -88, -47, -50, -56, -48, -26, -41, -24, -37, -28, -22, -117, 124, -115, -128, -119, -113, 113, -124, -128, -110, 124, 125, -124, -121, -124, -113, -108, 94, -125, -128, 126, -122, -128, -115, -127, -125, -128, 117, -122, 116, -123, -124, -52, -57, -51, -69, -64, -100, -71, -52, -71, -86, -67, -69, -57, -54, -68, -67, -54};
    }

    /* JADX WARN: Multi-variable type inference failed */
    public CP(C0958Hi c0958Hi, List<C2278oA> list, InterfaceC2224nG interfaceC2224nG, C1539c2 c1539c2, C2417qT c2417qT, String str, C1750fT c1750fT, InterfaceC05600l<? super String, ? super Integer, ? super Integer, AnonymousClass22> interfaceC05600l) {
        C1h.A09(c0958Hi, A01(25, 7, 120));
        C1h.A09(list, A01(82, 8, 4));
        C1h.A09(interfaceC2224nG, A01(0, 14, 22));
        C1h.A09(c1539c2, A01(58, 24, 14));
        C1h.A09(c2417qT, A01(90, 17, 75));
        C1h.A09(str, A01(14, 11, Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE));
        C1h.A09(interfaceC05600l, A01(38, 14, 88));
        this.A02 = c0958Hi;
        this.A07 = list;
        this.A03 = interfaceC2224nG;
        this.A05 = c1539c2;
        this.A04 = c2417qT;
        this.A06 = str;
        this.A01 = c1750fT;
        this.A08 = interfaceC05600l;
        this.A00 = new SparseBooleanArray();
    }

    /* JADX INFO: Access modifiers changed from: private */
    @Override // com.facebook.ads.redexgen.X.AbstractC1948ik
    /* renamed from: A00, reason: merged with bridge method [inline-methods] */
    public final CL A0F(ViewGroup viewGroup, int i5) {
        C1h.A09(viewGroup, A01(52, 6, 105));
        return new CL(new C2280oC(this.A02), this.A00, this.A05, this.A02, this.A03, this.A04, this.A06, this.A01);
    }

    /* JADX INFO: Access modifiers changed from: private */
    @Override // com.facebook.ads.redexgen.X.AbstractC1948ik
    /* renamed from: A05, reason: merged with bridge method [inline-methods] */
    public final void A0M(CL cl2, int i5) {
        C1h.A09(cl2, A01(32, 6, 6));
        C2278oA c2278oA = this.A07.get(i5);
        cl2.A0w(c2278oA, i5, this.A07.size(), new C06193p(this, c2278oA, i5));
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC1948ik
    public final int A0B() {
        return this.A07.size();
    }
}
