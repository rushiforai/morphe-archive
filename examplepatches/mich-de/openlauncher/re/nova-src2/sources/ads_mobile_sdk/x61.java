package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class x61 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public b71 f11593a;

    /* renamed from: b, reason: collision with root package name */
    public d33 f11594b;

    /* renamed from: c, reason: collision with root package name */
    public c80.a f11595c;

    /* renamed from: d, reason: collision with root package name */
    public /* synthetic */ Object f11596d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ b71 f11597e;

    /* renamed from: f, reason: collision with root package name */
    public int f11598f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public x61(b71 b71Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f11597e = b71Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f11596d = obj;
        this.f11598f |= Integer.MIN_VALUE;
        return b71.a(this.f11597e, (d33) null, this);
    }
}
