package io.branch.search.internal;

import io.branch.search.internal.util.CorosKt;
import java.util.Iterator;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.atomic.AtomicReference;
import kotlin.Unit;
import kotlin.jvm.JvmStatic;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Lambda;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public final class H3 {

    @NotNull
    public static final a Companion = new a();

    /* renamed from: a, reason: collision with root package name */
    public final long f62566a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final Function0<Long> f62567b;

    /* renamed from: c, reason: collision with root package name */
    public final boolean f62568c;

    /* renamed from: d, reason: collision with root package name */
    @NotNull
    public final t70.j0 f62569d;

    /* renamed from: e, reason: collision with root package name */
    @NotNull
    public final ConcurrentHashMap f62570e;

    /* renamed from: f, reason: collision with root package name */
    @NotNull
    public final AtomicReference<C3480z3> f62571f;

    public static final class a {

        /* renamed from: io.branch.search.internal.H3$a$a, reason: collision with other inner class name */
        public static final class C0322a extends Lambda implements Function0<Long> {

            /* renamed from: a, reason: collision with root package name */
            public static final C0322a f62572a = new C0322a();

            public C0322a() {
                super(0);
            }

            @Override // kotlin.jvm.functions.Function0
            public final Object invoke() {
                return Long.valueOf(System.currentTimeMillis());
            }
        }

        @JvmStatic
        @NotNull
        public static H3 a(long j11, boolean z11) {
            C0322a getCurrentTime = C0322a.f62572a;
            Intrinsics.g(getCurrentTime, "getCurrentTime");
            return new H3(j11, getCurrentTime, z11, CorosKt.getBNCScope());
        }
    }

    public H3(long j11, @NotNull a.C0322a getCurrentTime, boolean z11, @NotNull t70.j0 coroutineScope) {
        Intrinsics.g(getCurrentTime, "getCurrentTime");
        Intrinsics.g(coroutineScope, "coroutineScope");
        this.f62566a = j11;
        this.f62567b = getCurrentTime;
        this.f62568c = z11;
        this.f62569d = coroutineScope;
        this.f62570e = new ConcurrentHashMap();
        this.f62571f = new AtomicReference<>();
    }

    public final void a() {
        Iterator it = this.f62570e.entrySet().iterator();
        while (it.hasNext()) {
            C3 c32 = (C3) ((Map.Entry) it.next()).getValue();
            if (c32.f62198j.compareAndSet(false, true)) {
                C3309p1.c(EnumC3131e9.Cache, "Clearing cache");
                long jB = 0;
                for (Object key : c32.f62193e.keySet()) {
                    Intrinsics.f(key, "key");
                    jB += c32.b(key);
                }
                C3309p1.a(EnumC3131e9.Cache, new E3(c32, jB));
                c32.f62198j.set(false);
            }
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Nullable
    public final Object a(@NotNull String scope, @NotNull String key) {
        Intrinsics.g(scope, "scope");
        Intrinsics.g(key, "key");
        ConcurrentHashMap concurrentHashMap = this.f62570e;
        Object c32 = concurrentHashMap.get(scope);
        if (c32 == null) {
            c32 = new C3(this.f62566a, this.f62567b, this.f62569d);
            if (this.f62571f.get() == null) {
                Object objPutIfAbsent = concurrentHashMap.putIfAbsent(scope, c32);
                if (objPutIfAbsent != null) {
                    c32 = objPutIfAbsent;
                }
            } else {
                throw null;
            }
        }
        C3 c33 = (C3) c32;
        c33.f62195g.put(key, c33.f62190b.invoke());
        I3 i32 = c33.f62199k;
        Long lValueOf = c33.f62196h.get(key);
        if (lValueOf == null) {
            lValueOf = Long.valueOf(c33.f62189a);
        }
        i32.a(key, lValueOf.longValue());
        Object obj = c33.f62193e.get(key);
        if (this.f62568c) {
            Iterator it = this.f62570e.entrySet().iterator();
            while (it.hasNext()) {
                ((C3) ((Map.Entry) it.next()).getValue()).a();
            }
        }
        return obj;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public final void a(@NotNull String scope, @NotNull String key, @NotNull Object value, @Nullable Long l9) {
        Intrinsics.g(scope, "scope");
        Intrinsics.g(key, "key");
        Intrinsics.g(value, "value");
        ConcurrentHashMap concurrentHashMap = this.f62570e;
        Object c32 = concurrentHashMap.get(scope);
        if (c32 == null) {
            c32 = new C3(this.f62566a, this.f62567b, this.f62569d);
            if (this.f62571f.get() == null) {
                Object objPutIfAbsent = concurrentHashMap.putIfAbsent(scope, c32);
                if (objPutIfAbsent != null) {
                    c32 = objPutIfAbsent;
                }
            } else {
                throw null;
            }
        }
        C3 c33 = (C3) c32;
        C3309p1.c(EnumC3131e9.Cache, "Store new value with keepAlive = " + l9);
        c33.f62195g.put(key, c33.f62190b.invoke());
        c33.f62193e.put(key, value);
        I3 i32 = c33.f62199k;
        long jLongValue = l9.longValue();
        c33.f62196h.put(key, Long.valueOf(jLongValue));
        i32.a(key, jLongValue);
        t70.m0.t(c33.f62191c, null, null, new G3(c33, key, value, null), 3);
        Unit unit = Unit.f71706a;
        if (this.f62568c) {
            Iterator it = this.f62570e.entrySet().iterator();
            while (it.hasNext()) {
                ((C3) ((Map.Entry) it.next()).getValue()).a();
            }
        }
    }
}
