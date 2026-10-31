package dv;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class s extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public w f49640t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f49641u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ w f49642v;

    /* renamed from: w, reason: collision with root package name */
    public int f49643w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public s(w wVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f49642v = wVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f49641u = obj;
        this.f49643w |= Integer.MIN_VALUE;
        return w.e(this.f49642v, this);
    }
}
