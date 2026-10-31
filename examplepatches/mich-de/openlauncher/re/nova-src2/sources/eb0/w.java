package eb0;

import java.io.IOException;

/* loaded from: classes5.dex */
public final class w extends x80.p0 {

    /* renamed from: d, reason: collision with root package name */
    public final x80.p0 f52659d;

    /* renamed from: e, reason: collision with root package name */
    public final m90.d0 f52660e;

    /* renamed from: f, reason: collision with root package name */
    public IOException f52661f;

    public w(x80.p0 p0Var) {
        this.f52659d = p0Var;
        this.f52660e = x7.f.r(new v(this, p0Var.source()));
    }

    @Override // x80.p0, java.io.Closeable, java.lang.AutoCloseable
    public final void close() {
        this.f52659d.close();
    }

    @Override // x80.p0
    public final long contentLength() {
        return this.f52659d.contentLength();
    }

    @Override // x80.p0
    public final x80.a0 contentType() {
        return this.f52659d.contentType();
    }

    @Override // x80.p0
    public final m90.i source() {
        return this.f52660e;
    }
}
