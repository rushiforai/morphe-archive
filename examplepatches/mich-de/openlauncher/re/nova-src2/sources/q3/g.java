package q3;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class g extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public n f83556t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f83557u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ h f83558v;

    /* renamed from: w, reason: collision with root package name */
    public int f83559w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public g(h hVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f83558v = hVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f83557u = obj;
        this.f83559w |= Integer.MIN_VALUE;
        return this.f83558v.c(null, this);
    }
}
