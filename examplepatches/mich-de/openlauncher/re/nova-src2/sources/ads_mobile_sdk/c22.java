package ads_mobile_sdk;

import c80.d;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class c22 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public q22 f1635a;

    /* renamed from: b, reason: collision with root package name */
    public d f1636b;

    /* renamed from: c, reason: collision with root package name */
    public /* synthetic */ Object f1637c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ q22 f1638d;

    /* renamed from: e, reason: collision with root package name */
    public int f1639e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public c22(q22 q22Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f1638d = q22Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f1637c = obj;
        this.f1639e |= Integer.MIN_VALUE;
        return this.f1638d.a(this);
    }
}
