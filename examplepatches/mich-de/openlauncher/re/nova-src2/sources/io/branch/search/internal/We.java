package io.branch.search.internal;

import io.branch.search.internal.Xe;
import java.util.concurrent.atomic.AtomicReference;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final class We {

    @NotNull
    public static final a Companion = new a();

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final AtomicReference<C3095c7> f63603a;

    public static final class a {
    }

    public We(@NotNull Ne queue, @NotNull C3095c7 configProvided, @NotNull Xe.a managerActions) {
        Intrinsics.g(queue, "queue");
        Intrinsics.g(configProvided, "configProvided");
        Intrinsics.g(managerActions, "managerActions");
        AtomicReference<C3095c7> atomicReference = new AtomicReference<>();
        this.f63603a = atomicReference;
        C3095c7 c3095c7 = (C3095c7) queue.a();
        if (c3095c7 != null && c3095c7.c() > configProvided.c()) {
            configProvided = c3095c7;
        }
        C3095c7 c3095c7A = managerActions.a();
        if (c3095c7A == null || c3095c7A.b() != configProvided.b()) {
            managerActions.a(configProvided);
        } else {
            configProvided = c3095c7A;
        }
        atomicReference.set(configProvided);
        C3095c7 c3095c72 = atomicReference.get();
        Intrinsics.f(c3095c72, "currentStatus.get()");
        managerActions.b(c3095c72);
        queue.a(new Ve(this, managerActions));
    }
}
