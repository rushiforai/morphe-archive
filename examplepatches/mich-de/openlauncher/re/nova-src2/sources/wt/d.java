package wt;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class d extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f94671t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ f f94672u;

    /* renamed from: v, reason: collision with root package name */
    public int f94673v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public d(f fVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f94672u = fVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f94671t = obj;
        this.f94673v |= Integer.MIN_VALUE;
        return this.f94672u.i(null, this);
    }
}
