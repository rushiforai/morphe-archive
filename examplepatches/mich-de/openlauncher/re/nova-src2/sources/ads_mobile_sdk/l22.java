package ads_mobile_sdk;

import c80.d;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class l22 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public q22 f6039a;

    /* renamed from: b, reason: collision with root package name */
    public Object f6040b;

    /* renamed from: c, reason: collision with root package name */
    public Object f6041c;

    /* renamed from: d, reason: collision with root package name */
    public d f6042d;

    /* renamed from: e, reason: collision with root package name */
    public long f6043e;

    /* renamed from: f, reason: collision with root package name */
    public boolean f6044f;

    /* renamed from: g, reason: collision with root package name */
    public /* synthetic */ Object f6045g;

    /* renamed from: h, reason: collision with root package name */
    public final /* synthetic */ q22 f6046h;

    /* renamed from: i, reason: collision with root package name */
    public int f6047i;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public l22(q22 q22Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f6046h = q22Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f6045g = obj;
        this.f6047i |= Integer.MIN_VALUE;
        return this.f6046h.a(0L, null, null, false, this);
    }
}
