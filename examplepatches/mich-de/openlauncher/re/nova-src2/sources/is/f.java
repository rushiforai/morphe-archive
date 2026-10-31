package is;

import com.instabridge.mobilesdk.internal.ui.screens.t;
import com.stripe.android.link.LinkPaymentDetails;
import com.stripe.android.link.LinkPaymentMethod;
import com.stripe.android.link.model.LinkAccount;
import com.stripe.android.model.ConsumerPaymentDetails;
import kotlin.NoWhenBranchMatchedException;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function1;

/* loaded from: classes4.dex */
public final class f extends SuspendLambda implements Function1 {

    /* renamed from: t, reason: collision with root package name */
    public int f68024t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ LinkPaymentMethod f68025u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ g f68026v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ LinkAccount f68027w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public f(LinkPaymentMethod linkPaymentMethod, g gVar, LinkAccount linkAccount, Continuation continuation) {
        super(1, continuation);
        this.f68025u = linkPaymentMethod;
        this.f68026v = gVar;
        this.f68027w = linkAccount;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Continuation continuation) {
        return new f(this.f68025u, this.f68026v, this.f68027w, continuation);
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        return ((f) create((Continuation) obj)).invokeSuspend(Unit.f71706a);
    }

    /* JADX WARN: Code restructure failed: missing block: B:13:0x0040, code lost:
    
        if (r9 == r0) goto L21;
     */
    /* JADX WARN: Code restructure failed: missing block: B:20:0x0062, code lost:
    
        if (r9 == r0) goto L21;
     */
    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object invokeSuspend(Object obj) {
        j jVar = this.f68026v.f68028a;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i5 = this.f68024t;
        if (i5 != 0) {
            if (i5 == 1) {
                ResultKt.b(obj);
                return (o) obj;
            }
            if (i5 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            return (o) obj;
        }
        ResultKt.b(obj);
        LinkPaymentMethod linkPaymentMethod = this.f68025u;
        if (linkPaymentMethod instanceof LinkPaymentMethod.ConsumerPaymentDetails) {
            LinkPaymentMethod.ConsumerPaymentDetails consumerPaymentDetails = (LinkPaymentMethod.ConsumerPaymentDetails) linkPaymentMethod;
            ConsumerPaymentDetails.PaymentDetails paymentDetails = consumerPaymentDetails.f42942b;
            String str = consumerPaymentDetails.f42943c;
            String str2 = consumerPaymentDetails.f42944d;
            this.f68024t = 1;
            obj = jVar.a(new t(jVar, paymentDetails, this.f68027w, str, str2, 9), this);
        } else {
            if (!(linkPaymentMethod instanceof LinkPaymentMethod.LinkPaymentDetails)) {
                throw new NoWhenBranchMatchedException();
            }
            LinkPaymentMethod.LinkPaymentDetails linkPaymentDetails = (LinkPaymentMethod.LinkPaymentDetails) linkPaymentMethod;
            LinkPaymentDetails linkPaymentDetails2 = linkPaymentDetails.f42945b;
            String str3 = linkPaymentDetails.f42946c;
            String str4 = linkPaymentDetails.f42947d;
            this.f68024t = 2;
            obj = jVar.a(new t(jVar, linkPaymentDetails2, this.f68027w, str3, str4, 8), this);
        }
        return coroutineSingletons;
    }
}
