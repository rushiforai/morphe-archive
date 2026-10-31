package b;

import android.os.Looper;
import java.util.List;
import java.util.concurrent.atomic.AtomicReferenceArray;
import kotlin.coroutines.CoroutineContext;

/* loaded from: classes2.dex */
public final class kc implements ai.s, CoroutineContext.Key, m7.e {

    /* renamed from: b, reason: collision with root package name */
    public static final /* synthetic */ kc f15912b = new kc(2);

    /* renamed from: c, reason: collision with root package name */
    public static final /* synthetic */ kc f15913c = new kc(3);

    /* renamed from: d, reason: collision with root package name */
    public static final /* synthetic */ kc f15914d = new kc(4);

    /* renamed from: e, reason: collision with root package name */
    public static final /* synthetic */ kc f15915e = new kc(5);

    /* renamed from: f, reason: collision with root package name */
    public static final /* synthetic */ kc f15916f = new kc(6);

    /* renamed from: g, reason: collision with root package name */
    public static final /* synthetic */ kc f15917g = new kc(7);

    /* renamed from: h, reason: collision with root package name */
    public static final /* synthetic */ kc f15918h = new kc(8);

    /* renamed from: i, reason: collision with root package name */
    public static final /* synthetic */ kc f15919i = new kc(9);

    /* renamed from: j, reason: collision with root package name */
    public static final /* synthetic */ kc f15920j = new kc(10);

    /* renamed from: k, reason: collision with root package name */
    public static final /* synthetic */ kc f15921k = new kc(11);

    /* renamed from: l, reason: collision with root package name */
    public static final /* synthetic */ kc f15922l = new kc(12);

    /* renamed from: m, reason: collision with root package name */
    public static final /* synthetic */ kc f15923m = new kc(13);
    public static final /* synthetic */ kc n = new kc(14);
    public static final /* synthetic */ kc o = new kc(15);

    /* renamed from: p, reason: collision with root package name */
    public static final /* synthetic */ kc f15924p = new kc(16);

    /* renamed from: q, reason: collision with root package name */
    public static final /* synthetic */ kc f15925q = new kc(17);

    /* renamed from: r, reason: collision with root package name */
    public static final /* synthetic */ kc f15926r = new kc(18);

    /* renamed from: s, reason: collision with root package name */
    public static final /* synthetic */ kc f15927s = new kc(19);

    /* renamed from: t, reason: collision with root package name */
    public static final /* synthetic */ kc f15928t = new kc(20);

    /* renamed from: u, reason: collision with root package name */
    public static final /* synthetic */ kc f15929u = new kc(21);

    /* renamed from: v, reason: collision with root package name */
    public static final /* synthetic */ kc f15930v = new kc(22);

    /* renamed from: w, reason: collision with root package name */
    public static final /* synthetic */ kc f15931w = new kc(23);

    /* renamed from: x, reason: collision with root package name */
    public static final /* synthetic */ kc f15932x = new kc(24);

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f15933a;

    public /* synthetic */ kc(int i5) {
        this.f15933a = i5;
    }

    public static ads_mobile_sdk.y1 a(int i5) {
        ads_mobile_sdk.y1 y1Var = (ads_mobile_sdk.y1) ads_mobile_sdk.y1.f11906c.get(Integer.valueOf(i5));
        if (y1Var != null) {
            return y1Var;
        }
        throw new Exception("Invalid for value enum " + kc.class.getName() + ": " + i5);
    }

    public static final boolean b() {
        return Looper.myLooper() == Looper.getMainLooper();
    }

    @Override // ai.s
    public Object zza() {
        switch (this.f15933a) {
            case 2:
                return new Boolean(((Boolean) com.google.android.gms.internal.measurement.c4.f32424a.get()).booleanValue());
            case 3:
                List list = ai.x.f13400a;
                return (String) com.google.android.gms.internal.measurement.z3.f33285a.get();
            case 4:
                List list2 = ai.x.f13400a;
                com.google.android.gms.internal.measurement.k3.f32726b.get();
                return Integer.valueOf((int) ((Long) com.google.android.gms.internal.measurement.m3.f32813a.f(68, com.moloco.sdk.xenoss.sdkdevkit.android.persistenttransport.h.f42227c, "measurement.upload.max_conversions_per_day").get()).longValue());
            case 5:
                List list3 = ai.x.f13400a;
                com.google.android.gms.internal.measurement.k3.f32726b.get();
                return (String) com.google.android.gms.internal.measurement.m3.f32813a.h(44, "measurement.sgtm.service_upload_apps_list", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b).get();
            case 6:
                List list4 = ai.x.f13400a;
                com.google.android.gms.internal.measurement.k3.f32726b.get();
                return (Long) com.google.android.gms.internal.measurement.m3.f32813a.f(41, 1800000L, "measurement.sgtm.batch.retry_interval").get();
            case 7:
                List list5 = ai.x.f13400a;
                com.google.android.gms.internal.measurement.k3.f32726b.get();
                return (Long) com.google.android.gms.internal.measurement.m3.f32813a.f(50, 5000L, "measurement.sgtm.upload.min_delay_after_startup").get();
            case 8:
                List list6 = ai.x.f13400a;
                com.google.android.gms.internal.measurement.k3.f32726b.get();
                return (Long) com.google.android.gms.internal.measurement.m3.f32813a.f(63, 43200000L, "measurement.upload.backoff_period").get();
            case 9:
                List list7 = ai.x.f13400a;
                com.google.android.gms.internal.measurement.k3.f32726b.get();
                return (Long) com.google.android.gms.internal.measurement.m3.f32813a.f(28, 500L, "measurement.upload.minimum_delay").get();
            case 10:
                List list8 = ai.x.f13400a;
                com.google.android.gms.internal.measurement.k3.f32726b.get();
                return (String) com.google.android.gms.internal.measurement.m3.f32813a.h(8, "measurement.config.url_scheme", "https").get();
            case 11:
                List list9 = ai.x.f13400a;
                com.google.android.gms.internal.measurement.k3.f32726b.get();
                return Integer.valueOf((int) ((Long) com.google.android.gms.internal.measurement.m3.f32813a.f(17, 4L, "measurement.lifetimevalue.max_currency_tracked").get()).longValue());
            case 12:
                List list10 = ai.x.f13400a;
                com.google.android.gms.internal.measurement.w4.f33181b.get();
                return (String) com.google.android.gms.internal.measurement.y4.f33247a.h(5, "measurement.test.string_flag", "---").get();
            case 13:
                List list11 = ai.x.f13400a;
                com.google.android.gms.internal.measurement.w4.f33181b.get();
                com.google.android.gms.internal.measurement.l6 l6Var = com.google.android.gms.internal.measurement.y4.f33247a;
                AtomicReferenceArray atomicReferenceArray = (AtomicReferenceArray) l6Var.f32779b;
                com.google.android.gms.internal.measurement.hd hdVar = (com.google.android.gms.internal.measurement.hd) atomicReferenceArray.get(2);
                if (hdVar == null) {
                    com.google.android.gms.internal.measurement.ed edVar = new com.google.android.gms.internal.measurement.ed("measurement.test.double_flag", (com.google.android.gms.internal.measurement.td) ((com.google.android.gms.internal.measurement.d2) l6Var.f32780c).f32451b);
                    while (true) {
                        if (atomicReferenceArray.compareAndSet(2, null, edVar)) {
                            hdVar = edVar;
                        } else if (atomicReferenceArray.get(2) != null) {
                            hdVar = (com.google.android.gms.internal.measurement.hd) atomicReferenceArray.get(2);
                            hdVar.getClass();
                        }
                    }
                }
                return (Double) hdVar.get();
            case 14:
                List list12 = ai.x.f13400a;
                com.google.android.gms.internal.measurement.k3.f32726b.get();
                return (Long) com.google.android.gms.internal.measurement.m3.f32813a.f(61, 604800000L, "measurement.sdk.attribution.cache.ttl").get();
            case 15:
                List list13 = ai.x.f13400a;
                com.google.android.gms.internal.measurement.k3.f32726b.get();
                return (String) com.google.android.gms.internal.measurement.m3.f32813a.h(60, "measurement.rb.attribution.uri_scheme", "https").get();
            case 16:
                List list14 = ai.x.f13400a;
                com.google.android.gms.internal.measurement.k3.f32726b.get();
                return (String) com.google.android.gms.internal.measurement.m3.f32813a.h(80, "measurement.rb.attribution.user_properties", "_npa,npa|_fot,fot").get();
            case 17:
                List list15 = ai.x.f13400a;
                com.google.android.gms.internal.measurement.k3.f32726b.get();
                return Integer.valueOf((int) ((Long) com.google.android.gms.internal.measurement.m3.f32813a.f(54, 16L, "measurement.rb.attribution.max_retry_delay_seconds").get()).longValue());
            case 18:
                List list16 = ai.x.f13400a;
                com.google.android.gms.internal.measurement.k3.f32726b.get();
                return (Boolean) com.google.android.gms.internal.measurement.m3.f32813a.b(31, "measurement.config.notify_trigger_uris_on_backgrounded", true).get();
            case 19:
                List list17 = ai.x.f13400a;
                return (Boolean) com.google.android.gms.internal.measurement.i4.f32636b.get();
            case 20:
                List list18 = ai.x.f13400a;
                return (Boolean) com.google.android.gms.internal.measurement.a6.f32370a.get();
            case 21:
                List list19 = ai.x.f13400a;
                com.google.android.gms.internal.measurement.k3.f32726b.get();
                return Integer.valueOf((int) ((Long) com.google.android.gms.internal.measurement.m3.f32813a.f(70, 1000L, "measurement.upload.max_events_per_bundle").get()).longValue());
            case 22:
                List list20 = ai.x.f13400a;
                com.google.android.gms.internal.measurement.z4.f33288b.get();
                return (Boolean) com.google.android.gms.internal.measurement.b5.f32403a.b(7, "measurement.rb.attribution.enable_trigger_redaction", true).get();
            case 23:
                List list21 = ai.x.f13400a;
                return (Boolean) com.google.android.gms.internal.measurement.h5.f32602a.get();
            default:
                return new Boolean(((Boolean) com.google.android.gms.internal.measurement.v4.f33131a.get()).booleanValue());
        }
    }
}
