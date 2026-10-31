package a3;

import k0.g2;
import k0.i2;
import k0.y0;
import p1.s2;

/* loaded from: classes.dex */
public final class a extends g {

    /* renamed from: a, reason: collision with root package name */
    public i f170a;

    @Override // a3.g
    public final boolean a(c cVar) {
        ((y0) this.f170a).getClass();
        return cVar == i2.f70646a;
    }

    @Override // a3.g
    public final Object b(c cVar) {
        ((y0) this.f170a).getClass();
        if (!(cVar == i2.f70646a)) {
            y2.a.b("Check failed.");
        }
        return (g2) ((s2) ((y0) this.f170a).f70780c).getValue();
    }

    @Override // a3.g
    public final void c(c cVar, Object obj) {
        throw new IllegalStateException("Set is not allowed on a backwards compat provider");
    }
}
