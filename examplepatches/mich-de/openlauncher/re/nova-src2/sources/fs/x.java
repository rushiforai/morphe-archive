package fs;

import kotlin.Result;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class x extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public y f55848t;

    /* renamed from: u, reason: collision with root package name */
    public String f55849u;

    /* renamed from: v, reason: collision with root package name */
    public /* synthetic */ Object f55850v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ y f55851w;

    /* renamed from: x, reason: collision with root package name */
    public int f55852x;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public x(y yVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f55851w = yVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f55850v = obj;
        this.f55852x |= Integer.MIN_VALUE;
        Object objX = this.f55851w.x(null, null, this);
        return objX == CoroutineSingletons.f71806a ? objX : new Result(objX);
    }
}
