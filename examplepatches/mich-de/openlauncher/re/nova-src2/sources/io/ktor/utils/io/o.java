package io.ktor.utils.io;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class o extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f66621t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ q f66622u;

    /* renamed from: v, reason: collision with root package name */
    public int f66623v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public o(q qVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f66622u = qVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f66621t = obj;
        this.f66623v |= Integer.MIN_VALUE;
        return this.f66622u.c(this);
    }
}
