package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class uj3 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public yj3 f10378a;

    /* renamed from: b, reason: collision with root package name */
    public /* synthetic */ Object f10379b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ yj3 f10380c;

    /* renamed from: d, reason: collision with root package name */
    public int f10381d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public uj3(yj3 yj3Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f10380c = yj3Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f10379b = obj;
        this.f10381d |= Integer.MIN_VALUE;
        return this.f10380c.a(this);
    }
}
