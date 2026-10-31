package com.bytedance.sdk.openadsdk.thx.ycx.zb;

import android.os.SystemClock;
import android.text.TextUtils;
import com.bytedance.sdk.openadsdk.core.pmi;
import com.bytedance.sdk.openadsdk.core.ry;
import com.bytedance.sdk.openadsdk.core.settings.ea;
import com.bytedance.sdk.openadsdk.dy.sya;
import com.bytedance.sdk.openadsdk.dy.ycx.dj;
import com.bytedance.sdk.openadsdk.dy.zb;
import com.bytedance.sdk.openadsdk.utils.tru;
import com.bytedance.sdk.openadsdk.utils.yzp;
import com.google.android.gms.ads.identifier.AdvertisingIdClient;
import com.instabridge.ai.tools.SharedPreferencesToolRegistrationStateStore;
import com.instabridge.mobilesdk.internal.esim.CarrierConfigurator;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.vungle.ads.internal.protos.Sdk;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicLong;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class ycx {
    private static volatile ycx fby;
    private volatile Boolean ycx = null;

    /* renamed from: zb, reason: collision with root package name */
    private AtomicLong f27034zb = new AtomicLong(0);
    private int sya = 0;

    /* renamed from: dj, reason: collision with root package name */
    private String f27031dj = b.f42142b;
    private final CountDownLatch lud = new CountDownLatch(1);

    /* renamed from: lt, reason: collision with root package name */
    private volatile boolean f27032lt = false;

    /* renamed from: ul, reason: collision with root package name */
    private String f27033ul = b.f42142b;

    private ycx() {
    }

    /* JADX INFO: Access modifiers changed from: private */
    public boolean sya() {
        if (this.ycx == null) {
            synchronized (this) {
                try {
                    if (this.ycx == null) {
                        this.ycx = Boolean.valueOf(((int) ((Math.random() * 100.0d) + 1.0d)) <= sya.zb("gid_status", 100));
                        if (this.ycx.booleanValue()) {
                            try {
                                this.f27033ul = tru.ycx();
                            } catch (Throwable th2) {
                                com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4MHpTpI6yyGTa9tzM5N1lSI", "euo7kBGoYNSJRNB0iDmlJEvrPw==", "VesokTG5eciSXg==", Sdk.SDKError.Reason.INVALID_ADUNIT_BID_PAYLOAD_VALUE);
                                this.f27033ul = CarrierConfigurator.APN_TYPE;
                            }
                        }
                    }
                } catch (Throwable th3) {
                    throw th3;
                }
            }
        }
        return this.ycx.booleanValue();
    }

    public String zb() {
        if (pmi.dj().kt() != 1) {
            return this.f27031dj;
        }
        if (yzp.lt()) {
            return this.f27031dj;
        }
        try {
            if (!this.f27032lt) {
                try {
                    this.lud.await(4L, TimeUnit.SECONDS);
                } catch (InterruptedException e3) {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4MHpTpI6yyGTa9tzM5N1lSI", "euo7kBGoYNSJRNB0iDmlJEvrPw==", "XOs5siKVbfOJR9JymQU=", 81);
                }
            }
            return this.f27031dj;
        } finally {
            this.f27032lt = true;
            this.lud.countDown();
        }
    }

    public static ycx ycx() {
        if (fby == null) {
            synchronized (ycx.class) {
                try {
                    if (fby == null) {
                        fby = new ycx();
                    }
                } catch (Throwable th2) {
                    throw th2;
                }
            }
        }
        return fby;
    }

    public void ycx(boolean z11) {
        if (this.sya == 1 || !TextUtils.isEmpty(this.f27031dj)) {
            return;
        }
        long jElapsedRealtime = SystemClock.elapsedRealtime();
        if (z11 || this.f27034zb.get() <= jElapsedRealtime) {
            this.f27034zb.set(jElapsedRealtime + 300000);
            final long jElapsedRealtime2 = SystemClock.elapsedRealtime();
            yzp.ycx(new com.bytedance.sdk.component.fby.zb.sya("pag_gaid") { // from class: com.bytedance.sdk.openadsdk.thx.ycx.zb.ycx.1
                /* JADX WARN: Multi-variable type inference failed */
                /* JADX WARN: Type inference failed for: r2v5, types: [com.bytedance.sdk.openadsdk.core.sya] */
                /* JADX WARN: Type inference failed for: r4v1 */
                /* JADX WARN: Type inference failed for: r4v2, types: [int] */
                /* JADX WARN: Type inference failed for: r4v3, types: [boolean] */
                @Override // java.lang.Runnable
                public void run() {
                    ?? IsLimitAdTrackingEnabled;
                    try {
                        AdvertisingIdClient.Info advertisingIdInfo = AdvertisingIdClient.getAdvertisingIdInfo(pmi.ycx());
                        if (advertisingIdInfo != null) {
                            IsLimitAdTrackingEnabled = advertisingIdInfo.isLimitAdTrackingEnabled();
                            if (IsLimitAdTrackingEnabled != 0) {
                                ycx.this.sya = 1;
                                ycx.this.ycx(2, "lmt", SystemClock.elapsedRealtime() - jElapsedRealtime2);
                            }
                            if (IsLimitAdTrackingEnabled == 0) {
                                String id2 = advertisingIdInfo.getId();
                                String str = ycx.this.f27031dj;
                                if (TextUtils.isEmpty(id2)) {
                                    ycx.this.ycx(4, "empty gaid", SystemClock.elapsedRealtime() - jElapsedRealtime2);
                                } else {
                                    ycx.this.f27031dj = id2;
                                    ycx.this.ycx(true, SystemClock.elapsedRealtime() - jElapsedRealtime2);
                                }
                                if (!str.equals(id2)) {
                                    ry.ycx();
                                }
                            }
                        } else {
                            IsLimitAdTrackingEnabled = -1;
                        }
                        if (IsLimitAdTrackingEnabled != -1) {
                            com.bytedance.sdk.openadsdk.core.sya.ycx().ycx("limit_ad_track", IsLimitAdTrackingEnabled);
                        }
                    } finally {
                        try {
                        } finally {
                        }
                    }
                }
            });
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static String zb(Throwable th2) {
        if (th2 == null) {
            return b.f42142b;
        }
        try {
            StringBuilder sb2 = new StringBuilder();
            sb2.append(th2.toString());
            for (StackTraceElement stackTraceElement : th2.getStackTrace()) {
                sb2.append("\n\tat ");
                sb2.append(stackTraceElement.toString());
            }
            return sb2.toString();
        } catch (Throwable th3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4MHpTpI6yyGTa9tzM5N1lSI", "euo7kBGoYNSJRNB0iDmlJEvrPw==", "XOs5phe9asy0WNZeiSK0OlLgKg==", 237);
            return b.f42142b;
        }
    }

    public void ycx(JSONObject jSONObject) throws JSONException {
        if (jSONObject == null) {
            return;
        }
        try {
            jSONObject.put("gaid", zb());
        } catch (JSONException e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4MHpTpI6yyGTa9tzM5N1lSI", "euo7kBGoYNSJRNB0iDmlJEvrPw==", "WuopsiKVTfOPYORyoj6iIl7tOQ==", 158);
        }
    }

    public void ycx(boolean z11, long j11) {
        ycx(z11, 0, b.f42142b, null, j11);
    }

    public void ycx(int i5, String str, long j11) {
        ycx(false, i5, str, null, j11);
    }

    public void ycx(int i5, Throwable th2, long j11) {
        ycx(false, i5, b.f42142b, th2, j11);
    }

    public void ycx(final boolean z11, final int i5, final String str, final Throwable th2, final long j11) {
        if ((this.ycx == null || this.ycx.booleanValue()) && pmi.ycx() != null) {
            pmi.lud().ycx(new zb() { // from class: com.bytedance.sdk.openadsdk.thx.ycx.zb.ycx.2
                @Override // com.bytedance.sdk.openadsdk.dy.zb
                public com.bytedance.sdk.openadsdk.dy.ycx.sya ycx() throws Exception {
                    if (!ycx.this.sya()) {
                        return null;
                    }
                    JSONObject jSONObject = new JSONObject();
                    jSONObject.put(SharedPreferencesToolRegistrationStateStore.KEY_SESSION_ID, ycx.this.f27033ul);
                    jSONObject.put("is_success", z11);
                    jSONObject.put("error_code", i5);
                    jSONObject.put("error_msg", TextUtils.isEmpty(str) ? ycx.zb(th2) : str);
                    jSONObject.put("duration", j11);
                    jSONObject.put("has_setting", ea.zb().bh() > 0);
                    return dj.zb().ycx("gid_status").zb(jSONObject.toString());
                }
            }, false);
        }
    }
}
