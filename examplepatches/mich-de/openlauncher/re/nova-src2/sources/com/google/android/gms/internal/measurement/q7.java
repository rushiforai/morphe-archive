package com.google.android.gms.internal.measurement;

import android.os.Bundle;
import java.util.Objects;

/* loaded from: classes3.dex */
public final class q7 extends d8 {

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ int f32987e = 0;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ String f32988f;

    /* renamed from: g, reason: collision with root package name */
    public final /* synthetic */ String f32989g;

    /* renamed from: h, reason: collision with root package name */
    public final /* synthetic */ i8 f32990h;

    /* renamed from: i, reason: collision with root package name */
    public final /* synthetic */ Object f32991i;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public q7(i8 i8Var, String str, String str2, Bundle bundle) {
        super(i8Var, true);
        this.f32988f = str;
        this.f32989g = str2;
        this.f32991i = bundle;
        Objects.requireNonNull(i8Var);
        this.f32990h = i8Var;
    }

    @Override // com.google.android.gms.internal.measurement.d8
    public final void a() {
        switch (this.f32987e) {
            case 0:
                d7 d7Var = this.f32990h.f32648g;
                sg.w.h(d7Var);
                d7Var.clearConditionalUserProperty(this.f32988f, this.f32989g, (Bundle) this.f32991i);
                break;
            default:
                d7 d7Var2 = this.f32990h.f32648g;
                sg.w.h(d7Var2);
                d7Var2.getConditionalUserProperties(this.f32988f, this.f32989g, (a7) this.f32991i);
                break;
        }
    }

    @Override // com.google.android.gms.internal.measurement.d8
    public void b() {
        switch (this.f32987e) {
            case 1:
                ((a7) this.f32991i).G(null);
                break;
        }
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public q7(i8 i8Var, String str, String str2, a7 a7Var) {
        super(i8Var, true);
        this.f32988f = str;
        this.f32989g = str2;
        this.f32991i = a7Var;
        Objects.requireNonNull(i8Var);
        this.f32990h = i8Var;
    }
}
