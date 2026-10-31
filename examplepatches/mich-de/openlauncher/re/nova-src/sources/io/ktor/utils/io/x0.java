package io.ktor.utils.io;

import kotlin.coroutines.CoroutineContext;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class x0 implements t70.j0 {

    /* renamed from: a, reason: collision with root package name */
    public final j0 f66678a;

    /* renamed from: b, reason: collision with root package name */
    public final CoroutineContext f66679b;

    public x0(j0 j0Var, CoroutineContext coroutineContext) {
        Intrinsics.g(coroutineContext, "coroutineContext");
        this.f66678a = j0Var;
        this.f66679b = coroutineContext;
    }

    @Override // t70.j0
    public final CoroutineContext getCoroutineContext() {
        return this.f66679b;
    }
}
