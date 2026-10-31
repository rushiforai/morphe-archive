package o0;

import e0.f1;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.SuspendLambda;

/* loaded from: classes2.dex */
public final class x extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public f1 f78827t;

    /* renamed from: u, reason: collision with root package name */
    public SuspendLambda f78828u;

    /* renamed from: v, reason: collision with root package name */
    public /* synthetic */ Object f78829v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ z f78830w;

    /* renamed from: x, reason: collision with root package name */
    public int f78831x;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public x(z zVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f78830w = zVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f78829v = obj;
        this.f78831x |= Integer.MIN_VALUE;
        return this.f78830w.d(null, null, this);
    }
}
