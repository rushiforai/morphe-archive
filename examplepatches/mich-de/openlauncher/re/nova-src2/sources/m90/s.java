package m90;

import b.u4;
import java.io.EOFException;
import java.io.IOException;
import java.util.zip.DataFormatException;
import java.util.zip.Inflater;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class s implements j0 {

    /* renamed from: a, reason: collision with root package name */
    public final d0 f76161a;

    /* renamed from: b, reason: collision with root package name */
    public final Inflater f76162b;

    /* renamed from: c, reason: collision with root package name */
    public int f76163c;

    /* renamed from: d, reason: collision with root package name */
    public boolean f76164d;

    public s(d0 d0Var, Inflater inflater) {
        this.f76161a = d0Var;
        this.f76162b = inflater;
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public final void close() {
        if (this.f76164d) {
            return;
        }
        this.f76162b.end();
        this.f76164d = true;
        this.f76161a.close();
    }

    @Override // m90.j0
    public final long read(g sink, long j11) throws DataFormatException, IOException {
        long j12;
        Intrinsics.g(sink, "sink");
        while (j11 >= 0) {
            if (this.f76164d) {
                throw new IllegalStateException("closed");
            }
            d0 d0Var = this.f76161a;
            Inflater inflater = this.f76162b;
            if (j11 == 0) {
                j12 = 0;
            } else {
                try {
                    e0 e0VarE0 = sink.e0(1);
                    int iMin = (int) Math.min(j11, 8192 - e0VarE0.f76117c);
                    if (inflater.needsInput() && !d0Var.N()) {
                        e0 e0Var = d0Var.f76105b.f76125a;
                        Intrinsics.d(e0Var);
                        int i5 = e0Var.f76117c;
                        int i11 = e0Var.f76116b;
                        int i12 = i5 - i11;
                        this.f76163c = i12;
                        inflater.setInput(e0Var.f76115a, i11, i12);
                    }
                    int iInflate = inflater.inflate(e0VarE0.f76115a, e0VarE0.f76117c, iMin);
                    int i13 = this.f76163c;
                    if (i13 != 0) {
                        int remaining = i13 - inflater.getRemaining();
                        this.f76163c -= remaining;
                        d0Var.skip(remaining);
                    }
                    if (iInflate > 0) {
                        e0VarE0.f76117c += iInflate;
                        j12 = iInflate;
                        sink.f76126b += j12;
                    } else {
                        if (e0VarE0.f76116b == e0VarE0.f76117c) {
                            sink.f76125a = e0VarE0.a();
                            f0.a(e0VarE0);
                        }
                        j12 = 0;
                    }
                } catch (DataFormatException e3) {
                    throw new IOException(e3);
                }
            }
            if (j12 > 0) {
                return j12;
            }
            if (inflater.finished() || inflater.needsDictionary()) {
                return -1L;
            }
            if (d0Var.N()) {
                throw new EOFException("source exhausted prematurely");
            }
        }
        throw new IllegalArgumentException(u4.g(j11, "byteCount < 0: ").toString());
    }

    @Override // m90.j0
    public final l0 timeout() {
        return this.f76161a.f76104a.timeout();
    }
}
