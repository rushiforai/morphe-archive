package fr;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class q extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public r f55682t;

    /* renamed from: u, reason: collision with root package name */
    public g f55683u;

    /* renamed from: v, reason: collision with root package name */
    public r f55684v;

    /* renamed from: w, reason: collision with root package name */
    public /* synthetic */ Object f55685w;

    /* renamed from: x, reason: collision with root package name */
    public final /* synthetic */ r f55686x;

    /* renamed from: y, reason: collision with root package name */
    public int f55687y;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public q(r rVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f55686x = rVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f55685w = obj;
        this.f55687y |= Integer.MIN_VALUE;
        return this.f55686x.c(null, this);
    }
}
