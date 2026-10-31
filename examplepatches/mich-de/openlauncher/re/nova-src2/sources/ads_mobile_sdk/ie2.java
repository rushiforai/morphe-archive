package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class ie2 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public Object f4748a;

    /* renamed from: b, reason: collision with root package name */
    public Object f4749b;

    /* renamed from: c, reason: collision with root package name */
    public th3 f4750c;

    /* renamed from: d, reason: collision with root package name */
    public th3 f4751d;

    /* renamed from: e, reason: collision with root package name */
    public /* synthetic */ Object f4752e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ pe2 f4753f;

    /* renamed from: g, reason: collision with root package name */
    public int f4754g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ie2(pe2 pe2Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f4753f = pe2Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f4752e = obj;
        this.f4754g |= Integer.MIN_VALUE;
        return pe2.b(this.f4753f, (ue2) null, this);
    }
}
