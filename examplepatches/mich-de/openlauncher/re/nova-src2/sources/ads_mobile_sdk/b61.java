package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class b61 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public c61 f1281a;

    /* renamed from: b, reason: collision with root package name */
    public th3 f1282b;

    /* renamed from: c, reason: collision with root package name */
    public th3 f1283c;

    /* renamed from: d, reason: collision with root package name */
    public /* synthetic */ Object f1284d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ c61 f1285e;

    /* renamed from: f, reason: collision with root package name */
    public int f1286f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public b61(c61 c61Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f1285e = c61Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f1284d = obj;
        this.f1286f |= Integer.MIN_VALUE;
        return this.f1285e.f(this);
    }
}
