package bv;

import com.stripe.android.paymentsheet.paymentdatacollection.bacs.BacsMandateConfirmationActivity;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes4.dex */
public final class d extends Lambda implements Function0 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ int f18619j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ BacsMandateConfirmationActivity f18620k;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ d(BacsMandateConfirmationActivity bacsMandateConfirmationActivity, int i5) {
        super(0);
        this.f18619j = i5;
        this.f18620k = bacsMandateConfirmationActivity;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        switch (this.f18619j) {
            case 0:
                return this.f18620k.getViewModelStore();
            default:
                return this.f18620k.getDefaultViewModelCreationExtras();
        }
    }
}
