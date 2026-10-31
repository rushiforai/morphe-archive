package ads_mobile_sdk;

import android.net.Network;
import android.net.NetworkCapabilities;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Lambda;
import kotlin.time.Duration;

/* loaded from: classes.dex */
public final class g22 extends Lambda implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ long f3621a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Network f3622b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ NetworkCapabilities f3623c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public g22(long j11, Network network, NetworkCapabilities networkCapabilities) {
        super(0);
        this.f3621a = j11;
        this.f3622b = network;
        this.f3623c = networkCapabilities;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        return "Network capabilities changed at " + Duration.r(this.f3621a) + ": " + this.f3622b + " " + this.f3623c;
    }
}
