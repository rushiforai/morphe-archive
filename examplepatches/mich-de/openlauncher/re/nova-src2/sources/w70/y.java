package w70;

import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class y extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f94075t;

    /* renamed from: u, reason: collision with root package name */
    public int f94076u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ z f94077v;

    /* renamed from: w, reason: collision with root package name */
    public z f94078w;

    /* renamed from: x, reason: collision with root package name */
    public n f94079x;

    /* renamed from: y, reason: collision with root package name */
    public x70.v f94080y;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public y(z zVar, Continuation continuation) {
        super(continuation);
        this.f94077v = zVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f94075t = obj;
        this.f94076u |= Integer.MIN_VALUE;
        return this.f94077v.collect(null, this);
    }
}
