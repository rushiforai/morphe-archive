package pu;

import android.content.Intent;
import com.stripe.android.paymentsheet.addresselement.AutocompleteActivity;
import com.stripe.android.paymentsheet.addresselement.AutocompleteContract;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final /* synthetic */ class l implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f83056a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ AutocompleteActivity f83057b;

    public /* synthetic */ l(AutocompleteActivity autocompleteActivity, int i5) {
        this.f83056a = i5;
        this.f83057b = autocompleteActivity;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        int i5 = this.f83056a;
        AutocompleteActivity autocompleteActivity = this.f83057b;
        switch (i5) {
            case 0:
                int i11 = AutocompleteActivity.f44706q;
                Intent intent = autocompleteActivity.getIntent();
                Intrinsics.f(intent, "getIntent(...)");
                return (AutocompleteContract.Args) intent.getParcelableExtra("com.stripe.android.paymentsheet.addresselement.AutocompleteContract.extra_args");
            case 1:
                int i12 = AutocompleteActivity.f44706q;
                AutocompleteContract.Args args = (AutocompleteContract.Args) autocompleteActivity.o.getValue();
                if (args != null) {
                    return new com.stripe.android.paymentsheet.addresselement.e0(new com.stripe.android.paymentsheet.addresselement.d0(args));
                }
                throw new IllegalArgumentException("Required value was null.");
            default:
                ((z) autocompleteActivity.f44707p.getValue()).e();
                return Unit.f71706a;
        }
    }
}
