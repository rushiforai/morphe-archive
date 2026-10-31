package ads_mobile_sdk;

import b.fb;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class ko2 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public wo2 f5902a;

    /* renamed from: b, reason: collision with root package name */
    public fb f5903b;

    /* renamed from: c, reason: collision with root package name */
    public CoroutineContext f5904c;

    /* renamed from: d, reason: collision with root package name */
    public /* synthetic */ Object f5905d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ wo2 f5906e;

    /* renamed from: f, reason: collision with root package name */
    public int f5907f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ko2(wo2 wo2Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f5906e = wo2Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f5905d = obj;
        this.f5907f |= Integer.MIN_VALUE;
        return wo2.a(this.f5906e, null, this);
    }
}
