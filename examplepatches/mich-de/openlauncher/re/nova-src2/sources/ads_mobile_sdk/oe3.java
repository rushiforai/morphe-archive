package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class oe3 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public qe3 f7882a;

    /* renamed from: b, reason: collision with root package name */
    public b.kb f7883b;

    /* renamed from: c, reason: collision with root package name */
    public /* synthetic */ Object f7884c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ qe3 f7885d;

    /* renamed from: e, reason: collision with root package name */
    public int f7886e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public oe3(qe3 qe3Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f7885d = qe3Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f7884c = obj;
        this.f7886e |= Integer.MIN_VALUE;
        return this.f7885d.a((b.kb) null, this);
    }
}
