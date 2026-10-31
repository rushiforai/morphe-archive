package r10;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class j0 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public String f85151t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f85152u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ k0 f85153v;

    /* renamed from: w, reason: collision with root package name */
    public int f85154w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public j0(k0 k0Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f85153v = k0Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f85152u = obj;
        this.f85154w |= Integer.MIN_VALUE;
        return this.f85153v.a(null, this);
    }
}
