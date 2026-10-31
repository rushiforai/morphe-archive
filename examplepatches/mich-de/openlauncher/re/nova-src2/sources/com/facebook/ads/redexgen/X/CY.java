package com.facebook.ads.redexgen.X;

import android.text.TextUtils;
import android.util.SparseBooleanArray;
import android.view.ViewGroup;
import java.lang.ref.WeakReference;

/* loaded from: assets/audience_network/classes.dex */
public final class CY extends AbstractC1978jE implements InterfaceC2466rG {
    public C1750fT A00;
    public AbstractC1540c3 A01;
    public C1539c2 A02;
    public C1539c2 A03;
    public final int A04;
    public final SparseBooleanArray A05;
    public final C0958Hi A06;
    public final C06906i A07;

    public CY(C06906i c06906i, SparseBooleanArray sparseBooleanArray, C1539c2 c1539c2, int i5, C0958Hi c0958Hi, C1750fT c1750fT) {
        super(c06906i);
        this.A06 = c0958Hi;
        this.A07 = c06906i;
        this.A05 = sparseBooleanArray;
        this.A02 = c1539c2;
        this.A04 = i5;
        this.A00 = c1750fT;
    }

    private void A05(InterfaceC2224nG interfaceC2224nG, C2417qT c2417qT, String str, C2314ol c2314ol) {
        if (this.A05.get(c2314ol.A02())) {
            return;
        }
        if (this.A03 != null) {
            this.A03.A0V();
            this.A03 = null;
        }
        this.A01 = new C0821Ca(this, str, c2314ol, interfaceC2224nG, c2314ol.A04(), c2417qT);
        this.A03 = new C1539c2(this.A07, 10, new WeakReference(this.A01), this.A06);
        this.A03.A0Y(false);
        this.A03.A0W(100);
        this.A03.A0X(100);
        this.A07.setOnAssetsLoadedListener(new CZ(this, c2314ol));
    }

    public final void A0w(C2314ol c2314ol, InterfaceC2224nG interfaceC2224nG, C2086kz c2086kz, C2417qT c2417qT, String str, int i5, int i11, int i12) {
        int leftMargin = c2314ol.A02();
        this.A07.setTag(-1593835536, Integer.valueOf(leftMargin));
        this.A07.setupNativeCtaExtension(c2314ol);
        ViewGroup.MarginLayoutParams marginLayoutParams = new ViewGroup.MarginLayoutParams(i5, -2);
        int i13 = leftMargin == 0 ? i12 : i11;
        if (leftMargin < this.A04 - 1) {
            i12 = i11;
        }
        marginLayoutParams.setMargins(i13, 0, i12, 0);
        String strA08 = c2314ol.A03().A0I().A08();
        String strA09 = c2314ol.A03().A0I().A09();
        this.A07.setIsVideo(!TextUtils.isEmpty(strA09));
        if (this.A07.A1o()) {
            this.A07.setVideoPlaceholderUrl(strA08);
            this.A07.setVideoUrl(c2086kz.A0T(strA09));
        } else {
            this.A07.setImageUrl(strA08);
        }
        this.A07.setLayoutParams(marginLayoutParams);
        this.A07.setCTAInfo(c2314ol.A03().A0K(), c2314ol.A04());
        this.A07.A1p(c2314ol.A04());
        A05(interfaceC2224nG, c2417qT, str, c2314ol);
    }

    public final void A0x(C1539c2 c1539c2) {
        this.A02 = c1539c2;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2466rG
    public final void AKX() {
        this.A07.A1j();
    }
}
