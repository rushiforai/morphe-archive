package e90;

import java.io.InterruptedIOException;
import kotlin.Unit;
import kotlin.jvm.internal.Intrinsics;
import m90.h0;
import m90.l0;

/* loaded from: classes.dex */
public final class v implements h0 {

    /* renamed from: a, reason: collision with root package name */
    public final boolean f52387a;

    /* renamed from: b, reason: collision with root package name */
    public final m90.g f52388b = new m90.g();

    /* renamed from: c, reason: collision with root package name */
    public boolean f52389c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ y f52390d;

    public v(y yVar, boolean z11) {
        this.f52390d = yVar;
        this.f52387a = z11;
    }

    @Override // m90.h0
    public final void Z(m90.g source, long j11) {
        Intrinsics.g(source, "source");
        byte[] bArr = y80.c.f96853a;
        m90.g gVar = this.f52388b;
        gVar.Z(source, j11);
        while (gVar.f76126b >= 16384) {
            a(false);
        }
    }

    /* JADX WARN: Finally extract failed */
    public final void a(boolean z11) {
        long jMin;
        boolean z12;
        y yVar = this.f52390d;
        synchronized (yVar) {
            try {
                yVar.f52409l.h();
                while (yVar.f52402e >= yVar.f52403f && !this.f52387a && !this.f52389c) {
                    try {
                        synchronized (yVar) {
                            int i5 = yVar.f52410m;
                            if (i5 != 0) {
                                break;
                            }
                            try {
                                yVar.wait();
                            } catch (InterruptedException unused) {
                                Thread.currentThread().interrupt();
                                throw new InterruptedIOException();
                            }
                        }
                    } catch (Throwable th2) {
                        yVar.f52409l.k();
                        throw th2;
                    }
                }
                yVar.f52409l.k();
                yVar.b();
                jMin = Math.min(yVar.f52403f - yVar.f52402e, this.f52388b.f76126b);
                yVar.f52402e += jMin;
                z12 = z11 && jMin == this.f52388b.f76126b;
                Unit unit = Unit.f71706a;
            } catch (Throwable th3) {
                throw th3;
            }
        }
        this.f52390d.f52409l.h();
        try {
            y yVar2 = this.f52390d;
            yVar2.f52399b.f(yVar2.f52398a, z12, this.f52388b, jMin);
        } finally {
            this.f52390d.f52409l.k();
        }
    }

    @Override // m90.h0, java.io.Closeable, java.lang.AutoCloseable
    public final void close() {
        boolean z11;
        y yVar = this.f52390d;
        byte[] bArr = y80.c.f96853a;
        synchronized (yVar) {
            if (this.f52389c) {
                return;
            }
            synchronized (yVar) {
                z11 = yVar.f52410m == 0;
                Unit unit = Unit.f71706a;
            }
            y yVar2 = this.f52390d;
            if (!yVar2.f52407j.f52387a) {
                if (this.f52388b.f76126b > 0) {
                    while (this.f52388b.f76126b > 0) {
                        a(true);
                    }
                } else if (z11) {
                    yVar2.f52399b.f(yVar2.f52398a, true, null, 0L);
                }
            }
            synchronized (this.f52390d) {
                this.f52389c = true;
                Unit unit2 = Unit.f71706a;
            }
            this.f52390d.f52399b.flush();
            this.f52390d.a();
        }
    }

    @Override // m90.h0, java.io.Flushable
    public final void flush() {
        y yVar = this.f52390d;
        byte[] bArr = y80.c.f96853a;
        synchronized (yVar) {
            yVar.b();
            Unit unit = Unit.f71706a;
        }
        while (this.f52388b.f76126b > 0) {
            a(false);
            this.f52390d.f52399b.flush();
        }
    }

    @Override // m90.h0
    public final l0 timeout() {
        return this.f52390d.f52409l;
    }
}
