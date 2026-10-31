package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class ev2 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public /* synthetic */ Object f3014a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ iv2 f3015b;

    /* renamed from: c, reason: collision with root package name */
    public int f3016c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ev2(iv2 iv2Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f3015b = iv2Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f3014a = obj;
        this.f3016c |= Integer.MIN_VALUE;
        return this.f3015b.a(null, this);
    }
}
