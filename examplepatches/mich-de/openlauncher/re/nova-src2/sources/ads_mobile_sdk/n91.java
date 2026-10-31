package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class n91 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public s91 f7454a;

    /* renamed from: b, reason: collision with root package name */
    public /* synthetic */ Object f7455b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ s91 f7456c;

    /* renamed from: d, reason: collision with root package name */
    public int f7457d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public n91(s91 s91Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f7456c = s91Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f7455b = obj;
        this.f7457d |= Integer.MIN_VALUE;
        return this.f7456c.b(this);
    }
}
