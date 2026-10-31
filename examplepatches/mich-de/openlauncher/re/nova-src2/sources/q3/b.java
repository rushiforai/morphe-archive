package q3;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class b extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public j0 f83524t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f83525u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ jx.v f83526v;

    /* renamed from: w, reason: collision with root package name */
    public int f83527w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public b(jx.v vVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f83526v = vVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f83525u = obj;
        this.f83527w |= Integer.MIN_VALUE;
        return this.f83526v.a(null, this);
    }
}
