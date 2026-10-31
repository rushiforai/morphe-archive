package us;

import com.stripe.android.link.LinkConfiguration;
import com.stripe.android.link.LinkLaunchMode;
import com.stripe.android.link.LinkPaymentDetails;
import com.stripe.android.link.LinkPaymentMethod;
import com.stripe.android.link.model.LinkAccount;
import com.stripe.android.model.PaymentMethod;
import com.stripe.android.model.z2;
import com.vungle.ads.internal.protos.Sdk;
import es.f0;
import fs.h0;
import h6.f1;
import is.f;
import is.g;
import kotlin.NoWhenBranchMatchedException;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import ps.p0;
import ps.q0;
import w70.i2;
import w70.u1;

/* loaded from: classes4.dex */
public final class e extends f1 {

    /* renamed from: a, reason: collision with root package name */
    public final LinkConfiguration f91535a;

    /* renamed from: b, reason: collision with root package name */
    public final LinkAccount f91536b;

    /* renamed from: c, reason: collision with root package name */
    public final h0 f91537c;

    /* renamed from: d, reason: collision with root package name */
    public final g f91538d;

    /* renamed from: e, reason: collision with root package name */
    public final xq.c f91539e;

    /* renamed from: f, reason: collision with root package name */
    public final ou.d f91540f;

    /* renamed from: g, reason: collision with root package name */
    public final f0 f91541g;

    /* renamed from: h, reason: collision with root package name */
    public final LinkLaunchMode f91542h;

    /* renamed from: i, reason: collision with root package name */
    public final Function1 f91543i;

    /* renamed from: j, reason: collision with root package name */
    public final i2 f91544j;

    /* renamed from: k, reason: collision with root package name */
    public final i2 f91545k;

    public e(LinkConfiguration configuration, LinkAccount linkAccount, h0 linkAccountManager, g gVar, xq.c logger, ou.d dVar, f0 dismissalCoordinator, LinkLaunchMode linkLaunchMode, Function1 dismissWithResult) {
        Intrinsics.g(configuration, "configuration");
        Intrinsics.g(linkAccountManager, "linkAccountManager");
        Intrinsics.g(logger, "logger");
        Intrinsics.g(dismissalCoordinator, "dismissalCoordinator");
        Intrinsics.g(linkLaunchMode, "linkLaunchMode");
        Intrinsics.g(dismissWithResult, "dismissWithResult");
        this.f91535a = configuration;
        this.f91536b = linkAccount;
        this.f91537c = linkAccountManager;
        this.f91538d = gVar;
        this.f91539e = logger;
        this.f91540f = dVar;
        this.f91541g = dismissalCoordinator;
        this.f91542h = linkLaunchMode;
        this.f91543i = dismissWithResult;
        z2 z2Var = PaymentMethod.Type.f43637g;
        i2 i2VarC = u1.c(new b(dVar.a("card"), dVar.b("card"), q0.f82954c, p0.e(configuration.f42895a, linkLaunchMode), false, null, null));
        this.f91544j = i2VarC;
        this.f91545k = i2VarC;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0016  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object e(e eVar, LinkPaymentDetails linkPaymentDetails, String str, String str2, ContinuationImpl continuationImpl) throws Throwable {
        c cVar;
        Object value;
        eVar.getClass();
        if (continuationImpl instanceof c) {
            cVar = (c) continuationImpl;
            int i5 = cVar.f91527w;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                cVar.f91527w = i5 - Integer.MIN_VALUE;
            } else {
                cVar = new c(eVar, continuationImpl);
            }
        }
        Object objA = cVar.f91525u;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = cVar.f91527w;
        if (i11 == 0) {
            ResultKt.b(objA);
            g gVar = eVar.f91538d;
            LinkPaymentMethod.LinkPaymentDetails linkPaymentDetails2 = new LinkPaymentMethod.LinkPaymentDetails(linkPaymentDetails, str, str2);
            LinkAccount linkAccount = eVar.f91536b;
            cVar.f91524t = eVar;
            cVar.f91527w = 1;
            objA = gVar.a(gVar.f68031d, new f(linkPaymentDetails2, gVar, linkAccount, null), linkPaymentDetails2, cVar);
            if (objA == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            eVar = cVar.f91524t;
            ResultKt.b(objA);
        }
        is.d dVar = (is.d) objA;
        if (!(dVar instanceof is.a)) {
            if (dVar instanceof is.c) {
                i2 i2Var = eVar.f91544j;
                do {
                    value = i2Var.getValue();
                } while (!i2Var.i(value, b.a((b) value, null, false, null, ((is.c) dVar).f68017a, 63)));
            } else {
                if (!(dVar instanceof is.b)) {
                    throw new NoWhenBranchMatchedException();
                }
                eVar.f91543i.invoke(((is.b) dVar).f68016a);
            }
        }
        return Unit.f71706a;
    }

    public static final void f(e eVar, q0 q0Var) {
        i2 i2Var = eVar.f91544j;
        while (true) {
            Object value = i2Var.getValue();
            q0 q0Var2 = q0Var;
            if (i2Var.i(value, b.a((b) value, q0Var2, false, null, null, Sdk.SDKError.Reason.INVALID_RI_ENDPOINT_VALUE))) {
                return;
            } else {
                q0Var = q0Var2;
            }
        }
    }
}
