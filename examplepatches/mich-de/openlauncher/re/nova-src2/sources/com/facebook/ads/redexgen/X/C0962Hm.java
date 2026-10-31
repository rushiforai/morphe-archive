package com.facebook.ads.redexgen.X;

import java.util.Arrays;

/* renamed from: com.facebook.ads.redexgen.X.Hm, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class C0962Hm implements InterfaceC1633dY {
    public static byte[] A01;
    public static String[] A02 = {"aROWSCJTZ7USEA9NykDAgKPqU9Hz2yMC", "Zqbs868sBagHNlYScp55lXssWh10RIQa", "mbYc5GC1jhCg", "AuzesFDqytnerPl8cSxQvwaSTNgSXgGN", "J34OJh55Zf7CVcps1JZJSO0d6JwePACZ", "sgVYwbqUus7", "7dh0o4NaZc6u8WRc1KGfxvMUmypAWeMQ", "ZE0swazaf"};
    public final /* synthetic */ C0957Hh A00;

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A01, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            byte b11 = bArrCopyOfRange[i13];
            if (A02[3].charAt(2) == 'x') {
                throw new RuntimeException();
            }
            A02[0] = "5v5qZEzKm5dZGLy7lyhruzHwv9U4ulwR";
            bArrCopyOfRange[i13] = (byte) ((b11 ^ i12) ^ 108);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A01 = new byte[]{5, 1, 13, 11, 9};
    }

    static {
        A01();
    }

    public C0962Hm(C0957Hh c0957Hh) {
        this.A00 = c0957Hh;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1633dY
    public final void ABp(Throwable th2) {
        this.A00.A08().ABz(A00(0, 5, 0), AbstractC2126lf.A1e, new C2127lg(th2));
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1633dY
    public final void AC6(Throwable th2) {
        this.A00.A08().ABz(A00(0, 5, 0), AbstractC2126lf.A1g, new C2127lg(th2));
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1633dY
    public final void AIh(String str, int i5, String str2, Long l9, Long l11, C1618dJ c1618dJ) {
        C2089l2.A05(this.A00, c1618dJ.A06, c1618dJ.A08, c1618dJ.A09, c1618dJ.A07, c1618dJ.A03, i5, str2, l9, l11, null);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1633dY
    public final void AIi(String str, boolean z11, C1618dJ c1618dJ) {
        C2089l2.A04(this.A00, new C2088l1(c1618dJ.A06, c1618dJ.A08, c1618dJ.A07, c1618dJ.A03, str), z11);
    }
}
