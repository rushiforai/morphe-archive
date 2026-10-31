package ads_mobile_sdk;

import c80.d;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class f70 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public h70 f3222a;

    /* renamed from: b, reason: collision with root package name */
    public a70 f3223b;

    /* renamed from: c, reason: collision with root package name */
    public d f3224c;

    /* renamed from: d, reason: collision with root package name */
    public /* synthetic */ Object f3225d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ h70 f3226e;

    /* renamed from: f, reason: collision with root package name */
    public int f3227f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public f70(h70 h70Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f3226e = h70Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f3225d = obj;
        this.f3227f |= Integer.MIN_VALUE;
        return h70.a(this.f3226e, null, this);
    }
}
