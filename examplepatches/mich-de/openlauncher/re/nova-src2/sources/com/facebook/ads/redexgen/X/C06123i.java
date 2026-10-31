package com.facebook.ads.redexgen.X;

import android.widget.ImageView;
import android.widget.RelativeLayout;
import java.util.Arrays;
import java.util.List;
import kotlin.Metadata;

@Metadata
/* renamed from: com.facebook.ads.redexgen.X.3i, reason: invalid class name and case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C06123i extends AbstractC06635h {
    public static byte[] A02;
    public static final int A03;
    public static final C2074kn A04;
    public static final int A05;
    public final C2689ur A00;
    public final C0823Cc A01;

    public static String A02(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A02, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 116);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A03() {
        A02 = new byte[]{-4, -6, 11, 8, 14, 12, -2, 5, -36, -6, 11, -3, -37, -2, 1, -6, 15, 2, 8, 11, -31, -2, 5, 9, -2, 11, 69, 78, 75, 71, 80, 86, 54, 81, 77, 71, 80, 8, 20, 19, 25, 10, 29, 25, -24, -19, -13, -28, -15, -32, -30, -13, -24, -11, -28, -52, -28, -29, -24, -32, -56, -19, -27, -18, -14, -29, -12, -29, -17, -11};
    }

    static {
        A03();
        A04 = new C2074kn(null);
        A05 = AbstractC2383pv.A06;
        A03 = AbstractC2383pv.A0C;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public C06123i(C2689ur c2689ur, String str, C0823Cc c0823Cc) {
        super(c2689ur, false, str, c0823Cc);
        C1h.A09(c2689ur, A02(64, 6, 14));
        C1h.A09(str, A02(26, 11, 110));
        C1h.A09(c0823Cc, A02(0, 26, 37));
        this.A00 = c2689ur;
        this.A01 = c0823Cc;
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC06635h
    public final void A1t(C0958Hi c0958Hi) {
        C1h.A09(c0958Hi, A02(37, 7, 49));
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC06635h
    public final void A1u(C0958Hi c0958Hi, InterfaceC1959iv interfaceC1959iv) {
        C1h.A09(c0958Hi, A02(37, 7, 49));
        C1h.A09(interfaceC1959iv, A02(44, 20, 11));
        List cardInfoList = interfaceC1959iv.A7q();
        List cardInfoList2 = cardInfoList;
        if (cardInfoList2 == null || cardInfoList2.isEmpty()) {
            return;
        }
        C1962iy c1962iy = cardInfoList.get(0);
        int screenWidth = (int) (Math.min(AbstractC2385px.A04.widthPixels, AbstractC2385px.A04.heightPixels) * 0.74f);
        RelativeLayout relativeLayout = new RelativeLayout(c0958Hi);
        relativeLayout.setLayoutParams(new RelativeLayout.LayoutParams(screenWidth, (int) (screenWidth * 2.06f)));
        C2661uP c2661uP = new C2661uP(c0958Hi);
        c2661uP.setRadius(A05);
        c2661uP.setAdjustViewBounds(true);
        c2661uP.setScaleType(ImageView.ScaleType.CENTER_CROP);
        RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(-1, -2);
        layoutParams.addRule(13);
        c2661uP.setLayoutParams(layoutParams);
        c2661uP.setOnClickListener(new ViewOnClickListenerC2052kQ(c1962iy, this));
        relativeLayout.addView(c2661uP);
        addView(relativeLayout);
        new AsyncTaskC0892Et(c2661uP, this.A00.A06()).A04().A06(new C6(this)).A07(c1962iy.A06());
    }
}
