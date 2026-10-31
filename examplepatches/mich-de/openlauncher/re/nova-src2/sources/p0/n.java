package p0;

import kotlin.jvm.internal.Intrinsics;
import p1.t1;

/* loaded from: classes2.dex */
public final class n implements n0.d0 {

    /* renamed from: a, reason: collision with root package name */
    public final y f81177a;

    /* renamed from: b, reason: collision with root package name */
    public final androidx.compose.foundation.lazy.layout.b f81178b;

    /* renamed from: c, reason: collision with root package name */
    public final androidx.compose.foundation.lazy.layout.e f81179c;

    public n(y yVar, m mVar, androidx.compose.foundation.lazy.layout.e eVar) {
        this.f81177a = yVar;
        this.f81178b = mVar;
        this.f81179c = eVar;
    }

    @Override // n0.d0
    public final int a() {
        return this.f81178b.c().f19532b;
    }

    @Override // n0.d0
    public final int c(Object obj) {
        return this.f81179c.a(obj);
    }

    @Override // n0.d0
    public final Object d(int i5) {
        Object objB = this.f81179c.b(i5);
        return objB == null ? this.f81178b.d(i5) : objB;
    }

    @Override // n0.d0
    public final void e(int i5, Object obj, p1.o oVar, int i11) {
        p1.t tVar = (p1.t) oVar;
        tVar.d0(-1201380429);
        int i12 = (tVar.d(i5) ? 4 : 2) | i11 | (tVar.h(obj) ? 32 : 16) | (tVar.f(this) ? 256 : 128);
        if (tVar.S(i12 & 1, (i12 & 147) != 146)) {
            n0.z.b(obj, i5, this.f81177a.B, x1.f.d(1142237095, new gy.s(this, i5, 1), tVar), tVar, ((i12 >> 3) & 14) | 3072 | ((i12 << 3) & 112));
        } else {
            tVar.V();
        }
        t1 t1VarU = tVar.u();
        if (t1VarU != null) {
            t1VarU.f81583d = new b10.w(i5, i11, 28, this, obj);
        }
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof n)) {
            return false;
        }
        return Intrinsics.b(this.f81178b, ((n) obj).f81178b);
    }

    public final int hashCode() {
        return this.f81178b.hashCode();
    }
}
