package b90;

import java.io.IOException;
import java.net.ProtocolException;
import kotlin.jvm.internal.Intrinsics;
import m90.j0;

/* loaded from: classes.dex */
public final class d extends m90.o {

    /* renamed from: b, reason: collision with root package name */
    public final long f17658b;

    /* renamed from: c, reason: collision with root package name */
    public long f17659c;

    /* renamed from: d, reason: collision with root package name */
    public boolean f17660d;

    /* renamed from: e, reason: collision with root package name */
    public boolean f17661e;

    /* renamed from: f, reason: collision with root package name */
    public boolean f17662f;

    /* renamed from: g, reason: collision with root package name */
    public final /* synthetic */ e f17663g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public d(e eVar, j0 delegate, long j11) {
        super(delegate);
        Intrinsics.g(delegate, "delegate");
        this.f17663g = eVar;
        this.f17658b = j11;
        this.f17660d = true;
        if (j11 == 0) {
            a(null);
        }
    }

    public final IOException a(IOException iOException) {
        if (this.f17661e) {
            return iOException;
        }
        this.f17661e = true;
        if (iOException == null && this.f17660d) {
            this.f17660d = false;
        }
        return this.f17663g.a(true, false, iOException);
    }

    @Override // m90.o, java.io.Closeable, java.lang.AutoCloseable
    public final void close() throws IOException {
        if (this.f17662f) {
            return;
        }
        this.f17662f = true;
        try {
            super.close();
            a(null);
        } catch (IOException e3) {
            throw a(e3);
        }
    }

    @Override // m90.o, m90.j0
    public final long read(m90.g sink, long j11) throws IOException {
        Intrinsics.g(sink, "sink");
        if (this.f17662f) {
            throw new IllegalStateException("closed");
        }
        try {
            long j12 = delegate().read(sink, j11);
            if (this.f17660d) {
                this.f17660d = false;
            }
            if (j12 == -1) {
                a(null);
                return -1L;
            }
            long j13 = this.f17659c + j12;
            long j14 = this.f17658b;
            if (j14 == -1 || j13 <= j14) {
                this.f17659c = j13;
                if (j13 == j14) {
                    a(null);
                }
                return j12;
            }
            throw new ProtocolException("expected " + j14 + " bytes but received " + j13);
        } catch (IOException e3) {
            throw a(e3);
        }
    }
}
