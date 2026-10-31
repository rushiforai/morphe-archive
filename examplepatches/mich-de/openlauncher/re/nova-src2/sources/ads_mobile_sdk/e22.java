package ads_mobile_sdk;

import android.net.Network;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Lambda;
import kotlin.time.Duration;

/* loaded from: classes.dex */
public final class e22 extends Lambda implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ long f2717a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Network f2718b;

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ int f2719j;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ e22(long j11, Network network, int i5) {
        super(0);
        this.f2719j = i5;
        this.f2717a = j11;
        this.f2718b = network;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        switch (this.f2719j) {
            case 0:
                return "Network available at " + Duration.r(this.f2717a) + ": " + this.f2718b;
            default:
                return "Network lost at " + Duration.r(this.f2717a) + ": " + this.f2718b;
        }
    }
}
