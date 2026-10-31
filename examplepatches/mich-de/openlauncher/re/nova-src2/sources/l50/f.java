package l50;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class f extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f74737t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ h f74738u;

    /* renamed from: v, reason: collision with root package name */
    public int f74739v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public f(h hVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f74738u = hVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f74737t = obj;
        this.f74739v |= Integer.MIN_VALUE;
        return this.f74738u.a(null, this);
    }
}
