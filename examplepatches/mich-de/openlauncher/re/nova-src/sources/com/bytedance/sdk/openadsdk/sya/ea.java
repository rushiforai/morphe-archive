package com.bytedance.sdk.openadsdk.sya;

import android.content.Context;
import android.graphics.Color;
import android.view.View;
import com.bytedance.sdk.openadsdk.utils.dc;

/* loaded from: classes2.dex */
public class ea extends View {
    private final int ycx;

    public ea(Context context) {
        this(context, Color.parseColor("#25000000"));
    }

    @Override // android.view.View
    public void onMeasure(int i5, int i11) {
        super.onMeasure(i5, i11);
        setMeasuredDimension(getMeasuredWidth(), this.ycx);
    }

    public ea(Context context, int i5) {
        super(context);
        setBackgroundColor(i5);
        this.ycx = dc.zb(getContext(), 0.66f);
    }
}
