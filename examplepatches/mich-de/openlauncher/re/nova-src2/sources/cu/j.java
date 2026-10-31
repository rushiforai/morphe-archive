package cu;

import com.stripe.android.lpmfoundations.paymentmethod.PaymentMethodMetadata;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class j {

    /* renamed from: a, reason: collision with root package name */
    public final ou.c f47944a;

    /* renamed from: b, reason: collision with root package name */
    public final PaymentMethodMetadata f47945b;

    /* renamed from: c, reason: collision with root package name */
    public final i f47946c;

    /* renamed from: d, reason: collision with root package name */
    public final h f47947d;

    public j(ou.c customerStateHolder, PaymentMethodMetadata paymentMethodMetadata, i updateScreenInteractorFactory, h manageInteractorFactory) {
        Intrinsics.g(customerStateHolder, "customerStateHolder");
        Intrinsics.g(paymentMethodMetadata, "paymentMethodMetadata");
        Intrinsics.g(updateScreenInteractorFactory, "updateScreenInteractorFactory");
        Intrinsics.g(manageInteractorFactory, "manageInteractorFactory");
        this.f47944a = customerStateHolder;
        this.f47945b = paymentMethodMetadata;
        this.f47946c = updateScreenInteractorFactory;
        this.f47947d = manageInteractorFactory;
    }
}
