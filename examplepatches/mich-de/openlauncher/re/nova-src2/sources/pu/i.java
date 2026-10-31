package pu;

import com.stripe.android.paymentsheet.addresselement.AddressElementActivity;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes4.dex */
public final class i extends Lambda implements Function0 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ int f83047j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ AddressElementActivity f83048k;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ i(AddressElementActivity addressElementActivity, int i5) {
        super(0);
        this.f83047j = i5;
        this.f83048k = addressElementActivity;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        switch (this.f83047j) {
            case 0:
                return this.f83048k.getViewModelStore();
            default:
                return this.f83048k.getDefaultViewModelCreationExtras();
        }
    }
}
