package fz;

import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Ref;

/* loaded from: classes.dex */
public final class b0 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public Ref.ObjectRef f56182t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f56183u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ d0 f56184v;

    /* renamed from: w, reason: collision with root package name */
    public int f56185w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public b0(d0 d0Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f56184v = d0Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f56183u = obj;
        this.f56185w |= Integer.MIN_VALUE;
        return this.f56184v.Q(null, this);
    }
}
