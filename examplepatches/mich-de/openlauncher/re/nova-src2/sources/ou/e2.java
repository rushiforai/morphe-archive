package ou;

import com.stripe.android.model.PaymentMethod;
import kotlin.Result;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class e2 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public g2 f80852t;

    /* renamed from: u, reason: collision with root package name */
    public PaymentMethod f80853u;

    /* renamed from: v, reason: collision with root package name */
    public Object f80854v;

    /* renamed from: w, reason: collision with root package name */
    public /* synthetic */ Object f80855w;

    /* renamed from: x, reason: collision with root package name */
    public final /* synthetic */ g2 f80856x;

    /* renamed from: y, reason: collision with root package name */
    public int f80857y;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public e2(g2 g2Var, Continuation continuation) {
        super(continuation);
        this.f80856x = g2Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f80855w = obj;
        this.f80857y |= Integer.MIN_VALUE;
        Object objD = this.f80856x.d(null, this);
        return objD == CoroutineSingletons.f71806a ? objD : new Result(objD);
    }
}
