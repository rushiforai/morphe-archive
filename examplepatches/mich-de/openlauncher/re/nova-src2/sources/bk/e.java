package bk;

import ads_mobile_sdk.bm3;
import ads_mobile_sdk.cu0;
import ads_mobile_sdk.xi1;
import ads_mobile_sdk.yi1;
import ai.x;
import com.google.android.gms.internal.measurement.b5;
import com.google.android.gms.internal.measurement.i4;
import com.google.android.gms.internal.measurement.k3;
import com.google.android.gms.internal.measurement.k5;
import com.google.android.gms.internal.measurement.l4;
import com.google.android.gms.internal.measurement.m3;
import com.google.android.gms.internal.measurement.p3;
import com.google.android.gms.internal.measurement.t5;
import com.google.android.gms.internal.measurement.z3;
import com.google.android.gms.internal.measurement.z4;
import com.stripe.android.core.frauddetection.FraudDetectionData;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import kotlin.Pair;
import kotlin.collections.MapsKt;
import kotlin.coroutines.CoroutineContext;
import q1.l0;

/* loaded from: classes3.dex */
public class e implements ai.d, ai.s, CoroutineContext.Key {

    /* renamed from: b, reason: collision with root package name */
    public static final /* synthetic */ e f17941b = new e(1);

    /* renamed from: c, reason: collision with root package name */
    public static final /* synthetic */ e f17942c = new e(2);

    /* renamed from: d, reason: collision with root package name */
    public static final /* synthetic */ e f17943d = new e(3);

    /* renamed from: e, reason: collision with root package name */
    public static final /* synthetic */ e f17944e = new e(4);

    /* renamed from: f, reason: collision with root package name */
    public static final /* synthetic */ e f17945f = new e(5);

    /* renamed from: g, reason: collision with root package name */
    public static final /* synthetic */ e f17946g = new e(6);

    /* renamed from: h, reason: collision with root package name */
    public static final /* synthetic */ e f17947h = new e(7);

    /* renamed from: i, reason: collision with root package name */
    public static final /* synthetic */ e f17948i = new e(8);

    /* renamed from: j, reason: collision with root package name */
    public static final /* synthetic */ e f17949j = new e(9);

    /* renamed from: k, reason: collision with root package name */
    public static final /* synthetic */ e f17950k = new e(10);

    /* renamed from: l, reason: collision with root package name */
    public static final /* synthetic */ e f17951l = new e(11);

    /* renamed from: m, reason: collision with root package name */
    public static final /* synthetic */ e f17952m = new e(12);
    public static final /* synthetic */ e n = new e(13);
    public static final /* synthetic */ e o = new e(14);

    /* renamed from: p, reason: collision with root package name */
    public static final /* synthetic */ e f17953p = new e(15);

    /* renamed from: q, reason: collision with root package name */
    public static final /* synthetic */ e f17954q = new e(16);

    /* renamed from: r, reason: collision with root package name */
    public static final /* synthetic */ e f17955r = new e(17);

    /* renamed from: s, reason: collision with root package name */
    public static final /* synthetic */ e f17956s = new e(18);

    /* renamed from: t, reason: collision with root package name */
    public static final /* synthetic */ e f17957t = new e(19);

    /* renamed from: u, reason: collision with root package name */
    public static final /* synthetic */ e f17958u = new e(20);

    /* renamed from: v, reason: collision with root package name */
    public static final /* synthetic */ e f17959v = new e(21);

    /* renamed from: w, reason: collision with root package name */
    public static final /* synthetic */ e f17960w = new e(22);

    /* renamed from: x, reason: collision with root package name */
    public static final /* synthetic */ e f17961x = new e(23);

    /* renamed from: y, reason: collision with root package name */
    public static final /* synthetic */ e f17962y = new e(24);

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f17963a;

    public /* synthetic */ e(int i5) {
        this.f17963a = i5;
    }

    public static bm3 a(Object obj) {
        cu0 cu0Var = (cu0) obj;
        bm3 bm3Var = cu0Var.f2034b;
        if (bm3Var != bm3.f1463f) {
            return bm3Var;
        }
        bm3 bm3VarB = bm3.b();
        cu0Var.f2034b = bm3VarB;
        return bm3VarB;
    }

    public static void b(Object obj, Object obj2) {
        ((cu0) obj).f2034b = (bm3) obj2;
    }

    public static boolean c(int i5, l0 l0Var, Object obj) throws yi1 {
        int i11 = l0Var.f83399a;
        com.google.crypto.tink.shaded.protobuf.k kVar = (com.google.crypto.tink.shaded.protobuf.k) l0Var.f83402d;
        int i12 = i11 >>> 3;
        int i13 = i11 & 7;
        if (i13 == 0) {
            l0Var.b(0);
            ((bm3) obj).a(i12 << 3, Long.valueOf(kVar.l()));
            return true;
        }
        if (i13 == 1) {
            l0Var.b(1);
            ((bm3) obj).a((i12 << 3) | 1, Long.valueOf(kVar.i()));
            return true;
        }
        if (i13 == 2) {
            l0Var.b(2);
            ((bm3) obj).a((i12 << 3) | 2, kVar.e());
            return true;
        }
        if (i13 != 3) {
            if (i13 == 4) {
                if (i5 != 0) {
                    return false;
                }
                throw new yi1("Protocol message end-group tag did not match expected tag.");
            }
            if (i13 != 5) {
                int i14 = yi1.f12028b;
                throw new xi1();
            }
            l0Var.b(5);
            ((bm3) obj).a(5 | (i12 << 3), Integer.valueOf(kVar.h()));
            return true;
        }
        bm3 bm3VarB = bm3.b();
        int i15 = i12 << 3;
        int i16 = i15 | 4;
        int i17 = i5 + 1;
        if (i17 >= 100) {
            throw new yi1("Protocol message had too many levels of nesting.  May be malicious.  Use setRecursionLimit() to increase the recursion depth limit.");
        }
        while (l0Var.a() != Integer.MAX_VALUE && c(i17, l0Var, bm3VarB)) {
        }
        if (i16 != l0Var.f83399a) {
            throw new yi1("Protocol message end-group tag did not match expected tag.");
        }
        if (bm3VarB.f1468e) {
            bm3VarB.f1468e = false;
        }
        ((bm3) obj).a(i15 | 3, bm3VarB);
        return true;
    }

    public static Map d(LinkedHashMap linkedHashMap, FraudDetectionData fraudDetectionData) {
        Object next;
        Iterator it = kotlin.collections.c.f1(new String[]{"source_data", "payment_method_data"}).iterator();
        while (true) {
            if (!it.hasNext()) {
                next = null;
                break;
            }
            next = it.next();
            if (linkedHashMap.containsKey((String) next)) {
                break;
            }
        }
        String str = (String) next;
        if (str == null) {
            return linkedHashMap;
        }
        Object obj = linkedHashMap.get(str);
        Map map = obj instanceof Map ? (Map) obj : null;
        if (map == null) {
            return linkedHashMap;
        }
        Map mapB = fraudDetectionData != null ? fraudDetectionData.b() : null;
        if (mapB == null) {
            mapB = b70.h.f17594a;
        }
        return MapsKt.m0(linkedHashMap, b70.k.e0(new Pair(str, MapsKt.m0(map, mapB))));
    }

    public static void e(Object obj) {
        bm3 bm3Var = ((cu0) obj).f2034b;
        if (bm3Var.f1468e) {
            bm3Var.f1468e = false;
        }
    }

    @Override // ai.d
    public /* synthetic */ String f(String str, String str2) {
        return null;
    }

    @Override // ai.s
    public Object zza() {
        switch (this.f17963a) {
            case 2:
                return new Boolean(((Boolean) l4.f32775a.get()).booleanValue());
            case 3:
                List list = x.f13400a;
                return (String) z3.f33286b.get();
            case 4:
                List list2 = x.f13400a;
                k3.f32726b.get();
                return Integer.valueOf((int) ((Long) m3.f32813a.f(74, 10L, "measurement.upload.max_realtime_events_per_day").get()).longValue());
            case 5:
                List list3 = x.f13400a;
                k3.f32726b.get();
                return (String) m3.f32813a.h(45, "measurement.sgtm.upload.backoff_http_codes", "404,429,503,504").get();
            case 6:
                List list4 = x.f13400a;
                k3.f32726b.get();
                return (Long) m3.f32813a.f(43, 21600000L, "measurement.sgtm.batch.retry_max_wait").get();
            case 7:
                List list5 = x.f13400a;
                k3.f32726b.get();
                return (Long) m3.f32813a.f(49, 1000L, "measurement.sgtm.upload.min_delay_after_broadcast").get();
            case 8:
                List list6 = x.f13400a;
                k3.f32726b.get();
                return (Long) m3.f32813a.f(79, 3600000L, "measurement.upload.window_interval").get();
            case 9:
                List list7 = x.f13400a;
                k3.f32726b.get();
                return (Long) m3.f32813a.f(27, 60000L, "measurement.alarm_manager.minimum_interval").get();
            case 10:
                List list8 = x.f13400a;
                k3.f32726b.get();
                return (Long) m3.f32813a.f(77, 1800000L, "measurement.upload.retry_time").get();
            case 11:
                List list9 = x.f13400a;
                k3.f32726b.get();
                return Integer.valueOf((int) ((Long) m3.f32813a.f(22, 200L, "measurement.audience.filter_result_max_count").get()).longValue());
            case 12:
                List list10 = x.f13400a;
                k3.f32726b.get();
                return (String) m3.f32813a.h(7, "measurement.config.url_authority", "app-measurement.com").get();
            case 13:
                List list11 = x.f13400a;
                k3.f32726b.get();
                return Integer.valueOf((int) ((Long) m3.f32813a.f(21, 50L, "measurement.experiment.max_ids").get()).longValue());
            case 14:
                List list12 = x.f13400a;
                k3.f32726b.get();
                return (Long) m3.f32813a.f(62, 7200000L, "measurement.redaction.app_instance_id.ttl").get();
            case 15:
                List list13 = x.f13400a;
                k3.f32726b.get();
                return (String) m3.f32813a.h(56, "measurement.rb.attribution.uri_authority", "google-analytics.com").get();
            case 16:
                List list14 = x.f13400a;
                k3.f32726b.get();
                return (String) m3.f32813a.h(13, "measurement.rb.attribution.event_params", "value|currency").get();
            case 17:
                List list15 = x.f13400a;
                k3.f32726b.get();
                return Integer.valueOf((int) ((Long) m3.f32813a.f(55, 90L, "measurement.rb.attribution.client.min_time_after_boot_seconds").get()).longValue());
            case 18:
                List list16 = x.f13400a;
                k3.f32726b.get();
                return Integer.valueOf((int) ((Long) m3.f32813a.f(30, 3000L, "measurement.rb.attribution.notify_app_delay_millis").get()).longValue());
            case 19:
                List list17 = x.f13400a;
                return (Boolean) i4.f32635a.get();
            case 20:
                List list18 = x.f13400a;
                return Integer.valueOf((int) ((Long) p3.f32949a.get()).longValue());
            case 21:
                List list19 = x.f13400a;
                return (Boolean) t5.f33078a.get();
            case 22:
                List list20 = x.f13400a;
                z4.f33288b.get();
                return (Boolean) b5.f32403a.b(4, "measurement.rb.attribution.service.enable_max_trigger_uris_queried_at_once", true).get();
            case 23:
                List list21 = x.f13400a;
                k3.f32726b.get();
                return Integer.valueOf((int) ((Long) m3.f32813a.f(71, 100000L, "measurement.upload.max_events_per_day").get()).longValue());
            default:
                return new Boolean(((Boolean) k5.f32728a.get()).booleanValue());
        }
    }
}
