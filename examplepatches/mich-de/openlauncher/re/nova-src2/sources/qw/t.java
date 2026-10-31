package qw;

import kotlin.Result;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class t extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public v f84405t;

    /* renamed from: u, reason: collision with root package name */
    public String f84406u;

    /* renamed from: v, reason: collision with root package name */
    public /* synthetic */ Object f84407v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ v f84408w;

    /* renamed from: x, reason: collision with root package name */
    public int f84409x;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public t(v vVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f84408w = vVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f84407v = obj;
        this.f84409x |= Integer.MIN_VALUE;
        Object objD = v.d(this.f84408w, null, this);
        return objD == CoroutineSingletons.f71806a ? objD : new Result(objD);
    }
}
