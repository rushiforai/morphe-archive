package ww;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class u extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f94846t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ v f94847u;

    /* renamed from: v, reason: collision with root package name */
    public int f94848v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public u(v vVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f94847u = vVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f94846t = obj;
        this.f94848v |= Integer.MIN_VALUE;
        return v.e(this.f94847u, this);
    }
}
