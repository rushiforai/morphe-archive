package kw;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class j3 extends l3 {

    /* renamed from: a, reason: collision with root package name */
    public final w0 f72443a;

    public j3(v0 v0Var) {
        this.f72443a = v0Var;
    }

    @Override // kw.l3, kw.e3
    public final boolean b(boolean z11, boolean z12) {
        return this.f72443a != null;
    }

    @Override // kw.e3
    public final boolean c() {
        return true;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof j3) && Intrinsics.b(this.f72443a, ((j3) obj).f72443a);
    }

    @Override // kw.l3, kw.e3
    public final w0 g() {
        return this.f72443a;
    }

    public final int hashCode() {
        w0 w0Var = this.f72443a;
        if (w0Var == null) {
            return 0;
        }
        return w0Var.hashCode();
    }

    public final String toString() {
        return "Full(validationMessage=" + this.f72443a + ")";
    }
}
