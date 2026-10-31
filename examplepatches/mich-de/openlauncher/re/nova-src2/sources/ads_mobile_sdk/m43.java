package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class m43 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public /* synthetic */ Object f7007a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ q43 f7008b;

    /* renamed from: c, reason: collision with root package name */
    public int f7009c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public m43(q43 q43Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f7008b = q43Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f7007a = obj;
        this.f7009c |= Integer.MIN_VALUE;
        return q43.b(this.f7008b, this);
    }
}
