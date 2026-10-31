package a80;

import java.util.concurrent.Executor;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.EmptyCoroutineContext;
import t70.c0;
import t70.j1;
import y70.v;

/* loaded from: classes.dex */
public final class d extends j1 implements Executor {

    /* renamed from: c, reason: collision with root package name */
    public static final d f488c = new d();

    /* renamed from: d, reason: collision with root package name */
    public static final c0 f489d;

    static {
        l lVar = l.f502c;
        int i5 = v.f96828a;
        if (64 >= i5) {
            i5 = 64;
        }
        f489d = lVar.f0(y70.g.h(i5, 12, "kotlinx.coroutines.io.parallelism"), null);
    }

    @Override // t70.c0
    public final void c0(CoroutineContext coroutineContext, Runnable runnable) {
        f489d.c0(coroutineContext, runnable);
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public final void close() {
        throw new IllegalStateException("Cannot be invoked on Dispatchers.IO");
    }

    @Override // t70.c0
    public final void d0(CoroutineContext coroutineContext, Runnable runnable) {
        f489d.d0(coroutineContext, runnable);
    }

    @Override // java.util.concurrent.Executor
    public final void execute(Runnable runnable) {
        c0(EmptyCoroutineContext.f71803a, runnable);
    }

    @Override // t70.c0
    public final c0 f0(int i5, String str) {
        return l.f502c.f0(1, str);
    }

    @Override // t70.c0
    public final String toString() {
        return "Dispatchers.IO";
    }
}
