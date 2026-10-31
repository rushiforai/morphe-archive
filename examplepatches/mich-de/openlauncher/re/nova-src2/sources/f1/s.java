package f1;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class s extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f53935t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ y f53936u;

    /* renamed from: v, reason: collision with root package name */
    public int f53937v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public s(y yVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f53936u = yVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f53935t = obj;
        this.f53937v |= Integer.MIN_VALUE;
        return this.f53936u.b(null, null, null, this);
    }
}
