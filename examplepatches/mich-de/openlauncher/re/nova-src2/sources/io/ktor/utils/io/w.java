package io.ktor.utils.io;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class w extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public t f66668t;

    /* renamed from: u, reason: collision with root package name */
    public long f66669u;

    /* renamed from: v, reason: collision with root package name */
    public long f66670v;

    /* renamed from: w, reason: collision with root package name */
    public /* synthetic */ Object f66671w;

    /* renamed from: x, reason: collision with root package name */
    public int f66672x;

    public w(ContinuationImpl continuationImpl) {
        super(continuationImpl);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f66671w = obj;
        this.f66672x |= Integer.MIN_VALUE;
        return f0.c(null, 0L, this);
    }
}
