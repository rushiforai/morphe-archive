package com.google.crypto.tink.shaded.protobuf;

/* loaded from: classes3.dex */
public abstract class v implements n0, Cloneable {

    /* renamed from: a, reason: collision with root package name */
    public final x f34673a;

    /* renamed from: b, reason: collision with root package name */
    public x f34674b;

    public v(x xVar) {
        this.f34673a = xVar;
        if (xVar.n()) {
            throw new IllegalArgumentException("Default instance must be immutable.");
        }
        this.f34674b = xVar.q();
    }

    public final x a() {
        x xVarC = c();
        xVarC.getClass();
        if (x.m(xVarC, true)) {
            return xVarC;
        }
        throw new UninitializedMessageException();
    }

    public final x c() {
        if (!this.f34674b.n()) {
            return this.f34674b;
        }
        x xVar = this.f34674b;
        xVar.getClass();
        u0 u0Var = u0.f34670c;
        u0Var.getClass();
        u0Var.a(xVar.getClass()).b(xVar);
        xVar.o();
        return this.f34674b;
    }

    public final v d() {
        v vVarP = this.f34673a.c();
        vVarP.f34674b = c();
        return vVarP;
    }

    public final void e() {
        if (this.f34674b.n()) {
            return;
        }
        x xVarQ = this.f34673a.q();
        x xVar = this.f34674b;
        u0 u0Var = u0.f34670c;
        u0Var.getClass();
        u0Var.a(xVarQ.getClass()).a(xVarQ, xVar);
        this.f34674b = xVarQ;
    }
}
