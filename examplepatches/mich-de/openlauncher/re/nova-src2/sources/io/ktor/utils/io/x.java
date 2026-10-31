package io.ktor.utils.io;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class x extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public t f66674t;

    /* renamed from: u, reason: collision with root package name */
    public int f66675u;

    /* renamed from: v, reason: collision with root package name */
    public /* synthetic */ Object f66676v;

    /* renamed from: w, reason: collision with root package name */
    public int f66677w;

    public x(ContinuationImpl continuationImpl) {
        super(continuationImpl);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f66676v = obj;
        this.f66677w |= Integer.MIN_VALUE;
        return f0.d(null, 0, this);
    }
}
