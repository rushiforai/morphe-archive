package io.ktor.utils.io;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class p extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public boolean f66626t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f66627u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ q f66628v;

    /* renamed from: w, reason: collision with root package name */
    public int f66629w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public p(q qVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f66628v = qVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f66627u = obj;
        this.f66629w |= Integer.MIN_VALUE;
        return this.f66628v.d(false, this);
    }
}
