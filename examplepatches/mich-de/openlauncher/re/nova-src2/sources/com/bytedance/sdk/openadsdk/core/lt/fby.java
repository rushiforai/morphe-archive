package com.bytedance.sdk.openadsdk.core.lt;

import android.content.Context;
import android.graphics.drawable.Drawable;
import android.util.AttributeSet;
import android.view.ViewGroup;
import android.widget.TextView;
import com.bytedance.sdk.component.utils.htf;

/* loaded from: classes2.dex */
public class fby extends TextView {
    public fby(Context context) {
        super(context);
        ycx();
    }

    private void ycx() {
        setTextDirection(5);
    }

    @Override // android.widget.TextView, android.view.View
    public void onMeasure(int i5, int i11) {
        try {
            super.onMeasure(i5, i11);
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V7TiGF7Nk0YlPwA==", "a88KoQakffGJT8A=", "VOAAkAKvfNWF", 89);
            htf.sya("PAGTextView", th2.toString());
        }
    }

    @Override // android.widget.TextView
    public void setCompoundDrawables(Drawable drawable, Drawable drawable2, Drawable drawable3, Drawable drawable4) {
        super.setCompoundDrawablesRelative(drawable, drawable2, drawable3, drawable4);
    }

    @Override // android.widget.TextView
    public void setCompoundDrawablesWithIntrinsicBounds(int i5, int i11, int i12, int i13) {
        super.setCompoundDrawablesRelativeWithIntrinsicBounds(i5, i11, i12, i13);
    }

    @Override // android.widget.TextView
    public void setGravity(int i5) {
        super.setGravity(jw.ycx(i5));
    }

    @Override // android.view.View
    public void setLayoutParams(ViewGroup.LayoutParams layoutParams) {
        super.setLayoutParams(jw.ycx(this, layoutParams));
    }

    @Override // android.widget.TextView, android.view.View
    public void setPadding(int i5, int i11, int i12, int i13) {
        super.setPaddingRelative(i5, i11, i12, i13);
    }

    @Override // android.widget.TextView
    public void setCompoundDrawablesWithIntrinsicBounds(Drawable drawable, Drawable drawable2, Drawable drawable3, Drawable drawable4) {
        super.setCompoundDrawablesRelativeWithIntrinsicBounds(drawable, drawable2, drawable3, drawable4);
    }

    public fby(Context context, AttributeSet attributeSet, int i5) {
        super(context, attributeSet, i5);
        ycx();
    }
}
