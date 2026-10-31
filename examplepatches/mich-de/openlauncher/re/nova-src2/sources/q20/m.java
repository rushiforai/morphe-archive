package q20;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class m extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f83495t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ p f83496u;

    /* renamed from: v, reason: collision with root package name */
    public int f83497v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public m(p pVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f83496u = pVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f83495t = obj;
        this.f83497v |= Integer.MIN_VALUE;
        return this.f83496u.s(this);
    }
}
