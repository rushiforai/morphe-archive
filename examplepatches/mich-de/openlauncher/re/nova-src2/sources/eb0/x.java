package eb0;

/* loaded from: classes5.dex */
public final class x extends x80.p0 {

    /* renamed from: d, reason: collision with root package name */
    public final x80.a0 f52665d;

    /* renamed from: e, reason: collision with root package name */
    public final long f52666e;

    public x(x80.a0 a0Var, long j11) {
        this.f52665d = a0Var;
        this.f52666e = j11;
    }

    @Override // x80.p0
    public final long contentLength() {
        return this.f52666e;
    }

    @Override // x80.p0
    public final x80.a0 contentType() {
        return this.f52665d;
    }

    @Override // x80.p0
    public final m90.i source() {
        throw new IllegalStateException("Cannot read raw response body of a converted body.");
    }
}
