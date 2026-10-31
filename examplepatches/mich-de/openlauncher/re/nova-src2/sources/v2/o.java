package v2;

import c3.r0;
import c3.z1;

/* loaded from: classes.dex */
public final class o extends h {

    /* renamed from: d, reason: collision with root package name */
    public final String f91984d;

    public o(a aVar) {
        super(aVar, null);
        this.f91984d = "androidx.compose.ui.input.pointer.PointerHoverIcon";
    }

    @Override // v2.h
    public final void D(q qVar) {
        r rVar = (r) b3.g.c(this, z1.f19508u);
        if (rVar != null) {
            c3.x xVar = (c3.x) rVar;
            if (qVar == null) {
                q.f91986a.getClass();
                qVar = s.f91987a;
            }
            r0.f19414a.a(xVar.f19463b, qVar);
        }
    }

    @Override // v2.h
    public final boolean F(int i5) {
        return (g0.f(i5, 3) || g0.f(i5, 4)) ? false : true;
    }

    @Override // b3.u2
    public final Object a() {
        return this.f91984d;
    }
}
