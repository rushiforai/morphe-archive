package io.ktor.utils.io;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class s0 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f66645t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ t0 f66646u;

    /* renamed from: v, reason: collision with root package name */
    public int f66647v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public s0(t0 t0Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f66646u = t0Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f66645t = obj;
        this.f66647v |= Integer.MIN_VALUE;
        return this.f66646u.g(0, this);
    }
}
