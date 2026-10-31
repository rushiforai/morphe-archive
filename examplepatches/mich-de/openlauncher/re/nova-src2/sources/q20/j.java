package q20;

import kotlin.Result;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class j extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public p f83484t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f83485u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ p f83486v;

    /* renamed from: w, reason: collision with root package name */
    public int f83487w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public j(p pVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f83486v = pVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f83485u = obj;
        this.f83487w |= Integer.MIN_VALUE;
        Object objQ = this.f83486v.q(this);
        return objQ == CoroutineSingletons.f71806a ? objQ : new Result(objQ);
    }
}
