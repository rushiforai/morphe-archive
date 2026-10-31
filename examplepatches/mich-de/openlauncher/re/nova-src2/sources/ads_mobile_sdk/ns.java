package ads_mobile_sdk;

import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class ns extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public os f7661a;

    /* renamed from: b, reason: collision with root package name */
    public tx0 f7662b;

    /* renamed from: c, reason: collision with root package name */
    public String f7663c;

    /* renamed from: d, reason: collision with root package name */
    public /* synthetic */ Object f7664d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ os f7665e;

    /* renamed from: f, reason: collision with root package name */
    public int f7666f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ns(os osVar, Continuation continuation) {
        super(continuation);
        this.f7665e = osVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f7664d = obj;
        this.f7666f |= Integer.MIN_VALUE;
        return this.f7665e.a(null, null, this);
    }
}
