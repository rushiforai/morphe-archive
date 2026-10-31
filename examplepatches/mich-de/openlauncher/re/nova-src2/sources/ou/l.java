package ou;

import com.stripe.android.lpmfoundations.paymentmethod.PaymentMethodMetadata;
import com.stripe.android.model.PaymentMethodCreateParams;
import com.stripe.android.paymentsheet.model.PaymentSelection;
import java.util.List;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class l implements n {

    /* renamed from: a, reason: collision with root package name */
    public static final l f80924a = new l();

    /* renamed from: b, reason: collision with root package name */
    public static final l f80925b = new l();

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:23:0x0083  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static d a(kv.c viewModel, PaymentMethodMetadata paymentMethodMetadata, int i5) {
        r rVar = new r();
        boolean z11 = (i5 & 8) == 0;
        Intrinsics.g(viewModel, "viewModel");
        Intrinsics.g(paymentMethodMetadata, "paymentMethodMetadata");
        m6.a aVarF = h6.g1.f(viewModel);
        b6.b tapToAddCollectionHandler = viewModel.f72273h;
        jv.e eVar = new jv.e(viewModel, 4);
        jv.e eVar2 = new jv.e(viewModel, 5);
        Intrinsics.g(tapToAddCollectionHandler, "tapToAddCollectionHandler");
        mh.c cVar = paymentMethodMetadata.K ? new mh.c(aVarF, tapToAddCollectionHandler, paymentMethodMetadata, eVar, eVar2) : null;
        m6.a aVarF2 = h6.g1.f(viewModel);
        hq.m mVar = viewModel.f72271f;
        es.n nVar = viewModel.f72270e.f80957a;
        boolean zIsEmpty = ((List) viewModel.f72289z.f80805c.f91586b.invoke()).isEmpty();
        ru.d dVar = viewModel.f72267b;
        boolean z12 = z11;
        h6.u0 u0Var = viewModel.f72269d;
        PaymentMethodCreateParams paymentMethodCreateParams = null;
        nx.l lVar = viewModel.n;
        cw.q qVar = paymentMethodCreateParams;
        if (z12) {
            x xVarH = viewModel.h();
            if ((xVarH != null ? xVarH.b() : null) instanceof PaymentSelection.New.Card) {
                x xVarH2 = viewModel.h();
                PaymentMethodCreateParams paymentMethodCreateParamsE = paymentMethodCreateParams;
                if (xVarH2 != null) {
                    paymentMethodCreateParamsE = xVarH2.e();
                }
                boolean z13 = paymentMethodCreateParamsE != null;
                qVar = new cw.q(z13, paymentMethodMetadata.C, viewModel.f72269d);
            }
        }
        return new d(aVarF2, rVar, mVar, paymentMethodMetadata, new kv.a(viewModel, 1), new jv.e(viewModel, 6), nVar, zIsEmpty, dVar, u0Var, lVar, false, qVar, cVar);
    }
}
