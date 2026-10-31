package com.teslacoilsw.launcher.widget;

import android.content.Context;
import android.text.TextUtils;
import android.util.AttributeSet;
import android.view.View;
import android.widget.TextView;
import androidx.appcompat.widget.Toolbar;
import x7.f;

/* loaded from: classes4.dex */
public class FontFamilyToolbar extends Toolbar {
    public FontFamilyToolbar(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
    }

    @Override // androidx.appcompat.widget.Toolbar
    public final void A(CharSequence charSequence) {
        TextView textView;
        super.A(charSequence);
        if (TextUtils.isEmpty(charSequence)) {
            return;
        }
        int i5 = 0;
        while (true) {
            if (i5 >= getChildCount()) {
                textView = null;
                break;
            }
            View childAt = getChildAt(i5);
            if (childAt instanceof TextView) {
                textView = (TextView) childAt;
                break;
            }
            i5++;
        }
        if (textView != null) {
            textView.setTypeface(f.u(getContext(), "sans-serif-medium"), 0);
        }
    }
}
