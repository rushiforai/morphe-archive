package com.android.launcher3.widget.picker;

import android.content.Context;
import android.util.AttributeSet;
import android.view.View;
import android.widget.TableLayout;
import eb.n;

/* loaded from: classes2.dex */
public class WidgetsListTableView extends TableLayout {

    /* renamed from: a, reason: collision with root package name */
    public n f21359a;

    public WidgetsListTableView(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
    }

    @Override // android.view.ViewGroup, android.view.View
    public final int[] onCreateDrawableState(int i5) {
        n nVar = this.f21359a;
        if (nVar == null) {
            return super.onCreateDrawableState(i5);
        }
        int[] iArrOnCreateDrawableState = super.onCreateDrawableState(i5 + nVar.f52510a.length);
        View.mergeDrawableStates(iArrOnCreateDrawableState, this.f21359a.f52510a);
        return iArrOnCreateDrawableState;
    }
}
