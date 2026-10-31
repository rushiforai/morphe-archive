package com.facebook.ads.redexgen.X;

import android.view.View;
import android.widget.ImageView;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;

/* renamed from: com.facebook.ads.redexgen.X.rq, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C2502rq extends ImageView {
    public static String[] A01 = {b.f42142b, "xAgTXbjVi62PdicRvipr2yH2TBkp", "gkbD2s1xpJQg4uStKBrjHXnqoYLvnFUr", "soe6jIArtiQ", "3Vk7uiWTp4D98Qq5DBFXHdZ3JTbv3qUy", "5FE99nP0vOH07stjGxCxhCer", "JVbWipYt4YB", b.f42142b};
    public ImageView.ScaleType A00;

    public C2502rq(C0958Hi c0958Hi) {
        super(c0958Hi);
    }

    /* JADX WARN: Removed duplicated region for block: B:13:0x0045  */
    @Override // android.widget.ImageView, android.view.View
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void onMeasure(int i5, int i11) {
        int size = View.MeasureSpec.getSize(i11);
        int size2 = View.MeasureSpec.getSize(i5);
        int heightSpecSize = View.MeasureSpec.getMode(i5);
        if (heightSpecSize == 1073741824) {
            int mode = View.MeasureSpec.getMode(i11);
            String[] strArr = A01;
            String str = strArr[1];
            String str2 = strArr[5];
            int widthSpecSize = str.length();
            int heightSpecSize2 = str2.length();
            if (widthSpecSize == heightSpecSize2) {
                throw new RuntimeException();
            }
            String[] strArr2 = A01;
            strArr2[6] = "LPpzUfvPRnl";
            strArr2[3] = "8xYze5Yy4ig";
            if (mode == 1073741824) {
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
        if (this.A00 != null) {
            super.setScaleType(this.A00);
        }
    }

    @Override // android.widget.ImageView
    public void setScaleType(ImageView.ScaleType scaleType) {
        this.A00 = scaleType;
    }
}
