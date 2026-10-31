package ads_mobile_sdk;

import c80.d;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class c03 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public i03 f1615a;

    /* renamed from: b, reason: collision with root package name */
    public d f1616b;

    /* renamed from: c, reason: collision with root package name */
    public /* synthetic */ Object f1617c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ i03 f1618d;

    /* renamed from: e, reason: collision with root package name */
    public int f1619e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public c03(i03 i03Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f1618d = i03Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f1617c = obj;
        this.f1619e |= Integer.MIN_VALUE;
        return this.f1618d.a(null, null, null, this);
    }
}
