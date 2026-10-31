package io.ktor.utils.io;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class z extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public t f66684t;

    /* renamed from: u, reason: collision with root package name */
    public e80.a f66685u;

    /* renamed from: v, reason: collision with root package name */
    public int f66686v;

    /* renamed from: w, reason: collision with root package name */
    public /* synthetic */ Object f66687w;

    /* renamed from: x, reason: collision with root package name */
    public int f66688x;

    public z(ContinuationImpl continuationImpl) {
        super(continuationImpl);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f66687w = obj;
        this.f66688x |= Integer.MIN_VALUE;
        return f0.f(null, 0, this);
    }
}
