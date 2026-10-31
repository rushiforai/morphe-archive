package ads_mobile_sdk;

import c80.d;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class d70 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public h70 f2194a;

    /* renamed from: b, reason: collision with root package name */
    public a70 f2195b;

    /* renamed from: c, reason: collision with root package name */
    public d f2196c;

    /* renamed from: d, reason: collision with root package name */
    public /* synthetic */ Object f2197d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ h70 f2198e;

    /* renamed from: f, reason: collision with root package name */
    public int f2199f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public d70(h70 h70Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f2198e = h70Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f2197d = obj;
        this.f2199f |= Integer.MIN_VALUE;
        return this.f2198e.a(this);
    }
}
