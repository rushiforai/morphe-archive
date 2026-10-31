package m1;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class o extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public f1.y f75732t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f75733u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ f1.y f75734v;

    /* renamed from: w, reason: collision with root package name */
    public int f75735w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public o(f1.y yVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f75734v = yVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f75733u = obj;
        this.f75735w |= Integer.MIN_VALUE;
        return this.f75734v.c(null, null, null, this);
    }
}
