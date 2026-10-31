package cv;

import com.stripe.android.paymentsheet.paymentdatacollection.cvcrecollection.CvcRecollectionActivity;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes4.dex */
public final class i extends Lambda implements Function0 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ int f48010j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ CvcRecollectionActivity f48011k;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ i(CvcRecollectionActivity cvcRecollectionActivity, int i5) {
        super(0);
        this.f48010j = i5;
        this.f48011k = cvcRecollectionActivity;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        switch (this.f48010j) {
            case 0:
                return this.f48011k.getViewModelStore();
            default:
                return this.f48011k.getDefaultViewModelCreationExtras();
        }
    }
}
