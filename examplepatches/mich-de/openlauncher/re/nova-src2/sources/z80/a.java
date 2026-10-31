package z80;

import com.google.android.gms.internal.measurement.le;
import java.io.IOException;
import java.util.concurrent.TimeUnit;
import kotlin.jvm.internal.Intrinsics;
import m90.c0;
import m90.g;
import m90.i;
import m90.j0;
import m90.l0;

/* loaded from: classes5.dex */
public final class a implements j0 {

    /* renamed from: a, reason: collision with root package name */
    public boolean f98303a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ i f98304b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ le f98305c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ c0 f98306d;

    public a(i iVar, le leVar, c0 c0Var) {
        this.f98304b = iVar;
        this.f98305c = leVar;
        this.f98306d = c0Var;
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public final void close() throws IOException {
        boolean zS;
        if (!this.f98303a) {
            TimeUnit timeUnit = TimeUnit.MILLISECONDS;
            byte[] bArr = y80.c.f96853a;
            Intrinsics.g(timeUnit, "timeUnit");
            try {
                zS = y80.c.s(this, 100);
            } catch (IOException unused) {
                zS = false;
            }
            if (!zS) {
                this.f98303a = true;
                this.f98305c.a();
            }
        }
        this.f98304b.close();
    }

    @Override // m90.j0
    public final long read(g sink, long j11) throws IOException {
        Intrinsics.g(sink, "sink");
        try {
            long j12 = this.f98304b.read(sink, j11);
            c0 c0Var = this.f98306d;
            if (j12 != -1) {
                sink.e(c0Var.f76099b, sink.f76126b - j12, j12);
                c0Var.b();
                return j12;
            }
            if (!this.f98303a) {
                this.f98303a = true;
                c0Var.close();
            }
            return -1L;
        } catch (IOException e3) {
            if (this.f98303a) {
                throw e3;
            }
            this.f98303a = true;
            this.f98305c.a();
            throw e3;
        }
    }

    @Override // m90.j0
    public final l0 timeout() {
        return this.f98304b.timeout();
    }
}
