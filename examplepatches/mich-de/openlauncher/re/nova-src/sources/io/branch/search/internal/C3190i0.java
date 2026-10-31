package io.branch.search.internal;

import java.util.LinkedHashMap;
import java.util.NoSuchElementException;
import java.util.concurrent.locks.ReentrantLock;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* renamed from: io.branch.search.internal.i0, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3190i0 {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final Function0<String> f64694a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final ReentrantLock f64695b;

    /* renamed from: c, reason: collision with root package name */
    @NotNull
    public final LinkedHashMap f64696c;

    /* renamed from: d, reason: collision with root package name */
    @NotNull
    public final LinkedHashMap f64697d;

    public C3190i0(@NotNull O2 sessionIdGenerator) {
        Intrinsics.g(sessionIdGenerator, "sessionIdGenerator");
        this.f64694a = sessionIdGenerator;
        this.f64695b = new ReentrantLock();
        this.f64696c = new LinkedHashMap();
        this.f64697d = new LinkedHashMap();
    }

    @NotNull
    public final Fd a(@NotNull String callerId) {
        Intrinsics.g(callerId, "callerId");
        ReentrantLock reentrantLock = this.f64695b;
        reentrantLock.lock();
        try {
            String str = (String) this.f64694a.invoke();
            Fd fd2 = new Fd(callerId, 0, str);
            this.f64696c.put(callerId, fd2);
            this.f64697d.put(str, callerId);
            return fd2;
        } finally {
            reentrantLock.unlock();
        }
    }

    @NotNull
    public final String b(@NotNull String callerId) {
        String str;
        Intrinsics.g(callerId, "callerId");
        ReentrantLock reentrantLock = this.f64695b;
        reentrantLock.lock();
        try {
            Fd fd2 = (Fd) this.f64696c.get(callerId);
            if (fd2 == null || (str = fd2.f62474b) == null) {
                str = a(callerId).f62474b;
            }
            reentrantLock.unlock();
            return str;
        } catch (Throwable th2) {
            reentrantLock.unlock();
            throw th2;
        }
    }

    @NotNull
    public final Fd c(@NotNull String sessionId) {
        Intrinsics.g(sessionId, "sessionId");
        ReentrantLock reentrantLock = this.f64695b;
        reentrantLock.lock();
        try {
            for (Object obj : this.f64696c.values()) {
                if (Intrinsics.b(((Fd) obj).f62474b, sessionId)) {
                    return (Fd) obj;
                }
            }
            throw new NoSuchElementException("Collection contains no element matching the predicate.");
        } finally {
            reentrantLock.unlock();
        }
    }
}
