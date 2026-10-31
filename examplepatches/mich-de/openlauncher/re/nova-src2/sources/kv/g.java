package kv;

import com.stripe.android.paymentsheet.PaymentSheet$Configuration;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.FunctionReferenceImpl;
import kotlin.jvm.internal.Intrinsics;
import w70.g2;
import w70.i2;
import w70.o1;

/* loaded from: classes4.dex */
public final class g {

    /* renamed from: a, reason: collision with root package name */
    public final PaymentSheet$Configuration f72307a;

    /* renamed from: b, reason: collision with root package name */
    public final Function0 f72308b;

    /* renamed from: c, reason: collision with root package name */
    public final FunctionReferenceImpl f72309c;

    /* JADX WARN: Multi-variable type inference failed */
    public g(PaymentSheet$Configuration config, uw.c currentScreenFlow, uw.c buttonsEnabledFlow, g2 paymentMethodMetadataFlow, o1 selectionFlow, i2 customPrimaryButtonUiStateFlow, i2 cvcCompleteFlow, Function0 function0, Function0 function02) {
        Intrinsics.g(config, "config");
        Intrinsics.g(currentScreenFlow, "currentScreenFlow");
        Intrinsics.g(buttonsEnabledFlow, "buttonsEnabledFlow");
        Intrinsics.g(paymentMethodMetadataFlow, "paymentMethodMetadataFlow");
        Intrinsics.g(selectionFlow, "selectionFlow");
        Intrinsics.g(customPrimaryButtonUiStateFlow, "customPrimaryButtonUiStateFlow");
        Intrinsics.g(cvcCompleteFlow, "cvcCompleteFlow");
        this.f72307a = config;
        this.f72308b = function0;
        this.f72309c = (FunctionReferenceImpl) function02;
    }
}
