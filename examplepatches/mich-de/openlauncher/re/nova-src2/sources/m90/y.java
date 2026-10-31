package m90;

import java.io.IOException;
import java.io.OutputStream;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class y implements h0 {

    /* renamed from: a, reason: collision with root package name */
    public final OutputStream f76174a;

    /* renamed from: b, reason: collision with root package name */
    public final l0 f76175b;

    public y(OutputStream outputStream, l0 l0Var) {
        this.f76174a = outputStream;
        this.f76175b = l0Var;
    }

    @Override // m90.h0
    public final void Z(g source, long j11) throws IOException {
        Intrinsics.g(source, "source");
        com.google.android.gms.internal.consent_sdk.e0.v(source.f76126b, 0L, j11);
        while (j11 > 0) {
            this.f76175b.f();
            e0 e0Var = source.f76125a;
            Intrinsics.d(e0Var);
            int iMin = (int) Math.min(j11, e0Var.f76117c - e0Var.f76116b);
            this.f76174a.write(e0Var.f76115a, e0Var.f76116b, iMin);
            int i5 = e0Var.f76116b + iMin;
            e0Var.f76116b = i5;
            long j12 = iMin;
            j11 -= j12;
            source.f76126b -= j12;
            if (i5 == e0Var.f76117c) {
                source.f76125a = e0Var.a();
                f0.a(e0Var);
            }
        }
    }

    @Override // m90.h0, java.io.Closeable, java.lang.AutoCloseable
    public final void close() throws IOException {
        this.f76174a.close();
    }

    @Override // m90.h0, java.io.Flushable
    public final void flush() throws IOException {
        this.f76174a.flush();
    }

    @Override // m90.h0
    public final l0 timeout() {
        return this.f76175b;
    }

    public final String toString() {
        return "sink(" + this.f76174a + ')';
    }
}
