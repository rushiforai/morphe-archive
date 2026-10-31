package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class zb2 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public /* synthetic */ Object f12512a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ ac2 f12513b;

    /* renamed from: c, reason: collision with root package name */
    public int f12514c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public zb2(ac2 ac2Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f12513b = ac2Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f12512a = obj;
        this.f12514c |= Integer.MIN_VALUE;
        return this.f12513b.d(this);
    }
}
