package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class me2 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public pe2 f7181a;

    /* renamed from: b, reason: collision with root package name */
    public wk0 f7182b;

    /* renamed from: c, reason: collision with root package name */
    public /* synthetic */ Object f7183c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ pe2 f7184d;

    /* renamed from: e, reason: collision with root package name */
    public int f7185e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public me2(pe2 pe2Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f7184d = pe2Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f7183c = obj;
        this.f7185e |= Integer.MIN_VALUE;
        return this.f7184d.a((wk0) null, this);
    }
}
