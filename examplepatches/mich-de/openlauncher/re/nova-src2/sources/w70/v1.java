package w70;

import kotlin.coroutines.Continuation;

/* loaded from: classes.dex */
public final class v1 extends x70.c {

    /* renamed from: a, reason: collision with root package name */
    public long f94050a;

    /* renamed from: b, reason: collision with root package name */
    public t70.m f94051b;

    @Override // x70.c
    public final boolean a(x70.a aVar) {
        t1 t1Var = (t1) aVar;
        if (this.f94050a >= 0) {
            return false;
        }
        long j11 = t1Var.f94025i;
        if (j11 < t1Var.f94026j) {
            t1Var.f94026j = j11;
        }
        this.f94050a = j11;
        return true;
    }

    @Override // x70.c
    public final Continuation[] b(x70.a aVar) {
        long j11 = this.f94050a;
        this.f94050a = -1L;
        this.f94051b = null;
        return ((t1) aVar).u(j11);
    }
}
