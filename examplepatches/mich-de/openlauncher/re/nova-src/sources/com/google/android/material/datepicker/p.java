package com.google.android.material.datepicker;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.TextView;
import java.util.Calendar;

/* loaded from: classes3.dex */
public final class p extends BaseAdapter {

    /* renamed from: d, reason: collision with root package name */
    public static final int f34266d = v.c(null).getMaximum(4);

    /* renamed from: e, reason: collision with root package name */
    public static final int f34267e = (v.c(null).getMaximum(7) + v.c(null).getMaximum(5)) - 1;

    /* renamed from: a, reason: collision with root package name */
    public final Month f34268a;

    /* renamed from: b, reason: collision with root package name */
    public d f34269b;

    /* renamed from: c, reason: collision with root package name */
    public final CalendarConstraints f34270c;

    public p(Month month, CalendarConstraints calendarConstraints) {
        this.f34268a = month;
        this.f34270c = calendarConstraints;
        throw null;
    }

    public final int a() {
        int firstDayOfWeek = this.f34270c.f34191e;
        Month month = this.f34268a;
        Calendar calendar = month.f34231a;
        int i5 = calendar.get(7);
        if (firstDayOfWeek <= 0) {
            firstDayOfWeek = calendar.getFirstDayOfWeek();
        }
        int i11 = i5 - firstDayOfWeek;
        return i11 < 0 ? i11 + month.f34234d : i11;
    }

    @Override // android.widget.Adapter
    /* renamed from: b, reason: merged with bridge method [inline-methods] */
    public final Long getItem(int i5) {
        if (i5 < a() || i5 > c()) {
            return null;
        }
        int iA = (i5 - a()) + 1;
        Calendar calendarA = v.a(this.f34268a.f34231a);
        calendarA.set(5, iA);
        return Long.valueOf(calendarA.getTimeInMillis());
    }

    public final int c() {
        return (a() + this.f34268a.f34235e) - 1;
    }

    @Override // android.widget.Adapter
    public final int getCount() {
        return f34267e;
    }

    @Override // android.widget.Adapter
    public final long getItemId(int i5) {
        return i5 / this.f34268a.f34234d;
    }

    /* JADX WARN: Removed duplicated region for block: B:14:0x005d  */
    @Override // android.widget.Adapter
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final View getView(int i5, View view, ViewGroup viewGroup) {
        Context context = viewGroup.getContext();
        if (this.f34269b == null) {
            this.f34269b = new d(context);
        }
        TextView textView = (TextView) view;
        if (view == null) {
            textView = (TextView) LayoutInflater.from(viewGroup.getContext()).inflate(2131624239, viewGroup, false);
        }
        int iA = i5 - a();
        if (iA >= 0) {
            Month month = this.f34268a;
            if (iA >= month.f34235e) {
                textView.setVisibility(8);
                textView.setEnabled(false);
            } else {
                textView.setTag(month);
                textView.setText(String.format(textView.getResources().getConfiguration().locale, "%d", Integer.valueOf(iA + 1)));
                textView.setVisibility(0);
                textView.setEnabled(true);
            }
        }
        if (getItem(i5) == null || textView == null) {
            return textView;
        }
        textView.getContext();
        v.b().getTimeInMillis();
        throw null;
    }

    @Override // android.widget.BaseAdapter, android.widget.Adapter
    public final boolean hasStableIds() {
        return true;
    }
}
