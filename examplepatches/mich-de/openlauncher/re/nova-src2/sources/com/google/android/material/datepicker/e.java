package com.google.android.material.datepicker;

import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.TextView;
import java.util.Calendar;
import java.util.Locale;

/* loaded from: classes3.dex */
public final class e extends BaseAdapter {

    /* renamed from: a, reason: collision with root package name */
    public final Calendar f34243a;

    /* renamed from: b, reason: collision with root package name */
    public final int f34244b;

    /* renamed from: c, reason: collision with root package name */
    public final int f34245c;

    public e() {
        Calendar calendarC = v.c(null);
        this.f34243a = calendarC;
        this.f34244b = calendarC.getMaximum(7);
        this.f34245c = calendarC.getFirstDayOfWeek();
    }

    @Override // android.widget.Adapter
    public final int getCount() {
        return this.f34244b;
    }

    @Override // android.widget.Adapter
    public final Object getItem(int i5) {
        int i11 = this.f34244b;
        if (i5 >= i11) {
            return null;
        }
        int i12 = i5 + this.f34245c;
        if (i12 > i11) {
            i12 -= i11;
        }
        return Integer.valueOf(i12);
    }

    @Override // android.widget.Adapter
    public final long getItemId(int i5) {
        return 0L;
    }

    @Override // android.widget.Adapter
    public final View getView(int i5, View view, ViewGroup viewGroup) {
        TextView textView = (TextView) view;
        if (view == null) {
            textView = (TextView) LayoutInflater.from(viewGroup.getContext()).inflate(2131624240, viewGroup, false);
        }
        int i11 = i5 + this.f34245c;
        int i12 = this.f34244b;
        if (i11 > i12) {
            i11 -= i12;
        }
        Calendar calendar = this.f34243a;
        calendar.set(7, i11);
        textView.setText(calendar.getDisplayName(7, 4, textView.getResources().getConfiguration().locale));
        textView.setContentDescription(String.format(viewGroup.getContext().getString(2132018680), calendar.getDisplayName(7, 2, Locale.getDefault())));
        return textView;
    }

    public e(int i5) {
        Calendar calendarC = v.c(null);
        this.f34243a = calendarC;
        this.f34244b = calendarC.getMaximum(7);
        this.f34245c = i5;
    }
}
