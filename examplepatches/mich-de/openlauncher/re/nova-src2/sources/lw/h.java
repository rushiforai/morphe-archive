package lw;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class h extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public l f75132t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f75133u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ l f75134v;

    /* renamed from: w, reason: collision with root package name */
    public int f75135w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public h(l lVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f75134v = lVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f75133u = obj;
        this.f75135w |= Integer.MIN_VALUE;
        return this.f75134v.a(this);
    }
}
