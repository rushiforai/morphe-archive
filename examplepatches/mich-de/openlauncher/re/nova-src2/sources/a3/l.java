package a3;

import p1.e1;
import p1.s2;

/* loaded from: classes2.dex */
public final class l extends g {

    /* renamed from: a, reason: collision with root package name */
    public final c f181a;

    /* renamed from: b, reason: collision with root package name */
    public final e1 f182b = androidx.compose.runtime.d.k(null);

    public l(c cVar) {
        this.f181a = cVar;
    }

    @Override // a3.g
    public final boolean a(c cVar) {
        return cVar == this.f181a;
    }

    @Override // a3.g
    public final Object b(c cVar) {
        if (!(cVar == this.f181a)) {
            y2.a.b("Check failed.");
        }
        Object value = ((s2) this.f182b).getValue();
        if (value == null) {
            return null;
        }
        return value;
    }

    @Override // a3.g
    public final void c(c cVar, Object obj) {
        if (!(cVar == this.f181a)) {
            y2.a.b("Check failed.");
        }
        ((s2) this.f182b).setValue(obj);
    }
}
