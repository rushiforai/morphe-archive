package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class h1 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public th3 f4176a;

    /* renamed from: b, reason: collision with root package name */
    public th3 f4177b;

    /* renamed from: c, reason: collision with root package name */
    public /* synthetic */ Object f4178c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ j1 f4179d;

    /* renamed from: e, reason: collision with root package name */
    public int f4180e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public h1(j1 j1Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f4179d = j1Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f4178c = obj;
        this.f4180e |= Integer.MIN_VALUE;
        return this.f4179d.a(null, this);
    }
}
