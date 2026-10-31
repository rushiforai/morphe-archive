package au;

import android.os.Bundle;
import com.stripe.android.paymentsheet.model.PaymentSelection;
import com.stripe.android.paymentsheet.model.o;
import h6.u0;
import kotlin.jvm.internal.Intrinsics;
import w70.o1;

/* loaded from: classes4.dex */
public final class i {

    /* renamed from: a, reason: collision with root package name */
    public final u0 f15696a;

    /* renamed from: b, reason: collision with root package name */
    public final o1 f15697b;

    /* renamed from: c, reason: collision with root package name */
    public final Bundle f15698c;

    public i(u0 savedStateHandle) {
        Intrinsics.g(savedStateHandle, "savedStateHandle");
        this.f15696a = savedStateHandle;
        this.f15697b = savedStateHandle.b(null, "EMBEDDED_SELECTION_KEY");
        savedStateHandle.b(null, "EMBEDDED_TEMPORARY_SELECTION_KEY");
        Bundle bundle = (Bundle) savedStateHandle.a("EMBEDDED_PREVIOUS_SELECTIONS_KEY");
        this.f15698c = bundle == null ? new Bundle() : bundle;
    }

    public final void a(PaymentSelection paymentSelection) {
        this.f15696a.d("EMBEDDED_SELECTION_KEY", paymentSelection);
        if (paymentSelection == null || !(paymentSelection instanceof PaymentSelection.New)) {
            return;
        }
        this.f15698c.putParcelable(o.a(paymentSelection), paymentSelection);
    }
}
