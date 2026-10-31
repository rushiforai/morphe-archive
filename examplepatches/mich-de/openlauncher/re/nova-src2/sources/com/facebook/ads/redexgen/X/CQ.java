package com.facebook.ads.redexgen.X;

import android.text.TextUtils;
import android.util.SparseBooleanArray;
import android.view.ViewGroup;
import java.lang.ref.WeakReference;

/* loaded from: assets/audience_network/classes.dex */
public final class CQ extends AbstractC1978jE implements InterfaceC2466rG {
    public static String[] A0B = {"av2tITPhYKbVn20ukUfJR25ELbcgjHbj", "MLeLe181lhP7dC21QqjxU1VDKV9lNkzJ", "XUmY4VBJ2tlJWKlPJ7YkBdCsKtcC", "bK6oHsXedskfaWsjnVeS6YyvP0sRA20b", "BhCeFQN4dHt9z3MLE3p7bnIzhrf86Cw8", "mLW9T0fP2Q5Hob07hRXsv0QUH1fN4", "pNzPXZ5fcby2PvmlRsfUzns43oHDF5Mi", "3YktW7BrcDIc4Xw2f2zdWv5xFETbHIAE"};
    public C1750fT A00;
    public AbstractC1540c3 A01;
    public C1539c2 A02;
    public final int A03;
    public final int A04;
    public final int A05;
    public final int A06;
    public final SparseBooleanArray A07;
    public final C0958Hi A08;
    public final C6V A09;
    public final C1539c2 A0A;

    public CQ(C6V c6v, SparseBooleanArray sparseBooleanArray, C1539c2 c1539c2, int i5, int i11, int i12, int i13, C0958Hi c0958Hi, C1750fT c1750fT) {
        super(c6v);
        this.A08 = c0958Hi;
        this.A09 = c6v;
        this.A07 = sparseBooleanArray;
        this.A0A = c1539c2;
        this.A03 = i5;
        this.A04 = i11;
        this.A05 = i12;
        this.A06 = i13;
        this.A00 = c1750fT;
    }

    private void A05(InterfaceC2224nG interfaceC2224nG, C2417qT c2417qT, String str, C2314ol c2314ol) {
        if (this.A07.get(c2314ol.A02())) {
            return;
        }
        if (this.A02 != null) {
            this.A02.A0V();
            if (A0B[4].charAt(16) != 'E') {
                throw new RuntimeException();
            }
            A0B[4] = "iteeE4SnfkkyQnEAEqI0za4snrHpWaXy";
            this.A02 = null;
        }
        this.A01 = new CS(this, str, c2314ol, interfaceC2224nG, c2314ol.A04(), c2417qT);
        this.A02 = new C1539c2(this.A09, 10, new WeakReference(this.A01), this.A08);
        this.A02.A0Y(false);
        this.A02.A0W(100);
        this.A02.A0X(100);
        this.A09.setOnAssetsLoadedListener(new CR(this, c2314ol));
    }

    public final ViewOnClickListenerC0884El A0w() {
        return this.A09.getCtaButton();
    }

    public final void A0x(C2314ol c2314ol, InterfaceC2224nG interfaceC2224nG, C2086kz c2086kz, C2417qT c2417qT, String str) {
        int iA02 = c2314ol.A02();
        this.A09.setTag(-1593835536, Integer.valueOf(iA02));
        ViewGroup.MarginLayoutParams marginLayoutParams = new ViewGroup.MarginLayoutParams(this.A03, -2);
        int rightMargin = iA02 == 0 ? this.A04 : this.A05;
        int position = this.A06;
        marginLayoutParams.setMargins(rightMargin, 0, iA02 >= position + (-1) ? this.A04 : this.A05, 0);
        String imageUrl = c2314ol.A03().A0I().A08();
        String strA09 = c2314ol.A03().A0I().A09();
        this.A09.setIsVideo(!TextUtils.isEmpty(strA09));
        if (this.A09.A1o()) {
            if (imageUrl != null) {
                this.A09.setVideoPlaceholderUrl(imageUrl);
            }
            if (strA09 != null) {
                this.A09.setVideoUrl(c2086kz.A0T(strA09));
            }
        } else if (imageUrl != null) {
            this.A09.setImageUrl(imageUrl);
        }
        this.A09.setLayoutParams(marginLayoutParams);
        this.A09.setAdTitleAndDescription(c2314ol.A03().A0J().A0H(), c2314ol.A03().A0J().A04());
        this.A09.setCTAInfo(c2314ol.A03().A0K(), c2314ol.A04());
        this.A09.A1r(c2314ol.A04());
        A05(interfaceC2224nG, c2417qT, str, c2314ol);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2466rG
    public final void AKX() {
        this.A09.A1j();
    }
}
