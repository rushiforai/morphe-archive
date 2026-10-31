package ads_mobile_sdk;

import c80.d;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class cj2 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public fl2 f1904a;

    /* renamed from: b, reason: collision with root package name */
    public Object f1905b;

    /* renamed from: c, reason: collision with root package name */
    public d f1906c;

    /* renamed from: d, reason: collision with root package name */
    public long f1907d;

    /* renamed from: e, reason: collision with root package name */
    public /* synthetic */ Object f1908e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ fl2 f1909f;

    /* renamed from: g, reason: collision with root package name */
    public int f1910g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public cj2(fl2 fl2Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f1909f = fl2Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f1908e = obj;
        this.f1910g |= Integer.MIN_VALUE;
        return fl2.a(this.f1909f, 0L, this);
    }
}
