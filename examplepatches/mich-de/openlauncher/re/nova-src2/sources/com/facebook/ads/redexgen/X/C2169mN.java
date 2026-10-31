package com.facebook.ads.redexgen.X;

import android.graphics.Typeface;
import android.text.TextUtils;
import android.widget.RelativeLayout;
import android.widget.TextView;
import java.util.Arrays;
import java.util.List;
import kotlin.Metadata;

@Metadata
/* renamed from: com.facebook.ads.redexgen.X.mN, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C2169mN {
    public static byte[] A04;
    public static String[] A05 = {"wGScD8", "oPZfnFqeiuQp5tIiq7auFiLk80yAHegP", "4", "GYD7gch", "AWD5Gw4quaezKpfifvCiCkmCb", "GvllotOSRE86GeTStenHBKCXSTADrh3Y", "k9G59oRQ91IBErqTGWW2r93dI", "HxetapKDtkYR2GSbfKkwiAcFodRUyZ"};
    public static final C2185md A06;
    public TextView A00;
    public final RelativeLayout A01;
    public final C0958Hi A02;
    public final List<InterfaceC1959iv> A03;

    public static String A01(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A04, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 61);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A02() {
        A04 = new byte[]{-88, -76, -77, -71, -86, -67, -71, 28, 20, 19, 24, 16, -8, 29, 21, 30, -5, 24, 34, 35, -14, -29, -12, -25, -16, -10, -40, -21, -25, -7};
    }

    static {
        A02();
        A06 = new C2185md(null);
    }

    /* JADX WARN: Multi-variable type inference failed */
    public C2169mN(C0958Hi c0958Hi, RelativeLayout relativeLayout, List<? extends InterfaceC1959iv> list) {
        C1h.A09(c0958Hi, A01(0, 7, 8));
        C1h.A09(relativeLayout, A01(20, 10, 69));
        C1h.A09(list, A01(7, 13, 114));
        this.A02 = c0958Hi;
        this.A01 = relativeLayout;
        this.A03 = list;
    }

    /* JADX WARN: Removed duplicated region for block: B:13:0x003a  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private final String A00(int i5) {
        boolean z11;
        C1735fE c1735fEA03;
        C1742fL c1742fLA0J;
        if (i5 < 0 || i5 >= this.A03.size()) {
            return null;
        }
        List<C1962iy> listA7q = this.A03.get(i5).A7q();
        List<C1962iy> list = listA7q;
        if (list != null) {
            boolean zIsEmpty = list.isEmpty();
            if (A05[1].charAt(31) == 'Z') {
                throw new RuntimeException();
            }
            A05[5] = "1FWHGGrzRl4TsXmWRe1ePUjdivmi4nH4";
            z11 = zIsEmpty;
        }
        if (z11 || (c1735fEA03 = listA7q.get(0).A03()) == null || (c1742fLA0J = c1735fEA03.A0J()) == null) {
            return null;
        }
        return c1742fLA0J.A0H();
    }

    public final int A03() {
        TextView textView = this.A00;
        if (textView != null) {
            return textView.getId();
        }
        return -1;
    }

    public final void A04(int i5) {
        if (this.A00 != null) {
            return;
        }
        String initialTitle = A00(0);
        TextView textView = new TextView(this.A02);
        String str = initialTitle;
        if (!(str == null || str.length() == 0)) {
            textView.setText(initialTitle);
        } else {
            textView.setVisibility(8);
        }
        textView.setTextSize(17.0f);
        textView.setTextColor(-1);
        textView.setTypeface(Typeface.DEFAULT_BOLD);
        textView.setGravity(17);
        textView.setMaxLines(1);
        textView.setEllipsize(TextUtils.TruncateAt.END);
        AbstractC2426qc.A0L(textView);
        RelativeLayout.LayoutParams params = new RelativeLayout.LayoutParams(-1, -2);
        params.addRule(14);
        params.addRule(2, i5);
        params.setMargins(AbstractC2383pv.A0n, 0, AbstractC2383pv.A0n, AbstractC2383pv.A0c);
        this.A01.addView(textView, params);
        this.A00 = textView;
    }

    public final void A05(int i5) {
        TextView textView = this.A00;
        if (textView == null) {
            return;
        }
        String strA00 = A00(i5);
        String str = strA00;
        if (!(str == null || str.length() == 0)) {
            textView.setText(strA00);
            textView.setVisibility(0);
        } else {
            textView.setVisibility(8);
        }
    }
}
