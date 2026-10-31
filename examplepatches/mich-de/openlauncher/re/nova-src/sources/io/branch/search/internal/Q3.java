package io.branch.search.internal;

import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.locks.ReentrantLock;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final class Q3<T> {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final C3190i0 f63209a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final Function1<String, T> f63210b;

    /* renamed from: c, reason: collision with root package name */
    @NotNull
    public final ConcurrentHashMap<String, T> f63211c;

    /* JADX WARN: Multi-variable type inference failed */
    public Q3(@NotNull C3190i0 analyticsSessionDataSource, @NotNull Function1<? super String, ? extends T> create) {
        Intrinsics.g(analyticsSessionDataSource, "analyticsSessionDataSource");
        Intrinsics.g(create, "create");
        this.f63209a = analyticsSessionDataSource;
        this.f63210b = create;
        this.f63211c = new ConcurrentHashMap<>();
    }

    public final T a(@NotNull String callerId) {
        Intrinsics.g(callerId, "callerId");
        ConcurrentHashMap<String, T> concurrentHashMap = this.f63211c;
        T t6 = (T) concurrentHashMap.get(callerId);
        if (t6 != null) {
            return t6;
        }
        T t9 = (T) this.f63210b.invoke(callerId);
        T t10 = (T) concurrentHashMap.putIfAbsent(callerId, t9);
        return t10 == null ? t9 : t10;
    }

    public final T b(@NotNull String sessionId) {
        Intrinsics.g(sessionId, "sessionId");
        C3190i0 c3190i0 = this.f63209a;
        c3190i0.getClass();
        ReentrantLock reentrantLock = c3190i0.f64695b;
        reentrantLock.lock();
        try {
            String str = (String) c3190i0.f64697d.get(sessionId);
            if (str == null) {
                str = "io.branch.search";
            }
            return a(str);
        } finally {
            reentrantLock.unlock();
        }
    }
}
