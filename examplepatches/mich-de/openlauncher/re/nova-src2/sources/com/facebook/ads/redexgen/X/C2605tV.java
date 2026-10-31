package com.facebook.ads.redexgen.X;

import android.widget.RelativeLayout;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/* renamed from: com.facebook.ads.redexgen.X.tV, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C2605tV extends RelativeLayout {
    public static InterfaceC2459r9 A05;
    public static byte[] A06;
    public static String[] A07 = {"CT308ms2RTF49ixw7iITcI5DvAIGWMXZ", "UVauKq3DlAHpB1vMyeeSD4Us6AaVXCYd", "G3Ivv2DNtSsvdOlvNnw6jHI40eb4uyYL", "qur6nZLrhU9XJET37yOODnXWYcrj37IJ", "OCLfHPrXkMpm02uq88EYR3Uw1JpI2kE3", "KopKmjllEHptdGx3", "mL4xXMXopKoNgp", "1VwEGJcTQNgN7iTbFc9O"};
    public static final int A08;
    public static final int A09;
    public static final int A0A;
    public IY A00;
    public C0958Hi A01;
    public C3T A02;
    public F2 A03;
    public C2660uO A04;

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A06, i5, i5 + i11);
        int i13 = 0;
        while (true) {
            int length = bArrCopyOfRange.length;
            if (A07[6].length() == 9) {
                throw new RuntimeException();
            }
            String[] strArr = A07;
            strArr[2] = "hwjeWCnyrgrPOyFOaJyYR4Ki88uO9bQs";
            strArr[0] = "4m7NTkn57B9pIqsgccGzW0RoTzQfESBy";
            if (i13 >= length) {
                return new String(bArrCopyOfRange);
            }
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 119);
            i13++;
        }
    }

    public static void A02() {
        A06 = new byte[]{-25, 5, 22, 19, 25, 23, 9, 16, -60, -14, 5, 24, 13, 26, 9, -60, 26, 13, 9, 27, -60, 5, 8, 9, 20, 24, 9, 22, -60, 13, 23, 18, -53, 24, -60, 7, 22, 9, 5, 24, 9, 8, -60, 20, 22, 19, 20, 9, 22, 16, 29, -5, -7, 2, -7, 6, -3, -9};
    }

    static {
        A02();
        A09 = AbstractC2383pv.A0y;
        A08 = A09 * 10;
        A0A = (int) (AbstractC2385px.A02 * 15.0f);
        A05 = new F1();
    }

    public C2605tV(C0958Hi c0958Hi) throws IllegalStateException {
        super(c0958Hi);
        this.A01 = c0958Hi;
        this.A02 = new C3T(c0958Hi);
        AbstractC2426qc.A0L(this.A02);
        this.A00 = new C7P();
        this.A00.A0G(this.A02);
        RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(-1, -1);
        layoutParams.addRule(13);
        addView(this.A02, layoutParams);
    }

    private ArrayList<C2314ol> A01(LA la2) {
        if (la2 == null) {
            return new ArrayList<>();
        }
        List<C1735fE> listA39 = la2.A39();
        ArrayList<C2314ol> arrayList = new ArrayList<>(listA39.size());
        for (int i5 = 0; i5 < listA39.size(); i5++) {
            arrayList.add(new C2314ol(i5, listA39.size(), listA39.get(i5)));
        }
        return arrayList;
    }

    public final void A04() {
        this.A02.setAdapter(null);
    }

    public final void A05(GT gt2, int i5) {
        ArrayList<C2314ol> arrayListA01 = A01(gt2.A13());
        this.A02.setCardsInfo(arrayListA01);
        this.A03 = new F2(this.A01, arrayListA01, gt2.A13(), this.A01.A02().A0A(), gt2, A05, gt2.A13().A37(), this.A02.getCarouselCardBehaviorHelper(), null);
        this.A02.setAdapter(this.A03);
        if (i5 == 0) {
            i5 = AbstractC2385px.A04.widthPixels;
        }
        int i11 = i5 - A08;
        if (A07[4].charAt(22) == 'f') {
            throw new RuntimeException();
        }
        A07[5] = "x3kPSyXPXXgJlLSMaorwFJdxdHWI";
        this.A03.A0Q(i11, 16, 0);
        this.A03.A0G();
        setupDotsLayout(gt2, arrayListA01);
    }

    public final void A06(C1539c2 c1539c2) {
        if (this.A03 != null) {
            this.A03.A0R(c1539c2);
        } else {
            this.A01.A08().ABz(A00(51, 7, 29), AbstractC2126lf.A1v, new C2127lg(A00(0, 51, 45)));
        }
        this.A02.A27(c1539c2);
    }

    public static InterfaceC2459r9 getDummyListener() {
        return A05;
    }

    @Override // android.widget.RelativeLayout, android.view.ViewGroup, android.view.View
    public final void onLayout(boolean z11, int i5, int i11, int i12, int i13) {
        if (z11 && this.A03 != null) {
            this.A03.A0Q((i12 - i5) - A08, 16, 0);
        }
        super.onLayout(z11, i5, i11, i12, i13);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setUpLayoutForCardAtIndex(int i5) {
        if (this.A04 != null) {
            this.A04.A00(i5);
        }
    }

    private void setupDotsLayout(GT gt2, ArrayList<C2314ol> arrayList) {
        this.A02.getCarouselCardBehaviorHelper().A0i(new F0(this));
        this.A04 = new C2660uO(this.A01, gt2.A13().A31().A01(), arrayList.size());
        AbstractC2426qc.A0L(this.A04);
        RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(-1, -2);
        layoutParams.addRule(3, this.A02.getId());
        layoutParams.setMargins(0, A0A, 0, 0);
        addView(this.A04, layoutParams);
    }
}
