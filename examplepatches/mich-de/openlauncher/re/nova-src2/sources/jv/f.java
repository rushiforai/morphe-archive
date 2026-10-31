package jv;

import com.stripe.android.core.strings.ResolvableString;
import com.stripe.android.lpmfoundations.paymentmethod.PaymentMethodMetadata;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import ou.g2;

/* loaded from: classes4.dex */
public final /* synthetic */ class f implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f70034a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ g2 f70035b;

    public /* synthetic */ f(g2 g2Var, int i5) {
        this.f70034a = i5;
        this.f70035b = g2Var;
    }

    /* JADX WARN: Type inference failed for: r0v4, types: [java.lang.Object, w70.g2] */
    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        bt.g gVarB0;
        switch (this.f70034a) {
            case 0:
                ou.j it = (ou.j) obj;
                Intrinsics.g(it, "it");
                this.f70035b.f(it);
                return Unit.f71706a;
            default:
                String str = (String) obj;
                PaymentMethodMetadata paymentMethodMetadata = (PaymentMethodMetadata) this.f70035b.f80881a.getValue();
                ResolvableString resolvableStringH = null;
                if (paymentMethodMetadata != null) {
                    if (str != null && (gVarB0 = paymentMethodMetadata.b0(str)) != null) {
                        resolvableStringH = gVarB0.f18482c;
                    }
                    if (resolvableStringH == null) {
                        resolvableStringH = zg.a.H(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
                    }
                }
                return resolvableStringH == null ? zg.a.H(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b) : resolvableStringH;
        }
    }
}
