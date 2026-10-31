package cu;

import android.content.Intent;
import android.os.Bundle;
import com.stripe.android.paymentelement.embedded.manage.ManageActivity;
import com.stripe.android.paymentelement.embedded.manage.ManageContract;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final /* synthetic */ class l implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f47953a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ ManageActivity f47954b;

    public /* synthetic */ l(ManageActivity manageActivity, int i5) {
        this.f47953a = i5;
        this.f47954b = manageActivity;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        int i5 = this.f47953a;
        ManageActivity manageActivity = this.f47954b;
        switch (i5) {
            case 0:
                int i11 = ManageActivity.f44222u;
                Intent intent = manageActivity.getIntent();
                Intrinsics.f(intent, "getIntent(...)");
                Bundle extras = intent.getExtras();
                if (extras != null) {
                    return (ManageContract.Args) vm.d.i(extras, "extra_activity_args", ManageContract.Args.class);
                }
                return null;
            case 1:
                int i12 = ManageActivity.f44222u;
                return new com.stripe.android.paymentelement.embedded.manage.d(new l(manageActivity, 2));
            case 2:
                int i13 = ManageActivity.f44222u;
                ManageContract.Args args = (ManageContract.Args) manageActivity.o.getValue();
                if (args != null) {
                    return args;
                }
                throw new IllegalArgumentException("Required value was null.");
            case 3:
                manageActivity.b0().a(q.f47963b);
                return Unit.f71706a;
            default:
                ManageActivity.a0(manageActivity, false);
                manageActivity.finish();
                return Unit.f71706a;
        }
    }
}
