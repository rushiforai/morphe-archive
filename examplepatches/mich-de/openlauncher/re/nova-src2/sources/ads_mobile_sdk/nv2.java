package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class nv2 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public com.google.gson.r f7696a;

    /* renamed from: b, reason: collision with root package name */
    public com.google.gson.r f7697b;

    /* renamed from: c, reason: collision with root package name */
    public com.google.gson.r f7698c;

    /* renamed from: d, reason: collision with root package name */
    public String f7699d;

    /* renamed from: e, reason: collision with root package name */
    public /* synthetic */ Object f7700e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ qv2 f7701f;

    /* renamed from: g, reason: collision with root package name */
    public int f7702g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public nv2(qv2 qv2Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f7701f = qv2Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f7700e = obj;
        this.f7702g |= Integer.MIN_VALUE;
        return this.f7701f.b(this);
    }
}
