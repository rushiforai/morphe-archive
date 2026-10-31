package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class a11 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public h11 f796a;

    /* renamed from: b, reason: collision with root package name */
    public x80.g0 f797b;

    /* renamed from: c, reason: collision with root package name */
    public String f798c;

    /* renamed from: d, reason: collision with root package name */
    public /* synthetic */ Object f799d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ h11 f800e;

    /* renamed from: f, reason: collision with root package name */
    public int f801f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public a11(h11 h11Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f800e = h11Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f799d = obj;
        this.f801f |= Integer.MIN_VALUE;
        return this.f800e.a(null, this);
    }
}
