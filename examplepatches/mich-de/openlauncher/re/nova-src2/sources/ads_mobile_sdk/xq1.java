package ads_mobile_sdk;

import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class xq1 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public zq1 f11795a;

    /* renamed from: b, reason: collision with root package name */
    public tx0 f11796b;

    /* renamed from: c, reason: collision with root package name */
    public /* synthetic */ Object f11797c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ zq1 f11798d;

    /* renamed from: e, reason: collision with root package name */
    public int f11799e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public xq1(zq1 zq1Var, Continuation continuation) {
        super(continuation);
        this.f11798d = zq1Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f11797c = obj;
        this.f11799e |= Integer.MIN_VALUE;
        return this.f11798d.a(null, null, this);
    }
}
