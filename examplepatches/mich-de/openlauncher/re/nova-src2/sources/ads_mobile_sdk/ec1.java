package ads_mobile_sdk;

import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import w70.n;

/* loaded from: classes.dex */
public final class ec1 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public /* synthetic */ Object f2839a;

    /* renamed from: b, reason: collision with root package name */
    public int f2840b;

    /* renamed from: c, reason: collision with root package name */
    public n f2841c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ as.p f2842d;

    /* renamed from: e, reason: collision with root package name */
    public pu0 f2843e;

    /* renamed from: f, reason: collision with root package name */
    public ni.g0 f2844f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ec1(as.p pVar, Continuation continuation) {
        super(continuation);
        this.f2842d = pVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f2839a = obj;
        this.f2840b |= Integer.MIN_VALUE;
        return this.f2842d.emit(null, this);
    }
}
