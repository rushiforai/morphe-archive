package com.google.android.material.datepicker;

import android.view.View;
import android.widget.AdapterView;

/* loaded from: classes3.dex */
public final class q implements AdapterView.OnItemClickListener {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ MaterialCalendarGridView f34271a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ s f34272b;

    public q(s sVar, MaterialCalendarGridView materialCalendarGridView) {
        this.f34272b = sVar;
        this.f34271a = materialCalendarGridView;
    }

    @Override // android.widget.AdapterView.OnItemClickListener
    public final void onItemClick(AdapterView adapterView, View view, int i5, long j11) {
        MaterialCalendarGridView materialCalendarGridView = this.f34271a;
        p pVarA = materialCalendarGridView.a();
        if (i5 < pVarA.a() || i5 > pVarA.c()) {
            return;
        }
        if (materialCalendarGridView.a().getItem(i5).longValue() >= ((DateValidatorPointForward) this.f34272b.f34276b.f34255a.f34196c.f34189c).f34194a) {
            throw null;
        }
    }
}
