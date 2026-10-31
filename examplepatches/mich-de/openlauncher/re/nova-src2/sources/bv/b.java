package bv;

import android.content.Intent;
import android.os.Bundle;
import com.stripe.android.paymentsheet.paymentdatacollection.bacs.BacsMandateConfirmationActivity;
import com.stripe.android.paymentsheet.paymentdatacollection.bacs.BacsMandateConfirmationContract;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final /* synthetic */ class b implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f18615a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ BacsMandateConfirmationActivity f18616b;

    public /* synthetic */ b(BacsMandateConfirmationActivity bacsMandateConfirmationActivity, int i5) {
        this.f18615a = i5;
        this.f18616b = bacsMandateConfirmationActivity;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        int i5 = this.f18615a;
        i iVar = i.f18632a;
        BacsMandateConfirmationActivity bacsMandateConfirmationActivity = this.f18616b;
        switch (i5) {
            case 0:
                int i11 = BacsMandateConfirmationActivity.f44900q;
                Intent intent = bacsMandateConfirmationActivity.getIntent();
                Intrinsics.f(intent, "getIntent(...)");
                Bundle extras = intent.getExtras();
                BacsMandateConfirmationContract.Args args = extras != null ? (BacsMandateConfirmationContract.Args) vm.d.i(extras, "extra_activity_args", BacsMandateConfirmationContract.Args.class) : null;
                if (args != null) {
                    return args;
                }
                throw new IllegalStateException("Cannot start Bacs mandate confirmation flow without arguments");
            case 1:
                int i12 = BacsMandateConfirmationActivity.f44900q;
                return new com.stripe.android.paymentsheet.paymentdatacollection.bacs.f((BacsMandateConfirmationContract.Args) bacsMandateConfirmationActivity.o.getValue());
            case 2:
                int i13 = BacsMandateConfirmationActivity.f44900q;
                bacsMandateConfirmationActivity.Z().e(iVar);
                return Unit.f71706a;
            default:
                int i14 = BacsMandateConfirmationActivity.f44900q;
                bacsMandateConfirmationActivity.Z().e(iVar);
                return Unit.f71706a;
        }
    }
}
