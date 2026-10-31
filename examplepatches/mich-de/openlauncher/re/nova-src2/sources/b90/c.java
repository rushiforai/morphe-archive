package b90;

import b.c0;
import java.io.IOException;
import java.net.ProtocolException;
import kotlin.jvm.internal.Intrinsics;
import m90.h0;

/* loaded from: classes5.dex */
public final class c extends m90.n {

    /* renamed from: b, reason: collision with root package name */
    public final long f17653b;

    /* renamed from: c, reason: collision with root package name */
    public boolean f17654c;

    /* renamed from: d, reason: collision with root package name */
    public long f17655d;

    /* renamed from: e, reason: collision with root package name */
    public boolean f17656e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ e f17657f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public c(e eVar, h0 delegate, long j11) {
        super(delegate);
        Intrinsics.g(delegate, "delegate");
        this.f17657f = eVar;
        this.f17653b = j11;
    }

    @Override // m90.n, m90.h0
    public final void Z(m90.g source, long j11) throws IOException {
        Intrinsics.g(source, "source");
        if (this.f17656e) {
            throw new IllegalStateException("closed");
        }
        long j12 = this.f17653b;
        if (j12 != -1 && this.f17655d + j11 > j12) {
            StringBuilder sbU = c0.u(j12, "expected ", " bytes but received ");
            sbU.append(this.f17655d + j11);
            throw new ProtocolException(sbU.toString());
        }
        try {
            super.Z(source, j11);
            this.f17655d += j11;
        } catch (IOException e3) {
            throw a(e3);
        }
    }

    public final IOException a(IOException iOException) {
        if (this.f17654c) {
            return iOException;
        }
        this.f17654c = true;
        return this.f17657f.a(false, true, iOException);
    }

    @Override // m90.n, m90.h0, java.io.Closeable, java.lang.AutoCloseable
    public final void close() throws IOException {
        if (this.f17656e) {
            return;
        }
        this.f17656e = true;
        long j11 = this.f17653b;
        if (j11 != -1 && this.f17655d != j11) {
            throw new ProtocolException("unexpected end of stream");
        }
        try {
            super.close();
            a(null);
        } catch (IOException e3) {
            throw a(e3);
        }
    }

    @Override // m90.n, m90.h0, java.io.Flushable
    public final void flush() throws IOException {
        try {
            super.flush();
        } catch (IOException e3) {
            throw a(e3);
        }
    }
}
