package a80;

import kotlin.coroutines.CoroutineContext;
import t70.c0;
import y70.p;

/* loaded from: classes.dex */
public final class l extends c0 {

    /* renamed from: c, reason: collision with root package name */
    public static final l f502c = new l();

    @Override // t70.c0
    public final void c0(CoroutineContext coroutineContext, Runnable runnable) {
        e.f490d.f492c.b(true, false, runnable);
    }

    @Override // t70.c0
    public final void d0(CoroutineContext coroutineContext, Runnable runnable) {
        e.f490d.f492c.b(true, true, runnable);
    }

    @Override // t70.c0
    public final c0 f0(int i5, String str) {
        y70.g.a(i5);
        return i5 >= k.f499d ? str != null ? new p(this, str) : this : super.f0(i5, str);
    }

    @Override // t70.c0
    public final String toString() {
        return "Dispatchers.IO";
    }
}
