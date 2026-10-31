package jr;

import com.stripe.android.customersheet.CustomerSheetActivity;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes4.dex */
public final class d extends Lambda implements Function0 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ int f69650j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ CustomerSheetActivity f69651k;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ d(CustomerSheetActivity customerSheetActivity, int i5) {
        super(0);
        this.f69650j = i5;
        this.f69651k = customerSheetActivity;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        switch (this.f69650j) {
            case 0:
                return this.f69651k.getViewModelStore();
            default:
                return this.f69651k.getDefaultViewModelCreationExtras();
        }
    }
}
