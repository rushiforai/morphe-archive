package ju;

import com.stripe.android.auth.PaymentBrowserAuthContract;
import com.stripe.android.model.StripeIntent;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import t70.j0;

/* loaded from: classes4.dex */
public final class k extends SuspendLambda implements Function2 {
    public final /* synthetic */ String A;
    public final /* synthetic */ boolean B;
    public final /* synthetic */ String C;
    public final /* synthetic */ boolean D;

    /* renamed from: t, reason: collision with root package name */
    public final /* synthetic */ n f69957t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ ww.a f69958u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ StripeIntent f69959v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ int f69960w;

    /* renamed from: x, reason: collision with root package name */
    public final /* synthetic */ String f69961x;

    /* renamed from: y, reason: collision with root package name */
    public final /* synthetic */ String f69962y;

    /* renamed from: z, reason: collision with root package name */
    public final /* synthetic */ String f69963z;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public k(n nVar, ww.a aVar, StripeIntent stripeIntent, int i5, String str, String str2, String str3, String str4, boolean z11, String str5, boolean z12, Continuation continuation) {
        super(2, continuation);
        this.f69957t = nVar;
        this.f69958u = aVar;
        this.f69959v = stripeIntent;
        this.f69960w = i5;
        this.f69961x = str;
        this.f69962y = str2;
        this.f69963z = str3;
        this.A = str4;
        this.B = z11;
        this.C = str5;
        this.D = z12;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        return new k(this.f69957t, this.f69958u, this.f69959v, this.f69960w, this.f69961x, this.f69962y, this.f69963z, this.A, this.B, this.C, this.D, continuation);
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        return ((k) create((j0) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        ResultKt.b(obj);
        n nVar = this.f69957t;
        Function1 function1 = nVar.f69975a;
        ww.a aVar = this.f69958u;
        dq.n nVar2 = (dq.n) function1.invoke(aVar);
        String f43533a = this.f69959v.getF43533a();
        if (f43533a == null) {
            f43533a = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
        nVar2.a(new PaymentBrowserAuthContract.Args(f43533a, this.f69960w, this.f69961x, this.f69962y, this.f69963z, nVar.f69978d, null, this.A, false, this.B, aVar.f94747b, (String) nVar.f69980f.invoke(), nVar.f69981g, this.C, this.D, 64));
        return Unit.f71706a;
    }
}
