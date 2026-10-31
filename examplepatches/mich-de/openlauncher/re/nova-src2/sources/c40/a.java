package c40;

import android.graphics.Point;
import com.amplitude.C0436f2;
import com.amplitude.android.sessionreplay.config.RecordLogLevel;
import com.tiktok.TikTokBusinessSdk;
import com.tiktok.appevents.TTAppEventLogger;
import com.vungle.ads.internal.AnalyticsClient;
import com.vungle.ads.internal.protos.Sdk;
import com.vungle.ads.internal.util.s;
import java.util.concurrent.atomic.AtomicBoolean;

/* loaded from: classes4.dex */
public final /* synthetic */ class a implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f19649a = 3;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ long f19650b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Object f19651c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ Object f19652d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ Object f19653e;

    public /* synthetic */ a(com.amplitude.android.sessionreplay.a aVar, C0436f2 c0436f2, long j11, Point point) {
        this.f19651c = aVar;
        this.f19652d = c0436f2;
        this.f19650b = j11;
        this.f19653e = point;
    }

    @Override // java.lang.Runnable
    public final void run() {
        switch (this.f19649a) {
            case 0:
                AnalyticsClient.b((Sdk.SDKMetric.SDKMetricType) this.f19651c, this.f19650b, (s) this.f19652d, (String) this.f19653e);
                break;
            case 1:
                ((TTAppEventLogger) this.f19651c).lambda$initConfig$1((AtomicBoolean) this.f19652d, (TikTokBusinessSdk.TTInitCallback) this.f19653e, this.f19650b);
                break;
            case 2:
                com.amplitude.android.sessionreplay.a.a((com.amplitude.android.sessionreplay.a) this.f19651c, (String) this.f19653e, (RecordLogLevel) this.f19652d, this.f19650b);
                break;
            default:
                com.amplitude.android.sessionreplay.a.a((com.amplitude.android.sessionreplay.a) this.f19651c, (C0436f2) this.f19652d, this.f19650b, (Point) this.f19653e);
                break;
        }
    }

    public /* synthetic */ a(com.amplitude.android.sessionreplay.a aVar, String str, RecordLogLevel recordLogLevel, long j11) {
        this.f19651c = aVar;
        this.f19653e = str;
        this.f19652d = recordLogLevel;
        this.f19650b = j11;
    }

    public /* synthetic */ a(TTAppEventLogger tTAppEventLogger, AtomicBoolean atomicBoolean, TikTokBusinessSdk.TTInitCallback tTInitCallback, long j11) {
        this.f19651c = tTAppEventLogger;
        this.f19652d = atomicBoolean;
        this.f19653e = tTInitCallback;
        this.f19650b = j11;
    }

    public /* synthetic */ a(Sdk.SDKMetric.SDKMetricType sDKMetricType, long j11, s sVar, String str) {
        this.f19651c = sDKMetricType;
        this.f19650b = j11;
        this.f19652d = sVar;
        this.f19653e = str;
    }
}
