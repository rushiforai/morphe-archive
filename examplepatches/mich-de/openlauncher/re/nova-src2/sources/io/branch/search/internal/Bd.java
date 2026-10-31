package io.branch.search.internal;

import java.util.concurrent.locks.ReentrantLock;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final class Bd implements Ad {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final ReentrantLock f62151a;

    public Bd(@NotNull ReentrantLock lock) {
        Intrinsics.g(lock, "lock");
        this.f62151a = lock;
    }

    @Override // io.branch.search.internal.Ad
    public final void a(@NotNull Function0<Unit> block) {
        Intrinsics.g(block, "block");
        ReentrantLock reentrantLock = this.f62151a;
        reentrantLock.lock();
        try {
            block.invoke();
            Unit unit = Unit.f71706a;
        } finally {
            reentrantLock.unlock();
        }
    }
}
