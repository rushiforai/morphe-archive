package lw;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class k extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public l f75143t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f75144u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ l f75145v;

    /* renamed from: w, reason: collision with root package name */
    public int f75146w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public k(l lVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f75145v = lVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f75144u = obj;
        this.f75146w |= Integer.MIN_VALUE;
        return this.f75145v.c(this);
    }
}
