package com.google.android.material.datepicker;

import android.view.ContextThemeWrapper;
import android.view.LayoutInflater;
import android.view.ViewGroup;
import android.widget.LinearLayout;
import androidx.recyclerview.widget.a2;
import androidx.recyclerview.widget.m1;
import androidx.recyclerview.widget.s2;
import java.util.Calendar;

/* loaded from: classes3.dex */
public final class s extends m1 {

    /* renamed from: a, reason: collision with root package name */
    public final CalendarConstraints f34275a;

    /* renamed from: b, reason: collision with root package name */
    public final j f34276b;

    /* renamed from: c, reason: collision with root package name */
    public final int f34277c;

    public s(ContextThemeWrapper contextThemeWrapper, CalendarConstraints calendarConstraints, j jVar) {
        Month month = calendarConstraints.f34187a;
        Month month2 = calendarConstraints.f34188b;
        Month month3 = calendarConstraints.f34190d;
        if (month.f34231a.compareTo(month3.f34231a) > 0) {
            throw new IllegalArgumentException("firstPage cannot be after currentPage");
        }
        if (month3.f34231a.compareTo(month2.f34231a) > 0) {
            throw new IllegalArgumentException("currentPage cannot be after lastPage");
        }
        this.f34277c = (contextThemeWrapper.getResources().getDimensionPixelSize(2131166127) * p.f34266d) + (MaterialDatePicker.q(contextThemeWrapper, 16843277) ? contextThemeWrapper.getResources().getDimensionPixelSize(2131166127) : 0);
        this.f34275a = calendarConstraints;
        this.f34276b = jVar;
        setHasStableIds(true);
    }

    @Override // androidx.recyclerview.widget.m1
    public final int getItemCount() {
        return this.f34275a.f34193g;
    }

    @Override // androidx.recyclerview.widget.m1
    public final long getItemId(int i5) {
        Calendar calendarA = v.a(this.f34275a.f34187a.f34231a);
        calendarA.add(2, i5);
        return new Month(calendarA).f34231a.getTimeInMillis();
    }

    @Override // androidx.recyclerview.widget.m1
    public final void onBindViewHolder(s2 s2Var, int i5) {
        r rVar = (r) s2Var;
        CalendarConstraints calendarConstraints = this.f34275a;
        Calendar calendarA = v.a(calendarConstraints.f34187a.f34231a);
        calendarA.add(2, i5);
        Month month = new Month(calendarA);
        rVar.f34273b.setText(month.d());
        MaterialCalendarGridView materialCalendarGridView = (MaterialCalendarGridView) rVar.f34274c.findViewById(2131428371);
        if (materialCalendarGridView.a() == null || !month.equals(materialCalendarGridView.a().f34268a)) {
            new p(month, calendarConstraints);
            throw null;
        }
        materialCalendarGridView.invalidate();
        materialCalendarGridView.a().getClass();
        throw null;
    }

    @Override // androidx.recyclerview.widget.m1
    public final s2 onCreateViewHolder(ViewGroup viewGroup, int i5) {
        LinearLayout linearLayout = (LinearLayout) LayoutInflater.from(viewGroup.getContext()).inflate(2131624244, viewGroup, false);
        if (!MaterialDatePicker.q(viewGroup.getContext(), 16843277)) {
            return new r(linearLayout, false);
        }
        linearLayout.setLayoutParams(new a2(-1, this.f34277c));
        return new r(linearLayout, true);
    }
}
