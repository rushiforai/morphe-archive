package ads_mobile_sdk;

import c80.d;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class v61 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public b71 f10609a;

    /* renamed from: b, reason: collision with root package name */
    public pu0 f10610b;

    /* renamed from: c, reason: collision with root package name */
    public ni.g0 f10611c;

    /* renamed from: d, reason: collision with root package name */
    public d f10612d;

    /* renamed from: e, reason: collision with root package name */
    public /* synthetic */ Object f10613e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ b71 f10614f;

    /* renamed from: g, reason: collision with root package name */
    public int f10615g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public v61(b71 b71Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f10614f = b71Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f10613e = obj;
        this.f10615g |= Integer.MIN_VALUE;
        return b71.a(this.f10614f, (pu0) null, (ni.g0) null, this);
    }
}
