package m90;

import b.u4;
import java.io.IOException;
import java.io.InputStream;
import kotlin.Unit;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class d implements j0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f76101a = 1;

    /* renamed from: b, reason: collision with root package name */
    public final Object f76102b;

    /* renamed from: c, reason: collision with root package name */
    public final Object f76103c;

    public d(InputStream input, l0 l0Var) {
        Intrinsics.g(input, "input");
        this.f76102b = input;
        this.f76103c = l0Var;
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public final void close() {
        int i5 = this.f76101a;
        Object obj = this.f76102b;
        switch (i5) {
            case 0:
                i0 i0Var = (i0) obj;
                d dVar = (d) this.f76103c;
                i0Var.h();
                try {
                    dVar.close();
                    Unit unit = Unit.f71706a;
                    if (i0Var.i()) {
                        throw i0Var.k(null);
                    }
                    return;
                } catch (IOException e3) {
                    if (!i0Var.i()) {
                        throw e3;
                    }
                    throw i0Var.k(e3);
                } finally {
                    i0Var.i();
                }
            default:
                ((InputStream) obj).close();
                return;
        }
    }

    @Override // m90.j0
    public final long read(g sink, long j11) {
        switch (this.f76101a) {
            case 0:
                Intrinsics.g(sink, "sink");
                i0 i0Var = (i0) this.f76102b;
                d dVar = (d) this.f76103c;
                i0Var.h();
                try {
                    long j12 = dVar.read(sink, j11);
                    if (i0Var.i()) {
                        throw i0Var.k(null);
                    }
                    return j12;
                } catch (IOException e3) {
                    if (i0Var.i()) {
                        throw i0Var.k(e3);
                    }
                    throw e3;
                } finally {
                    i0Var.i();
                }
            default:
                Intrinsics.g(sink, "sink");
                if (j11 == 0) {
                    return 0L;
                }
                if (j11 < 0) {
                    throw new IllegalArgumentException(u4.g(j11, "byteCount < 0: ").toString());
                }
                try {
                    ((l0) this.f76103c).f();
                    e0 e0VarE0 = sink.e0(1);
                    int i5 = ((InputStream) this.f76102b).read(e0VarE0.f76115a, e0VarE0.f76117c, (int) Math.min(j11, 8192 - e0VarE0.f76117c));
                    if (i5 == -1) {
                        if (e0VarE0.f76116b == e0VarE0.f76117c) {
                            sink.f76125a = e0VarE0.a();
                            f0.a(e0VarE0);
                        }
                        return -1L;
                    }
                    e0VarE0.f76117c += i5;
                    long j13 = i5;
                    sink.f76126b += j13;
                    return j13;
                } catch (AssertionError e11) {
                    if (x7.f.K(e11)) {
                        throw new IOException(e11);
                    }
                    throw e11;
                }
        }
    }

    @Override // m90.j0
    public final l0 timeout() {
        switch (this.f76101a) {
            case 0:
                return (i0) this.f76102b;
            default:
                return (l0) this.f76103c;
        }
    }

    public final String toString() {
        switch (this.f76101a) {
            case 0:
                return "AsyncTimeout.source(" + ((d) this.f76103c) + ')';
            default:
                return "source(" + ((InputStream) this.f76102b) + ')';
        }
    }

    public d(i0 i0Var, d dVar) {
        this.f76102b = i0Var;
        this.f76103c = dVar;
    }
}
