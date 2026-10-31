package com.facebook.ads.redexgen.X;

import android.view.View;
import android.widget.ImageView;

/* loaded from: assets/audience_network/classes.dex */
public final class FK extends C2661uP {
    public static String[] A01 = {"ApYQLHiJfFoQxPLev3v1RnZtjL3Htxrs", "bo2sqrskjgNWasJuJCrp16cZ2XBNeh8X", "emwWE4rUfgFwy6LExYmEfzkDvXYAedhg", "bPVrpfjvf63ND9vhKC9W9DFqAg6wIvw3", "k6ukfOYu7hE0QQIPVs49Kdk3IYXWEofH", "fvCBaRVGvF6m5ZfwhdbeNg6rR0MmpiyE", "HEJk8ccdn4XKVem16EvPwrOEFwPjrKpO", "Ip6ocVLC"};
    public ImageView.ScaleType A00;

    public FK(C0958Hi c0958Hi) {
        super(c0958Hi);
    }

    /* JADX WARN: Removed duplicated region for block: B:13:0x003d  */
    @Override // android.widget.ImageView, android.view.View
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void onMeasure(int i5, int i11) {
        int size = View.MeasureSpec.getSize(i11);
        int size2 = View.MeasureSpec.getSize(i5);
        int heightSpecSize = View.MeasureSpec.getMode(i5);
        if (heightSpecSize == 1073741824) {
            int heightSpecSize2 = View.MeasureSpec.getMode(i11);
            if (heightSpecSize2 == 1073741824) {
                int heightSpecSize3 = Math.min(size2, size);
                setMeasuredDimension(heightSpecSize3, heightSpecSize3);
            } else {
                int heightSpecSize4 = View.MeasureSpec.getMode(i5);
                if (heightSpecSize4 == 1073741824) {
                    if (size > 0) {
                        size2 = Math.min(size2, size);
                    }
                    setMeasuredDimension(size2, size2);
                } else {
                    int heightSpecSize5 = View.MeasureSpec.getMode(i11);
                    if (heightSpecSize5 == 1073741824) {
                        if (size2 > 0) {
                            size = Math.min(size2, size);
                        }
                        setMeasuredDimension(size, size);
                    } else {
                        super.onMeasure(i5, i11);
                    }
                }
            }
        }
        ImageView.ScaleType scaleType = this.A00;
        int widthSpecSize = A01[5].charAt(24);
        if (widthSpecSize == 121) {
            throw new RuntimeException();
        }
        A01[1] = "60jXKIpbxaQwCHoxf9ChBAtjlKdb11wg";
        if (scaleType != null) {
            super.setScaleType(this.A00);
        }
    }

    @Override // android.widget.ImageView
    public void setScaleType(ImageView.ScaleType scaleType) {
        this.A00 = scaleType;
    }
}
