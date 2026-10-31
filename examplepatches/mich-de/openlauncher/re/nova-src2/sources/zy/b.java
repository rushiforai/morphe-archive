package zy;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class b extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public c f98818t;

    /* renamed from: u, reason: collision with root package name */
    public String f98819u;

    /* renamed from: v, reason: collision with root package name */
    public /* synthetic */ Object f98820v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ c f98821w;

    /* renamed from: x, reason: collision with root package name */
    public int f98822x;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public b(c cVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f98821w = cVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f98820v = obj;
        this.f98822x |= Integer.MIN_VALUE;
        return this.f98821w.e(null, this);
    }
}
