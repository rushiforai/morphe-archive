package ads_mobile_sdk;

import c80.d;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class bv1 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public iv1 f1575a;

    /* renamed from: b, reason: collision with root package name */
    public d f1576b;

    /* renamed from: c, reason: collision with root package name */
    public /* synthetic */ Object f1577c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ iv1 f1578d;

    /* renamed from: e, reason: collision with root package name */
    public int f1579e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public bv1(iv1 iv1Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f1578d = iv1Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f1577c = obj;
        this.f1579e |= Integer.MIN_VALUE;
        return this.f1578d.r(this);
    }
}
