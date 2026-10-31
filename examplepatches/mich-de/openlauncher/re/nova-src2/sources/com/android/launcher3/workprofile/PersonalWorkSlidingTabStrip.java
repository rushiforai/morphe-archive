package com.android.launcher3.workprofile;

import android.content.Context;
import android.util.AttributeSet;
import android.widget.Button;
import android.widget.LinearLayout;
import com.android.launcher3.widget.picker.WidgetsFullSheet;
import ia.a;

/* loaded from: classes2.dex */
public class PersonalWorkSlidingTabStrip extends LinearLayout implements a {

    /* renamed from: a, reason: collision with root package name */
    public WidgetsFullSheet f21378a;

    /* renamed from: b, reason: collision with root package name */
    public int f21379b;

    public PersonalWorkSlidingTabStrip(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        this.f21379b = 0;
    }

    @Override // ia.a
    public final void a(int i5) {
        int i11 = 0;
        while (i11 < getChildCount()) {
            ((Button) getChildAt(i11)).setSelected(i11 == i5);
            i11++;
        }
        WidgetsFullSheet widgetsFullSheet = this.f21378a;
        if (widgetsFullSheet != null && this.f21379b != i5) {
            widgetsFullSheet.n0(i5);
        }
        this.f21379b = i5;
    }

    @Override // ia.a
    public final void c(int i5) {
    }

    @Override // android.view.View
    public final boolean hasOverlappingRendering() {
        return false;
    }
}
