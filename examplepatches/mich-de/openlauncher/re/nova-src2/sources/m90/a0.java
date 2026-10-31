package m90;

import b.u4;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes5.dex */
public final class a0 implements j0 {

    /* renamed from: a, reason: collision with root package name */
    public final i f76088a;

    /* renamed from: b, reason: collision with root package name */
    public final g f76089b;

    /* renamed from: c, reason: collision with root package name */
    public e0 f76090c;

    /* renamed from: d, reason: collision with root package name */
    public int f76091d;

    /* renamed from: e, reason: collision with root package name */
    public boolean f76092e;

    /* renamed from: f, reason: collision with root package name */
    public long f76093f;

    public a0(i iVar) {
        this.f76088a = iVar;
        g gVarI = iVar.i();
        this.f76089b = gVarI;
        e0 e0Var = gVarI.f76125a;
        this.f76090c = e0Var;
        this.f76091d = e0Var != null ? e0Var.f76116b : -1;
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public final void close() {
        this.f76092e = true;
    }

    /* JADX WARN: Code restructure failed: missing block: B:11:0x0020, code lost:
    
        if (r3 == r5.f76116b) goto L15;
     */
    @Override // m90.j0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final long read(g sink, long j11) {
        e0 e0Var;
        Intrinsics.g(sink, "sink");
        if (j11 < 0) {
            throw new IllegalArgumentException(u4.g(j11, "byteCount < 0: ").toString());
        }
        if (this.f76092e) {
            throw new IllegalStateException("closed");
        }
        e0 e0Var2 = this.f76090c;
        g gVar = this.f76089b;
        if (e0Var2 != null) {
            e0 e0Var3 = gVar.f76125a;
            if (e0Var2 == e0Var3) {
                int i5 = this.f76091d;
                Intrinsics.d(e0Var3);
            }
            throw new IllegalStateException("Peek source is invalid because upstream source was used");
        }
        if (j11 == 0) {
            return 0L;
        }
        if (!this.f76088a.j(this.f76093f + 1)) {
            return -1L;
        }
        if (this.f76090c == null && (e0Var = gVar.f76125a) != null) {
            this.f76090c = e0Var;
            this.f76091d = e0Var.f76116b;
        }
        long jMin = Math.min(j11, gVar.f76126b - this.f76093f);
        this.f76089b.e(sink, this.f76093f, jMin);
        this.f76093f += jMin;
        return jMin;
    }

    @Override // m90.j0
    public final l0 timeout() {
        return this.f76088a.timeout();
    }
}
