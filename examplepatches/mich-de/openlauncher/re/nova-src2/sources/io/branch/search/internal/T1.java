package io.branch.search.internal;

import com.google.android.gms.ads.identifier.AdvertisingIdClient;
import io.branch.search.internal.C3296o5;
import java.util.UUID;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes4.dex */
public final class T1 extends Lambda implements Function0<Unit> {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ F4 f63365a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ P1 f63366b;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public T1(F4 f42, P1 p12) {
        super(0);
        this.f63365a = f42;
        this.f63366b = p12;
    }

    /* JADX WARN: Removed duplicated region for block: B:11:0x0021  */
    @Override // kotlin.jvm.functions.Function0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object invoke() {
        try {
            AdvertisingIdClient.Info advertisingIdInfo = AdvertisingIdClient.getAdvertisingIdInfo(this.f63365a.f62438a);
            P1 p12 = this.f63366b;
            String id2 = advertisingIdInfo.getId();
            if (id2 != null) {
                p12.getClass();
                if (id2.equals("00000000-0000-0000-0000-000000000000")) {
                    id2 = null;
                }
                p12.f63038e = id2;
                this.f63366b.f63039f = advertisingIdInfo.isLimitAdTrackingEnabled();
            }
        } catch (Exception e3) {
            C3296o5.a(UUID.randomUUID().toString(), e3, "BranchConfiguration.fetchGAID");
        } catch (NoClassDefFoundError e11) {
            C3296o5.a aVar = C3296o5.f65426a;
            C3296o5.a(new F6("BranchConfiguration.fetchGAID", "Could not find the play-services lib.", null, e11, null));
        }
        return Unit.f71706a;
    }
}
