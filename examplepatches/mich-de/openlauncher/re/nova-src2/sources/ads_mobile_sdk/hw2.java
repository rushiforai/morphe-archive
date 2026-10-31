package ads_mobile_sdk;

import c80.d;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class hw2 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public iw2 f4569a;

    /* renamed from: b, reason: collision with root package name */
    public com.google.gson.r f4570b;

    /* renamed from: c, reason: collision with root package name */
    public String f4571c;

    /* renamed from: d, reason: collision with root package name */
    public d f4572d;

    /* renamed from: e, reason: collision with root package name */
    public /* synthetic */ Object f4573e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ iw2 f4574f;

    /* renamed from: g, reason: collision with root package name */
    public int f4575g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public hw2(iw2 iw2Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f4574f = iw2Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f4573e = obj;
        this.f4575g |= Integer.MIN_VALUE;
        return iw2.a(this.f4574f, null, null, null, this);
    }
}
