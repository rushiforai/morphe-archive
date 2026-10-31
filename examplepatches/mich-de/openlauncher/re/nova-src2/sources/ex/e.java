package ex;

import kotlin.Result;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class e extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f53066t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ f f53067u;

    /* renamed from: v, reason: collision with root package name */
    public int f53068v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public e(f fVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f53067u = fVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f53066t = obj;
        this.f53068v |= Integer.MIN_VALUE;
        Object objA = this.f53067u.a(null, null, null, this);
        return objA == CoroutineSingletons.f71806a ? objA : new Result(objA);
    }
}
