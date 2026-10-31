package io.ktor.utils.io;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class u extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public Object f66653t;

    /* renamed from: u, reason: collision with root package name */
    public j0 f66654u;

    /* renamed from: v, reason: collision with root package name */
    public long f66655v;

    /* renamed from: w, reason: collision with root package name */
    public /* synthetic */ Object f66656w;

    /* renamed from: x, reason: collision with root package name */
    public int f66657x;

    public u(ContinuationImpl continuationImpl) {
        super(continuationImpl);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f66656w = obj;
        this.f66657x |= Integer.MIN_VALUE;
        return f0.a(null, null, this);
    }
}
