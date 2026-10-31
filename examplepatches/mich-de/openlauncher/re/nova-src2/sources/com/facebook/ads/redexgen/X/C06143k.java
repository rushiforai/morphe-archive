package com.facebook.ads.redexgen.X;

import android.view.View;
import android.view.ViewGroup;
import android.widget.GridLayout;
import android.widget.ImageView;
import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;

/* renamed from: com.facebook.ads.redexgen.X.3k, reason: invalid class name and case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C06143k extends AbstractC06635h {
    public static byte[] A03;
    public static String[] A04 = {"ikKBtYlS8EdGbd8Sq0odZDfnKoONzGS0", "DBn5Ocauyc7zo9ZGObGFJIKtaqVZxBSQ", "lm7EQ53jnO2V3HqlwmL25Q2MhvIqQm3f", "CWbrj9d1nRNP380gvlaxSmFYAfG3rwR8", "vQbY5", "jSDd3UBGb0rrzazSerBNNvLK", "fNekV3QJ4rl1LJIejAM1xLsHFOam23d9", "PNLhKgEBvYWcTJr0QfmKKMeNnWmRDpMq"};
    public GridLayout A00;
    public final C2689ur A01;
    public final C0823Cc A02;

    public static String A02(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A03, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 48);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A03() {
        A03 = new byte[]{-34, -36, -19, -22, -16, -18, -32, -25, -38, -15, -83, 14, 26, 11, 9, 13, 11, 28, 25, 31, 29, 15, 22, -48, -50, -41, -50, -37, -46, -52};
        if (A04[6].charAt(29) != '3') {
            throw new RuntimeException();
        }
        A04[1] = "2CnBTVnu05c3qC8r6cXLkJUhY8FNHlP8";
    }

    static {
        A03();
    }

    public C06143k(C2689ur c2689ur, String str, C0823Cc c0823Cc) {
        super(c2689ur, false, str, c0823Cc);
        this.A01 = c2689ur;
        this.A02 = c0823Cc;
    }

    public static GridLayout.LayoutParams A00(int i5, int i11, int i12, int i13, int i14) {
        GridLayout.LayoutParams layoutParams = new GridLayout.LayoutParams(new ViewGroup.MarginLayoutParams(i5, i11));
        layoutParams.rowSpec = GridLayout.spec(i12 / i13);
        layoutParams.columnSpec = GridLayout.spec(i12 % i13);
        A04(layoutParams, i12, i13, i14);
        return layoutParams;
    }

    private ImageView A01(int i5, int i11, int i12, int i13, int i14, final C1962iy c1962iy) {
        ImageView imageView = new ImageView(this.A01.A06());
        imageView.setAdjustViewBounds(true);
        imageView.setScaleType(ImageView.ScaleType.FIT_CENTER);
        AbstractC2426qc.A0O(imageView, Integer.MIN_VALUE);
        imageView.setLayoutParams(A00(i5, i11, i12, i13, i14));
        imageView.setOnClickListener(new View.OnClickListener() { // from class: com.facebook.ads.redexgen.X.ls
            @Override // android.view.View.OnClickListener
            public final void onClick(View view) {
                this.A00.A1x(c1962iy, view);
            }
        });
        return imageView;
    }

    public static void A04(GridLayout.LayoutParams layoutParams, int i5, int i11, int i12) {
        int topMargin = i5 / i11;
        int i13 = i5 % i11;
        int leftMargin = i13 > 0 ? AbstractC2383pv.A01 : 0;
        int row = i11 - 1;
        int bottomMargin = i13 < row ? AbstractC2383pv.A01 : 0;
        int col = topMargin > 0 ? AbstractC2383pv.A01 : 0;
        int row2 = i12 - 1;
        int rightMargin = topMargin < row2 ? AbstractC2383pv.A01 : 0;
        layoutParams.setMargins(leftMargin, col, bottomMargin, rightMargin);
    }

    private void A05(GridLayout gridLayout, InterfaceC1959iv interfaceC1959iv, int index, int i5) {
        if (interfaceC1959iv.A7q() == null || interfaceC1959iv.A7q().isEmpty()) {
            return;
        }
        int[] iArrA1w = A1w(interfaceC1959iv.A97(), interfaceC1959iv.A8p(), i5 > 1 ? AbstractC2383pv.A0B : 0, i5);
        int i11 = iArrA1w[0];
        int i12 = iArrA1w[1];
        int i13 = 0;
        while (true) {
            int size = interfaceC1959iv.A7q().size();
            String[] strArr = A04;
            if (strArr[2].charAt(8) != strArr[3].charAt(8)) {
                throw new RuntimeException();
            }
            A04[0] = "2ARBnrZ1cEerP2LUfHum4n3Blmwa36s7";
            if (i13 < size) {
                C1962iy c1962iy = interfaceC1959iv.A7q().get(i13);
                ImageView imageViewA01 = A01(i11, i12, i13, i5, index, c1962iy);
                gridLayout.addView(imageViewA01);
                setImageUrl(imageViewA01, c1962iy.A06());
                i13++;
            } else {
                return;
            }
        }
    }

    private void A06(C1962iy c1962iy) {
        if (this.A01.A05().A2I() && c1962iy.A05() != null && A08(c1962iy)) {
            c1962iy.A05().AGa(c1962iy.A02());
        } else {
            A07(c1962iy);
        }
        this.A02.A0Y();
    }

    private void A07(C1962iy c1962iy) {
        if (this.A01.A05().A2K() && c1962iy.A03() != null) {
            A1q();
            setCTAInfo(c1962iy.A03().A0K(), c1962iy.A08());
            getCtaButton().A0E(A02(0, 11, 75));
            return;
        }
        String strA07 = c1962iy.A07();
        if (strA07 != null && !strA07.isEmpty()) {
            c1962iy.A04().A0F();
            c1962iy.A04().setClickUrl(strA07, c1962iy.A08());
        }
        ViewOnClickListenerC0884El viewOnClickListenerC0884ElA04 = c1962iy.A04();
        String productUrl = A02(11, 12, Sdk.SDKError.Reason.INVALID_ADS_ENDPOINT_VALUE);
        viewOnClickListenerC0884ElA04.A0E(productUrl);
    }

    private boolean A08(C1962iy c1962iy) {
        if (c1962iy.A03() == null || c1962iy.A03().A0K() == null) {
            return false;
        }
        C1735fE c1735fEA03 = c1962iy.A03();
        if (A04[1].length() != 32) {
            throw new RuntimeException();
        }
        A04[0] = "OoaFjyiLcTNH6IsRKncfqxguSLJA4cDe";
        String ctaUrl = c1735fEA03.A0K().A06();
        if (ctaUrl == null || ctaUrl.isEmpty()) {
            return false;
        }
        try {
            return C2141lu.A08(AbstractC2351pP.A00(ctaUrl)) != null;
        } catch (SecurityException e3) {
            this.A01.A06().A08().ABz(A02(23, 7, 57), AbstractC2126lf.A2a, new C2127lg(e3));
            return false;
        }
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC06635h
    public final void A1t(C0958Hi c0958Hi) {
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC06635h
    public final void A1u(C0958Hi c0958Hi, InterfaceC1959iv interfaceC1959iv) {
        int iCeil = (int) Math.ceil(Math.sqrt(interfaceC1959iv.A8p()));
        int columnCount = interfaceC1959iv.A8p();
        int iCeil2 = (int) Math.ceil(columnCount / iCeil);
        if (this.A00 != null) {
            removeView(this.A00);
        }
        ViewGroup.LayoutParams layoutParams = new GridLayout.LayoutParams(new ViewGroup.MarginLayoutParams(-1, -2));
        GridLayout gridLayout = new GridLayout(c0958Hi);
        gridLayout.setRowCount(iCeil2);
        gridLayout.setColumnCount(iCeil);
        gridLayout.setUseDefaultMargins(false);
        gridLayout.setOrientation(1);
        gridLayout.setLayoutParams(layoutParams);
        addView(gridLayout);
        this.A00 = gridLayout;
        A05(gridLayout, interfaceC1959iv, iCeil2, iCeil);
    }

    public final /* synthetic */ void A1x(C1962iy c1962iy, View view) {
        A06(c1962iy);
    }

    private void setImageUrl(ImageView imageView, String str) {
        new AsyncTaskC0892Et(imageView, this.A01.A06()).A04().A06(new C7(this)).A07(str);
    }
}
