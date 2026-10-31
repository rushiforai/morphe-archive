package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class z20 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public b30 f12423a;

    /* renamed from: b, reason: collision with root package name */
    public /* synthetic */ Object f12424b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ b30 f12425c;

    /* renamed from: d, reason: collision with root package name */
    public int f12426d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public z20(b30 b30Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f12425c = b30Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f12424b = obj;
        this.f12426d |= Integer.MIN_VALUE;
        return this.f12425c.h(this);
    }
}
