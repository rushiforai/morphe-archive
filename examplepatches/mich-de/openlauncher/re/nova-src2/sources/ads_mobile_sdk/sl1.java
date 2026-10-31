package ads_mobile_sdk;

import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class sl1 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public Object f9602a;

    /* renamed from: b, reason: collision with root package name */
    public Object f9603b;

    /* renamed from: c, reason: collision with root package name */
    public th3 f9604c;

    /* renamed from: d, reason: collision with root package name */
    public th3 f9605d;

    /* renamed from: e, reason: collision with root package name */
    public /* synthetic */ Object f9606e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ tl1 f9607f;

    /* renamed from: g, reason: collision with root package name */
    public int f9608g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public sl1(tl1 tl1Var, Continuation continuation) {
        super(continuation);
        this.f9607f = tl1Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f9606e = obj;
        this.f9608g |= Integer.MIN_VALUE;
        return this.f9607f.a(null, null, this);
    }
}
