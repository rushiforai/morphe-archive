package com.facebook.ads.redexgen.X;

import android.util.DisplayMetrics;
import android.view.View;
import android.widget.RelativeLayout;

/* renamed from: com.facebook.ads.redexgen.X.nz, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public abstract class AbstractC2267nz {
    public static EnumC2265nx A00(DisplayMetrics displayMetrics) {
        int i5 = (int) (displayMetrics.widthPixels / displayMetrics.density);
        int screenWidth = displayMetrics.heightPixels;
        int screenHeight = (int) (screenWidth / displayMetrics.density);
        if (C2386py.A04(i5, screenHeight)) {
            return EnumC2265nx.A0H;
        }
        if (screenHeight > i5) {
            return EnumC2265nx.A0J;
        }
        return EnumC2265nx.A0G;
    }

    public static void A01(DisplayMetrics displayMetrics, View view, EnumC2264nw enumC2264nw) {
        int iCeil;
        int i5 = (int) (displayMetrics.widthPixels / displayMetrics.density);
        int screenWidth = enumC2264nw.A04();
        if (i5 >= screenWidth) {
            iCeil = displayMetrics.widthPixels;
        } else {
            int screenWidth2 = enumC2264nw.A04();
            iCeil = (int) Math.ceil(screenWidth2 * displayMetrics.density);
        }
        int screenWidth3 = enumC2264nw.A03();
        RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(iCeil, (int) Math.ceil(screenWidth3 * displayMetrics.density));
        layoutParams.addRule(14, -1);
        view.setLayoutParams(layoutParams);
    }
}
