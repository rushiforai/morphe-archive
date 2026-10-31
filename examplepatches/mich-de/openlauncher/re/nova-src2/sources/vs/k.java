package vs;

import es.f0;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class k extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public o f92971t;

    /* renamed from: u, reason: collision with root package name */
    public f0 f92972u;

    /* renamed from: v, reason: collision with root package name */
    public boolean f92973v;

    /* renamed from: w, reason: collision with root package name */
    public /* synthetic */ Object f92974w;

    /* renamed from: x, reason: collision with root package name */
    public final /* synthetic */ o f92975x;

    /* renamed from: y, reason: collision with root package name */
    public int f92976y;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public k(o oVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f92975x = oVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f92974w = obj;
        this.f92976y |= Integer.MIN_VALUE;
        return o.f(this.f92975x, this);
    }
}
