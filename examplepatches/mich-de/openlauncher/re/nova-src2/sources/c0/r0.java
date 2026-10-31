package c0;

import kotlin.jvm.internal.Intrinsics;
import p1.s2;

/* loaded from: classes.dex */
public final class r0 extends g2 {

    /* renamed from: f, reason: collision with root package name */
    public final p1.e1 f18938f;

    /* renamed from: l, reason: collision with root package name */
    public final p1.e1 f18939l;

    public r0(Object obj) {
        super(0);
        this.f18938f = androidx.compose.runtime.d.k(obj);
        this.f18939l = androidx.compose.runtime.d.k(obj);
    }

    @Override // c0.g2
    public final Object c() {
        return ((s2) this.f18938f).getValue();
    }

    @Override // c0.g2
    public final Object f() {
        return ((s2) this.f18939l).getValue();
    }

    @Override // c0.g2
    public final void g(Object obj) {
        ((s2) this.f18938f).setValue(obj);
    }

    @Override // c0.g2
    public final void h(c2 c2Var) {
    }

    @Override // c0.g2
    public final void i() {
    }

    public final boolean j() {
        return Intrinsics.b(((s2) this.f18938f).getValue(), ((s2) this.f18939l).getValue()) && !((Boolean) ((s2) ((p1.e1) this.f18817a)).getValue()).booleanValue();
    }

    public final void k(Boolean bool) {
        ((s2) this.f18939l).setValue(bool);
    }
}
