package ads_mobile_sdk;

import b.a7;
import c80.d;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class y92 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public ca2 f11974a;

    /* renamed from: b, reason: collision with root package name */
    public a7 f11975b;

    /* renamed from: c, reason: collision with root package name */
    public ea2 f11976c;

    /* renamed from: d, reason: collision with root package name */
    public yo2 f11977d;

    /* renamed from: e, reason: collision with root package name */
    public d f11978e;

    /* renamed from: f, reason: collision with root package name */
    public /* synthetic */ Object f11979f;

    /* renamed from: g, reason: collision with root package name */
    public final /* synthetic */ ca2 f11980g;

    /* renamed from: h, reason: collision with root package name */
    public int f11981h;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public y92(ca2 ca2Var, Continuation continuation) {
        super(continuation);
        this.f11980g = ca2Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f11979f = obj;
        this.f11981h |= Integer.MIN_VALUE;
        return this.f11980g.a((a7) null, (ea2) null, this);
    }
}
