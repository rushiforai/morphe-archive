package m1;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class m extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public f1.y f75719t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f75720u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ f1.y f75721v;

    /* renamed from: w, reason: collision with root package name */
    public int f75722w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public m(f1.y yVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f75721v = yVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f75720u = obj;
        this.f75722w |= Integer.MIN_VALUE;
        return this.f75721v.d(null, null, this);
    }
}
