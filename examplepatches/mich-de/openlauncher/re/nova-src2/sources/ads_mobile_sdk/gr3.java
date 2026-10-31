package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class gr3 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public Object f4039a;

    /* renamed from: b, reason: collision with root package name */
    public th3 f4040b;

    /* renamed from: c, reason: collision with root package name */
    public /* synthetic */ Object f4041c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ bs3 f4042d;

    /* renamed from: e, reason: collision with root package name */
    public int f4043e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public gr3(bs3 bs3Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f4042d = bs3Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f4041c = obj;
        this.f4043e |= Integer.MIN_VALUE;
        return bs3.a(this.f4042d, this);
    }
}
