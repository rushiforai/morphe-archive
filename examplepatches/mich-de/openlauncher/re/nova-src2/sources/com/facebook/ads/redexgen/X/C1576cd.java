package com.facebook.ads.redexgen.X;

import android.net.Uri;
import android.view.Surface;
import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;

/* renamed from: com.facebook.ads.redexgen.X.cd, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1576cd {
    public static byte[] A02;
    public static String[] A03 = {"WzijvlAd9RP1HJzMxCKzeYHnMs2QP54v", "kfrqpsiELz0FvZTPYg", "hAwPDz", "OryCsPOoCbEZ1Kjw18", "JoqBI6chV", "rfkFyJ13DXugB3RLj6H", "rQvj", "kthZXjW83"};
    public final AnonymousClass93 A00;
    public final C1187Qv A01 = new C1187Qv();

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A02, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 10);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A02() {
        A02 = new byte[]{-114, -104, -116, -114, -49, -51, -31, -33, -47, -114, -116, -90, -116, -114, -96, -86, -98, -96, -16, -29, -20, -30, -29, -16, -29, -16, -57, -20, -30, -29, -10, -96, -98, -72, -98, -96, -114, -23, 111, 114, -127, -68, 99, -82, -90, -76, -76, -94, -88, -90, 99, 97, 123, 97, 99, -119, 48, -126, -121, 126, 115, 48, 46, 72, 46, 48};
    }

    static {
        A02();
    }

    public C1576cd(C0958Hi c0958Hi) {
        WY trackSelectionFactory = new RT(this.A01);
        C07398h c07398h = new C07398h(trackSelectionFactory);
        InterfaceC1145Ot loadControl = new C1242Sy();
        this.A00 = OQ.A00(new C1233Sp(c0958Hi), c07398h, loadControl, this.A01);
    }

    public static String A01(UY uy2) {
        boolean z11 = uy2 instanceof AnonymousClass96;
        String strA00 = A00(36, 2, 98);
        String strA002 = A00(0, 14, 98);
        if (z11) {
            AnonymousClass96 anonymousClass96 = (AnonymousClass96) uy2;
            return A00(55, 11, 4) + anonymousClass96.A03 + A00(14, 22, Sdk.SDKError.Reason.GZIP_ENCODE_ERROR_VALUE) + anonymousClass96.A02 + strA002 + anonymousClass96.getCause() + strA00;
        }
        return A00(41, 14, 55) + uy2.getMessage() + strA002 + uy2.getCause() + strA00;
    }

    public static boolean A03() {
        if (A03[0].charAt(3) == 'z') {
            throw new RuntimeException();
        }
        A03[6] = "p35x";
        return true;
    }

    public final int A04() {
        return this.A00.A0I();
    }

    public final int A05() {
        return this.A00.A00();
    }

    public final long A06() {
        return this.A00.A8F();
    }

    public final long A07() {
        return this.A00.A8T();
    }

    public final C1578cf A08() {
        VC vf2 = this.A00.A0K();
        if (vf2 == null) {
            return null;
        }
        return new C1578cf(vf2.A0L, vf2.A0A);
    }

    public final void A09() {
        this.A00.A0L();
    }

    public final void A0A() {
        this.A00.A02();
    }

    public final void A0B() {
        this.A00.A01();
    }

    public final void A0C(float f11) {
        this.A00.A0M(f11);
    }

    public final void A0D(long j11) {
        this.A00.A04(j11);
    }

    public final void A0E(Surface surface) {
        this.A00.A0N(surface);
    }

    public final void A0F(C0957Hh c0957Hh, Uri uri) {
        if (C2203mv.A32(c0957Hh, A03())) {
            C1562cP cacheManager = C1562cP.A06(c0957Hh);
            NN cachedDataSourceFactory = cacheManager.A0H(c0957Hh);
            this.A00.A0Q(new C07418o(cachedDataSourceFactory).A04(uri));
            return;
        }
        InterfaceC1276Uj mediaSource = new C07418o(new TD(c0957Hh, N1.A0j(c0957Hh, A00(38, 3, 4)), this.A01)).A04(uri);
        this.A00.A0Q(mediaSource);
    }

    public final void A0G(InterfaceC1579cg interfaceC1579cg) {
        this.A00.A0O(new C0773Ae(this, interfaceC1579cg));
    }

    public final void A0H(final InterfaceC1577ce interfaceC1577ce) {
        this.A00.A0P(new InterfaceC1221Sd() { // from class: com.facebook.ads.redexgen.X.4w
            @Override // com.facebook.ads.redexgen.X.NA
            public final void AHk(int i5, int i11, int i12, float f11) {
                interfaceC1577ce.AHk(i5, i11, i12, f11);
            }
        });
    }

    public final void A0I(boolean z11) {
        this.A00.A0S(z11);
    }

    public final boolean A0J() {
        return this.A00.A0T();
    }

    public final boolean A0K() {
        return this.A00.A0J() != null;
    }
}
