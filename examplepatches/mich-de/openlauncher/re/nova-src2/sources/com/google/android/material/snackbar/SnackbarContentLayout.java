package com.google.android.material.snackbar;

import a5.a1;
import android.content.Context;
import android.content.res.Resources;
import android.text.Layout;
import android.util.AttributeSet;
import android.widget.LinearLayout;
import android.widget.TextView;
import cj.a;
import java.util.WeakHashMap;
import ps.l;

/* loaded from: classes3.dex */
public class SnackbarContentLayout extends LinearLayout {

    /* renamed from: a, reason: collision with root package name */
    public TextView f34359a;

    public SnackbarContentLayout(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        l.r(context, 2130969713, a.f19952b);
    }

    @Override // android.view.View
    public final void onFinishInflate() {
        super.onFinishInflate();
        this.f34359a = (TextView) findViewById(2131428872);
    }

    @Override // android.widget.LinearLayout, android.view.View
    public final void onMeasure(int i5, int i11) throws Resources.NotFoundException {
        super.onMeasure(i5, i11);
        boolean z11 = true;
        if (getOrientation() == 1) {
            return;
        }
        int dimensionPixelSize = getResources().getDimensionPixelSize(2131165412);
        int dimensionPixelSize2 = getResources().getDimensionPixelSize(2131165411);
        Layout layout = this.f34359a.getLayout();
        if (layout == null || layout.getLineCount() <= 1) {
            dimensionPixelSize = dimensionPixelSize2;
        }
        boolean z12 = false;
        if (getOrientation() != 0) {
            setOrientation(0);
            z12 = true;
        }
        if (this.f34359a.getPaddingTop() == dimensionPixelSize && this.f34359a.getPaddingBottom() == dimensionPixelSize) {
            z11 = z12;
        } else {
            TextView textView = this.f34359a;
            WeakHashMap weakHashMap = a1.f250a;
            if (textView.isPaddingRelative()) {
                textView.setPaddingRelative(textView.getPaddingStart(), dimensionPixelSize, textView.getPaddingEnd(), dimensionPixelSize);
            } else {
                textView.setPadding(textView.getPaddingLeft(), dimensionPixelSize, textView.getPaddingRight(), dimensionPixelSize);
            }
        }
        if (z11) {
            super.onMeasure(i5, i11);
        }
    }
}
