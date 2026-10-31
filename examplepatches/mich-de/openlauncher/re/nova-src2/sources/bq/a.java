package bq;

import aq.r;
import aq.u;
import aq.x;

/* loaded from: classes4.dex */
public final class a extends r {

    /* renamed from: a, reason: collision with root package name */
    public final r f18415a;

    public a(r rVar) {
        this.f18415a = rVar;
    }

    @Override // aq.r
    public final Object a(u uVar) {
        if (uVar.w() != 9) {
            return this.f18415a.a(uVar);
        }
        uVar.p();
        return null;
    }

    @Override // aq.r
    public final void e(x xVar, Object obj) {
        if (obj == null) {
            xVar.e();
        } else {
            this.f18415a.e(xVar, obj);
        }
    }

    public final String toString() {
        return this.f18415a + ".nullSafe()";
    }
}
