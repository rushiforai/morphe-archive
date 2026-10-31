package h6;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class h extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f59367t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ i f59368u;

    /* renamed from: v, reason: collision with root package name */
    public int f59369v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public h(i iVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f59368u = iVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f59367t = obj;
        this.f59369v |= Integer.MIN_VALUE;
        return this.f59368u.l(this);
    }
}
