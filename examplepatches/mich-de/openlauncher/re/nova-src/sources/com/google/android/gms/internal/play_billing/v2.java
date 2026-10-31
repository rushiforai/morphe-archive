package com.google.android.gms.internal.play_billing;

/* loaded from: classes3.dex */
public abstract class v2 implements Cloneable {

    /* renamed from: a, reason: collision with root package name */
    public final x2 f33563a;

    /* renamed from: b, reason: collision with root package name */
    public x2 f33564b;

    public v2(x2 x2Var) {
        this.f33563a = x2Var;
        if (x2Var.h()) {
            throw new IllegalArgumentException("Default instance must be immutable.");
        }
        this.f33564b = (x2) x2Var.j(4);
    }

    public final x2 a() {
        x2 x2VarC = c();
        x2VarC.getClass();
        if (x2.i(x2VarC, true)) {
            return x2VarC;
        }
        throw new zzia();
    }

    public final x2 c() {
        if (!this.f33564b.h()) {
            return this.f33564b;
        }
        this.f33564b.p();
        return this.f33564b;
    }

    public final Object clone() {
        v2 v2Var = (v2) this.f33563a.j(5);
        v2Var.f33564b = c();
        return v2Var;
    }

    public final void d() {
        if (this.f33564b.h()) {
            return;
        }
        e();
    }

    public final void e() {
        x2 x2Var = (x2) this.f33563a.j(4);
        u3.f33553c.a(x2Var.getClass()).zzg(x2Var, this.f33564b);
        this.f33564b = x2Var;
    }
}
