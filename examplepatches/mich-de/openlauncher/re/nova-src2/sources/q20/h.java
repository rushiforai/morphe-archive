package q20;

import kotlin.Result;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class h extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public p f83476t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f83477u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ p f83478v;

    /* renamed from: w, reason: collision with root package name */
    public int f83479w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public h(p pVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f83478v = pVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f83477u = obj;
        this.f83479w |= Integer.MIN_VALUE;
        Object objO = this.f83478v.o(this);
        return objO == CoroutineSingletons.f71806a ? objO : new Result(objO);
    }
}
