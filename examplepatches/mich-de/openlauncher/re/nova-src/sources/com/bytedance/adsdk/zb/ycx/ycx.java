package com.bytedance.adsdk.zb.ycx;

import android.graphics.Paint;
import android.graphics.PorterDuff;
import android.graphics.PorterDuffXfermode;
import android.os.Build;
import android.os.LocaleList;
import com.bytedance.adsdk.zb.lt.lud;

/* loaded from: classes2.dex */
public class ycx extends Paint {
    public ycx() {
    }

    @Override // android.graphics.Paint
    public void setAlpha(int i5) {
        if (Build.VERSION.SDK_INT >= 29) {
            super.setAlpha(lud.ycx(i5, 0, 255));
        } else {
            setColor((lud.ycx(i5, 0, 255) << 24) | (getColor() & 16777215));
        }
    }

    @Override // android.graphics.Paint
    public void setTextLocales(LocaleList localeList) {
    }

    public ycx(int i5) {
        super(i5);
    }

    public ycx(PorterDuff.Mode mode) {
        setXfermode(new PorterDuffXfermode(mode));
    }

    public ycx(int i5, PorterDuff.Mode mode) {
        super(i5);
        setXfermode(new PorterDuffXfermode(mode));
    }
}
