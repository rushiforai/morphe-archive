package gx;

import java.util.Iterator;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class p0 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public q0 f58150t;

    /* renamed from: u, reason: collision with root package name */
    public Iterator f58151u;

    /* renamed from: v, reason: collision with root package name */
    public /* synthetic */ Object f58152v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ q0 f58153w;

    /* renamed from: x, reason: collision with root package name */
    public int f58154x;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public p0(q0 q0Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f58153w = q0Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f58152v = obj;
        this.f58154x |= Integer.MIN_VALUE;
        return q0.d(this.f58153w, this);
    }
}
