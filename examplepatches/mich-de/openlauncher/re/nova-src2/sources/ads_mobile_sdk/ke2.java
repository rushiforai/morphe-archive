package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class ke2 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public th3 f5714a;

    /* renamed from: b, reason: collision with root package name */
    public th3 f5715b;

    /* renamed from: c, reason: collision with root package name */
    public /* synthetic */ Object f5716c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ pe2 f5717d;

    /* renamed from: e, reason: collision with root package name */
    public int f5718e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ke2(pe2 pe2Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f5717d = pe2Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f5716c = obj;
        this.f5718e |= Integer.MIN_VALUE;
        return pe2.a(this.f5717d, this);
    }
}
