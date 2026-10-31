package com.facebook.ads.redexgen.X;

import android.text.TextUtils;
import com.facebook.ads.internal.protocol.AdErrorType;
import com.facebook.ads.internal.protocol.AdPlacementType;
import java.lang.ref.WeakReference;
import java.util.Arrays;
import java.util.UUID;
import org.json.JSONObject;

/* renamed from: com.facebook.ads.redexgen.X.7q, reason: invalid class name and case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C07247q implements MA {
    public static byte[] A09;
    public static String[] A0A = {"vQVR1W3KlFe1E6rykCQCN1hDjMfDn8rI", "tljelZM2jTB3b2QbbMIwKIvWUquFoQXI", "0RiyIUNkcV4TWqJ0V4znzZ5bg2a", "MB6YWUDNpiHBLRzyVZhANt93gTO", "D0Irbp5yZSl4LI2XNM8ietwCF", "tPTjxG3CTnyfKgiqByKdCe9GOtIwdNY0", "nGMCZLoa7jZxlH5O5MEheqiCaj61zw57", "8ntFVXYpP614IfxmD9rZT4cXa3R1zF25"};
    public InterfaceC1716ev A01;
    public C1717ew A02;
    public LM A03;
    public LK A04;
    public C7D A05;
    public InterfaceC2480rU A06;
    public C2481rV A07;
    public final String A08 = UUID.randomUUID().toString();
    public long A00 = -1;

    public static String A03(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A09, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 94);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A04() {
        A09 = new byte[]{43, 60, 40, 32, 31, 36, 48, 40, 26, 45, 32, 30, 47, 28, 41, 34, 39, 32};
    }

    static {
        A04();
    }

    private void A05(C7D c7d, LK lk2, C2086kz c2086kz, InterfaceC1716ev interfaceC1716ev, C2481rV c2481rV) {
        String strA7z = lk2.A7z();
        if (!TextUtils.isEmpty(strA7z)) {
            c2086kz.A0e(new C2232nO(strA7z, c7d.A0A()));
        }
        if (lk2.A0I() != null) {
            C2084kx c2084kx = new C2084kx(lk2.A0I().getUrl(), lk2.A0I().getHeight(), lk2.A0I().getWidth(), lk2.A0b(), A03(2, 16, 93));
            c2084kx.A01 = new l5(false, -1, -1);
            c2086kz.A0W();
            c2086kz.A0c(c2084kx);
        }
        if (lk2.A0H() != null) {
            c2086kz.A0c(new C2084kx(lk2.A0H().getUrl(), lk2.A0H().getHeight(), lk2.A0H().getWidth(), lk2.A0b(), A03(2, 16, 93)));
        }
        String strA0e = lk2.A0e();
        if (strA0e != null && !TextUtils.isEmpty(strA0e)) {
            c2086kz.A0b(new C2082kv(strA0e, lk2.A0b(), A03(2, 16, 93), lk2.A0D()));
        }
        LA laA0F = lk2.A0F();
        String strA03 = A03(2, 16, 93);
        if (laA0F != null) {
            AbstractC1774fr.A00(lk2.A0F(), c2086kz, strA03);
        }
        C1059Lk c1059Lk = new C1059Lk(this, c2481rV, interfaceC1716ev, c7d);
        String clientToken = lk2.A0b();
        c2086kz.A0X(c1059Lk, new C2079ks(clientToken, strA03));
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1708en
    public final String A7z() {
        if (this.A04 == null) {
            return null;
        }
        return this.A04.A7z();
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1708en
    public final AdPlacementType A9N() {
        return AdPlacementType.MEDIUM_RECTANGLE;
    }

    @Override // com.facebook.ads.redexgen.X.MA
    public final void ABb(C7D c7d, InterfaceC2224nG interfaceC2224nG, EnumC2264nw enumC2264nw, InterfaceC1716ev interfaceC1716ev, JSONObject jSONObject, C2146lz c2146lz) {
        c7d.A0F().A4o();
        this.A05 = c7d;
        this.A01 = interfaceC1716ev;
        C2086kz c2086kz = new C2086kz(c7d);
        this.A00 = System.currentTimeMillis();
        LK lkA00 = AbstractC1725f4.A00(c7d, jSONObject, AbstractC2392q4.A02(jSONObject, A03(0, 2, 106)));
        this.A04 = lkA00;
        if (!AbstractC1705ej.A06(c7d, lkA00, interfaceC2224nG)) {
            InterfaceC2480rU adViewListener = new C1061Lm(this, c7d);
            this.A06 = adViewListener;
            C2481rV c2481rV = new C2481rV(c7d, interfaceC2224nG, c2086kz, new WeakReference(adViewListener), c2146lz.A04(), c2146lz.A07(), c2146lz.A08(), c2146lz.A09(), lkA00, this.A08);
            this.A07 = c2481rV;
            this.A03 = new LM(c7d, new C1060Ll(this, c7d, interfaceC1716ev), c2481rV.getViewabilityChecker(), interfaceC2224nG, lkA00);
            A05(c7d, lkA00, c2086kz, interfaceC1716ev, c2481rV);
            this.A02 = new C1717ew(c7d, this.A08, this, interfaceC1716ev);
            this.A02.A02();
            return;
        }
        c7d.A0F().A5b();
        interfaceC1716ev.AFQ(this, C2262nt.A00(AdErrorType.NO_FILL));
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1708en
    public final boolean ALe() {
        return false;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1708en
    public final void onDestroy() {
        if (this.A05 != null) {
            this.A05.A0F().A4m(this.A07 != null);
        }
        if (this.A07 != null) {
            this.A07.A0I();
            this.A07 = null;
            this.A06 = null;
        }
        if (this.A02 != null) {
            C1717ew c1717ew = this.A02;
            String[] strArr = A0A;
            if (strArr[6].charAt(15) == strArr[1].charAt(15)) {
                throw new RuntimeException();
            }
            String[] strArr2 = A0A;
            strArr2[7] = "OGRbKfmI1Ptis6ekzQBSmcc2x9iZCAib";
            strArr2[5] = "LImDBlZwACBxOLNi0gm0BXbkK8Ewnu8z";
            c1717ew.A03();
        }
    }
}
