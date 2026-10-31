package ads_mobile_sdk;

import c80.d;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class is0 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public Object f4925a;

    /* renamed from: b, reason: collision with root package name */
    public d f4926b;

    /* renamed from: c, reason: collision with root package name */
    public /* synthetic */ Object f4927c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ et0 f4928d;

    /* renamed from: e, reason: collision with root package name */
    public int f4929e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public is0(et0 et0Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f4928d = et0Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f4927c = obj;
        this.f4929e |= Integer.MIN_VALUE;
        return et0.a(this.f4928d, this);
    }
}
