package io.sentry;

/* loaded from: classes4.dex */
public final class w0 implements l0 {

    /* renamed from: a, reason: collision with root package name */
    public final Runtime f67894a = Runtime.getRuntime();

    @Override // io.sentry.l0
    public final void a() {
    }

    @Override // io.sentry.l0
    public final void b(a2 a2Var) {
        long jCurrentTimeMillis = System.currentTimeMillis();
        Runtime runtime = this.f67894a;
        a2Var.f66739a = new n1(jCurrentTimeMillis, runtime.totalMemory() - runtime.freeMemory(), -1L);
    }
}
