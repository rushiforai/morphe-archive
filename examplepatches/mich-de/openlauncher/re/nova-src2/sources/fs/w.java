package fs;

import kotlin.Result;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class w extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public y f55844t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f55845u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ y f55846v;

    /* renamed from: w, reason: collision with root package name */
    public int f55847w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public w(y yVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f55846v = yVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f55845u = obj;
        this.f55847w |= Integer.MIN_VALUE;
        Object objW = this.f55846v.w(false, this);
        return objW == CoroutineSingletons.f71806a ? objW : new Result(objW);
    }
}
