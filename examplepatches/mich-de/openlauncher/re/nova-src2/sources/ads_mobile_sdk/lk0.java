package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class lk0 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public Object f6261a;

    /* renamed from: b, reason: collision with root package name */
    public Object f6262b;

    /* renamed from: c, reason: collision with root package name */
    public /* synthetic */ Object f6263c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ tk0 f6264d;

    /* renamed from: e, reason: collision with root package name */
    public int f6265e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public lk0(tk0 tk0Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f6264d = tk0Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f6263c = obj;
        this.f6265e |= Integer.MIN_VALUE;
        return this.f6264d.b(this);
    }
}
