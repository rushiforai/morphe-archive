package io.ktor.utils.io;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class e0 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f66575t;

    /* renamed from: u, reason: collision with root package name */
    public int f66576u;

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f66575t = obj;
        this.f66576u |= Integer.MIN_VALUE;
        return f0.l(null, this);
    }
}
