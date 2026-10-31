package fs;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class f extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f55763t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ y f55764u;

    /* renamed from: v, reason: collision with root package name */
    public int f55765v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public f(y yVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f55764u = yVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f55763t = obj;
        this.f55765v |= Integer.MIN_VALUE;
        return this.f55764u.f(null, false, this);
    }
}
