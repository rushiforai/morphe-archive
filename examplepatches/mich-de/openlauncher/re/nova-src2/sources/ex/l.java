package ex;

import kotlin.Result;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class l extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public Object f53085t;

    /* renamed from: u, reason: collision with root package name */
    public dx.f f53086u;

    /* renamed from: v, reason: collision with root package name */
    public /* synthetic */ Object f53087v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ m f53088w;

    /* renamed from: x, reason: collision with root package name */
    public int f53089x;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public l(m mVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f53088w = mVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f53087v = obj;
        this.f53089x |= Integer.MIN_VALUE;
        Object objA = this.f53088w.a(null, null, null, this);
        return objA == CoroutineSingletons.f71806a ? objA : new Result(objA);
    }
}
