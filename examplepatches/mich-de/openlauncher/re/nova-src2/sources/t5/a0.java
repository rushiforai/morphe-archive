package t5;

import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Ref;

/* loaded from: classes2.dex */
public final class a0 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public Ref.IntRef f88525t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f88526u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ c0 f88527v;

    /* renamed from: w, reason: collision with root package name */
    public int f88528w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public a0(c0 c0Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f88527v = c0Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f88526u = obj;
        this.f88528w |= Integer.MIN_VALUE;
        return this.f88527v.j(null, false, this);
    }
}
