package gv;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class n extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f57902t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ x f57903u;

    /* renamed from: v, reason: collision with root package name */
    public int f57904v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public n(x xVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f57903u = xVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f57902t = obj;
        this.f57904v |= Integer.MIN_VALUE;
        return x.c(this.f57903u, null, this);
    }
}
