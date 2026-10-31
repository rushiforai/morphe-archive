package t5;

import kotlin.coroutines.jvm.internal.ContinuationImpl;
import l1.a2;

/* loaded from: classes2.dex */
public final class i extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public a2 f88603t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f88604u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ a2 f88605v;

    /* renamed from: w, reason: collision with root package name */
    public int f88606w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public i(a2 a2Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f88605v = a2Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f88604u = obj;
        this.f88606w |= Integer.MIN_VALUE;
        return this.f88605v.g(this);
    }
}
