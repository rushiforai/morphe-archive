package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class ij1 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public Object f4783a;

    /* renamed from: b, reason: collision with root package name */
    public re1 f4784b;

    /* renamed from: c, reason: collision with root package name */
    public /* synthetic */ Object f4785c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ zj1 f4786d;

    /* renamed from: e, reason: collision with root package name */
    public int f4787e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ij1(zj1 zj1Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f4786d = zj1Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f4785c = obj;
        this.f4787e |= Integer.MIN_VALUE;
        return this.f4786d.a((re1) null, this);
    }
}
