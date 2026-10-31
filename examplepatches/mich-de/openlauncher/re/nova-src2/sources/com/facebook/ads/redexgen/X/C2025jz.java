package com.facebook.ads.redexgen.X;

import android.graphics.Rect;
import android.os.Build;
import android.os.Handler;
import android.os.Looper;
import android.view.Window;
import com.facebook.ads.AudienceNetworkActivity;

/* renamed from: com.facebook.ads.redexgen.X.jz, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C2025jz {
    public static String[] A02 = {"OQyMkRmLK3yQz1hGE", "t4lszE", "3Yfc26OPNiktPGwQDAV4CnWfG8qsLcyB", "ulAF6fWqh9lrp3UyWwNgHB46t", "8f0bd3Ggg0XKH", "Q12Pr1P7kyyUe1KrNEeGickvx2ldBvLV", "gTkcRU2lfjpaknO2gGEtGiknhNP52Q86", "gBi3lq0Y471ZDrQm"};
    public final AudienceNetworkActivity A00;
    public final C0958Hi A01;

    public C2025jz(C0958Hi c0958Hi, AudienceNetworkActivity audienceNetworkActivity) {
        this.A01 = c0958Hi;
        this.A00 = audienceNetworkActivity;
    }

    private int A00() {
        Rect rect = new Rect();
        Window window = this.A00.getWindow();
        if (window != null) {
            window.getDecorView().getWindowVisibleDisplayFrame(rect);
            if (rect.top < 200 && rect.left < 200) {
                return 1;
            }
            return 0;
        }
        String[] strArr = A02;
        if (strArr[5].charAt(22) != strArr[6].charAt(22)) {
            throw new RuntimeException();
        }
        A02[7] = "P6bwZdWp90Fv8mnE";
        return 2;
    }

    public final void A01() {
        if ((this.A01.A0H().A01() || C2203mv.A25(this.A01)) && Build.VERSION.SDK_INT >= 24) {
            new Handler(Looper.getMainLooper()).postDelayed(new Runnable() { // from class: com.facebook.ads.redexgen.X.jy
                @Override // java.lang.Runnable
                public final void run() {
                    this.A00.A02();
                }
            }, 1000L);
        }
    }

    public final /* synthetic */ void A02() {
        if (this.A00.isInMultiWindowMode()) {
            this.A01.A0F().ACu(A00());
        }
    }
}
