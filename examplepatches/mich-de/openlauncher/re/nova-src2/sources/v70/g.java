package v70;

import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class g extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f92153t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ i f92154u;

    /* renamed from: v, reason: collision with root package name */
    public int f92155v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public g(i iVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f92154u = iVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f92153t = obj;
        this.f92155v |= Integer.MIN_VALUE;
        Object objF = i.F(this.f92154u, this);
        return objF == CoroutineSingletons.f71806a ? objF : new r(objF);
    }
}
