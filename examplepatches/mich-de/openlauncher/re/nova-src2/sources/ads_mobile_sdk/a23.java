package ads_mobile_sdk;

import c80.d;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class a23 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public e23 f815a;

    /* renamed from: b, reason: collision with root package name */
    public d f816b;

    /* renamed from: c, reason: collision with root package name */
    public /* synthetic */ Object f817c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ e23 f818d;

    /* renamed from: e, reason: collision with root package name */
    public int f819e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public a23(e23 e23Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f818d = e23Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f817c = obj;
        this.f819e |= Integer.MIN_VALUE;
        return e23.a(this.f818d, this);
    }
}
