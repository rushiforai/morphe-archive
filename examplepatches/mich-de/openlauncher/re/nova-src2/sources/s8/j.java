package s8;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class j extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public k f86753t;

    /* renamed from: u, reason: collision with root package name */
    public i f86754u;

    /* renamed from: v, reason: collision with root package name */
    public /* synthetic */ Object f86755v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ k f86756w;

    /* renamed from: x, reason: collision with root package name */
    public int f86757x;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public j(k kVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f86756w = kVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f86755v = obj;
        this.f86757x |= Integer.MIN_VALUE;
        return this.f86756w.b(null, this);
    }
}
