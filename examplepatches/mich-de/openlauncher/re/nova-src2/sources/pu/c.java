package pu;

import android.app.Application;
import android.content.Intent;
import com.stripe.android.paymentsheet.addresselement.AddressElementActivity;
import com.stripe.android.paymentsheet.addresselement.AddressElementActivityContract;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final /* synthetic */ class c implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f83014a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ AddressElementActivity f83015b;

    public /* synthetic */ c(AddressElementActivity addressElementActivity, int i5) {
        this.f83014a = i5;
        this.f83015b = addressElementActivity;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        int i5 = this.f83014a;
        AddressElementActivity addressElementActivity = this.f83015b;
        switch (i5) {
            case 0:
                int i11 = AddressElementActivity.f44682r;
                Application application = addressElementActivity.getApplication();
                Intrinsics.f(application, "getApplication(...)");
                return application;
            case 1:
                int i12 = AddressElementActivity.f44682r;
                AddressElementActivityContract.Args args = (AddressElementActivityContract.Args) addressElementActivity.f44684q.getValue();
                if (args != null) {
                    return args;
                }
                throw new IllegalArgumentException("Required value was null.");
            case 2:
                return addressElementActivity.o;
            case 3:
                int i13 = AddressElementActivity.f44682r;
                Intent intent = addressElementActivity.getIntent();
                Intrinsics.f(intent, "getIntent(...)");
                return (AddressElementActivityContract.Args) intent.getParcelableExtra("com.stripe.android.paymentsheet.addresselement.AddressElementActivityContract.extra_args");
            default:
                k0 k0Var = ((k) addressElementActivity.f44683p.getValue()).f83051a;
                p6.l0 l0Var = k0Var.f83054a;
                if (l0Var != null && !l0Var.o()) {
                    com.stripe.android.paymentsheet.addresselement.e.a(k0Var);
                }
                return Unit.f71706a;
        }
    }
}
