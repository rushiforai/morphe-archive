package q10;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class h extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f83445t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ i f83446u;

    /* renamed from: v, reason: collision with root package name */
    public int f83447v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public h(i iVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f83446u = iVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f83445t = obj;
        this.f83447v |= Integer.MIN_VALUE;
        return this.f83446u.i(null, this);
    }
}
