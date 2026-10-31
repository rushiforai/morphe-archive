package com.facebook.ads.redexgen.X;

import android.view.View;
import android.widget.LinearLayout;
import java.util.Arrays;
import kotlin.Metadata;
import kotlin.jvm.JvmStatic;

@Metadata
/* renamed from: com.facebook.ads.redexgen.X.ds, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1652ds extends LinearLayout {
    public static byte[] A00;
    public static final C1653dt A01;
    public static final int A02;
    public static final int A03;
    public static final int A04;

    public static String A03(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 65);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A04() {
        A00 = new byte[]{9, 21, 20, 26, 11, 30, 26, -71, -68, -59, -58, -57, -90, -72, -70, -64, -72, -63, -57, 16, 2, 0, 12, 11, 1, -16, 2, 4, 10, 2, 11, 17};
    }

    static {
        A04();
        A01 = new C1653dt(null);
        A04 = AbstractC2383pv.A0K;
        A03 = AbstractC1841gx.A02(-1, 128);
        A02 = AbstractC1841gx.A02(-1, 17);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public C1652ds(C0958Hi c0958Hi, View view, View view2) {
        super(c0958Hi);
        C1h.A09(c0958Hi, A03(0, 7, 101));
        C1h.A09(view, A03(7, 12, 18));
        C1h.A09(view2, A03(19, 13, 92));
        setOrientation(0);
        A01.A02(view);
        A01.A02(view2);
        LinearLayout.LayoutParams firstParams = new LinearLayout.LayoutParams(0, -1, 75.0f);
        firstParams.rightMargin = A04;
        addView(view, firstParams);
        LinearLayout.LayoutParams secondParams = new LinearLayout.LayoutParams(0, -1, 25.0f);
        addView(view2, secondParams);
    }

    @JvmStatic
    public static final C1652ds A01(C0958Hi c0958Hi, C0781Am c0781Am, int i5) {
        return A01.A04(c0958Hi, c0781Am, i5);
    }

    @JvmStatic
    public static final C1652ds A02(C0958Hi c0958Hi, C0781Am c0781Am, int i5, int i11, int i12) {
        return A01.A05(c0958Hi, c0781Am, i5, i11, i12);
    }
}
