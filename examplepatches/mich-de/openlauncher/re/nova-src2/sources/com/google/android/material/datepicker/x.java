package com.google.android.material.datepicker;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.ViewGroup;
import android.widget.TextView;
import androidx.recyclerview.widget.m1;
import androidx.recyclerview.widget.s2;
import java.util.Locale;

/* loaded from: classes3.dex */
public final class x extends m1 {

    /* renamed from: a, reason: collision with root package name */
    public final MaterialCalendar f34281a;

    public x(MaterialCalendar materialCalendar) {
        this.f34281a = materialCalendar;
    }

    @Override // androidx.recyclerview.widget.m1
    public final int getItemCount() {
        return this.f34281a.f34196c.f34192f;
    }

    @Override // androidx.recyclerview.widget.m1
    public final void onBindViewHolder(s2 s2Var, int i5) {
        w wVar = (w) s2Var;
        MaterialCalendar materialCalendar = this.f34281a;
        int i11 = materialCalendar.f34196c.f34187a.f34233c + i5;
        wVar.f34280b.setText(String.format(Locale.getDefault(), "%d", Integer.valueOf(i11)));
        TextView textView = wVar.f34280b;
        Context context = textView.getContext();
        textView.setContentDescription(v.b().get(1) == i11 ? String.format(context.getString(2132018686), Integer.valueOf(i11)) : String.format(context.getString(2132018687), Integer.valueOf(i11)));
        d dVar = materialCalendar.f34199f;
        if (v.b().get(1) == i11) {
            c cVar = dVar.f34242b;
        } else {
            c cVar2 = dVar.f34241a;
        }
        throw null;
    }

    @Override // androidx.recyclerview.widget.m1
    public final s2 onCreateViewHolder(ViewGroup viewGroup, int i5) {
        return new w((TextView) LayoutInflater.from(viewGroup.getContext()).inflate(2131624248, viewGroup, false));
    }
}
