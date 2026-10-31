package com.google.android.material.datepicker;

import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;
import androidx.recyclerview.widget.o2;

/* loaded from: classes3.dex */
public final class i extends LinearLayoutManager {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f34253a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ MaterialCalendar f34254b;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public i(MaterialCalendar materialCalendar, int i5, int i11) {
        super(i5, false);
        this.f34254b = materialCalendar;
        this.f34253a = i11;
    }

    @Override // androidx.recyclerview.widget.LinearLayoutManager
    public final void calculateExtraLayoutSpace(o2 o2Var, int[] iArr) {
        int i5 = this.f34253a;
        MaterialCalendar materialCalendar = this.f34254b;
        if (i5 == 0) {
            iArr[0] = materialCalendar.f34201h.getWidth();
            iArr[1] = materialCalendar.f34201h.getWidth();
        } else {
            iArr[0] = materialCalendar.f34201h.getHeight();
            iArr[1] = materialCalendar.f34201h.getHeight();
        }
    }

    @Override // androidx.recyclerview.widget.LinearLayoutManager, androidx.recyclerview.widget.z1
    public final void smoothScrollToPosition(RecyclerView recyclerView, o2 o2Var, int i5) {
        t tVar = new t(recyclerView.getContext());
        tVar.setTargetPosition(i5);
        startSmoothScroll(tVar);
    }
}
