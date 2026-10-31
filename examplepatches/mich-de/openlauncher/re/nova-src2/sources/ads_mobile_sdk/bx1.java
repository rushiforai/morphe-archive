package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class bx1 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public jx1 f1599a;

    /* renamed from: b, reason: collision with root package name */
    public com.google.gson.r f1600b;

    /* renamed from: c, reason: collision with root package name */
    public /* synthetic */ Object f1601c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ jx1 f1602d;

    /* renamed from: e, reason: collision with root package name */
    public int f1603e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public bx1(jx1 jx1Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f1602d = jx1Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f1601c = obj;
        this.f1603e |= Integer.MIN_VALUE;
        return this.f1602d.a((com.google.gson.r) null, (String) null, this);
    }
}
