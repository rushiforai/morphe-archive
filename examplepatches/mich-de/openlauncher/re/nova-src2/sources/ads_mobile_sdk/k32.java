package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class k32 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public p32 f5474a;

    /* renamed from: b, reason: collision with root package name */
    public /* synthetic */ Object f5475b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ p32 f5476c;

    /* renamed from: d, reason: collision with root package name */
    public int f5477d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public k32(p32 p32Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f5476c = p32Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f5475b = obj;
        this.f5477d |= Integer.MIN_VALUE;
        return p32.a(this.f5476c, this);
    }
}
