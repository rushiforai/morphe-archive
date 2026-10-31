package io.ktor.utils.io;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class b0 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public t f66555t;

    /* renamed from: u, reason: collision with root package name */
    public e80.j f66556u;

    /* renamed from: v, reason: collision with root package name */
    public long f66557v;

    /* renamed from: w, reason: collision with root package name */
    public /* synthetic */ Object f66558w;

    /* renamed from: x, reason: collision with root package name */
    public int f66559x;

    public b0(ContinuationImpl continuationImpl) {
        super(continuationImpl);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f66558w = obj;
        this.f66559x |= Integer.MIN_VALUE;
        return f0.g(null, 0L, this);
    }
}
