package kv;

import com.stripe.android.lpmfoundations.paymentmethod.PaymentMethodMetadata;
import com.stripe.android.model.PaymentMethod;
import com.stripe.android.model.SetupIntent;
import com.stripe.android.model.z2;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import ou.v0;

/* loaded from: classes4.dex */
public final /* synthetic */ class a implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f72261a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ c f72262b;

    public /* synthetic */ a(c cVar, int i5) {
        this.f72261a = i5;
        this.f72262b = cVar;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        int i5 = this.f72261a;
        c cVar = this.f72262b;
        switch (i5) {
            case 0:
                return cVar.g();
            case 1:
                return cVar.h();
            case 2:
                return Boolean.valueOf(cVar.i() != v0.f80991a);
            case 3:
                PaymentMethodMetadata paymentMethodMetadata = (PaymentMethodMetadata) cVar.f72277l.getValue();
                return Boolean.valueOf((paymentMethodMetadata != null ? paymentMethodMetadata.f43092a : null) instanceof SetupIntent);
            default:
                ru.d dVar = cVar.f72267b;
                z2 z2Var = PaymentMethod.Type.f43637g;
                ((ru.a) dVar).n("us_bank_account");
                return Unit.f71706a;
        }
    }
}
