package com.google.android.material.timepicker;

import android.view.View;

/* loaded from: classes3.dex */
public final class u implements View.OnClickListener {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f34528a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f34529b;

    public /* synthetic */ u(Object obj, int i5) {
        this.f34528a = i5;
        this.f34529b = obj;
    }

    @Override // android.view.View.OnClickListener
    public final void onClick(View view) {
        switch (this.f34528a) {
            case 0:
                n nVar = ((TimePickerView) this.f34529b).f34482v;
                if (nVar != null) {
                    nVar.b(((Integer) view.getTag(2131428803)).intValue(), true);
                    break;
                }
                break;
            default:
                ((t) this.f34529b).b(((Integer) view.getTag(2131428803)).intValue());
                break;
        }
    }
}
