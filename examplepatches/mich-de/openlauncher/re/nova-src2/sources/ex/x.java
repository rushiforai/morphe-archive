package ex;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class x extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public Object f53121t;

    /* renamed from: u, reason: collision with root package name */
    public String f53122u;

    /* renamed from: v, reason: collision with root package name */
    public c80.d f53123v;

    /* renamed from: w, reason: collision with root package name */
    public /* synthetic */ Object f53124w;

    /* renamed from: x, reason: collision with root package name */
    public final /* synthetic */ y f53125x;

    /* renamed from: y, reason: collision with root package name */
    public int f53126y;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public x(y yVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f53125x = yVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f53124w = obj;
        this.f53126y |= Integer.MIN_VALUE;
        return this.f53125x.c(null, this);
    }
}
