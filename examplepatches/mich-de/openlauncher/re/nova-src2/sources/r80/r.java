package r80;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes5.dex */
public final class r extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public s f85703t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f85704u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ s f85705v;

    /* renamed from: w, reason: collision with root package name */
    public int f85706w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public r(s sVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f85705v = sVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f85704u = obj;
        this.f85706w |= Integer.MIN_VALUE;
        return this.f85705v.c(null, this);
    }
}
