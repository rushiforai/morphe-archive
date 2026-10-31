package io.branch.search.internal.util;

import io.branch.search.internal.C3296o5;
import io.branch.search.internal.C3309p1;
import io.branch.search.internal.EnumC3131e9;
import java.util.UUID;
import java.util.concurrent.Executors;
import java.util.concurrent.ThreadFactory;
import java.util.concurrent.atomic.AtomicInteger;
import kotlin.ExceptionsKt;
import kotlin.Lazy;
import kotlin.LazyKt;
import kotlin.Metadata;
import kotlin.coroutines.AbstractCoroutineContextElement;
import kotlin.coroutines.CoroutineContext;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Lambda;
import org.jetbrains.annotations.NotNull;
import t70.f0;
import t70.i0;
import t70.j0;
import t70.j1;
import t70.k0;
import t70.k1;
import t70.m0;
import t70.y0;
import x80.d0;
import x80.e0;

@Metadata(d1 = {"\u0000\b\n\u0002\u0018\u0002\n\u0002\b\u0005\"\u0017\u0010\u0001\u001a\u00020\u00008\u0006¢\u0006\f\n\u0004\b\u0001\u0010\u0002\u001a\u0004\b\u0003\u0010\u0004¨\u0006\u0005"}, d2 = {"Lt70/j0;", "BNCScope", "Lt70/j0;", "getBNCScope", "()Lt70/j0;", "BranchSearchSDK_forPartnersRelease"}, k = 2, mv = {1, 7, 1})
/* loaded from: classes.dex */
public final class CorosKt {

    @NotNull
    private static final j0 BNCScope;

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public static final b f66060a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public static final j1 f66061b;

    /* renamed from: c, reason: collision with root package name */
    @NotNull
    public static final Lazy f66062c;

    public static final class a extends Lambda implements Function0<e0> {

        /* renamed from: a, reason: collision with root package name */
        public static final a f66063a = new a();

        public a() {
            super(0);
        }

        @Override // kotlin.jvm.functions.Function0
        public final Object invoke() {
            return new e0(new d0());
        }
    }

    public static final class b extends AbstractCoroutineContextElement implements f0 {
        public b(t70.e0 e0Var) {
            super(e0Var);
        }

        @Override // t70.f0
        public final void handleException(@NotNull CoroutineContext coroutineContext, @NotNull Throwable th2) {
            C3309p1.a(EnumC3131e9.UnhandledCoroutineException, "Exception on context " + coroutineContext + " -> " + ExceptionsKt.b(th2), th2);
            C3296o5.a(UUID.randomUUID().toString(), th2, "BNCScope");
        }
    }

    static {
        b bVar = new b(t70.e0.f88787a);
        f66060a = bVar;
        BNCScope = k0.a(new i0("BNCScope").plus(y0.f88884a).plus(m0.d()).plus(bVar));
        final AtomicInteger atomicInteger = new AtomicInteger();
        f66061b = new k1(Executors.unconfigurableExecutorService(Executors.newScheduledThreadPool(8, new ThreadFactory() { // from class: t70.l2
            @Override // java.util.concurrent.ThreadFactory
            public final Thread newThread(Runnable runnable) {
                Thread thread = new Thread(runnable, "BncSqlite-" + atomicInteger.incrementAndGet());
                thread.setDaemon(true);
                return thread;
            }
        })));
        f66062c = LazyKt.a(a.f66063a);
    }

    @NotNull
    public static final b a() {
        return f66060a;
    }

    @NotNull
    public static final j1 b() {
        return f66061b;
    }

    @NotNull
    public static final j0 getBNCScope() {
        return BNCScope;
    }
}
