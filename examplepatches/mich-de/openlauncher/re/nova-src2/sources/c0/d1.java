package c0;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class d1 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f18744t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ i1 f18745u;

    /* renamed from: v, reason: collision with root package name */
    public int f18746v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public d1(i1 i1Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f18745u = i1Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f18744t = obj;
        this.f18746v |= Integer.MIN_VALUE;
        return i1.k(this.f18745u, this);
    }
}
