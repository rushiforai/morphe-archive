package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class dc2 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public fc2 f2433a;

    /* renamed from: b, reason: collision with root package name */
    public /* synthetic */ Object f2434b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ fc2 f2435c;

    /* renamed from: d, reason: collision with root package name */
    public int f2436d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public dc2(fc2 fc2Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f2435c = fc2Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f2434b = obj;
        this.f2436d |= Integer.MIN_VALUE;
        return this.f2435c.a(this);
    }
}
