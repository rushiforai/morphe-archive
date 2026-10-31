package ads_mobile_sdk;

import c80.d;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class v60 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public x60 f10601a;

    /* renamed from: b, reason: collision with root package name */
    public String f10602b;

    /* renamed from: c, reason: collision with root package name */
    public String f10603c;

    /* renamed from: d, reason: collision with root package name */
    public d f10604d;

    /* renamed from: e, reason: collision with root package name */
    public boolean f10605e;

    /* renamed from: f, reason: collision with root package name */
    public /* synthetic */ Object f10606f;

    /* renamed from: g, reason: collision with root package name */
    public final /* synthetic */ x60 f10607g;

    /* renamed from: h, reason: collision with root package name */
    public int f10608h;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public v60(x60 x60Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f10607g = x60Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f10606f = obj;
        this.f10608h |= Integer.MIN_VALUE;
        return this.f10607g.a((String) null, (String) null, false, (ContinuationImpl) this);
    }
}
