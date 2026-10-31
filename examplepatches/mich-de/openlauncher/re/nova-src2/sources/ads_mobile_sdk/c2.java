package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class c2 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public e2 f1626a;

    /* renamed from: b, reason: collision with root package name */
    public th3 f1627b;

    /* renamed from: c, reason: collision with root package name */
    public th3 f1628c;

    /* renamed from: d, reason: collision with root package name */
    public /* synthetic */ Object f1629d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ e2 f1630e;

    /* renamed from: f, reason: collision with root package name */
    public int f1631f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public c2(e2 e2Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f1630e = e2Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f1629d = obj;
        this.f1631f |= Integer.MIN_VALUE;
        return e2.a(this.f1630e, null, 0, this);
    }
}
