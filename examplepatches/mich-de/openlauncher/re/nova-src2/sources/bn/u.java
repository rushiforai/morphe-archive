package bn;

import b.i8;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class u extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public Object f18286t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f18287u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ i8 f18288v;

    /* renamed from: w, reason: collision with root package name */
    public int f18289w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public u(i8 i8Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f18288v = i8Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f18287u = obj;
        this.f18289w |= Integer.MIN_VALUE;
        return this.f18288v.s(null, this);
    }
}
