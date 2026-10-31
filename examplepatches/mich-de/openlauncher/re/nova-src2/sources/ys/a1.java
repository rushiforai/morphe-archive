package ys;

import com.stripe.android.model.ConsumerPaymentDetails;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;

/* loaded from: classes4.dex */
public final class a1 extends SuspendLambda implements Function2 {

    /* renamed from: t, reason: collision with root package name */
    public int f97421t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ boolean f97422u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ e1 f97423v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ ConsumerPaymentDetails.PaymentDetails f97424w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public a1(boolean z11, e1 e1Var, ConsumerPaymentDetails.PaymentDetails paymentDetails, Continuation continuation) {
        super(2, continuation);
        this.f97422u = z11;
        this.f97423v = e1Var;
        this.f97424w = paymentDetails;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        return new a1(this.f97422u, this.f97423v, this.f97424w, continuation);
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        return ((a1) create((t70.j0) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
    }

    /* JADX WARN: Code restructure failed: missing block: B:13:0x002a, code lost:
    
        if (ys.e1.e(r4, r1, r5) == r0) goto L17;
     */
    /* JADX WARN: Code restructure failed: missing block: B:16:0x0033, code lost:
    
        if (r4.k(r1, r5) == r0) goto L17;
     */
    /* JADX WARN: Code restructure failed: missing block: B:17:0x0035, code lost:
    
        return r0;
     */
    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object invokeSuspend(Object obj) {
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i5 = this.f97421t;
        if (i5 == 0) {
            ResultKt.b(obj);
            boolean z11 = this.f97422u;
            ConsumerPaymentDetails.PaymentDetails paymentDetails = this.f97424w;
            e1 e1Var = this.f97423v;
            if (z11) {
                this.f97421t = 1;
            } else {
                this.f97421t = 2;
            }
        } else {
            if (i5 != 1 && i5 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
        }
        return Unit.f71706a;
    }
}
