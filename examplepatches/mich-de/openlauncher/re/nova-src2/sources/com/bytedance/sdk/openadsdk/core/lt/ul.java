package com.bytedance.sdk.openadsdk.core.lt;

import android.content.Context;
import android.util.AttributeSet;
import android.view.ViewGroup;
import android.widget.RelativeLayout;

/* loaded from: classes2.dex */
public class ul extends RelativeLayout {
    public ul(Context context) {
        super(context);
    }

    @Override // android.widget.RelativeLayout, android.view.View
    public void onMeasure(int i5, int i11) {
        super.onMeasure(i5, i11);
    }

    @Override // android.widget.RelativeLayout
    public void setGravity(int i5) {
        super.setGravity(jw.ycx(i5));
    }

    @Override // android.view.View
    public void setLayoutParams(ViewGroup.LayoutParams layoutParams) {
        super.setLayoutParams(jw.ycx(this, layoutParams));
    }

    @Override // android.view.View
    public void setPadding(int i5, int i11, int i12, int i13) {
        super.setPaddingRelative(i5, i11, i12, i13);
    }

    public ul(Context context, AttributeSet attributeSet, int i5) {
        super(context, attributeSet, i5);
    }
}
