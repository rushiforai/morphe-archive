package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class be2 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public pe2 f1385a;

    /* renamed from: b, reason: collision with root package name */
    public c80.a f1386b;

    /* renamed from: c, reason: collision with root package name */
    public /* synthetic */ Object f1387c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ pe2 f1388d;

    /* renamed from: e, reason: collision with root package name */
    public int f1389e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public be2(pe2 pe2Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f1388d = pe2Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f1387c = obj;
        this.f1389e |= Integer.MIN_VALUE;
        return this.f1388d.b(this);
    }
}
