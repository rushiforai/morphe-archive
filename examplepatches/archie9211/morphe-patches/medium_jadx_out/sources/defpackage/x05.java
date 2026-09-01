package defpackage;

import java.io.InterruptedIOException;
import java.util.concurrent.TimeUnit;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class x05 extends fmd {
    public fmd e;

    public x05(fmd fmdVar) {
        fmdVar.getClass();
        this.e = fmdVar;
    }

    @Override // defpackage.fmd
    public final fmd a() {
        return this.e.a();
    }

    @Override // defpackage.fmd
    public final fmd b() {
        return this.e.b();
    }

    @Override // defpackage.fmd
    public final long c() {
        return this.e.c();
    }

    @Override // defpackage.fmd
    public final fmd d(long j) {
        return this.e.d(j);
    }

    @Override // defpackage.fmd
    public final boolean e() {
        return this.e.e();
    }

    @Override // defpackage.fmd
    public final void f() throws InterruptedIOException {
        this.e.f();
    }

    @Override // defpackage.fmd
    public final fmd g(long j, TimeUnit timeUnit) {
        timeUnit.getClass();
        return this.e.g(j, timeUnit);
    }

    @Override // defpackage.fmd
    public final long h() {
        return this.e.h();
    }
}
