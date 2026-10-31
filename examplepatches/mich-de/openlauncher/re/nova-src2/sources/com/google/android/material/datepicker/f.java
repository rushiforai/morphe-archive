package com.google.android.material.datepicker;

import android.view.View;
import androidx.recyclerview.widget.LinearLayoutManager;
import java.util.Calendar;

/* loaded from: classes3.dex */
public final class f implements View.OnClickListener {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f34246a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ s f34247b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ MaterialCalendar f34248c;

    public /* synthetic */ f(MaterialCalendar materialCalendar, s sVar, int i5) {
        this.f34246a = i5;
        this.f34248c = materialCalendar;
        this.f34247b = sVar;
    }

    @Override // android.view.View.OnClickListener
    public final void onClick(View view) {
        switch (this.f34246a) {
            case 0:
                MaterialCalendar materialCalendar = this.f34248c;
                int iFindLastVisibleItemPosition = ((LinearLayoutManager) materialCalendar.f34201h.getLayoutManager()).findLastVisibleItemPosition() - 1;
                if (iFindLastVisibleItemPosition >= 0) {
                    Calendar calendarA = v.a(this.f34247b.f34275a.f34187a.f34231a);
                    calendarA.add(2, iFindLastVisibleItemPosition);
                    materialCalendar.n(new Month(calendarA));
                    break;
                }
                break;
            default:
                MaterialCalendar materialCalendar2 = this.f34248c;
                int iFindFirstVisibleItemPosition = ((LinearLayoutManager) materialCalendar2.f34201h.getLayoutManager()).findFirstVisibleItemPosition() + 1;
                if (iFindFirstVisibleItemPosition < materialCalendar2.f34201h.getAdapter().getItemCount()) {
                    Calendar calendarA2 = v.a(this.f34247b.f34275a.f34187a.f34231a);
                    calendarA2.add(2, iFindFirstVisibleItemPosition);
                    materialCalendar2.n(new Month(calendarA2));
                    break;
                }
                break;
        }
    }
}
