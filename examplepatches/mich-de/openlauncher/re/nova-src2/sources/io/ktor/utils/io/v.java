package io.ktor.utils.io;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class v extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public Object f66660t;

    /* renamed from: u, reason: collision with root package name */
    public j0 f66661u;

    /* renamed from: v, reason: collision with root package name */
    public long f66662v;

    /* renamed from: w, reason: collision with root package name */
    public long f66663w;

    /* renamed from: x, reason: collision with root package name */
    public /* synthetic */ Object f66664x;

    /* renamed from: y, reason: collision with root package name */
    public int f66665y;

    public v(ContinuationImpl continuationImpl) {
        super(continuationImpl);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f66664x = obj;
        this.f66665y |= Integer.MIN_VALUE;
        return f0.b(null, null, 0L, this);
    }
}
