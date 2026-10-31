package com.bytedance.sdk.openadsdk.core.lt;

import android.content.Context;
import android.util.AttributeSet;
import android.view.ViewGroup;
import android.widget.FrameLayout;

/* loaded from: classes2.dex */
public class sya extends FrameLayout {
    public sya(Context context) {
        super(context);
        init();
    }

    private void init() {
    }

    @Override // android.widget.FrameLayout, android.view.View
    public void onMeasure(int i5, int i11) {
        super.onMeasure(i5, i11);
    }

    @Override // android.view.View
    public void setLayoutParams(ViewGroup.LayoutParams layoutParams) {
        super.setLayoutParams(jw.ycx(this, layoutParams));
    }

    @Override // android.view.View
    public void setPadding(int i5, int i11, int i12, int i13) {
        super.setPaddingRelative(i5, i11, i12, i13);
    }

    public sya(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        init();
    }

    public sya(Context context, AttributeSet attributeSet, int i5) {
        super(context, attributeSet, i5);
        init();
    }
}
