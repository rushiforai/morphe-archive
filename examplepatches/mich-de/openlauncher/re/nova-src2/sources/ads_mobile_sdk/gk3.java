package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class gk3 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public pk3 f3983a;

    /* renamed from: b, reason: collision with root package name */
    public /* synthetic */ Object f3984b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ pk3 f3985c;

    /* renamed from: d, reason: collision with root package name */
    public int f3986d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public gk3(pk3 pk3Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f3985c = pk3Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f3984b = obj;
        this.f3986d |= Integer.MIN_VALUE;
        return pk3.b(this.f3985c, (ContinuationImpl) this);
    }
}
