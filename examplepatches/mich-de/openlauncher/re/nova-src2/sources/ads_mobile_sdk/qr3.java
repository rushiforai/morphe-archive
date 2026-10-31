package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class qr3 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public Object f8783a;

    /* renamed from: b, reason: collision with root package name */
    public th3 f8784b;

    /* renamed from: c, reason: collision with root package name */
    public /* synthetic */ Object f8785c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ bs3 f8786d;

    /* renamed from: e, reason: collision with root package name */
    public int f8787e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public qr3(bs3 bs3Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f8786d = bs3Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f8785c = obj;
        this.f8787e |= Integer.MIN_VALUE;
        return bs3.c(this.f8786d, this);
    }
}
