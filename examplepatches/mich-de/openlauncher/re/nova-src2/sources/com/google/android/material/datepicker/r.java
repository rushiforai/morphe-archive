package com.google.android.material.datepicker;

import a5.a1;
import a5.o0;
import android.widget.LinearLayout;
import android.widget.TextView;
import androidx.recyclerview.widget.s2;
import java.util.WeakHashMap;

/* loaded from: classes3.dex */
public final class r extends s2 {

    /* renamed from: b, reason: collision with root package name */
    public final TextView f34273b;

    /* renamed from: c, reason: collision with root package name */
    public final MaterialCalendarGridView f34274c;

    public r(LinearLayout linearLayout, boolean z11) {
        super(linearLayout);
        TextView textView = (TextView) linearLayout.findViewById(2131428376);
        this.f34273b = textView;
        WeakHashMap weakHashMap = a1.f250a;
        new o0(3).b(textView, Boolean.TRUE);
        this.f34274c = (MaterialCalendarGridView) linearLayout.findViewById(2131428371);
        if (z11) {
            return;
        }
        textView.setVisibility(8);
    }
}
