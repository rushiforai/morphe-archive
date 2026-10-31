package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class a92 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public c92 f905a;

    /* renamed from: b, reason: collision with root package name */
    public ni.s f906b;

    /* renamed from: c, reason: collision with root package name */
    public /* synthetic */ Object f907c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ c92 f908d;

    /* renamed from: e, reason: collision with root package name */
    public int f909e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public a92(c92 c92Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f908d = c92Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f907c = obj;
        this.f909e |= Integer.MIN_VALUE;
        return c92.a(this.f908d, (ni.s) null, this);
    }
}
