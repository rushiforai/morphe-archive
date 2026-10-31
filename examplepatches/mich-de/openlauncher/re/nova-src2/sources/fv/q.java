package fv;

import com.stripe.android.model.ElementsSessionParams;
import kotlin.Result;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class q extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public r f56138t;

    /* renamed from: u, reason: collision with root package name */
    public ElementsSessionParams f56139u;

    /* renamed from: v, reason: collision with root package name */
    public /* synthetic */ Object f56140v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ r f56141w;

    /* renamed from: x, reason: collision with root package name */
    public int f56142x;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public q(r rVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f56141w = rVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f56140v = obj;
        this.f56142x |= Integer.MIN_VALUE;
        Object objB = this.f56141w.b(null, null, null, null, null, null, null, this);
        return objB == CoroutineSingletons.f71806a ? objB : new Result(objB);
    }
}
