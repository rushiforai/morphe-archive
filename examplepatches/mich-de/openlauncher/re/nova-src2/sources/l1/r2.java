package l1;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class r2 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public t2 f73895t;

    /* renamed from: u, reason: collision with root package name */
    public i0.h f73896u;

    /* renamed from: v, reason: collision with root package name */
    public /* synthetic */ Object f73897v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ t2 f73898w;

    /* renamed from: x, reason: collision with root package name */
    public int f73899x;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public r2(t2 t2Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f73898w = t2Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f73897v = obj;
        this.f73899x |= Integer.MIN_VALUE;
        return this.f73898w.a(null, this);
    }
}
