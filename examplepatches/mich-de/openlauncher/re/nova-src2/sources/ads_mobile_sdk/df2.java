package ads_mobile_sdk;

import c80.d;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class df2 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public hf2 f2493a;

    /* renamed from: b, reason: collision with root package name */
    public nu0 f2494b;

    /* renamed from: c, reason: collision with root package name */
    public d f2495c;

    /* renamed from: d, reason: collision with root package name */
    public /* synthetic */ Object f2496d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ hf2 f2497e;

    /* renamed from: f, reason: collision with root package name */
    public int f2498f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public df2(hf2 hf2Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f2497e = hf2Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f2496d = obj;
        this.f2498f |= Integer.MIN_VALUE;
        hf2.a(this.f2497e, this);
        return CoroutineSingletons.f71806a;
    }
}
