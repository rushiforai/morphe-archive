package ads_mobile_sdk;

import c80.d;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class ev1 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public iv1 f3008a;

    /* renamed from: b, reason: collision with root package name */
    public zu1 f3009b;

    /* renamed from: c, reason: collision with root package name */
    public d f3010c;

    /* renamed from: d, reason: collision with root package name */
    public /* synthetic */ Object f3011d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ iv1 f3012e;

    /* renamed from: f, reason: collision with root package name */
    public int f3013f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ev1(iv1 iv1Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f3012e = iv1Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f3011d = obj;
        this.f3013f |= Integer.MIN_VALUE;
        return this.f3012e.e(0L, this);
    }
}
