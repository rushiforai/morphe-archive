package d90;

import kotlin.jvm.internal.Intrinsics;
import m90.h;
import m90.h0;
import m90.l0;
import m90.p;

/* loaded from: classes5.dex */
public final class b implements h0 {

    /* renamed from: a, reason: collision with root package name */
    public final p f49077a;

    /* renamed from: b, reason: collision with root package name */
    public boolean f49078b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ g f49079c;

    public b(g gVar) {
        this.f49079c = gVar;
        this.f49077a = new p(gVar.f49094d.timeout());
    }

    @Override // m90.h0
    public final void Z(m90.g source, long j11) {
        h hVar = this.f49079c.f49094d;
        Intrinsics.g(source, "source");
        if (this.f49078b) {
            throw new IllegalStateException("closed");
        }
        if (j11 == 0) {
            return;
        }
        hVar.T(j11);
        hVar.u("\r\n");
        hVar.Z(source, j11);
        hVar.u("\r\n");
    }

    @Override // m90.h0, java.io.Closeable, java.lang.AutoCloseable
    public final synchronized void close() {
        if (this.f49078b) {
            return;
        }
        this.f49078b = true;
        this.f49079c.f49094d.u("0\r\n\r\n");
        p pVar = this.f49077a;
        l0 l0Var = pVar.f76150e;
        pVar.f76150e = l0.f76140d;
        l0Var.a();
        l0Var.b();
        this.f49079c.f49095e = 3;
    }

    @Override // m90.h0, java.io.Flushable
    public final synchronized void flush() {
        if (this.f49078b) {
            return;
        }
        this.f49079c.f49094d.flush();
    }

    @Override // m90.h0
    public final l0 timeout() {
        return this.f49077a;
    }
}
