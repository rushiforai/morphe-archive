package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class bc3 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public cc3 f1370a;

    /* renamed from: b, reason: collision with root package name */
    public /* synthetic */ Object f1371b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ cc3 f1372c;

    /* renamed from: d, reason: collision with root package name */
    public int f1373d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public bc3(cc3 cc3Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f1372c = cc3Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f1371b = obj;
        this.f1373d |= Integer.MIN_VALUE;
        return cc3.a(this.f1372c, this);
    }
}
