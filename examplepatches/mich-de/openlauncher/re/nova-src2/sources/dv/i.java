package dv;

import com.stripe.android.paymentsheet.paymentdatacollection.polling.PollingActivity;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes4.dex */
public final class i extends Lambda implements Function0 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ int f49608j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ PollingActivity f49609k;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ i(PollingActivity pollingActivity, int i5) {
        super(0);
        this.f49608j = i5;
        this.f49609k = pollingActivity;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        switch (this.f49608j) {
            case 0:
                return this.f49609k.getViewModelStore();
            default:
                return this.f49609k.getDefaultViewModelCreationExtras();
        }
    }
}
