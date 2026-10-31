package p10;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class x extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public y f81954t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f81955u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ y f81956v;

    /* renamed from: w, reason: collision with root package name */
    public int f81957w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public x(y yVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f81956v = yVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f81955u = obj;
        this.f81957w |= Integer.MIN_VALUE;
        return this.f81956v.f(this);
    }
}
