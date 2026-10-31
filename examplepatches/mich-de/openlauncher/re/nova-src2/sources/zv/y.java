package zv;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class y extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public og.i f98764t;

    /* renamed from: u, reason: collision with root package name */
    public String f98765u;

    /* renamed from: v, reason: collision with root package name */
    public /* synthetic */ Object f98766v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ og.i f98767w;

    /* renamed from: x, reason: collision with root package name */
    public int f98768x;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public y(og.i iVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f98767w = iVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f98766v = obj;
        this.f98768x |= Integer.MIN_VALUE;
        return this.f98767w.j(null, this);
    }
}
