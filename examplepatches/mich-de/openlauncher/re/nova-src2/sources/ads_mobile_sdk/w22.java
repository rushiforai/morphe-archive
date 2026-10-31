package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class w22 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public y22 f11013a;

    /* renamed from: b, reason: collision with root package name */
    public Object f11014b;

    /* renamed from: c, reason: collision with root package name */
    public Object f11015c;

    /* renamed from: d, reason: collision with root package name */
    public th3 f11016d;

    /* renamed from: e, reason: collision with root package name */
    public th3 f11017e;

    /* renamed from: f, reason: collision with root package name */
    public long f11018f;

    /* renamed from: g, reason: collision with root package name */
    public /* synthetic */ Object f11019g;

    /* renamed from: h, reason: collision with root package name */
    public final /* synthetic */ y22 f11020h;

    /* renamed from: i, reason: collision with root package name */
    public int f11021i;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public w22(y22 y22Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f11020h = y22Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f11019g = obj;
        this.f11021i |= Integer.MIN_VALUE;
        return this.f11020h.a(null, null, this);
    }
}
