package com.google.android.gms.internal.measurement;

import android.content.Context;
import android.content.res.Resources;
import android.os.Bundle;
import android.text.TextUtils;
import android.util.Log;
import com.google.android.gms.dynamite.descriptors.com.google.android.gms.measurement.dynamite.ModuleDescriptor;

/* loaded from: classes.dex */
public final class u7 extends d8 {

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ Context f33105e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ Bundle f33106f;

    /* renamed from: g, reason: collision with root package name */
    public final /* synthetic */ i8 f33107g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public u7(i8 i8Var, Context context, Bundle bundle) {
        super(i8Var, true);
        this.f33105e = context;
        this.f33106f = bundle;
        this.f33107g = i8Var;
    }

    @Override // com.google.android.gms.internal.measurement.d8
    public final void a() {
        i8 i8Var = this.f33107g;
        try {
            Context context = this.f33105e;
            sg.w.h(context);
            String strA = ai.b2.a(context);
            Resources resources = context.getResources();
            if (TextUtils.isEmpty(strA)) {
                strA = ai.b2.a(context);
            }
            Boolean boolH = ai.b2.h(resources, strA);
            i8Var.m(i8Var.s(context, boolH == null || !boolH.booleanValue()));
            if (i8Var.l() == null) {
                Log.w("FA", "Failed to connect to measurement client.");
                return;
            }
            int iA = bh.e.a(context, ModuleDescriptor.MODULE_ID);
            int iD = bh.e.d(context, ModuleDescriptor.MODULE_ID, false);
            int iMax = Math.max(iA, iD);
            boolean z11 = Boolean.TRUE.equals(boolH) || iD < iA;
            long j11 = iMax;
            i8Var.n(j11);
            zzdb zzdbVar = new zzdb(161000L, j11, z11, this.f33106f, ai.b2.a(context));
            if (i8Var.i()) {
                d7 d7VarL = i8Var.l();
                sg.w.h(d7VarL);
                d7VarL.initializeWithElapsedTime(new ah.d(context), zzdbVar, this.f32460a, this.f32461b);
            } else {
                d7 d7VarL2 = i8Var.l();
                sg.w.h(d7VarL2);
                d7VarL2.initialize(new ah.d(context), zzdbVar, this.f32460a);
            }
        } catch (Exception e3) {
            i8Var.h(e3, true, false);
        }
    }
}
