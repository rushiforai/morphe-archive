package g0;

import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Ref;

/* loaded from: classes2.dex */
public final class c2 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public Ref.LongRef f56485t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f56486u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ h2 f56487v;

    /* renamed from: w, reason: collision with root package name */
    public int f56488w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public c2(h2 h2Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f56487v = h2Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f56486u = obj;
        this.f56488w |= Integer.MIN_VALUE;
        return this.f56487v.a(0L, this);
    }
}
