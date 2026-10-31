package wv;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class g extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public h f94720t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f94721u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ h f94722v;

    /* renamed from: w, reason: collision with root package name */
    public int f94723w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public g(h hVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f94722v = hVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f94721u = obj;
        this.f94723w |= Integer.MIN_VALUE;
        return this.f94722v.a(this);
    }
}
