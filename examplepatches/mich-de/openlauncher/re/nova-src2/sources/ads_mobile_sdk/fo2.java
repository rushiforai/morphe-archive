package ads_mobile_sdk;

import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import w70.n;

/* loaded from: classes.dex */
public final class fo2 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public /* synthetic */ Object f3444a;

    /* renamed from: b, reason: collision with root package name */
    public int f3445b;

    /* renamed from: c, reason: collision with root package name */
    public n f3446c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ go2 f3447d;

    /* renamed from: e, reason: collision with root package name */
    public Object f3448e;

    /* renamed from: f, reason: collision with root package name */
    public b.a1 f3449f;

    /* renamed from: g, reason: collision with root package name */
    public ni.g0 f3450g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public fo2(go2 go2Var, Continuation continuation) {
        super(continuation);
        this.f3447d = go2Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f3444a = obj;
        this.f3445b |= Integer.MIN_VALUE;
        return this.f3447d.emit(null, this);
    }
}
