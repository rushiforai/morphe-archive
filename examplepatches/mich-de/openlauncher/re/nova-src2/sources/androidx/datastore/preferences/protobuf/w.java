package androidx.datastore.preferences.protobuf;

/* loaded from: classes.dex */
public abstract class w implements Cloneable {

    /* renamed from: a, reason: collision with root package name */
    public final y f14413a;

    /* renamed from: b, reason: collision with root package name */
    public y f14414b;

    public w(y yVar) {
        this.f14413a = yVar;
        if (yVar.f()) {
            throw new IllegalArgumentException("Default instance must be immutable.");
        }
        this.f14414b = yVar.h();
    }

    public final y a() {
        y yVarC = c();
        yVarC.getClass();
        if (y.e(yVarC, true)) {
            return yVarC;
        }
        throw new UninitializedMessageException();
    }

    public final y c() {
        if (!this.f14414b.f()) {
            return this.f14414b;
        }
        y yVar = this.f14414b;
        yVar.getClass();
        w0 w0Var = w0.f14415c;
        w0Var.getClass();
        w0Var.a(yVar.getClass()).b(yVar);
        yVar.g();
        return this.f14414b;
    }

    public final Object clone() {
        w wVar = (w) this.f14413a.b(5);
        wVar.f14414b = c();
        return wVar;
    }

    public final void d() {
        if (this.f14414b.f()) {
            return;
        }
        y yVarH = this.f14413a.h();
        y yVar = this.f14414b;
        w0 w0Var = w0.f14415c;
        w0Var.getClass();
        w0Var.a(yVarH.getClass()).a(yVarH, yVar);
        this.f14414b = yVarH;
    }
}
