package gv;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class w extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f57956t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ x f57957u;

    /* renamed from: v, reason: collision with root package name */
    public int f57958v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public w(x xVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f57957u = xVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f57956t = obj;
        this.f57958v |= Integer.MIN_VALUE;
        return x.f(this.f57957u, null, this);
    }
}
