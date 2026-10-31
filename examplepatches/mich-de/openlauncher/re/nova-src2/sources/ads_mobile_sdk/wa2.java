package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class wa2 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public Object f11119a;

    /* renamed from: b, reason: collision with root package name */
    public Object f11120b;

    /* renamed from: c, reason: collision with root package name */
    public th3 f11121c;

    /* renamed from: d, reason: collision with root package name */
    public th3 f11122d;

    /* renamed from: e, reason: collision with root package name */
    public /* synthetic */ Object f11123e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ fb2 f11124f;

    /* renamed from: g, reason: collision with root package name */
    public int f11125g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public wa2(fb2 fb2Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f11124f = fb2Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f11123e = obj;
        this.f11125g |= Integer.MIN_VALUE;
        return this.f11124f.a((d33) null, this);
    }
}
