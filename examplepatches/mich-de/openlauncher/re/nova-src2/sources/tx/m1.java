package tx;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class m1 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f89874t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ r f89875u;

    /* renamed from: v, reason: collision with root package name */
    public int f89876v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public m1(r rVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f89875u = rVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f89874t = obj;
        this.f89876v |= Integer.MIN_VALUE;
        return this.f89875u.c(null, this);
    }
}
