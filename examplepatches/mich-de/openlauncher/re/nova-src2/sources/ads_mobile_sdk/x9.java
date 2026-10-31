package ads_mobile_sdk;

import c80.d;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class x9 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public z9 f11640a;

    /* renamed from: b, reason: collision with root package name */
    public qo3 f11641b;

    /* renamed from: c, reason: collision with root package name */
    public d f11642c;

    /* renamed from: d, reason: collision with root package name */
    public /* synthetic */ Object f11643d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ z9 f11644e;

    /* renamed from: f, reason: collision with root package name */
    public int f11645f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public x9(z9 z9Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f11644e = z9Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f11643d = obj;
        this.f11645f |= Integer.MIN_VALUE;
        return z9.a(this.f11644e, null, this);
    }
}
