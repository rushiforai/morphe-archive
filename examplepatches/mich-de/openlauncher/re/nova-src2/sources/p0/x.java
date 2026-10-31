package p0;

import e0.f1;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.SuspendLambda;

/* loaded from: classes2.dex */
public final class x extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public y f81221t;

    /* renamed from: u, reason: collision with root package name */
    public f1 f81222u;

    /* renamed from: v, reason: collision with root package name */
    public SuspendLambda f81223v;

    /* renamed from: w, reason: collision with root package name */
    public /* synthetic */ Object f81224w;

    /* renamed from: x, reason: collision with root package name */
    public final /* synthetic */ y f81225x;

    /* renamed from: y, reason: collision with root package name */
    public int f81226y;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public x(y yVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f81225x = yVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f81224w = obj;
        this.f81226y |= Integer.MIN_VALUE;
        return y.t(this.f81225x, null, null, this);
    }
}
