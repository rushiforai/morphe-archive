package i2;

import android.graphics.Shader;
import kotlin.ULong;

/* loaded from: classes.dex */
public final class x0 extends p {

    /* renamed from: a, reason: collision with root package name */
    public final long f61189a;

    public x0(long j11) {
        this.f61189a = j11;
    }

    @Override // i2.p
    public final void a(long j11, float f11, l0 l0Var) {
        aa.m0 m0Var = (aa.m0) l0Var;
        m0Var.m(1.0f);
        long jB = this.f61189a;
        if (f11 != 1.0f) {
            jB = s.b(s.c(jB) * f11, jB);
        }
        m0Var.o(jB);
        if (((Shader) m0Var.f620c) != null) {
            m0Var.s(null);
        }
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof x0)) {
            return false;
        }
        long j11 = ((x0) obj).f61189a;
        int i5 = s.n;
        return ULong.a(this.f61189a, j11);
    }

    public final int hashCode() {
        int i5 = s.n;
        ULong.Companion companion = ULong.f71699b;
        return Long.hashCode(this.f61189a);
    }

    public final String toString() {
        return "SolidColor(value=" + ((Object) s.h(this.f61189a)) + ')';
    }
}
