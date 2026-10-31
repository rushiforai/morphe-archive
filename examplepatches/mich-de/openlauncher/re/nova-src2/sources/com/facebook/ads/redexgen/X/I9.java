package com.facebook.ads.redexgen.X;

import android.content.Context;
import android.content.res.Resources;
import android.view.View;

/* loaded from: assets/audience_network/classes.dex */
public class I9 extends C1893hp {
    public static String[] A01 = {"OZnJYNnF6iNpWafuL0M1gR4fftLtNKLH", "jp3I09eVvza8VUO8I2V9bgD0uqoo2eoT", "o0dN6TNbDPM1OFHwgByg4fes3ij5f0X", "koNydS70AznyGH22QswPXmmCOWqgW7Lp", "FfQJA5dgq067zFURnAgi95yx0TDwU15M", "ldbJEvhnHaVxGyPD7qN3mcBmJCgMtAqs", "ixVhzklDdFphFwHpdcaKVfByjOKIZSaQ", "Bo7wQ6HJBqNsqngGB"};
    public int A00;

    public I9(Context context) {
        super(context);
        this.A00 = 0;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void A00(int i5) {
        this.A00 = i5;
    }

    /* JADX WARN: Removed duplicated region for block: B:13:0x0049 A[PHI: r0
      0x0049: PHI (r0v15 'height' int) = (r0v14 'height' int), (r0v16 'height' int) binds: [B:16:0x0058, B:12:0x0047] A[DONT_GENERATE, DONT_INLINE]] */
    @Override // com.facebook.ads.redexgen.X.C1893hp, android.view.View
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void onMeasure(int i5, int i11) throws Resources.NotFoundException {
        int height;
        int h5 = this.A00;
        int i12 = 0;
        while (true) {
            int childCount = getChildCount();
            String[] strArr = A01;
            String str = strArr[4];
            String str2 = strArr[0];
            int i13 = str.charAt(3);
            int height2 = str2.charAt(3);
            if (i13 != height2) {
                throw new RuntimeException();
            }
            A01[2] = "oQM5as2Hx349sp";
            if (i12 < childCount) {
                View childAt = getChildAt(i12);
                int height3 = View.MeasureSpec.makeMeasureSpec(0, 0);
                childAt.measure(i5, height3);
                int i14 = A01[3].charAt(2);
                if (i14 != 78) {
                    height = childAt.getMeasuredHeight();
                    if (height > h5) {
                        h5 = height;
                    }
                } else {
                    A01[7] = "8uJesuWryF1bocGxs";
                    height = childAt.getMeasuredHeight();
                    if (height > h5) {
                    }
                }
                i12++;
            } else {
                int height4 = View.MeasureSpec.makeMeasureSpec(h5, 1073741824);
                super.onMeasure(i5, height4);
                return;
            }
        }
    }
}
