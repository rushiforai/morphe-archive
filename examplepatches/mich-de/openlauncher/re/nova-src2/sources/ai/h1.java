package ai;

import java.lang.Thread;

/* loaded from: classes3.dex */
public final class h1 implements Thread.UncaughtExceptionHandler {

    /* renamed from: a, reason: collision with root package name */
    public final String f12992a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ k1 f12993b;

    public h1(k1 k1Var, String str) {
        this.f12993b = k1Var;
        this.f12992a = str;
    }

    @Override // java.lang.Thread.UncaughtExceptionHandler
    public final synchronized void uncaughtException(Thread thread, Throwable th2) {
        o0 o0Var = ((m1) this.f12993b.f13368a).f13138f;
        m1.l(o0Var);
        o0Var.f13190f.b(th2, this.f12992a);
    }
}
