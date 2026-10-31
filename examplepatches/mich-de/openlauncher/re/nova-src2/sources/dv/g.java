package dv;

import android.content.Intent;
import com.stripe.android.paymentsheet.paymentdatacollection.polling.PollingActivity;
import com.stripe.android.paymentsheet.paymentdatacollection.polling.PollingContract;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;
import kotlin.time.Duration;
import kotlin.time.DurationKt;
import kotlin.time.DurationUnit;

/* loaded from: classes4.dex */
public final /* synthetic */ class g implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f49604a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ PollingActivity f49605b;

    public /* synthetic */ g(PollingActivity pollingActivity, int i5) {
        this.f49604a = i5;
        this.f49605b = pollingActivity;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        int i5 = this.f49604a;
        PollingActivity pollingActivity = this.f49605b;
        switch (i5) {
            case 0:
                int i11 = PollingActivity.f44935r;
                Intent intent = pollingActivity.getIntent();
                Intrinsics.f(intent, "getIntent(...)");
                PollingContract.Args args = (PollingContract.Args) intent.getParcelableExtra("extra_args");
                if (args != null) {
                    return args;
                }
                throw new IllegalArgumentException("Required value was null.");
            case 1:
                int i12 = PollingActivity.f44935r;
                String str = pollingActivity.Z().f44938a;
                Duration.Companion companion = Duration.f72038b;
                int i13 = pollingActivity.Z().f44940c;
                DurationUnit durationUnit = DurationUnit.f72046e;
                return new q(pollingActivity.Z().f44942e, DurationKt.g(i13, durationUnit), DurationKt.g(pollingActivity.Z().f44941d, durationUnit), str, pollingActivity.Z().f44943f, pollingActivity.Z().f44944g);
            default:
                return pollingActivity.f44936p;
        }
    }
}
