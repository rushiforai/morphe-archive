package q20;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class k extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f83488t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ p f83489u;

    /* renamed from: v, reason: collision with root package name */
    public int f83490v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public k(p pVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f83489u = pVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f83488t = obj;
        this.f83490v |= Integer.MIN_VALUE;
        return this.f83489u.r(this);
    }
}
