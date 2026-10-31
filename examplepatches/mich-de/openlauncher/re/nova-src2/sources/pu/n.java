package pu;

import com.stripe.android.paymentsheet.addresselement.AutocompleteActivity;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes4.dex */
public final class n extends Lambda implements Function0 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ int f83062j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ AutocompleteActivity f83063k;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ n(AutocompleteActivity autocompleteActivity, int i5) {
        super(0);
        this.f83062j = i5;
        this.f83063k = autocompleteActivity;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        switch (this.f83062j) {
            case 0:
                return this.f83063k.getViewModelStore();
            default:
                return this.f83063k.getDefaultViewModelCreationExtras();
        }
    }
}
