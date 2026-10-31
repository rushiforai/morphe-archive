package is;

import com.stripe.android.link.LinkAccountUpdate;
import com.stripe.android.link.LinkActivityResult;
import com.stripe.android.link.LinkLaunchMode;
import com.stripe.android.link.LinkPaymentMethod;
import com.stripe.android.model.ConsumerShippingAddress;
import es.f0;
import fs.h0;
import fs.j0;
import kotlin.NoWhenBranchMatchedException;
import kotlin.ResultKt;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class g {

    /* renamed from: a, reason: collision with root package name */
    public final j f68028a;

    /* renamed from: b, reason: collision with root package name */
    public final h0 f68029b;

    /* renamed from: c, reason: collision with root package name */
    public final f0 f68030c;

    /* renamed from: d, reason: collision with root package name */
    public final LinkLaunchMode f68031d;

    public g(j jVar, h0 linkAccountManager, f0 dismissalCoordinator, LinkLaunchMode linkLaunchMode) {
        Intrinsics.g(linkAccountManager, "linkAccountManager");
        Intrinsics.g(dismissalCoordinator, "dismissalCoordinator");
        Intrinsics.g(linkLaunchMode, "linkLaunchMode");
        this.f68028a = jVar;
        this.f68029b = linkAccountManager;
        this.f68030c = dismissalCoordinator;
        this.f68031d = linkLaunchMode;
    }

    /* JADX WARN: Code restructure failed: missing block: B:29:0x0069, code lost:
    
        if (r13 == r1) goto L45;
     */
    /* JADX WARN: Removed duplicated region for block: B:50:0x00c2  */
    /* JADX WARN: Removed duplicated region for block: B:52:0x00c5  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(LinkLaunchMode linkLaunchMode, f fVar, LinkPaymentMethod linkPaymentMethod, ContinuationImpl continuationImpl) throws Throwable {
        e eVar;
        f0 f0Var;
        boolean z11;
        Throwable th2;
        LinkAccountUpdate linkAccountUpdateA;
        o oVar;
        if (continuationImpl instanceof e) {
            eVar = (e) continuationImpl;
            int i5 = eVar.f68023y;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                eVar.f68023y = i5 - Integer.MIN_VALUE;
            } else {
                eVar = new e(this, continuationImpl);
            }
        }
        Object objInvoke = eVar.f68021w;
        Object obj = CoroutineSingletons.f71806a;
        int i11 = eVar.f68023y;
        if (i11 != 0) {
            if (i11 != 1) {
                if (i11 != 2) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                linkPaymentMethod = eVar.f68019u;
                linkAccountUpdateA = (LinkAccountUpdate) eVar.f68018t;
                ResultKt.b(objInvoke);
                return new b(new LinkActivityResult.Completed(linkAccountUpdateA, linkPaymentMethod, (ConsumerShippingAddress) objInvoke, null, 8));
            }
            z11 = eVar.f68020v;
            f0Var = (f0) eVar.f68018t;
            try {
                ResultKt.b(objInvoke);
                oVar = (o) objInvoke;
                f0Var.f52946a = z11;
                if (!Intrinsics.b(oVar, l.f68048a)) {
                    return a.f68015a;
                }
                if (oVar instanceof m) {
                    return new c(((m) oVar).f68049a);
                }
                if (Intrinsics.b(oVar, n.f68050a)) {
                    return new b(new LinkActivityResult.Completed(new LinkAccountUpdate.Value(null, com.stripe.android.link.d.f42970b), null, null, null, 12));
                }
                throw new NoWhenBranchMatchedException();
            } catch (Throwable th3) {
                th2 = th3;
                f0Var.f52946a = z11;
                throw th2;
            }
        }
        ResultKt.b(objInvoke);
        if ((linkLaunchMode instanceof LinkLaunchMode.Full) || (linkLaunchMode instanceof LinkLaunchMode.Confirmation)) {
            f0 f0Var2 = this.f68030c;
            boolean z12 = f0Var2.f52946a;
            f0Var2.f52946a = false;
            try {
                eVar.f68018t = f0Var2;
                eVar.f68020v = z12;
                eVar.f68023y = 1;
                objInvoke = fVar.invoke(eVar);
                if (objInvoke != obj) {
                    f0Var = f0Var2;
                    z11 = z12;
                    oVar = (o) objInvoke;
                    f0Var.f52946a = z11;
                    if (!Intrinsics.b(oVar, l.f68048a)) {
                    }
                }
            } catch (Throwable th4) {
                f0Var = f0Var2;
                z11 = z12;
                th2 = th4;
                f0Var.f52946a = z11;
                throw th2;
            }
        } else {
            boolean z13 = linkLaunchMode instanceof LinkLaunchMode.PaymentMethodSelection;
            h0 h0Var = this.f68029b;
            if (!z13) {
                if ((linkLaunchMode instanceof LinkLaunchMode.Authentication) || (linkLaunchMode instanceof LinkLaunchMode.Authorization)) {
                    return new b(new LinkActivityResult.Completed(j0.a(h0Var), null, null, null, 8));
                }
                throw new NoWhenBranchMatchedException();
            }
            linkAccountUpdateA = j0.a(h0Var);
            eVar.f68018t = linkAccountUpdateA;
            eVar.f68019u = linkPaymentMethod;
            eVar.f68023y = 2;
            objInvoke = j0.b(h0Var, eVar);
        }
        return obj;
    }
}
