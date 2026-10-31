package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class af1 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public of1 f950a;

    /* renamed from: b, reason: collision with root package name */
    public Object f951b;

    /* renamed from: c, reason: collision with root package name */
    public /* synthetic */ Object f952c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ of1 f953d;

    /* renamed from: e, reason: collision with root package name */
    public int f954e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public af1(of1 of1Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f953d = of1Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f952c = obj;
        this.f954e |= Integer.MIN_VALUE;
        return this.f953d.a(this);
    }
}
