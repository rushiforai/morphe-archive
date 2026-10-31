package xz;

import kotlin.coroutines.jvm.internal.ContinuationImpl;
import x7.n;

/* loaded from: classes4.dex */
public final class a extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public n f96478t;

    /* renamed from: u, reason: collision with root package name */
    public e f96479u;

    /* renamed from: v, reason: collision with root package name */
    public /* synthetic */ Object f96480v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ n f96481w;

    /* renamed from: x, reason: collision with root package name */
    public int f96482x;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public a(n nVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f96481w = nVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f96480v = obj;
        this.f96482x |= Integer.MIN_VALUE;
        return this.f96481w.j(null, null, this);
    }
}
