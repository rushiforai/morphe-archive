package io.ktor.utils.io;

import java.util.concurrent.CancellationException;
import kotlin.jvm.functions.Function1;

/* loaded from: classes.dex */
public final class q0 {

    /* renamed from: a, reason: collision with root package name */
    public final Throwable f66640a;

    public q0(Throwable th2) {
        this.f66640a = th2;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public final Throwable a(Function1 function1) {
        Throwable th2 = this.f66640a;
        if (th2 == 0) {
            return null;
        }
        return th2 instanceof t70.y ? ((t70.y) th2).a() : th2 instanceof CancellationException ? ph.a.a(((CancellationException) th2).getMessage(), th2) : (Throwable) function1.invoke(th2);
    }
}
