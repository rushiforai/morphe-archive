package com.google.android.gms.internal.measurement;

import android.app.Activity;

/* loaded from: classes3.dex */
public final class g8 extends d8 {

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ int f32565e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ Activity f32566f;

    /* renamed from: g, reason: collision with root package name */
    public final /* synthetic */ h8 f32567g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public g8(h8 h8Var, Activity activity, int i5) {
        super(h8Var.f32607a, true);
        this.f32565e = i5;
        switch (i5) {
            case 1:
                this.f32566f = activity;
                this.f32567g = h8Var;
                super(h8Var.f32607a, true);
                break;
            case 2:
                this.f32566f = activity;
                this.f32567g = h8Var;
                super(h8Var.f32607a, true);
                break;
            case 3:
                this.f32566f = activity;
                this.f32567g = h8Var;
                super(h8Var.f32607a, true);
                break;
            case 4:
                this.f32566f = activity;
                this.f32567g = h8Var;
                super(h8Var.f32607a, true);
                break;
            default:
                this.f32566f = activity;
                this.f32567g = h8Var;
                break;
        }
    }

    @Override // com.google.android.gms.internal.measurement.d8
    public final void a() {
        switch (this.f32565e) {
            case 0:
                d7 d7Var = this.f32567g.f32607a.f32648g;
                sg.w.h(d7Var);
                d7Var.onActivityStartedByScionActivityInfo(zzdd.b(this.f32566f), this.f32461b);
                break;
            case 1:
                d7 d7Var2 = this.f32567g.f32607a.f32648g;
                sg.w.h(d7Var2);
                d7Var2.onActivityResumedByScionActivityInfo(zzdd.b(this.f32566f), this.f32461b);
                break;
            case 2:
                d7 d7Var3 = this.f32567g.f32607a.f32648g;
                sg.w.h(d7Var3);
                d7Var3.onActivityPausedByScionActivityInfo(zzdd.b(this.f32566f), this.f32461b);
                break;
            case 3:
                d7 d7Var4 = this.f32567g.f32607a.f32648g;
                sg.w.h(d7Var4);
                d7Var4.onActivityStoppedByScionActivityInfo(zzdd.b(this.f32566f), this.f32461b);
                break;
            default:
                d7 d7Var5 = this.f32567g.f32607a.f32648g;
                sg.w.h(d7Var5);
                d7Var5.onActivityDestroyedByScionActivityInfo(zzdd.b(this.f32566f), this.f32461b);
                break;
        }
    }
}
