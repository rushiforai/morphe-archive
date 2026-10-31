package com.google.android.gms.internal.measurement;

import java.util.Calendar;
import java.util.Date;

/* loaded from: classes3.dex */
public final class z extends a0 {

    /* renamed from: c, reason: collision with root package name */
    public final y f33270c;

    public z(ei eiVar, int i5, y yVar) {
        super(eiVar, i5);
        this.f33270c = yVar;
        StringBuilder sb2 = new StringBuilder("%");
        eiVar.d(sb2);
        sb2.append(true != eiVar.c() ? 't' : 'T');
        sb2.append(yVar.f33237a);
    }

    @Override // com.google.android.gms.internal.measurement.a0
    public final void f(xg xgVar, Object obj) {
        ei eiVar = (ei) this.f32363b;
        StringBuilder sb2 = (StringBuilder) xgVar.f33232g;
        boolean z11 = obj instanceof Date;
        y yVar = this.f33270c;
        if (z11 || (obj instanceof Calendar) || (obj instanceof Long)) {
            StringBuilder sb3 = new StringBuilder("%");
            eiVar.d(sb3);
            sb3.append(true != eiVar.c() ? 't' : 'T');
            sb3.append(yVar.f33237a);
            sb2.append(String.format(gi.f32581a, sb3.toString(), obj));
            return;
        }
        char c11 = yVar.f33237a;
        StringBuilder sb4 = new StringBuilder(String.valueOf(c11).length() + 2);
        sb4.append("%t");
        sb4.append(c11);
        xg.f(sb2, obj, sb4.toString());
    }
}
