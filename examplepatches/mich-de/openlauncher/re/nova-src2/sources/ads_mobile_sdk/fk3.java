package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class fk3 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public pk3 f3385a;

    /* renamed from: b, reason: collision with root package name */
    public /* synthetic */ Object f3386b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ pk3 f3387c;

    /* renamed from: d, reason: collision with root package name */
    public int f3388d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public fk3(pk3 pk3Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f3387c = pk3Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f3386b = obj;
        this.f3388d |= Integer.MIN_VALUE;
        return pk3.a(this.f3387c, (ContinuationImpl) this);
    }
}
