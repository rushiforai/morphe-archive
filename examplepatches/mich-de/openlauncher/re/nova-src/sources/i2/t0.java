package i2;

import android.graphics.Paint;
import android.graphics.Shader;
import kotlin.ULong;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public abstract class t0 extends p {

    /* renamed from: a, reason: collision with root package name */
    public gu.j f61167a;

    /* renamed from: b, reason: collision with root package name */
    public long f61168b = 9205357640488583168L;

    @Override // i2.p
    public final void a(long j11, float f11, l0 l0Var) {
        gu.j jVar = this.f61167a;
        if (jVar == null || !h2.e.a(this.f61168b, j11)) {
            if (h2.e.e(j11)) {
                this.f61167a = null;
                this.f61168b = 9205357640488583168L;
                jVar = null;
            } else {
                jVar = this.f61167a;
                if (jVar == null) {
                    jVar = new gu.j((char) 0, 14);
                    this.f61167a = jVar;
                }
                jVar.f57836b = b(j11);
                this.f61167a = jVar;
                this.f61168b = j11;
            }
        }
        aa.m0 m0Var = (aa.m0) l0Var;
        long jD = m0Var.d();
        long j12 = s.f61136b;
        if (!ULong.a(jD, j12)) {
            m0Var.o(j12);
        }
        if (!Intrinsics.b((Shader) m0Var.f620c, jVar != null ? (Shader) jVar.f57836b : null)) {
            m0Var.s(jVar != null ? (Shader) jVar.f57836b : null);
        }
        if (((Paint) m0Var.f619b).getAlpha() / 255.0f == f11) {
            return;
        }
        m0Var.m(f11);
    }

    public abstract Shader b(long j11);
}
