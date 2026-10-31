package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class q20 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public w20 f8439a;

    /* renamed from: b, reason: collision with root package name */
    public Object f8440b;

    /* renamed from: c, reason: collision with root package name */
    public String f8441c;

    /* renamed from: d, reason: collision with root package name */
    public /* synthetic */ Object f8442d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ w20 f8443e;

    /* renamed from: f, reason: collision with root package name */
    public int f8444f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public q20(w20 w20Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f8443e = w20Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f8442d = obj;
        this.f8444f |= Integer.MIN_VALUE;
        return this.f8443e.a(null, this);
    }
}
