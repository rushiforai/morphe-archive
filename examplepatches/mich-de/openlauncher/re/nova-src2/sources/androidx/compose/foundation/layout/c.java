package androidx.compose.foundation.layout;

import b2.f;
import k0.t;
import k0.v;
import kotlin.jvm.internal.Intrinsics;
import z2.w1;

/* loaded from: classes.dex */
public final class c implements v, t {

    /* renamed from: a, reason: collision with root package name */
    public final y3.c f13969a;

    /* renamed from: b, reason: collision with root package name */
    public final long f13970b;

    public c(w1 w1Var, long j11) {
        this.f13969a = w1Var;
        this.f13970b = j11;
    }

    @Override // k0.t
    public final b2.t a(b2.t tVar, f fVar) {
        return tVar.then(new BoxChildDataElement(fVar, false));
    }

    public final float b() {
        long j11 = this.f13970b;
        if (!y3.a.c(j11)) {
            return Float.POSITIVE_INFINITY;
        }
        return this.f13969a.mo99toDpu2uoSUM(y3.a.g(j11));
    }

    public final float c() {
        long j11 = this.f13970b;
        if (!y3.a.d(j11)) {
            return Float.POSITIVE_INFINITY;
        }
        return this.f13969a.mo99toDpu2uoSUM(y3.a.h(j11));
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof c)) {
            return false;
        }
        c cVar = (c) obj;
        return Intrinsics.b(this.f13969a, cVar.f13969a) && y3.a.b(this.f13970b, cVar.f13970b);
    }

    public final int hashCode() {
        return Long.hashCode(this.f13970b) + (this.f13969a.hashCode() * 31);
    }

    public final String toString() {
        return "BoxWithConstraintsScopeImpl(density=" + this.f13969a + ", constraints=" + ((Object) y3.a.k(this.f13970b)) + ')';
    }
}
